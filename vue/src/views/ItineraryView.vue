<template>
  <div>
    <h1>Welcome to your Brewery Tour Itinerary!</h1>
    <h2>Here is the optimal route for your trip based on the breweries you've selected:</h2>
      <!-- <h1 v-for="location in locations" :key="location">{{location}}</h1> -->
    <div class="i-map" v-if="pageLoaded">  
        <itinerary-map  />
    </div>
  </div>
</template>

<script>
import ItineraryMap from '../components/ItineraryMap.vue';
export default {
  components: { ItineraryMap },
name: 'itinerary-view',
data(){
    return{
        pageLoaded: false,
    }
},
mounted(){
    setTimeout(() => this.pageLoaded = true, 1000);
}
}
</script>

<style>

.i-map{
   display: flex;
   justify-content: center;
}

</style>