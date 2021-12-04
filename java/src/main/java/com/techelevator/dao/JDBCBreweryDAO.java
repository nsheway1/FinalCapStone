package com.techelevator.dao;

import com.techelevator.model.Brewery;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;

import java.util.ArrayList;
import java.util.List;

public class JDBCBreweryDAO implements BreweryDAO{

    private JdbcTemplate jdbcTemplate;

    public JDBCBreweryDAO(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    public List<Brewery> getAllBreweries() {
        List<Brewery> breweries = new ArrayList<Brewery>();
        String sql = "SELECT id, name, description, street_address, city, state, zipcode FROM brewery";
        SqlRowSet results = jdbcTemplate.queryForRowSet(sql);
        while (results.next()) {
            Brewery brewery = mapRowToBrewery(results);
            breweries.add(brewery);
        }

        return breweries;
    }

    private Brewery mapRowToBrewery(SqlRowSet results) {
        Brewery brewery = new Brewery();
        brewery.setId(results.getLong("id"));
        brewery.setName(results.getString("name"));
        brewery.setDescription(results.getString("description"));
        brewery.setStreetAddress(results.getString("street_address"));
        brewery.setCity(results.getString("city"));
        brewery.setState(results.getString("state"));
        brewery.setZipcode(results.getString("zipcode"));

        return brewery;
    }
}
