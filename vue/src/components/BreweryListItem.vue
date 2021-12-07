<template>
<div>
  <router-link class="brewery-link" v-bind:to="{ name: 'brewery-details', params: {id: brewery.id}}">
  <div class="brewerybox">
      <h1>{{brewery.name}}</h1>
      <img :src="require('../img/' + brewery.name + '.jpg')" />
  </div>
  </router-link>
</div>  
</template>

<script>
export default {
    name: 'brewery-list-item',
    props: ['brewery']
    

}
</script>

<style>
.brewery-link{
  text-decoration: none;
  color: inherit;
}

.brewerybox{
  border: 1px black solid;
  border-radius: 10px;
  -webkit-transform: perspective(1px) translateZ(0);
  transform: perspective(1px) translateZ(0);
  -webkit-transition-duration: 0.3s;
  transition-duration: 0.3s;
  -webkit-transition-property: transform;
  transition-property: transform;
  -webkit-transition-timing-function: ease-out;
  transition-timing-function: ease-out;
  background-color:rgba(251, 170, 27, .5);
  margin-bottom: 10%;
  box-shadow: .25rem .25rem .25rem rgba(251, 170, 27, .7);
  
}



.brewerybox:hover, .brewerybox:focus, .brewerybox:active {
  -webkit-transform: translateY(-8px);
  transform: translateY(-8px);
}
.brewerybox img{
  width: 20rem;
  height: 15rem;
  margin-bottom: 2%;
}

h1 {
  background-color: rgba(0, 0, 0, .7);
}

@keyframes shake {
 0% { transform: translate(1px, 1px) rotate(0deg); }
  10% { transform: translate(-1px, -2px) rotate(-1deg); }
  20% { transform: translate(-3px, 0px) rotate(1deg); }
 30% { transform: translate(3px, 2px) rotate(0deg); }
 40% { transform: translate(1px, -1px) rotate(1deg); }
 50% { transform: translate(-1px, 2px) rotate(-1deg); }
 60% { transform: translate(-3px, 1px) rotate(0deg); }
 70% { transform: translate(3px, 1px) rotate(-1deg); }
 80% { transform: translate(-1px, -1px) rotate(1deg); }
 90% { transform: translate(1px, 2px) rotate(0deg); }
 100% { transform: translate(1px, -2px) rotate(-1deg); }
}

</style>