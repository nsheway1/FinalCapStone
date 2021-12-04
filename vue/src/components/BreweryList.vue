<template>
  <div class="brewery-list">
      <brewery-list-item v-for="brewery in breweries" 
      v-bind:key="brewery.id" class="brewery" 
      v-bind:brewery="brewery" />
      
          
        
  </div>
</template>

<script>
import breweryService from '@/services/BreweryService'
import breweryListItem from '@/components/BreweryListItem'

export default {
    name: 'brewery-list',
    components: {
        breweryListItem
    },
    computed: {
        breweries() {
            const breweryList = this.$store.state.breweries;
            return breweryList;

        }
    },
    created() {
        breweryService.getBreweries().then( response => {
            this.$store.commit("SET_BREWERIES", response.data);
        })
    }
}
</script>

<style>
.brewery-list {
    margin: auto auto;
    padding: 20px 20px;
    display:flex;
    justify-content:space-between;
    flex-direction: row-reverse;
    flex-basis: 25%;
}

.brewery {
    font-size: 20px;
    flex-grow: 1;
    padding: 30px 30px;
    width: 35%;
}

</style>
