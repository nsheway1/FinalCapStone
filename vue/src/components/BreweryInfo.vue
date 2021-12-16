<template>
  <div class="whole-thing">
      <div class="spacer"></div>
      <div class="top-half">
      <img :src="imageUrl" class="logo" />
      <p class="description">{{brewery.description}}</p>
      </div>

      <div class="lower-box">
        <div class="carousel">
            <carousel>
                <slide v-for="(image, i) in imageUrls" v-bind:key="i" >
                    <img class="logo" :src="imageUrls[i]" /> 
                </slide>
            </carousel>
            <div class="photo-upload" v-if="this.$store.state.token">
                <input style="display: none" type="file" @change="onFileSelected" ref="imgInput">
                <!-- <h1 class="insert-photo">Insert photo here</h1>  -->
                <button class="select-photo" @click="$refs.imgInput.click()">Select Photo</button>
                <p v-if="photoSelected">Photo Selected</p>
                <button class="upload-photo" @click="onUpload">Upload</button>
                <p v-if="uploadSuccess">Upload Successful!</p>
            </div>
        </div>

        <div class="map-box">
            <brewery-map v-if="mapReady" class="actual-map" v-bind:brewery="brewery" />
            <p class="address">Address: {{brewery.streetAddress}}, {{brewery.city}}, {{brewery.state}}, {{brewery.zipcode}}</p>
        </div>
        </div>

        
        <div class="table-box">
            <h1 class="beers-header">Beer List</h1>
            <div class="table-button">
            <button v-if="this.$store.state.token" @click="showForm=true" class="add-beer"> Add New Beer
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
      </div>

      </div>
</template>

<script>
import breweryService from '@/services/BreweryService.js'
import beerDetailBox from './beerDetailBox.vue';
import AddBeerForm from './addBeerForm.vue';
import BreweryMap from './breweryMap.vue';
import axios from 'axios';
import { Carousel, Slide } from 'vue-carousel'
export default {
  components: { beerDetailBox, AddBeerForm, BreweryMap, Carousel, Slide },
name: 'brewery-info',
data(){
    return{
        brewery: {},
        beers: [],
        selectedBeer: null,
        showForm: false,
        fileToUpload: null,
        photoSelected: false,
        uploadSuccess: false,
        imageUrl: '',
        isLoaded: false,
        mapReady: false,
        imageUrls: [],
        carouselURL: '',
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
    this.mapReady = true;
    this.$store.commit("SET_CURRENT_PAGE", this.brewery.name)
    axios.get('https://us-central1-brewery-finder-f943e.cloudfunctions.net/getImageUrl', { params: { name: this.brewery.name + '-logo.jpg' }})
      .then(response => {
        this.imageUrl = response.data;
      });
    for(let i = 1; i <= this.brewery.carouselCount; i++) {
      axios.get('https://us-central1-brewery-finder-f943e.cloudfunctions.net/getImageUrl', { 
          params: { name: this.brewery.name + ' Carousel-' + i + '.jpg' }})
      .then(response => {
        this.carouselURL = response.data;
        this.imageUrls.push(this.carouselURL);
      });
    }  
});
breweryService.getBeersByBreweryId(this.$route.params.id).then(response =>{
    this.beers = response.data;
    this.beers.forEach(function(beer) {
        beer.showInfo = "false";
    })
});
      this.isLoaded = true;
}
}
</script>

<style>


.photo-upload {
    margin-top: 1rem;
}

.spacer{
    padding: 3rem;
}

.whole-thing{
    background-color: rgba(214, 216, 218, .6);
      padding-bottom: 3rem;
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
    justify-content: space-around;
    flex-basis: 40%;
    margin-top: 5rem;
    
}

.carousel {
    width: 50rem;
}

.map-box {

}

.table-box {
  
}

.table-button {
    display: flex;
    justify-content: center;
}

.actual-map {
    text-align: center;
}

.beer-list{
    margin-right: 2rem;
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
        height: 4rem;
        text-align: left;
        margin-top: 3.2rem;
        background: linear-gradient(1deg, rgba(0, 0, 0, 1), rgba(251, 170, 27, .8));
        color: white;
        /* border: solid rgba(255,255,255,0) 1pt; */
        border-radius: 5px;
        font-size: 1em;
        margin-right: 1rem;
        margin-left: 2rem;
    }
    .add-beer:hover {
        background: rgba(251, 170, 27, .8);
        color:black;
        border: solid black 1pt;
    }

    .select-photo{
    background-color: rgba(251, 170, 27, .8);
    border-radius: 4px;
    margin-bottom: 3px;
    
    }
    .select-photo:hover{
        background-color: rgb(247, 247, 247);
        
    }

    .upload-photo{
        background: rgba(251, 170, 27, .8);
         border-radius: 4px;
    }

    .upload-photo:hover{
     background-color: rgb(247, 247, 247);   
    }

    .insert-photo{
        color: rgba(251, 170, 27, .8);
        font-size: 2;
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    }
</style>