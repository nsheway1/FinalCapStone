<template>
  <div>
      <h1>{{brewery.name}}</h1>
      <p>{{brewery.description}}</p>
      <li v-for="beer in beers" v-bind:key="beer.id" >{{beer.name}}</li>
  </div>

</template>

<script>
import breweryService from '@/services/BreweryService.js'
export default {
name: 'brewery-info',
data(){
    return{
        brewery: {},
        beers: []
    }
},

created(){
breweryService.getBreweryInfo(this.$route.params.id).then(response => {
    this.brewery = response.data;
});
breweryService.getBeersByBreweryId(this.$route.params.id).then(response =>{
    this.beers = response.data;
})
}
}
</script>

<style>

</style>