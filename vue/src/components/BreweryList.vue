<template>
<div class="mainlist"> 
     <div class="sidebar" >
      <h3>Drag brewery here to add to itinerary!</h3>
      <!-- create draggable element to put here -->
      <button>Brew My Trip</button>
    </div>
  <div class="brewery-list">
      <brewery-list-item v-for="brewery in filteredList" 
      v-bind:key="brewery.id" class="brewery" 
      v-bind:brewery="brewery"/>
  </div>
</div>
</template>

<script>
import breweryListItem from '@/components/BreweryListItem'


export default {
    name: 'brewery-list',
    components: {
        breweryListItem,

    },

   props: ['filter'],
    

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



}
</script>

<style>
.brewery-list {
    display: flex;
    flex-wrap: wrap;
    justify-content: space-around;
    flex-direction: row;
    grid-area: list;
}

.brewery {
    
    font-size: 20px;
     flex-basis: 29%;
       
}
.sidebar{
  position: fixed;
  height: 40rem;
  width:20rem;
  grid-area: sidebar;
  margin-top: 13rem;
  top: 0;
  left: 0;

  border: .1rem black solid;
  border-radius: 1rem;
  background-color:rgba(251, 170, 27, .5);
  box-shadow: rgba(251, 170, 27, .5) 5px 5px, 
  rgba(251, 170, 27, .3) 10px 10px, 
  rgba(251, 170, 27, .2) 15px 15px,
  rgba(251, 170, 27, .1) 20px 20px,
  rgba(251, 170, 27, .005) 25px 25px;



}

.mainlist{
    display: grid;
    grid-template-columns: 20% 80%;
    grid-template-areas: 
    "sidebar list";
}






</style>
