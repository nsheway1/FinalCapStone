<template>
  <div class="featured">
      <h1>Featured Brewery</h1>
      <brewery-list-item draggable="false" id="featured" v-bind:brewery="brewery" />
  </div>
</template>

<script>
import breweryService from '@/services/BreweryService'
import BreweryListItem from './BreweryListItem.vue';
export default {
  components: { BreweryListItem },
name: 'featured-brewery',
computed: {
  brewery(){
    const featuredBrewery = this.$store.state.featuredBrewery;
    return featuredBrewery;
  }
},
created() {
        breweryService.getBreweries().then( response => {
            this.$store.commit("SET_BREWERIES", response.data);
            this.$store.commit("SET_FEATURED_BREWERY", this.$store.state.breweries[3]);
        })  
    }
}
</script>

<style>

.featured{
  display: grid;
}


</style>