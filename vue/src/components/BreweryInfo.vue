<template>
  <div class="whole-thing">
      <div class="spacer"></div>
      <div class="top-half">
      <img :src="require('../img/' + brewery.name + '-logo.jpg')" class="logo" />
      <p class="description">{{brewery.description}}</p>
     
      </div>
     
      <div class="lower-box">
          <div class="table-box">
              <h1 class="beers-header">Beer List</h1>
                      <button @click="showForm=true" class="add-beer"> Add New Beer
        
        </button>
      
        <add-beer-form v-if="showForm"/> 
        <table class="beer-list">
        <tr>
            <th>Name</th>
            <th>Type</th>
            <th>ABV</th>
        </tr>
        <tr @click="updateSelectedBeer(beer, index)" v-for="(beer, index) in beers" v-bind:key="beer.id"  >
            <td>
                {{beer.name}}
                <beer-detail-box v-bind:beer="beer" v-if="selectedBeer== index">
                    
                </beer-detail-box></td>
            <td>{{beer.type}}</td>
            <td>{{beer.abv}}%</td>
        </tr>
        </table>
        </div>
        <div class="map-box">
        <brewery-map class="actual-map" v-bind:brewery="brewery" />
         <p class="address">Address: {{brewery.streetAddress}}, {{brewery.city}}, {{brewery.state}}, {{brewery.zipcode}}</p>
        </div>
        </div>
        <input style="display: none" type="file" @change="onFileSelected" ref="imgInput">
        <button @click="$refs.imgInput.click()">Select Photo</button>
        <p v-if="photoSelected">Photo Selected</p>
        <button @click="onUpload">Upload</button>
        <p v-if="uploadSuccess">Upload Successful!</p>
      </div>
</template>

<script>
import breweryService from '@/services/BreweryService.js'
import beerDetailBox from './beerDetailBox.vue';
import AddBeerForm from './addBeerForm.vue';
import BreweryMap from './breweryMap.vue';
import axios from 'axios';
export default {
  components: { beerDetailBox, AddBeerForm, BreweryMap },
name: 'brewery-info',
data(){
    return{
        brewery: {},
        beers: [],
        selectedBeer: null,
        showForm: false,
        fileToUpload: null,
        photoSelected: false,
        uploadSuccess: false
    }
},
methods: {
    updateSelectedBeer(beer, index) {
        this.selectedBeer = index;
    },
    onFileSelected(event) {
        this.fileToUpload = event.target.files[0];
        this.photoSelected = true;
        this.uploadSuccess = false;
    },
    onUpload(){
        const fd = new FormData();
        fd.append('image', this.fileToUpload, this.fileToUpload.name);
        axios.post('https://us-central1-brewery-finder-f943e.cloudfunctions.net/uploadImage', fd)
        .then(response => {
            console.log(response);
        });
        this.photoSelected = false;
        this.uploadSuccess = true;
    }
},

created(){
breweryService.getBreweryInfo(this.$route.params.id).then(response => {
    this.brewery = response.data;
    this.$store.commit("SET_CURRENT_PAGE", this.brewery.name)
});
breweryService.getBeersByBreweryId(this.$route.params.id).then(response =>{
    this.beers = response.data;
    this.beers.forEach(function(beer) {
        beer.showInfo = "false";
    })
});
}
}
</script>

<style>

.spacer{
    padding: 3rem;
}

.whole-thing{
    background-color: rgba(214, 216, 218, .6);
}

.top-half{
    display: grid;
    grid-template-columns: 1fr 1fr;
    grid-template-areas: 
    "logo descr"
    "logo address";
    background-color: rgba(241, 191, 105, 1);
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
    color: black;
    font-size: 2.5rem;
    font-weight: normal;
    /* width: 50%; */
    /* margin-left: auto;
    margin-right: auto; */
}

.lower-box {
    display: flex;
    justify-content: space-evenly;
    
}

.actual-map {
    text-align: center;
}

.beer-list{
    table-layout: fixed;
    width: 50rem;
    border: .1rem solid #d6d8da;
    background: linear-gradient(1deg, rgba(0, 0, 0, 1), rgba(251, 170, 27, .8));
}

.beer-list th{
    font-weight: normal;
    border: .1rem solid #d6d8da;
    font-size: 1.7rem;
}

.beer-list td {
    font-weight: normal;
    border: .1rem solid #d6d8da;
    font-size: 1.3rem;
}

.beer-list tr:hover{
    background-color: rgba(255, 255, 255, .3);
}

p{
    color: black;
    font-size: 1.7rem;
}

 .add-beer {
        text-align: left;
        padding: 20px 50px;
        background: linear-gradient(1deg, rgba(0, 0, 0, 1), rgba(251, 170, 27, .8));
        color: white;
        border: solid rgba(255,255,255,0) 1pt;
        font-size: 1em;
    }
    .add-beer:hover {
        background: rgba(251, 170, 27, .8);
        color:black;
        border: solid black 1pt;
    }
</style>