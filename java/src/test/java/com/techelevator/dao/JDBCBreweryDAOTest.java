package com.techelevator.dao;

import com.techelevator.model.Brewery;
import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;
import org.springframework.jdbc.core.JdbcTemplate;

import javax.sql.DataSource;
import java.util.ArrayList;
import java.util.List;

public class JDBCBreweryDAOTest  extends DAOIntegrationTest{

    private JDBCBreweryDAO jdbcBreweryDAO;
    private JdbcTemplate jdbcTemplate;

    @Before
    public void setup() {
        DataSource dataSource = this.getDataSource();
        this.jdbcTemplate = new JdbcTemplate(dataSource);
        jdbcBreweryDAO = new JDBCBreweryDAO(jdbcTemplate);
    }


    @Test
    public void get_all_breweries_return_list() {
        jdbcTemplate.update("TRUNCATE brewery CASCADE");
        Brewery testBrewery = new Brewery();
        testBrewery.setName("Test Brewery 1");
        testBrewery.setDescription("Cool Stuff");
        testBrewery.setStreetAddress("123 Street");
        testBrewery.setCity("columbus");
        testBrewery.setState("Ohio");
        testBrewery.setZipcode("43445");
        insertTestBrewery(testBrewery);

        Brewery testBreweryTwo = new Brewery();
        testBreweryTwo.setName("Test Brewery 2");
        testBreweryTwo.setDescription("Cool Stuff 2");
        testBreweryTwo.setStreetAddress("123 Street 2");
        testBreweryTwo.setCity("columbus 2");
        testBreweryTwo.setState("Ohio 2");
        testBreweryTwo.setZipcode("99999");
        insertTestBrewery(testBreweryTwo);

        List<Brewery> expectedResult = new ArrayList<Brewery>();
        expectedResult.add(testBrewery);
        expectedResult.add(testBreweryTwo);

        List<Brewery> actualResult = jdbcBreweryDAO.getAllBreweries();

        Assert.assertEquals(expectedResult, actualResult);
    }

    private Brewery insertTestBrewery(Brewery breweryToInsert) {
        String sql = "INSERT INTO brewery VALUES(DEFAULT, ?, ?, ?, ?, ?, ?) RETURNING id";
        Long breweryId = jdbcTemplate.queryForObject(sql, Long.class, breweryToInsert.getName(), breweryToInsert.getDescription(),
                breweryToInsert.getStreetAddress(), breweryToInsert.getCity(), breweryToInsert.getState(), breweryToInsert.getZipcode());

        breweryToInsert.setId(breweryId);
        return breweryToInsert;

    }
}
