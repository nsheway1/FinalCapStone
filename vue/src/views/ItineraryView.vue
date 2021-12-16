<template>
  <div>
      <h1 class="location" v-for="location in locations" :key="location">
          {{location}}
      </h1>
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