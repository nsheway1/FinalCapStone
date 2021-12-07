BEGIN TRANSACTION;

DROP TABLE IF EXISTS users;
DROP SEQUENCE IF EXISTS seq_user_id;
DROP TABLE IF EXISTS beer;
DROP TABLE IF EXISTS brewery;

CREATE SEQUENCE seq_user_id
  INCREMENT BY 1
  NO MAXVALUE
  NO MINVALUE
  CACHE 1;


CREATE TABLE users (
	user_id int DEFAULT nextval('seq_user_id'::regclass) NOT NULL,
	username varchar(50) NOT NULL,
	password_hash varchar(200) NOT NULL,
	role varchar(50) NOT NULL,
	CONSTRAINT PK_user PRIMARY KEY (user_id)
);

INSERT INTO users (username,password_hash,role) VALUES ('user','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_USER');
INSERT INTO users (username,password_hash,role) VALUES ('admin','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_ADMIN');

CREATE TABLE brewery(
        id serial primary key,
        name varchar(200) not null,
        description varchar(500) not null,
        street_address varchar(200) not null,
        city varchar(200) not null,
        state varchar(200) not null,
        zipcode varchar(15) not null
);


CREATE TABLE beer(
        id serial primary key,
        name varchar(200) not null,
        type varchar(200) not null,
        description varchar(500) not null,
        abv decimal(3, 1) not null,
        brewery_id bigint,
        
        constraint fk_brewery_id foreign key (brewery_id) references brewery(id)
);

INSERT INTO brewery VALUES (default, 'Seventh Son', 'Seventh Son Brewing has been producing exceptional beers at the intersection of 4th & 4th in Columbus’ historic Italian Village since April of 2013.',
'1101 N. 4th St.', 'Columbus', 'Ohio', '43201');
INSERT INTO brewery VALUES (default, 'Hoof-Hearted', 'Here at Hoof Hearted Brewing we have been turning tanks like cassette tapes since late 2011. Known throughout the industry for our deft hop-wrangling and nude air guitar prowess, we do everything we can to provide fresh, high-quality (and sometimes hi-test) liquid to help you get the party poppin',
'850 N 4th St.', 'Columbus', 'Ohio', '43215');
INSERT INTO brewery VALUES (default, 'Edison', 'Fresh brews that will leave you needing more', '785 Science Blvd.', 'Gahanna', 'Ohio', '43230');
INSERT INTO brewery VALUES (default, 'Nostalgia', 'Beer that starts a conversation is the essence of Nostalgia Brewing', '81 Mill St', 'Gahanna', 'Ohio', '43230');
INSERT INTO brewery VALUES (default, 'North High', 'Beer so good they named a street after us', '1288 N High St', 'Columbus', 'Ohio', '43201');
INSERT INTO brewery VALUES (default, 'Endeavor', 'There is a story behind every beer', '909 W 5th Ave', 'Columbus', 'Ohio', '43212');

INSERT INTO beer VALUES (default, 'Humulus Nimbus', 'Pale Ale', 'A pale golden ale that is both super crisp and super hop forward with a refreshing mouthfeel and a summer friendly 6% abv. Mosaic & simcoe hops lend tart blueberry and fragrant pine to a pleasingly bitter dandelion finish.',
6.0, 1);
INSERT INTO beer VALUES (default, 'Belloq', 'Stout', 'Stout with coffee and vanilla added', 4.2, 2);
INSERT INTO beer VALUES (default, 'Nikola', 'Vienna Lager', 'This is a Vienna Lager that has moderate malt sweetness. It has a malt character from Vienna and other colored malts. Balanced with a subtle hop and caramel flavor and aroma. Clean, moderately dry finish.',
5.3, 3);
INSERT INTO beer VALUES (default, 'Thackery', 'pumpkin', 'Nothing says fall quite like pumpkins and beer', 5.0, 4);
INSERT INTO beer VALUES (default, 'Honey Wheat', 'Honey - US',' Honey Wheat is an American wheat ale with 30 pounds of honey added to the brew. Honey Wheat is lightly hopped, slightly sweet, and has a clean finish.', 6.0, 5);
INSERT INTO beer VALUES (default, 'Holy Ground', 'Export Stout', 'A bigger version of a typical dry Irish stout. This beer is forward with rich, roasted malts. Our’s is nitrogenated for a silky body', 6.0,6);
COMMIT TRANSACTION;


