<template>
  <div class="list">
      <brewery-list />
  </div>
</template>

<script>
import BreweryList from '@/components/BreweryList.vue'
export default {
    name: 'all-breweries',
  components: { BreweryList },
  created(){
    this.$store.commit("SET_CURRENT_PAGE", 'Browse Breweries')
  }

};
</script>

<style>

.list{
  padding-top: 1rem;
}

</style>