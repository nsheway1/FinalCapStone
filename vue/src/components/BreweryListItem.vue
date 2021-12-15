<template>
<div class ="brewery-div" :id="id">  
  <router-link class="brewery-link" v-bind:to="{ name: 'brewery-details', params: {id: brewery.id}}">
  <div class="brewerybox">
      <h1 class="brewery-list-title">{{brewery.name}}</h1>
      <img :src="imageUrl" /> 
  </div>
  </router-link>
  <div class="social-parent">
  <div class="social">
    <p class="like-text">Like {{this.brewery.name}} ?</p>
  <img v-if="!voted && !voteLocked" class="unliked" src="../img/singleBeerEmpty.jpg" @click="voted=true; updateBrewVotes(brewery, brewery.id)"/>
  <img v-if="voted" class="liked" src="../img/twinBeersFull.jpg"/>

  </div>
  </div>
</div>  
</template>



<script>
import axios from 'axios'
import breweryService from '@/services/BreweryService.js'

export default {
    name: 'brewery-list-item',
    props: ['brewery', 'id', 'featuredURL'],
    data(){
      return{
        imageUrl: '',
        isLoaded: false,
        voted: false,
        voteLocked: false
      }
    },
    created(){
      axios.get('https://us-central1-brewery-finder-f943e.cloudfunctions.net/getImageUrl', { params: { name: this.brewery.name + '.jpg' }})
      .then(response => {
        this.imageUrl = response.data;
      });
      // this.isLoaded = true;
    },

    methods: {
      updateBrewVotes(breweryToUpdate, breweryId) {
        breweryService.updateVoteCount(breweryToUpdate, breweryId);
        this.voteLocked = true;
      //   axios.get('https://us-central1-brewery-finder-f943e.cloudfunctions.net/getImageUrl', { params: { name: this.brewery.name + '.jpg' }})
      // .then(response => {
      //  this.$store.commit("SET_FEATURED_URL", response.data);
      // });
        setTimeout(() => this.$store.commit("INCREMENT_VOTE_COUNT"), 500);
      },
      // determineURL(){
      //   if(this.$store.state.featured.name && this.brewery.name == this.$store.state.featured.name){
      //     return this.featuredURL;
      //   }
      //   return this.imageUrl;
      // }
    }
}
</script>

<style>
.like-text {
  font-size: 1rem;
}

.social-parent {
  display: flex;
  justify-content: center;
  flex-wrap: wrap;
  
}

.social {
  display: flex;
  background-color: wheat;
  justify-content: center;
  max-width: 22rem;
  max-height: 3rem;
}

.unliked{
  
  height: 3rem;
  margin-top: 0rem;
}

.unliked:hover {
  background-color: teal;
  cursor: pointer;
}

.liked {
  height: 3rem;
  margin-top: 0rem;
}

.brewery-div{
  margin-bottom: 4rem;
  
}

.brewery-link{
  text-decoration: none;
  color: inherit;
}

.brewerybox{
  border: .1rem black solid;
  border-radius: 1rem;
  -webkit-transform: perspective(1px) translateZ(0);
  transform: perspective(1px) translateZ(0);
  -webkit-transition-duration: 0.3s;
  transition-duration: 0.3s;
  -webkit-transition-property: transform;
  transition-property: transform;
  -webkit-transition-timing-function: ease-out;
  transition-timing-function: ease-out;
  background-color:rgba(251, 170, 27, .5);
  margin-bottom: 3%;
  box-shadow: rgba(251, 170, 27, .5) 5px 5px, 
  rgba(251, 170, 27, .3) 10px 10px, 
  rgba(251, 170, 27, .2) 15px 15px,
  rgba(251, 170, 27, .1) 20px 20px,
  rgba(251, 170, 27, .005) 25px 25px;
  
}



.brewerybox:hover, .brewerybox:focus, .brewerybox:active {
  -webkit-transform: translateY(-8px);
  transform: translateY(-8px);
}
.brewerybox img{
  width: 20rem;
  height: 15rem;
  margin-bottom: 2%;
}

.brewery-list-title{
  background-color: rgb(0, 0, 0, .6);
  font-weight: normal;
}

@keyframes shake {
 0% { transform: translate(1px, 1px) rotate(0deg); }
  10% { transform: translate(-1px, -2px) rotate(-1deg); }
  20% { transform: translate(-3px, 0px) rotate(1deg); }
 30% { transform: translate(3px, 2px) rotate(0deg); }
 40% { transform: translate(1px, -1px) rotate(1deg); }
 50% { transform: translate(-1px, 2px) rotate(-1deg); }
 60% { transform: translate(-3px, 1px) rotate(0deg); }
 70% { transform: translate(3px, 1px) rotate(-1deg); }
 80% { transform: translate(-1px, -1px) rotate(1deg); }
 90% { transform: translate(1px, 2px) rotate(0deg); }
 100% { transform: translate(1px, -2px) rotate(-1deg); }
}



</style>