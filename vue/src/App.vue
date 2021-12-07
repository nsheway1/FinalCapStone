<template>
  <div id="app">
    <div id="nav">
      <router-link v-bind:to="{ name: 'home' }">Home</router-link>&nbsp;|&nbsp;
      <router-link v-bind:to="{ name: 'logout' }" v-if="$store.state.token != ''">Logout</router-link>
    </div>
    <router-view class="main" />
  </div>
</template>

<style>
#app {
   font-family: fantasy;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #d6d8da;
}

html {
  background: url("../src/img/background.jpg") no-repeat center center fixed;
  background-size: cover;
}
</style>
