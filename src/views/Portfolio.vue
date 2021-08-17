<template>
  <div id="project-container">
    <ProjectCard
      v-for="project in projects"
      v-bind:key="project.title"
      v-bind:project="project"
    />
  </div>
</template>

<script>
import ProjectCard from "../components/ProjectCard.vue";
import gsap from "gsap";
export default {
  name: "App",
  components: {
    ProjectCard,
  },
  data() {
    return {
      show: {
        landingMessage: true,
        myWork: false,
      },
      projects: [
        {
          title: "Green Metals",
          year: 2021,
          info: "An App helping users analyse companies involved in producing critical metals for the zero-carbon future. Users can login and compare companies by metrics such as market capitalizations.",
          tech: [
            "React",
            "Redux",
            "NodeJS",
            "Express",
            "MongoDB",
            "AWS S3",
            "JWT",
            "REST API",
          ],
          icons: ["React", "Nodejs", "Redux", "MongoDB"],
          links: [
            {
              name: "Code",
              url: "https://github.com/mint-made/green-metals",
            },
            {
              name: "Site",
              url: "https://greenmetals.herokuapp.com/",
            },
          ],
        },
        {
          title: "Pippa & Paper v2.0",
          year: 2021,
          info: "A responsive eCommerce site, built from scratch using the MERN stack and AWS S3, with a fully customizable checkout process complete with PayPal payment integration.",
          tech: [
            "React",
            "Redux",
            "NodeJS",
            "Express",
            "MongoDB",
            "AWS S3",
            "PayPal",
            "JWT",
          ],
          icons: ["React", "Nodejs", "MongoDB", "PayPal"],
          links: [
            {
              name: "Code",
              url: "https://github.com/mint-made/pippaandpaper",
            },
            {
              name: "Site",
              url: "https://pippaandpaper.herokuapp.com/",
            },
          ],
        },
        {
          title: "Blob Generator",
          year: 2021,
          info: "A web app to randomly generate SVG blobs for users, displaying the code and colored markers to help the user understand the Bezier curves that make up the blobs",
          tech: ["SVG", "GSAP", "Bezier curves"],
          icons: ["SVG", "GSAP", "JavaScript", "HTML"],
          url: {
            site: "https://mint-made.com/blob-generator/",
            repo: "https://github.com/mint-made/blob-generator",
          },
          links: [
            {
              name: "Code",
              url: "https://github.com/mint-made/blob-generator",
            },
            {
              name: "Site",
              url: "https://mint-made.com/blob-generator/",
            },
          ],
        },
        {
          title: "Myers-Briggs Tech Research Portal",
          year: 2020,
          info: "A secure questionnaire built for a client to collect data on a business's tech strategy, so they can analyse how to help the business attain the skill set it needs",
          tech: ["Firebase", "Firebase Auth", "Vuex"],
          icons: ["VueJS", "Firebase", "JavaScript", "SASS"],
          url: {
            site: "https://mint-made.com/tmb",
            repo: "https://github.com/mint-made/tmb",
          },
          links: [
            {
              name: "Code",
              url: "https://github.com/mint-made/tmb",
            },
            {
              name: "Site",
              url: "https://mint-made.com/tmb",
            },
          ],
        },
        {
          title: "Pippa & Paper",
          year: 2020,
          info: "A responsive eCommerce website built for a client, utilizing WooCommerce and Stripe as a product/payment solution.",
          tech: ["WordPress"],
          icons: ["WordPress", "stripe", "WooCommerce"],
          url: {
            site: "https://www.pippaandpaper.com/",
          },
          links: [
            {
              name: "Site",
              url: "https://www.pippaandpaper.com/",
            },
          ],
        },
        {
          title: "A Node.js Task Manager",
          year: 2020,
          info: "A Node.js CRUD app for users to login and manage tasks. The app uses bcrypt to securely hash passwords and JWTs for user authorization",
          tech: [
            "NodeJS",
            "REST API",
            "mongoDB",
            "mongoose",
            "bcrypt",
            "JWT",
            "Jest",
          ],
          icons: ["NodeJS", "mongoDB", "Jest"],
          url: {
            repo: "https://github.com/mint-made/task-manager",
          },
          links: [
            {
              name: "Code",
              url: "https://github.com/mint-made/task-manager",
            },
          ],
        },
        {
          title: "Restaurant Review",
          year: 2019,
          info: "An app to discover new restaurants, quickly find reviews and filter restaurants based on their average ratings. Built using data from Google Maps and Places API",
          icons: ["webpack", "JavaScript", "HTML", "Google Maps API"],
          tech: ["Google Maps API", "Places API", "Geolocation API"],
          url: {
            site: "https://mint-made.com/restaurant-review/",
            repo: "https://github.com/mint-made/restaurant-review",
          },
          links: [
            {
              name: "Code",
              url: "https://github.com/mint-made/restaurant-review",
            },
            {
              name: "Site",
              url: "https://mint-made.com/restaurant-review/",
            },
          ],
        },
        {
          title: "Discover Film",
          year: 2020,
          info: "A VueJS app helping users to efficiently discover films and help decide on a film to watch. Built using data from TMDb API",
          tech: ["Vuex", "Vue Router", "TMDb API"],
          icons: ["VueJS", "SASS", "JavaScript", "HTML"],
          url: {
            site: "https://mint-made.com/discover-film",
            repo: "https://github.com/mint-made/discover-film",
          },
          links: [
            {
              name: "Code",
              url: "https://github.com/mint-made/discover-film",
            },
            {
              name: "Site",
              url: "https://mint-made.com/discover-film",
            },
          ],
        },
        {
          title: "A Node.js Weather App",
          year: 2020,
          info: "A weather app built with Node.js and Express.js using weather data from Open Weather and geocoding data from Mapbox.",
          tech: [
            "NodeJS",
            "Express",
            "Heroku",
            "Handlebars",
            "mapbox API",
            "OpenWeather API",
          ],
          icons: ["NodeJS", "Heroku", "Handlebars"],
          url: {
            site: "https://mint-weather-app.herokuapp.com",
            repo: "https://github.com/mint-made/weather-app",
          },
          links: [
            {
              name: "Code",
              url: "https://github.com/mint-made/weather-app",
            },
            {
              name: "Site",
              url: "https://mint-weather-app.herokuapp.com",
            },
          ],
        },
        {
          title: "VueJS Deploy to gh-pages",
          year: 2020,
          info: "A shell script to automate the creation and deployment of a new VueJS project, with the project automatically hosted on Github Pages",
          icons: ["Bash", "git"],
          tech: ["Bash", "git", "Shell Script"],

          url: {
            site: false,
            repo: "https://github.com/mint-made/vuejs-deploy-ghpages",
          },
          links: [
            {
              name: "Code",
              url: "https://github.com/mint-made/vuejs-deploy-ghpages",
            },
          ],
        },
        {
          title: "Enhance an Existing Project",
          year: 2019,
          info: "Taking over an existing codebase to Fix bugs, write documentation, implement Jasmine unit tests and audit the performance of a someone else's codebase",
          icons: ["Jasmine", "HTML", "CSS"],
          tech: ["Jasmine", "documentation.js"],
          url: {
            site: "https://mint-made.com/enhance-an-existing-project/",
            repo: "https://github.com/mint-made/enhance-an-existing-project",
          },
          links: [
            {
              name: "Code",
              url: "https://github.com/mint-made/enhance-an-existing-project",
            },
            {
              name: "Site",
              url: "https://mint-made.com/enhance-an-existing-project/",
            },
          ],
        },
        {
          title: "Food Delivery Database",
          year: 2019,
          info: "A technical database solution for a food delivery company designed in UML and created using MySQL",
          icons: ["MySQL"],
          tech: ["MySQL", "UML Diagrams"],
          url: {
            site: false,
            repo: "https://github.com/mint-made/food-delivery-database",
          },
          links: [
            {
              name: "Code",
              url: "https://github.com/mint-made/food-delivery-database",
            },
            {
              name: "UML Diagram",
              url: "https://github.com/mint-made/food-delivery-database/blob/master/UML-diagram.pdf",
            },
          ],
        },
        {
          title: "Watch it Outside",
          year: 2019,
          info: "A film festival website built to technical specification using Bootstrap for a mock client",
          icons: ["Bootstrap", "HTML", "SASS"],
          tech: ["Bootstrap"],
          url: {
            site: "https://mint-made.com/watch-it-outside/",
            repo: "https://github.com/mint-made/watch-it-outside",
          },
          links: [
            {
              name: "Code",
              url: "https://github.com/mint-made/watch-it-outside",
            },
            {
              name: "Site",
              url: "https://mint-made.com/watch-it-outside/",
            },
          ],
        },
        {
          title: "The Vikings - turn-based board game",
          year: 2018,
          info: "A two player turn-based board game with a medieval Vikings theme built using plain JavaScript and jQuery for animations ",
          icons: ["Bootstrap", "JavaScript", "jQuery"],
          tech: ["Bootstrap", "jQuery"],
          url: {
            site: "https://mint-made.com/the-vikings/",
            repo: "https://github.com/mint-made/the-vikings",
          },
          links: [
            {
              name: "Code",
              url: "https://github.com/mint-made/the-vikings",
            },
            {
              name: "Site",
              url: "https://mint-made.com/the-vikings/",
            },
          ],
        },
      ],
    };
  },
  mounted() {
    gsap.to("#project-container", {
      opacity: 1,
      duration: 1,
    });
  },
};
</script>

<style>
#project-container {
  padding-top: 60px;
  display: flex;
  flex-wrap: wrap;
  justify-content: center;
  opacity: 0;
}
</style>
