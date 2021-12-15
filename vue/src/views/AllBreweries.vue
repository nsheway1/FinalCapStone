<template>
<div>
  <featured-brew-box :key="featuredBreweryKey" v-if="pageLoaded" />
<label class="brew-form-label" for="breweryNameFilter">Search</label>
   <input type="text" name="" id="breweryNameFilter" v-model="filter.breweryName" />
  <div class="list">
      <brewery-list v-bind:filter="filter" />
  </div>
  <button @click="isAddingBrewery = true">Add Brewery</button>
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
      },
      // featuredURL: ''

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
    }
  },

  beforeCreate() {
         breweryService.getBreweries().then( response => {
            this.$store.commit("SET_BREWERIES", response.data);
         
        })


  },

  created(){

    this.$store.commit("SET_CURRENT_PAGE", 'Browse Breweries');
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

.list{
  padding-top: 1rem;
}

</style>