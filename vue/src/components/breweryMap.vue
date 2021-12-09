<template>
  <div> 
         <GmapMap 
  :center='center'
  :zoom="15"
  map-type-id="terrain"
  style="width: 100%; height: 25rem;"
>

  <GmapMarker
    :key="index"
    v-for="(m, index) in markers"
    :position="m.position"
    :clickable="true"
    :draggable="true"
    @click="center=m.position"
  />
</GmapMap>

  </div>


</template>

<script>
export default {
    name: 'brewery-map',

    data() {
        return {
            center: null,
            markers: []
        }
    },

       created() {
        
            const marker = {
                lat: 39.9867941,
                lng: -83.0022474,
            };

       this.markers.push({ position: marker });
       this.center = marker;
        
    },


}
</script>

<style>

</style>