<template>
  <div>
      <h1>Welcome to your Brewery Tour Itinerary!</h1>
      <h2>Here is the optimal route for your trip based on the breweries you've selected:</h2>
      <h1 v-for="location in locations" :key="location">{{location}}</h1>
  </div>
</template>

<script>
export default {
name: 'itinerary-view',
computed: {
    locations(){
        return this.$store.state.itinerary;
    }
}
}
</script>

<style>

</style>