<template>
  <div class="project-card shadow">
    <div class="tech-container">
      <div class="tech-icons" v-if="project.icons">
        <a
          v-for="icon in project.icons"
          v-bind:key="icon"
          :href="getUrl(icon)"
          target="_blank"
        >
          <img
            v-bind:src="require(`@/assets/icons/${icon.toLowerCase()}.svg`)"
            :alt="icon"
            :class="icon + '-icon'"
        /></a>
      </div>
      <div class="tech-pills">
        <pill-item
          v-for="tech in project.tech"
          :key="tech"
          background="#eee"
          :url="getUrl(tech)"
          color="#444444"
          >{{ tech }}</pill-item
        >
      </div>
    </div>
    <div class="info-container">
      <h3>
        {{ project.title }}
        <span class="project-year">{{ project.year }}</span>
      </h3>

      <p class="project-info">{{ project.info }}</p>

      <div>
        <a
          v-for="link in project.links"
          v-bind:key="project.title + '-' + link.name"
          :href="link.url"
          class="btn btn-project"
          target="_blank"
          >{{ link.name }}</a
        >
      </div>
    </div>
  </div>
</template>

<script>
import PillItem from "./PillItem.vue";
export default {
  name: "ProjectCard",
  props: ["project"],
  components: { PillItem },
  data() {
    return {
      techInfo: [
        {
          name: "VueJS",
          url: "https://vuejs.org/",
        },
        {
          name: "SASS",
          url: "https://sass-lang.com/",
        },
        {
          name: "CSS",
          url: "https://www.w3.org/TR/CSS/",
        },
        {
          name: "JavaScript",
          url: "https://developer.mozilla.org/en-US/docs/Web/JavaScript",
        },
        {
          name: "HTML",
          url: "https://developer.mozilla.org/en-US/docs/Web/HTML",
        },
        {
          name: "Bootstrap",
          url: "https://getbootstrap.com/",
        },
        {
          name: "webpack",
          url: "https://webpack.js.org/",
        },
        {
          name: "Bash",
          url: "https://www.gnu.org/software/bash/",
        },
        {
          name: "Vuex",
          url: "https://vuex.vuejs.org/",
        },
        {
          name: "Vue Router",
          url: "https://router.vuejs.org/",
        },
        {
          name: "TMDb API",
          url: "https://developers.themoviedb.org/3",
        },
        {
          name: "Google Maps API",
          url:
            "https://developers.google.com/maps/documentation/javascript/overview",
        },
        {
          name: "Places API",
          url: "https://developers.google.com/places/web-service/overview",
        },
        {
          name: "Geolocation API",
          url:
            "https://developers.google.com/maps/documentation/geolocation/overview",
        },
        {
          name: "Bash",
          url: "https://www.gnu.org/software/bash/",
        },
        {
          name: "Shell Script",
          url: "https://www.shellscript.sh/",
        },
        {
          name: "git",
          url: "https://git-scm.com/",
        },
        {
          name: "documentation.js",
          url: "https://documentation.js.org/",
        },
        {
          name: "Jasmine",
          url: "https://jasmine.github.io/",
        },
        {
          name: "UML Diagrams",
          url: "https://www.uml-diagrams.org/uml-25-diagrams.html",
        },
        {
          name: "MySQL",
          url: "https://dev.mysql.com/",
        },
        {
          name: "jQuery",
          url: "https://jquery.com/",
        },
        {
          name: "Firebase",
          url: "https://firebase.google.com/",
        },
        {
          name: "Firebase Auth",
          url: "https://firebase.google.com/docs/auth",
        },
        {
          name: "SVG",
          url: "https://www.w3.org/Graphics/SVG/",
        },
        {
          name: "GSAP",
          url: "https://greensock.com/gsap/",
        },
        {
          name: "Bezier curves",
          url: "https://javascript.info/bezier-curve",
        },
        {
          name: "Heroku",
          url: "https://www.heroku.com/",
        },
        {
          name: "NodeJS",
          url: "https://nodejs.org",
        },
        {
          name: "Express",
          url: "https://expressjs.com/",
        },
        {
          name: "Handlebars",
          url: "https://handlebarsjs.com/",
        },
        {
          name: "OpenWeather API",
          url: "https://openweathermap.org/api",
        },
        {
          name: "mapbox API",
          url: "https://docs.mapbox.com/api/overview/",
        },
        {
          name: "mongoDB",
          url: "https://www.mongodb.com/",
        },
        {
          name: "Jest",
          url: "https://jestjs.io/",
        },
        {
          name: "bcrypt",
          url: "https://www.npmjs.com/package/bcrypt",
        },
        {
          name: "JWT",
          url: "https://jwt.io/",
        },
        {
          name: "mongoose",
          url: "https://mongoosejs.com/",
        },
        {
          name: "REST API",
          url: "https://restfulapi.net/",
        },
        {
          name: "WordPress",
          url: "https://wordpress.org/",
        },
        {
          name: "stripe",
          url: "https://stripe.com/gb",
        },
        {
          name: "WooCommerce",
          url: "https://woocommerce.com/",
        },
      ],
    };
  },
  methods: {
    getBgColor(techName) {
      const tech = this.techInfo.find((item) => item.name === techName);
      if (tech === undefined) {
        return "white";
      }
      return tech.bgColor;
    },
    getUrl(techName) {
      const tech = this.techInfo.find((item) => item.name === techName);
      if (tech === undefined) {
        return "";
      }
      return tech.url;
    },
    getColor(techName) {
      const tech = this.techInfo.find((item) => item.name === techName);
      if (tech === undefined) {
        return "black";
      }
      return tech.color;
    },
    getIconUrl(techName) {
      const url = "../assets/icons/" + techName.toLowerCase() + ".svg";
      console.log(url);
      return url;
    },
  },
};
</script>

<style lang="scss">
$steel: rgb(135, 206, 153);
$purple: #eee;

.project-card {
  text-align: center;
  border-radius: 15px;
  background-color: #eee;
  height: 300px;
  width: 500px;
  margin: 10px;
  display: flex;
  color: #444444;
  background-color: #eee;
  .tech-container {
    padding: 5px;
    display: flex;
    min-width: 140px;
    flex-direction: column;
    justify-content: space-around;
    align-items: center;
    flex-basis: 1;
    background-color: $steel;
    border-radius: 15px 0px 0px 15px;
    .tech-icons {
      display: flex;
      justify-content: center;
      flex-wrap: wrap;
      margin: 10px;
      img {
        width: 40px;
        height: 40px;
        padding: 5px;
        cursor: pointer;
        &:hover {
          opacity: 0.7;
        }
      }
      img.jQuery-icon {
        width: 80px;
      }
    }
    .tech-pills {
    }
  }
  .info-container {
    padding: 10px;
    display: flex;
    flex-direction: column;
    justify-content: space-between;
    h3 {
      margin: 0px;
    }
    .project-info {
    }
  }
}

.shadow {
  -webkit-box-shadow: 10px 10px 25px 10px rgba(0, 0, 0, 0.75);
  -moz-box-shadow: 10px 10px 25px 10px rgba(0, 0, 0, 0.75);
  box-shadow: 10px 10px 25px 10px rgba(0, 0, 0, 0.75);
}

.btn-project {
  background-color: rgba(255, 255, 255, 0);
  border-color: $steel;
  color: $steel;
  padding: 5px 10px;
  border-radius: 20px;
  margin: 5px;
  text-decoration: none;
  &:hover {
    background-color: $steel;
    color: $purple;
  }
}
span.project-year {
  font-weight: 500;
  font-style: italic;
}
// Media Queries
@media only screen and (max-width: 500px) {
  .project-card {
    .tech-container {
      font-size: 0.9em;
      min-width: 120px;
    }
    .info-container {
      font-size: 0.9em;
    }
  }
}
@media only screen and (max-width: 375px) {
  .project-card {
    .tech-container {
      font-size: 0.75em;
      min-width: 100px;
    }
    .info-container {
      padding: 5px;
      font-size: 0.85em;
      p {
        margin: 5px 0px;
      }
    }
  }
  .btn-project {
    padding: 0px 6px;
    font-size: 1.2em;
    border-radius: 20px;
    margin: 1px;
  }
}
@media only screen and (max-width: 300px) {
  .project-card {
    .tech-container {
      font-size: 0.7em;
      min-width: 95px;
    }
    .info-container {
      padding: 3px;
      font-size: 0.8em;
    }
  }
  .btn-project {
    padding: 0px 4px;
    font-size: 1em;
    border-radius: 20px;
    margin: 1px;
  }
}
</style>
