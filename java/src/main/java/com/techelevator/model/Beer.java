package com.techelevator.model;

import java.util.Objects;

public class Beer {
    private Long id;
    private String name;
    private String type;
    private String description;
    private Double abv;
    private Long brewery_id;

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Beer beer = (Beer) o;
        return Objects.equals(id, beer.id) && Objects.equals(name, beer.name) && Objects.equals(type, beer.type) && Objects.equals(description, beer.description) && Objects.equals(abv, beer.abv) && Objects.equals(brewery_id, beer.brewery_id);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id, name, type, description, abv, brewery_id);
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Double getAbv() {
        return abv;
    }

    public void setAbv(Double abv) {
        this.abv = abv;
    }

    public Long getBrewery_id() {
        return brewery_id;
    }

    public void setBrewery_id(Long brewery_id) {
        this.brewery_id = brewery_id;
    }
}
