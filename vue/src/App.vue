<template>
  <div id="app">
    <header id="nav">
      <router-link class="logo-link" v-bind:to="{ name: 'all-breweries'}">
      <h1 class="site-logo">Brewery Finder</h1>
      </router-link>
      <div id="links">
      <router-link class="link" v-bind:to="{ name: 'login'}">Login</router-link>
      <router-link class="link" v-bind:to="{ name: 'all-breweries'}">Home</router-link>
      </div>
    </header>
    <router-view class="main" />
  </div>
</template>

<style>

#nav{
  display: flex;
  justify-content: space-between;
  align-items: center;
  /* background-color:  #d6d8da; */
  color: black;
  border-bottom: .1rem solid black;
  /* background: linear-gradient(165deg, #d6d8da 20%, green 20%); */
  background: -webkit-linear-gradient(165deg, #d6d8da 20%, rgba(0, 0, 0, 0) 20%), -webkit-linear-gradient(165deg, rgba(241, 191, 105, 1) 70%, #d6d8da 70%);
    background: -o-linear-gradient(165deg, #d6d8da 20%, rgba(0, 0, 0, 0) 20%), -o-linear-gradient(165deg, rgba(241, 191, 105, 1) 70%, #d6d8da 70%);
    background: -moz-linear-gradient(165deg, #d6d8da 20%, rgba(0, 0, 0, 0) 20%), -moz-linear-gradient(165deg, rgba(241, 191, 105, 1) 70%, #d6d8da 70%);
    background: linear-gradient(165deg, #d6d8da 20%, rgba(0, 0, 0, 0) 20%), linear-gradient(165deg, rgba(241, 191, 105, 1) 70%, #d6d8da 70%);
}

.logo-link{
  text-decoration: none;
  color: inherit;
}

.site-logo{
  font-family: 'Tangerine', cursive;
  font-size: 3rem;
  transform: rotate(-15deg);
}

.link{
  color: inherit;
  padding: 1rem;
  text-decoration: none;
}

.link:hover{
  background-color: #c3c5c7;
}

#app {
   font-family: 'Merriweather', serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #d6d8da;
}

html {
  background: url("../src/img/background.jpg") no-repeat center center fixed;
  background-size: cover;
}

@import url('https://fonts.googleapis.com/css2?family=Merriweather&family=Tangerine:wght@700&display=swap');
@import url('https://fonts.googleapis.com/css2?family=Merriweather&family=Tangerine:wght@700&display=swap');

</style>
