<template>
<div>
  <!-- <featured-brewery /> -->
  <div class="list">
      <brewery-list />
  </div>
  <button @click="isAddingBrewery = true">Add Brewery</button>
  <add-brewery-form v-if="isAddingBrewery" />
</div>
</template>

<script>
import BreweryList from '@/components/BreweryList.vue'
import AddBreweryForm from '../components/addBreweryForm.vue';
export default {
  name: 'all-breweries',
  components: { BreweryList, AddBreweryForm },
  data(){
    return{
      isAddingBrewery: false
    }
  },
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