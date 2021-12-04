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
.brewery {
  border: 1px black solid;
  border-radius: 10px;
}
.brewery img{
  width: 75%;
  max-height: 100%;
  margin-bottom: 2%;
}
</style>