<template>
  <div id="app">
    <div id="nav">
      <a href="/"> <div class="logo">Mint-Made</div></a>
      <div id="icon-container">
        <img src="./assets/icons/github.svg" class="profile-icon-link" alt="" />
        <img
          src="./assets/icons/linkedin.svg"
          class="profile-icon-link"
          alt=""
        />
      </div>
    </div>
    <router-view />
  </div>
</template>

<script>
export default {
  name: "App",
};
</script>

<style lang="scss">
html {
  overflow-y: scroll;
}
body {
  margin: 0;
  height: 100%;
  padding: 0;
  background-color: rgb(154, 198, 236);
}
#app {
  font-family: consolas, "Liberation Mono", courier, monospace;
}

/* buttons */
.btn {
  display: inline-block;
  font-weight: 700;
  text-align: center;
  vertical-align: middle;
  -webkit-user-select: none;
  -moz-user-select: none;
  user-select: none;
  border: 2px solid black;
  font-size: 1rem;
  line-height: 1.5;
  border-radius: 10px;
  cursor: pointer;
  transition: color 0.15s ease-in-out, background-color 0.15s ease-in-out,
    border-color 0.15s ease-in-out, box-shadow 0.15s ease-in-out;
}
// Colors
$red: #ff595e;
$yellow: #ffca3a;
$green: #8ac926;
$blue: #1982c4;
$purple: #6a4c93;
$steel: #eeeeee;

.btn-x {
  background-color: rgba(255, 255, 255, 0);
  border-color: $steel;
  color: $steel;
  padding: 5px 20px;
  border-radius: 20px;
  &:hover {
    background-color: $steel;
    color: $purple;
  }
}

#nav {
  background-color: #444444;
  color: #d5d5d5;
  position: fixed;
  z-index: 51;
  margin: auto;
  display: flex;
  justify-content: space-between;
  align-items: center;
  width: 100%;
  font-size: 1.5em;
  a {
    text-decoration: none;
    .logo {
      padding: 3px 5px 0px 5px;
      margin-left: 20px;
      background: #d5d5d5;
      color: #444444;
      display: flex;
      align-items: center;
      border-radius: 3px;
      cursor: pointer;
      text-decoration: none;
      &:hover {
        opacity: 0.7;
      }
    }
  }

  #icon-container {
    padding-right: 20px;
    display: flex;
    align-items: center;
    .profile-icon-link {
      width: 35px;
      height: 35px;
      padding: 5px;
      cursor: pointer;
      &:hover {
        opacity: 0.7;
      }
    }
  }
}
</style>
