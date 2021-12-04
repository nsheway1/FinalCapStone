<template>
  <div class="brewery">
      <h1>{{brewery.name}}</h1>
      <img :src="require('../img/' + brewery.name + '.jpg')" />
  </div>
</template>

<script>
export default {
    name: 'brewery-list-item',
    props: ['brewery']
    

}
</script>

<style>

</style>