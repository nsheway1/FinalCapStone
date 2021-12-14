<template>
  <div class="featured">
      <h1>Featured Brewery</h1>
      <div class="feature-box">
        <brewery-list-item class="feature-item" draggable="false" id="featured" v-bind:brewery="featuredBrewery" />
        <p class="feature-info">

          "{{featuredBrewery.description}}"
          Bunch of text about this place
          Upvote your favorite breweries to get them featured
        </p>
      </div>
  </div>
</template>

<script>
import breweryService from '@/services/BreweryService'
import BreweryListItem from './BreweryListItem.vue';
export default {
  components: { BreweryListItem },
name: 'featured-brewery',
props: ['featuredBrewery'],
// computed: {
//   brewery(){
//     const featuredBrewery = this.$store.state.featuredBrewery;
//     return featuredBrewery;
//   }
// },
created() {
        breweryService.getBreweries().then( response => {
            this.$store.commit("SET_BREWERIES", response.data);
            this.$store.commit("SET_FEATURED_BREWERY", this.$store.state.breweries[3]);
        })  
    }
}
</script>

<style>

.feature-box {
  display: flex;
  justify-content: space-around;
  background-color: rgb(0, 0, 0, .8);
}

.feature-item {
  width: 42rem;

}

.feature-info {
  color: inherit;
  margin-top: 0rem;
  width: 42rem;
  height: 21.5rem;
    border: .1rem black solid;
  border-radius: 1rem;
  background-color:rgba(251, 170, 27, .5);
  box-shadow: rgba(251, 170, 27, .5) 5px 5px, 
  rgba(251, 170, 27, .3) 10px 10px, 
  rgba(251, 170, 27, .2) 15px 15px,
  rgba(251, 170, 27, .1) 20px 20px,
  rgba(251, 170, 27, .005) 25px 25px;
}
</style>