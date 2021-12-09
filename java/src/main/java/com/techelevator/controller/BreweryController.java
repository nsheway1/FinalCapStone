package com.techelevator.controller;

import com.techelevator.dao.BeerDAO;
import com.techelevator.dao.BreweryDAO;
import com.techelevator.model.Beer;
import com.techelevator.model.Brewery;
import org.springframework.web.bind.annotation.*;

import java.security.Principal;
import java.util.List;

@RestController
@CrossOrigin
public class BreweryController {

    private BreweryDAO breweryDAO;
    private BeerDAO beerDAO;

    public BreweryController(BreweryDAO breweryDAO, BeerDAO beerDAO) {
        this.breweryDAO = breweryDAO;
        this.beerDAO = beerDAO;
    }

    @RequestMapping(path = "/breweries", method = RequestMethod.GET)
    public List<Brewery> listAllBreweries() {
        return breweryDAO.getAllBreweries();
    }

    @RequestMapping(path = "/breweries/{id}", method = RequestMethod.GET)
    public Brewery findBreweryById(@PathVariable Long id){
        return breweryDAO.getBreweryById(id);
    }

    @RequestMapping(path = "/breweries/{id}/beers", method = RequestMethod.GET)
    public List<Beer> findBeersByBreweryId(@PathVariable Long id){
        return beerDAO.getBeersByBreweryId(id);
    }

    @RequestMapping(path = "/breweries/{id}/beers", method = RequestMethod.POST)
    public Beer addNewBeer(@RequestBody Beer beer, @PathVariable Long id){
        return beerDAO.addNewBeer(beer, id);
    }

    @RequestMapping(path = "/breweries/{breweryId}/beers/{beerId}", method = RequestMethod.DELETE)
    public void deleteBeer(@PathVariable Long breweryId, @PathVariable Long beerId){
        beerDAO.deleteBeer(beerId);
    }
}
