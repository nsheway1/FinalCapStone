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
    <select v-model="end">
      <option v-for="brewery in this.$store.state.itinerary" :key="brewery" 
      :value="brewery.address_line_1 + ', ' + brewery.city + ', ' + brewery.state">
      {{brewery.name}}
      </option>
    </select>
    <GmapMap :zoom="11" :center="{ lat: 39.96, lng: -82.9988 }">
      <DirectionsRenderer travelMode="DRIVING" :origin="origin" :destination="destination"/>
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
    end: ""
  }),

  computed: {
    origin() {
      if (!this.start) return null;
      return { query: this.start };
    },
    destination() {
      if (!this.end) return null;
      return { query: this.end };
    }
  }
};
</script>

<style>
.vue-map-container {
  height: 300px;
}
</style>