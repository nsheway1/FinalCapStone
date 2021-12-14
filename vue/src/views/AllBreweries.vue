<template>
<div>
<label class="brew-form-label" for="breweryNameFilter">Search</label>
   <input type="text" name="" id="breweryNameFilter" v-model="filter.breweryName" />
  <div class="list">
      <brewery-list v-bind:filter="filter" />
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
      isAddingBrewery: false,
      filter: {
        breweryName:""
      }
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