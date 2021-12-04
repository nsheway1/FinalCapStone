package com.techelevator.dao;

import com.techelevator.model.Beer;

import java.util.List;

public interface BeerDAO {

    public List<Beer> getBeersByBreweryId(Long id);

}
