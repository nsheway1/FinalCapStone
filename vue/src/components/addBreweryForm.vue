<template>
  <form v-on:submit.prevent="submitForm">
      <label for="name">Name</label>
      <input id="name" type="text" v-model="brewery.name">
      <label for="description">Description</label>
      <input id="description" type="text" v-model="brewery.description">
      <label for="street address">Street Address</label>
      <input id="street address" type= "text" v-model="brewery.streetAddress" >
      <label for="city">City</label>
      <input id="city" type="text" v-model="brewery.city">
      <label for="state">State</label>
      <input id="state" type="text" v-model="brewery.state">
      <label for="zipcode">Zipcode</label>
      <input id="zipcode" type="text" v-model="brewery.zipcode">
      <button>submit</button>
  </form>
</template>


<script>
import breweryService from '@/services/BreweryService'
export default {
  data(){
    return{
      brewery:{
      name:"",
      description:"",
      streetAddress:"",
      city:"",
      state:"",
      zipcode:"",

      }
      
      
    }
  }

}
</script>

<style>

</style>