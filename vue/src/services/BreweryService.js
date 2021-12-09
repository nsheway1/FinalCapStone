import axios from 'axios';

const http = axios.create({
    baseURL: "http://localhost:8080"
})

export default {

    getBreweries() {
        return http.get('/breweries');
    },

    getBreweryInfo(breweryId){
        return http.get(`/breweries/${breweryId}`);
    },
    getBeersByBreweryId(breweryId){
        return http.get(`/breweries/${breweryId}/beers`);
    },

    addNewBeer(beer, breweryId){
        return http.post(`/breweries/${breweryId}/beers`, beer);
    },
    
    deleteBeer(beerId, breweryId){
        return http.delete(`/breweries/${breweryId}/beers/${beerId}`)
    }

}