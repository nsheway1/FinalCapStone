package com.techelevator.dao;

import com.techelevator.model.Brewery;

import java.util.List;

public interface BreweryDAO {

    public List<Brewery> getAllBreweries();
    public Brewery getBreweryById(Long id);
    public Brewery addNewBrewery(Brewery breweryToInsert);
}
