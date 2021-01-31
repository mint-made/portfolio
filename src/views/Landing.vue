<template>
  <div id="landing-container">
    <svg id="svg-canvas" viewBox="0 0 200 200">
      <path id="blob" fill="#9b5de5" d="" transform="translate(100 100)" />
    </svg>
    <div id="heading-container">
      <div id="title-container">
        <h1>Thomas Kupai</h1>
        <h2>Web Developer</h2>
      </div>

      <button class="btn btn-x" @click="viewPorjectsClick">
        View Projects
      </button>
    </div>
  </div>
</template>

<script>
import gsap from "gsap";
export default {
  name: "Landing",
  data() {
    return {
      // if false, it will kill the morphing loop
      morphing: true,
      blobVertices: 5,
      blobVisible: true,
      rotationLoop: "",
      morphLoop: ""
    };
  },
  methods: {
    viewPorjectsClick() {
      this.morphing = false;
      console.log("View Projects");
      gsap.to("#blob", {
        opacity: 0,
        rotation: 270,
        duration: 0.5,
        transformOrigin: "center"
      });
      gsap.to("#heading-container", {
        opacity: 0,
        duration: 0.5
      });
      setTimeout(() => {
        this.$router.push("portfolio");
      }, 700);
    },
    initBlobAnimationLoops() {
      // init morphing loop
      this.newBlobMorph(this.blobVertices);

      // init GSAP rotation loop
      this.rotationLoop = gsap.to("#blob", {
        rotation: 360,
        duration: 15,
        ease: "none",
        transformOrigin: "center",
        repeat: -1
      });
    },
    newBlobMorph(n = this.blobVertices) {
      gsap.to("#blob", {
        duration: 2.5,
        ease: "none",
        attr: {
          d: this.newBlobPath(n)
        },
        onComplete: () => {
          if (this.morphing) {
            this.newBlobMorph();
          }
        }
      });
    },
    newBlobPath(n) {
      const pointsArray = this.generateBlobCoords(n);
      return this.generateBlobPath(
        pointsArray,
        pointsArray[pointsArray.length - 1]
      );
    },
    generateBlobCoords(n) {
      // Generates n random point origins within n sections of the canvas each with two bezier points
      const sectionAngle = (2 * Math.PI) / n;
      const pointsArray = [];
      for (let i = 0; i < n; i++) {
        const point = {
          origin: {},
          bezier1: {},
          bezier2: {}
        };
        const MIN_RADIUS = this.rndNoBetween(60, 85);
        const MAX_RADIUS = MIN_RADIUS + 15;
        // Bezier line length reduces as n increases to ensure Bezier lines do not cross and cause points in the blob
        const BEZIER_LENGTH = (2 * Math.PI * (MIN_RADIUS * 0.85)) / (2 * n);
        // Randomly generates an origin point within a specific section of the canvas
        let angleToOrigin =
          i * sectionAngle + this.rndNoBetween(0, sectionAngle / 3);
        const radius = this.rndNoBetween(MIN_RADIUS, MAX_RADIUS);
        point.origin.x = radius * Math.sin(angleToOrigin);
        point.origin.y = radius * Math.cos(angleToOrigin);

        // Angle to origin is increased to generate a point in an adjacent section of the canvas
        angleToOrigin =
          i * sectionAngle +
          this.rndNoBetween(sectionAngle / 3, (2 * sectionAngle) / 3);
        const sectionPoint = {};
        sectionPoint.x = radius * Math.sin(angleToOrigin);
        sectionPoint.y = radius * Math.cos(angleToOrigin);
        // Distance of bezier point to the point is calculated
        const distanceFromOrigin = {};
        distanceFromOrigin.x = sectionPoint.x - point.origin.x;
        distanceFromOrigin.y = sectionPoint.y - point.origin.y;
        distanceFromOrigin.hypotenuse = Math.sqrt(
          Math.pow(distanceFromOrigin.x, 2) + Math.pow(distanceFromOrigin.y, 2)
        );
        // Calculate the scale factor to standardise the length of the Bezier lines
        const scaleFactor = BEZIER_LENGTH / distanceFromOrigin.hypotenuse;

        // Generate Bezier points (BEZIER_LENGTH) from the point origin, using the scale factor
        point.bezier1.x = point.origin.x + distanceFromOrigin.x * scaleFactor;
        point.bezier1.y = point.origin.y + distanceFromOrigin.y * scaleFactor;
        point.bezier2.x = point.origin.x - distanceFromOrigin.x * scaleFactor;
        point.bezier2.y = point.origin.y - distanceFromOrigin.y * scaleFactor;

        pointsArray.push(point);
      }
      return pointsArray;
    },
    rndNoBetween(x, y) {
      // Generates a random number between two values x and y
      const randomNum = Math.random() * (y - x) + x;
      return randomNum;
    },
    generateBlobPath(pointsArray, startPoint) {
      // Generate d value for path element of the blob
      const pathArray = [`M${startPoint.origin.x},${startPoint.origin.y}`];
      let bezierOrigin = startPoint;
      for (let i = 0; i < pointsArray.length; i++) {
        // Bezier2 point from the current point
        pathArray.push(`C${bezierOrigin.bezier1.x},${bezierOrigin.bezier1.y}`);
        // Bezier1 Point from the destination point
        pathArray.push(
          `${pointsArray[i].bezier2.x},${pointsArray[i].bezier2.y}`
        );
        // Point of the destination
        pathArray.push(`${pointsArray[i].origin.x},${pointsArray[i].origin.y}`);
        bezierOrigin = pointsArray[i];
      }
      pathArray.push("Z");
      return pathArray.join(" ");
    }
  },
  mounted() {
    console.log("created", this.morphing);
    document
      .querySelector("#blob")
      .setAttributeNS(null, "d", this.newBlobPath(this.blobVertices));
    this.initBlobAnimationLoops();
  }
};
</script>

<style lang="scss">
#landing-container {
  margin-left: auto;
  margin-right: auto;
  max-width: 2000px;
  width: 100vw;
  height: 100vh;
  overflow: hidden;
  background-color: rgb(154, 198, 236);
  #heading-container {
    display: flex;
    align-items: center;
    flex-direction: column;
    justify-content: center;
    position: absolute;
    left: 0;
    right: 0;
    bottom: 0;
    margin: auto;
    height: 100%;
    color: #eeeeee;
    #title-container {
      border-left: 3px solid #eeeeee;
      padding: 0px 10px;
      margin-bottom: 10px;
      h1,
      h2 {
        margin: 0;
      }
    }
  }
}

#svg-canvas {
  width: 100%;
  height: 100%;
}
#blob {
  opacity: 0.9;
}
</style>
