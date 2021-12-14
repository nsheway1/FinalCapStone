<template>



  <div class="brewery-list">
    <input type="text" name="" id="breweryNameFilter" v-model="filter.breweryName" />
      <brewery-list-item v-for="brewery in filteredList" 
      v-bind:key="brewery.id" class="brewery" 
      v-bind:brewery="brewery"/>
  </div>

</template>

<script>
import breweryService from '@/services/BreweryService'
import breweryListItem from '@/components/BreweryListItem'


export default {
    name: 'brewery-list',
    components: {
        breweryListItem,

    },

    data() {
        return {
                    filter: {
            breweryName: ''
        }
        }
    },
    

    computed: {
        breweries() {
            const breweryList = this.$store.state.breweries;
            return breweryList;

        },

        

        filteredList() {
            return this.$store.state.breweries.filter((brewery) => {
                return brewery.name.toLowerCase().includes(this.filter.breweryName.toLowerCase())
            })
        }
        // setFeatured(brewery) {
        //     this.$store.commit("SET_FEATURED", brewery);
        //     const featured = this.$store.state.featured;
        //     return featured
        // }
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
    display: flex;
    flex-wrap: wrap;
    justify-content: space-around;
    flex-direction: row;
}

.brewery {
    
    font-size: 20px;
     flex-basis: 29%;
       
}







</style>
