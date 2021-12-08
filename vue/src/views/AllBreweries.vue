<template>
  <div class="list">
      <brewery-list />
  </div>
</template>

<script>
import BreweryList from '@/components/BreweryList.vue'
export default {
    name: 'all-breweries',
  components: { BreweryList }

};
</script>

<style>

.list{
  padding-top: 1rem;
  background-color: rgba(214, 216, 218, .8);
}

</style>