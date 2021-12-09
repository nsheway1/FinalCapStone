<template>
  <form v-on:submit.prevent="submitForm">
      <label for="name">Name</label>
      <input id="name" type="text" v-model="beer.name">
      <label for="type">Type</label>
      <input id="type" type="text" v-model="beer.type">
      <label for="description">Description</label>
      <input id="description" type="text" v-model="beer.description">
      <label for="ABV">ABV</label>
      <input id="ABV" type= "text" v-model="beer.abv" >
      <button>submit</button>
  </form>
</template>

<script>
import breweryService from '@/services/BreweryService'
export default {
name:'add-beer-form',
data(){
    return{
        beer:{
            id:0,
            name:"",
            type:"",
            description:"",
            abv:0.0,
            breweryId:0
        }
    }
},
methods:{
    submitForm(){
        this.beer.breweryId= this.$route.params.id;
        breweryService.addNewBeer(this.beer, this.$route.params.id);

         document.location.reload(true);
        this.$forceUpdate();
    }
}
}
</script>

<style>
 label{
     color: black;
 }

</style>