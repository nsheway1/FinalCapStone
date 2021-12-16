<template>
  <div>
    <b>Start:</b>
    <select v-model="start">
      <option v-for="brewery in this.$store.state.itinerary" :key="brewery" 
      :value="brewery.address_line_1 + ', ' + brewery.city + ', ' + brewery.state">
      {{brewery.name}}
      </option>
    </select>
    <b>End:</b>
    <select @change="waypointCalc" v-model="end">
      <option v-for="brewery in this.$store.state.itinerary" :key="brewery" 
      :value="brewery.address_line_1 + ', ' + brewery.city + ', ' + brewery.state">
      {{brewery.name}}
      </option>
    </select>
    <GmapMap :zoom="11" :center="{ lat: 39.96, lng: -82.9988 }">
      <DirectionsRenderer travelMode="DRIVING" :origin="origin" :destination="destination" :waypoints="waypoints" />
    </GmapMap>
  </div>
</template>

<script>
import DirectionsRenderer from "@/components/DirectionsRenderer";

export default {
  components: {
    DirectionsRenderer
  },

  data: () => ({
    start: "",
    end: "",
    waypoints: []
  }),

  computed: {
    origin() {
      if (!this.start) return null;
      return { query: this.start };
    },
    destination() {
      if (!this.end) return null;
      return { query: this.end };
    },
  },

  methods: {
    waypointCalc(){
      this.$store.state.itinerary.forEach(brewStop => {
        let point = {
          location: brewStop.address_line_1 + ', ' + brewStop.city + ', ' + brewStop.state
        }
        if(point.location != this.start && point.location != this.end){
          this.waypoints.push(point);
        } 
      })
    }
  }
};
</script>

<style>
.vue-map-container {
  height: 300px;
}
</style>