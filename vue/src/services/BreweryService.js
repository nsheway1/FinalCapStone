import axios from 'axios';

const http = axios.create({
    baseURL: "http://localhost:8080"
})

export default {

    getBreweries() {
        return http.get('/breweries');
    }
}