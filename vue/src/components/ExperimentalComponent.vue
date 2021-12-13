<template>
<div>
    <div class="row">
        <div class="column">
        <draggable :list="featured" class="list-group column-drag" >
             <brewery-list-item v-for="brewery in featured" 
      v-bind:key="brewery.id" class="brewery" 
       />  
        </draggable>
        </div>
    </div>
 
<div class="row">
    <div class="column">
  <div class="brewery-list">
      <draggable :list="breweries" class="list-group column-drag" >
      <brewery-list-item v-for="brewery in breweries" 
      v-bind:key="brewery.id" class="brewery" 
      v-bind:brewery="brewery"/>
      </draggable>
        
  </div>
  </div>
  </div>
</div>
</template>

<script>
import breweryService from '@/services/BreweryService'
import breweryListItem from '@/components/BreweryListItem'
import draggable from 'vuedraggable'

export default {
    name: 'brewery-list',
    components: {
        breweryListItem,
        draggable
    },

    data() {
        return {
            featured: []
        }
    },
    computed: {
        breweries() {
            const breweryList = this.$store.state.breweries;
            return breweryList;

        },
        // setFeatured(brewery) {
        //     this.$store.commit("SET_FEATURED", brewery);
        //     const featured = this.$store.state.featured;
        //     return featured
        // }
    },

    methods: {
        addFeature(brewery) {
            this.featured.push(brewery);
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
    display: flex;
    flex-wrap: wrap;
    justify-content: space-around;
    flex-direction: row;
}

.brewery {
    
    font-size: 20px;
     flex-basis: 29%;
       
}

.row {
    min-height: 10rem;
}





</style>
