<template>
<div>
  <featured-brew-box :key="featuredBreweryKey" v-if="pageLoaded" class="feature-brew-box"/>
<div class="search-area">
  <img class="magnify-glass" src="../img/search.jpg" />
  <div class="bar-label">
    <label class="brew-form-label" for="breweryNameFilter"></label>
    <input class="search-input" type="text" name="" 
    id="breweryNameFilter" v-model="filter.breweryName" 
    placeholder="Search for breweries" />
  </div>
</div>
<div class="list">
      <brewery-list v-bind:filter="filter" />
</div>
  <button v-if="isLoggedIn" @click="isAddingBrewery = true">Add Brewery</button>
  <add-brewery-form v-if="isAddingBrewery" />
</div>
</template>

<script>
import BreweryList from '@/components/BreweryList.vue'
import AddBreweryForm from '../components/addBreweryForm.vue';
import breweryService from '@/services/BreweryService'
import FeaturedBrewBox from '../components/FeaturedBrewBox.vue';
// import axios from 'axios'

export default {
  name: 'all-breweries',
  components: { BreweryList, AddBreweryForm, FeaturedBrewBox},
  data(){
    return{
      isAddingBrewery: false,
      pageLoaded: false,
      filter: {
        breweryName:""
      }
    }
  },

  computed: {
    featured() {
      let featuredBrewery;
      let x = 0;
      this.$store.state.breweries.forEach(brewery => {
         if (brewery.voteCount > x) {
           x = brewery.voteCount;
           featuredBrewery = brewery;
         }

       });
        return featuredBrewery
    },
    featuredBreweryKey() {
      return this.$store.state.featuredKey;
    },
    isLoggedIn(){
      return this.$store.state.token;
    }
  },

  beforeCreate() {
         breweryService.getBreweries().then( response => {
            this.$store.commit("SET_BREWERIES", response.data);
         
        })


  },

  created(){

    this.$store.commit("SET_CURRENT_PAGE", 'Explore Columbus Beer');
          this.pageLoaded = true;
    // setTimeout(() => this.$store.commit("SET_FEATURED", this.featured), 500);
    // let featURL;
    // axios.get('https://us-central1-brewery-finder-f943e.cloudfunctions.net/getImageUrl', { params: { name: this.featured.name + '.jpg' }})
    //   .then(response => {
    //    featURL = response.data;
    //   });
    //   setTimeout(() => this.$store.commit("SET_FEATURED_URL", featURL), 500);

      //     setTimeout(() => 
      //     this.setFeatured(this.$store.state.breweries), 500
      //  )
   
  },


  //  methods: {

  //    setFeatured(breweryList) {
  //      breweryList.forEach(brewery => {
  //         let x = 0;
  //        if (brewery.voteCount > x) {
  //          x = brewery.voteCount;
  //          this.featuredBrewery = brewery;
  //        }
  //      }) 
  //      this.pageLoaded = true;
     
  //  } 
  // methods: {
  //     drop: event => {
  //       const box_id = event.dataTransfer.getData('box_id');
  //       const box = document.getElementById(box_id);
  //       box.style.display = "block";
  //       event.target.appendChild(box);
  //     }
  //   }

}


</script>

<style>

.search-area {
  display: flex;
  justify-content: center;
}

.magnify-glass {
  margin-top: .7rem;
  margin-right: .2rem;
  height: 2.5rem;
  color: wheat;
}

.search-input {
  margin-top: 1rem;
  height: 1.5rem;
  border-radius: 5px;

}

.list{
  padding-top: 1rem;
}

.feature-brew-box {
  margin-left: 20rem;

 

}

</style>