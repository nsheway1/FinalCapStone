<template>
<div>
  <router-link class="brewery-link" v-bind:to="{ name: 'brewery-details', params: {id: brewery.id}}">
  <div class="brewerybox">
      <h1 class="brewery-list-title">{{brewery.name}}</h1>
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
  border: .1rem black solid;
  border-radius: 1rem;
  -webkit-transform: perspective(1px) translateZ(0);
  transform: perspective(1px) translateZ(0);
  -webkit-transition-duration: 0.3s;
  transition-duration: 0.3s;
  -webkit-transition-property: transform;
  transition-property: transform;
  -webkit-transition-timing-function: ease-out;
  transition-timing-function: ease-out;
  background-color:rgba(253, 205, 122, 0.5);
  margin-bottom: 10%;
  /* box-shadow: rgba(251, 170, 27, .5) 5px 5px, 
  rgba(251, 170, 27, .3) 10px 10px, 
  rgba(251, 170, 27, .2) 15px 15px,
  rgba(251, 170, 27, .1) 20px 20px,
  rgba(251, 170, 27, .005) 25px 25px; */
  
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

.brewery-list-title{
  background-color: rgb(5, 92, 77);
  font-weight: normal;
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