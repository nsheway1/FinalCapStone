<template>
  <div>
      <div v-for="brewery in breweries" v-bind:key="brewery.id">
          
      </div>
  </div>
</template>

<script>
import breweryService from '../services/BreweryService.js';

export default {
    name: 'brewery-list',
    data() {
        return {
            breweries: []
        }
    },
    created() {
        breweryService.getBreweries().then( response => {
            this.breweries = response.data;
        })
    }
}
</script>

<style>


</style>