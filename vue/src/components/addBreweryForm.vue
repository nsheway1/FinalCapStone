<template>
<div>
  <form v-if="showForm" v-on:submit.prevent="submitForm">
      <label class="brew-form-label" for="name">Name</label>
      <input id="name" type="text" v-model="brewery.name">
      <label class="brew-form-label" for="description">Description</label>
      <input id="description" type="text" v-model="brewery.description">
      <label class="brew-form-label" for="street address">Street Address</label>
      <input id="street address" type= "text" v-model="brewery.streetAddress" >
      <label class="brew-form-label" for="city">City</label>
      <input id="city" type="text" v-model="brewery.city">
      <label class="brew-form-label" for="state">State</label>
      <input id="state" type="text" v-model="brewery.state">
      <label class="brew-form-label" for="zipcode">Zipcode</label>
      <input id="zipcode" type="text" v-model="brewery.zipcode">
      <button>submit</button>
  </form>
      
      <div v-if="showPhotoUploader">
      <p class="brew-upload-status-text">Add Brewery Photo</p>
      <input style="display: none" type="file" @change="onFileSelected" ref="imgInput">
      <button class="select-photo" @click="$refs.imgInput.click()">Select Photo</button>
        <p class="brew-upload-status-text" v-if="photoSelected">Photo Selected</p>
        <button class="upload-photo" @click="onUploadPhoto">Upload</button>
        <p class="brew-upload-status-text" v-if="uploadSuccess">Upload Successful!</p>
      </div>

      <div v-if="showLogoUploader">
      <p class="brew-upload-status-text">Add Brewery Logo</p>
      <input style="display: none" type="file" @change="onLogoSelected" ref="imgInput">
      <button class="select-photo" @click="$refs.imgInput.click()">Select Logo Image</button>
        <p class="brew-upload-status-text" v-if="photoSelected">Image Selected</p>
        <button class="upload-photo" @click="onUploadLogo">Upload</button>
        <p class="brew-upload-status-text" v-if="uploadSuccess">Upload Successful!</p>
      </div>
  </div>
</template>


<script>
import breweryService from '@/services/BreweryService'
import axios from 'axios'
export default {
  name: 'add-brewery-form',
  data(){
    return{
      brewery:{
        id: 0,
        name:"",
        description:"",
        streetAddress:"",
        city:"",
        state:"",
        zipcode:""
      },
      showForm: true,
      showPhotoUploader: false,
      fileToUpload: null,
      photoSelected: false,
      uploadSuccess: false,
      showLogoUploader: false
    }
  },
  methods:{
    submitForm(){
      breweryService.addNewBrewery(this.brewery);
      this.showPhotoUploader = true;
      this.showForm = false;
    },
    onFileSelected(event) {
        this.fileToUpload = event.target.files[0];
        this.photoSelected = true;
        this.uploadSuccess = false;
    },
    onLogoSelected(event){
      this.fileToUpload = event.target.files[0];
      this.photoSelected = true;
      this.uploadSuccess = false;
    },
    onUploadPhoto(){
        const fd = new FormData();
        fd.append('image', this.fileToUpload, this.brewery.name + '.jpg');
        axios.post('https://us-central1-brewery-finder-f943e.cloudfunctions.net/uploadImage', fd)
        .then(response => {
            console.log(response);
        });
        this.photoSelected = false;
        this.uploadSuccess = true;
        this.showLogoUploader = true;
    },
    onUploadLogo(){
        const fd = new FormData();
        fd.append('image', this.fileToUpload, this.brewery.name + '-logo.jpg');
        axios.post('https://us-central1-brewery-finder-f943e.cloudfunctions.net/uploadImage', fd)
        .then(response => {
            console.log(response);
        });
        this.photoSelected = false;
        this.uploadSuccess = true;
        document.location.reload(true);
        this.$forceUpdate();
    }
  }


}
</script>

<style>

.brew-form-label{
  background-color: black;
  color: #d6d8da;
}

.brew-upload-status-text{
  background-color: black;
  color: #d6d8da;
}

</style>