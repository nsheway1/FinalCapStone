import Vue from 'vue'
import App from './App.vue'
import router from './router/index'
import store from './store/index'
import axios from 'axios'
import * as VueGoogleMaps from 'vue2-google-maps'
import Geocoder from "@pderas/vue2-geocoder"
import firebase from 'firebase'

const firebaseConfig = {
  apiKey: "AIzaSyC5HGZSVCEh5xfUfNYs7pqU4JKYGTf8E4Y",
  authDomain: "brewery-finder-f943e.firebaseapp.com",
  projectId: "brewery-finder-f943e",
  storageBucket: "brewery-finder-f943e.appspot.com",
  messagingSenderId: "107821408111",
  appId: "1:107821408111:web:313f745afed0be3c44129a",
  measurementId: "G-EF9MZWVRK7"
};

// Initialize Firebase
firebase.initializeApp(firebaseConfig);

Vue.config.productionTip = false

axios.defaults.baseURL = process.env.VUE_APP_REMOTE_API;

Vue.use(Geocoder, {
  defaultCountryCode: 'US',
  defaultLanguage: 'en',
  defaultMode: 'address', // or 'lat-lng'
  googleMapsApiKey: 'AIzaSyBNA9LokvNMh6SfE9LQdZVGxwK-ndBmkms'
});

Vue.use(VueGoogleMaps, {
  load: {
    key: 'AIzaSyBNA9LokvNMh6SfE9LQdZVGxwK-ndBmkms',
    libraries: 'places',
  }
})

new Vue({
  router,
  store,
  render: h => h(App)
}).$mount('#app')
