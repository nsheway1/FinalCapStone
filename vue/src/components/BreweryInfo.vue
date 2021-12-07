<template>
  <div>
      <h1 class="brewery-details-title">{{brewery.name}}</h1>
      <div class="top-half">
      <img :src="require('../img/' + brewery.name + '-logo.jpg')" class="logo" />
      <p class="description">{{brewery.description}}</p>
      <p class="address">Address: {{brewery.streetAddress}}, {{brewery.city}}, {{brewery.state}}, {{brewery.zipcode}}</p>
      </div>
      <h1 class="beers-header">Beer List</h1>
      <table class="beer-list">
      <tr>
          <th>Name</th>
          <th>Type</th>
          <th>ABV</th>
      </tr>
      <tr v-for="beer in beers" v-bind:key="beer.id" >
          <td>{{beer.name}}</td>
          <td>{{beer.type}}</td>
          <td>{{beer.abv}}%</td>
      </tr>
      </table>
  </div>

</template>

<script>
import breweryService from '@/services/BreweryService.js'
export default {
name: 'brewery-info',
data(){
    return{
        brewery: {},
        beers: []
    }
},

created(){
breweryService.getBreweryInfo(this.$route.params.id).then(response => {
    this.brewery = response.data;
});
breweryService.getBeersByBreweryId(this.$route.params.id).then(response =>{
    this.beers = response.data;
})
}
}
</script>

<style>

.brewery-details-title{
    font-size: 3rem;
    font-weight: normal;
}

.top-half{
    display: grid;
    grid-template-columns: 1fr 1fr;
    grid-template-areas: 
    "logo descr"
    "logo address";
    background-color: rgba(251, 170, 27, .8);
    align-items: center;
    justify-items: center;
}

.logo{
    border-radius: 1rem;
    height: 12rem;
    grid-area: logo;
}

.description{
    grid-area: descr;
}

.address{
    grid-area: address;
}

.beers-header{
    font-size: 2.5rem;
    font-weight: normal;
    background-color: rgba(0, 0, 0, .4);
    width: 50%;
    margin-left: auto;
    margin-right: auto;
}

.beer-list{
    margin-left: auto;
    margin-right: auto;
    width: 60%;
    border: .1rem solid #d6d8da;
    background: linear-gradient(1deg, rgba(0, 0, 0, 1), rgba(251, 170, 27, .8));
}

.beer-list th, td{
    font-weight: normal;
    border: .1rem solid #d6d8da;
    font-size: 1.7rem;
}

.beer-list tr:hover{
    background-color: rgba(255, 255, 255, .3);
}

p{
    color: black;
    font-size: 1.7rem;
}

</style>