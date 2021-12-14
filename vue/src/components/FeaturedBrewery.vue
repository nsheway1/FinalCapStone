<template>
  <div class="featured">
      <h1>Featured Brewery</h1>
      <brewery-list-item v-bind:brewery="brewery" />
  </div>
</template>

<script>
export default {
name: 'featured-brewery',
computed: {
  brewery(){
    const featuredBrewery = this.$store.state.featuredBrewery;
    return featuredBrewery;
  }
}
}
</script>

<style>

.featured{
  display: grid;
}


</style>