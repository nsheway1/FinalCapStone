<template>
  <div>
      
      </div>

</template>

<script>
import breweryService from '@/services/BreweryService'
export default {
name: 'brewery-info',
data(){
    return{
        brewery: {
            id: 0,
        name:'',
        description:'',
        streetAddress:'',
        city:'',
        zipcode:''

        }
    }
}

created(){
breweryService.getBreweryInfo(this.$route.params.breweryId).then(response => {
this.brewery = response;
}),
breweryService.getBeersByBreweryId(this.$route.params.breweryId).then(response =>{
    /*left here*/
})
}
}
</script>

<style>

</style>