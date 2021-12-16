<template>
  <div class="sidebar" :id="id" @dragover.prevent @drop.prevent="drop" >
      <h3>Drag brewery here to add to itinerary!</h3>
      <button @click="setupItinerary">Brew My Trip</button>
</div>
</template>

<script>
import breweryService from '@/services/BreweryService.js'
export default {
    name: 'sidebar',
    props: ['id'],
    data(){
        return{
            breweryNames: []
        }
    },

    methods: {
    drop(e) {
      const box_id = e.dataTransfer.getData('box_id');
      const name = document.createElement('h3');
      name.innerText = box_id;
      e.target.appendChild(name);
      this.breweryNames.push(box_id);
    },
    setupItinerary(){
        breweryService.getItineraryList(this.breweryNames).then( response => {
            const tempArr = response.data;
            let markers = [];
            tempArr.forEach(brewery => {
                let addressObj = {
                    address_line_1: brewery.streetAddress,
                    address_line_2: '',
                    city: brewery.city,
                    state: brewery.state,
                    zip_code: brewery.zipcode,
                    country: 'United States'
                };
                this.$geocoder.send(addressObj, response => {
                    let tempMarker = response.results[0].geometry.location;
                    markers.push({position: tempMarker});
                });
            });
            setTimeout(() => this.$store.commit("GENERATE_ITINERARY", markers), 1500);
            setTimeout(() => this.$router.push({name: 'itinerary-view'}), 1501);
        })
    }
  }
}
</script>

<style>

.sidebar{
  position: fixed;
  height: 32rem;
  width:19rem;
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

</style>