<template>
<div>
  <!-- <featured-brewery v-if="pageLoaded" :key="id" :id="id" @dragover.prevent @drop.prevent="drop" /> -->
  <div class="list">
      <brewery-list />
  </div>
  <button @click="isAddingBrewery = true">Add Brewery</button>
  <add-brewery-form v-if="isAddingBrewery" />
</div>
</template>

<script>
import BreweryList from '@/components/BreweryList.vue'
import AddBreweryForm from '../components/addBreweryForm.vue';
// import FeaturedBrewery from '../components/FeaturedBrewery.vue';
export default {
  name: 'all-breweries',
  props: ['id'],
  components: { BreweryList, AddBreweryForm, FeaturedBrewery },
  data(){
    return{
      isAddingBrewery: false,
      pageLoaded: false
    }
  },
  created(){
    this.$store.commit("SET_CURRENT_PAGE", 'Browse Breweries');
  },
  mounted(){
    this.$forceUpdate;
    this.pageLoaded = true;
   },
  // methods: {
  //     drop: event => {
  //       const box_id = event.dataTransfer.getData('box_id');
  //       const box = document.getElementById(box_id);
  //       box.style.display = "block";
  //       event.target.appendChild(box);
  //     }
  //   }

};
</script>

<style>

.list{
  padding-top: 1rem;
}

</style>