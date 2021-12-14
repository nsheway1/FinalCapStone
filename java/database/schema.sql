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
        zipcode varchar(15) not null,
        vote_count int,
        carousel_count int
);


CREATE TABLE beer(
        id serial primary key,
        name varchar(200) not null,
        type varchar(200) not null,
        description varchar(600) not null,
        abv decimal(3, 1) not null,
        brewery_id bigint,
        
        constraint fk_brewery_id foreign key (brewery_id) references brewery(id)
);

INSERT INTO brewery VALUES (default, 'Seventh Son', 'Seventh Son Brewing has been producing exceptional beers at the intersection of 4th & 4th in Columbus’ historic Italian Village since April of 2013.',
'1101 N. 4th St.', 'Columbus', 'Ohio', '43201', 0, 0);
INSERT INTO brewery VALUES (default, 'Hoof-Hearted', 'Here at Hoof Hearted Brewing we have been turning tanks like cassette tapes since late 2011. Known throughout the industry for our deft hop-wrangling and nude air guitar prowess, we do everything we can to provide fresh, high-quality (and sometimes hi-test) liquid to help you get the party poppin',
'850 N 4th St.', 'Columbus', 'Ohio', '43215', 0, 0);
INSERT INTO brewery VALUES (default, 'Edison', 'Fresh brews that will leave you needing more', '785 Science Blvd.', 'Gahanna', 'Ohio', '43230', 0, 0);
INSERT INTO brewery VALUES (default, 'Nostalgia', 'Beer that starts a conversation is the essence of Nostalgia Brewing', '81 Mill St', 'Gahanna', 'Ohio', '43230', 1, 0);
INSERT INTO brewery VALUES (default, 'North High', 'Beer so good they named a street after us', '1288 N High St', 'Columbus', 'Ohio', '43201', 0, 0);
INSERT INTO brewery VALUES (default, 'Endeavor', 'There is a story behind every beer', '909 W 5th Ave', 'Columbus', 'Ohio', '43212', 0, 0);

INSERT INTO beer VALUES (default, 'Humulus Nimbus', 'Pale Ale', 'A pale golden ale that is both super crisp and super hop forward with a refreshing mouthfeel and a summer friendly 6% abv. Mosaic & simcoe hops lend tart blueberry and fragrant pine to a pleasingly bitter dandelion finish.',
6.0, 1);
INSERT INTO beer VALUES (default, 'Assistant Manager', 'American Golden Ale', 
'The definition of a drinkable and refreshing. Delicate hops and golden malts give way to firm bitterness and a clean finish', 6.0, 1);
INSERT INTO beer VALUES (default, 'Rime', 'Winter IPA', 
'Lightly spiced Winter IPA uses fresh ginger, coriander, and caramelized orange peels', 6.5, 1);
INSERT INTO beer VALUES (default, 'Belloq', 'Stout', 'Stout with coffee and vanilla added', 7.5, 2);
INSERT INTO beer VALUES (default, 'Key Bump', 'Triple IPA', 'Have you any idea what the street value of this mountain is? Clean off your mirrored glass table and grab a hundo. Key Bump bout to pack your nose full of those oh-so tropical tones. Passionfruit, guava, pineapples, calamansi and kumquat barrel down the mountain as quick as Alberto Tomba on an Olympic qualifying run. Hopped with the most dangerous weapon in the game (ElMoMoCoe) + fermented w/ the fruity flyboi Orenthal, Key Bump''s the pick-me-up you can''t put down. To quote the great Clyde Von Damme,
"What the hell is Dim Mak?"', 10.5, 2);
INSERT INTO beer VALUES (default, 'Discount Nachos', 'IPA', 'Double Dry-Hopped IPA', 7.3, 2);


INSERT INTO beer VALUES (default, 'Nikola', 'Vienna Lager', 'This is a Vienna Lager that has moderate malt sweetness. It has a malt character from Vienna and other colored malts. Balanced with a subtle hop and caramel flavor and aroma. Clean, moderately dry finish.',
5.3, 3);
INSERT INTO beer VALUES (default, 'All Mina', 'Pale Ale', '?
A British-Style Pale Ale with a malty middle and light hop aroma and moderate hop flavor. A slightly minerally dry finish.',
4.8, 3);
INSERT INTO beer VALUES (default, 'Gus', 'Porter', '
A classic British style porter with black and brown malt flavor and aroma. Rich body with blanched dry finish.',
5.3, 3);


INSERT INTO beer VALUES (default, 'Thackery', 'pumpkin', 'Nothing says fall quite like pumpkins and beer', 5.0, 4);
INSERT INTO beer VALUES (default, 'Marty Mc-Fly-PA', 'IPA', 'It doesn''t take 1.21 Gigawatts to taste this delicious New England-style IPA!', 7.0, 4);
INSERT INTO beer VALUES (default, 'Glass Joe', 'IPA', 'You won''t need a Power Glove to attack this East Coast IPA, but it definitely packs a hoppy punch!', 6.0, 4);
INSERT INTO beer VALUES (default, 'Honey Wheat', 'Honey - US',' Honey Wheat is an American wheat ale with 30 pounds of honey added to the brew. Honey Wheat is lightly hopped, slightly sweet, and has a clean finish.', 6.0, 5);
INSERT INTO beer VALUES (default, 'Rise IPA', 'IPA', 'Aggressively hopped and assertively bitter, this crisp, malty India Pale Ale showcases a wonderful bouquet of citrusy and floral aromas.', 6.8, 5);
INSERT INTO beer VALUES (default, 'Filth McNasty', 'Imperial Stout', 'A Russian Imperial Stout with an intensely concentrated roasted malt character. Aggressively hopped to give it a resinous and herbal undertone.', 9.0, 5);

INSERT INTO beer VALUES (default, 'Holy Ground', 'Export Stout', 'A bigger version of a typical dry Irish stout. This beer is forward with rich, roasted malts. Our’s is nitrogenated for a silky body', 6.0,6);
INSERT INTO beer VALUES (default, 'New World', 'IPA', 'Hops from three continents with hints of guava, key lime and tropical fruit', 5.5, 6);
INSERT INTO beer VALUES (default, 'Shaka', 'IPA', 'Select hops from three separate continents provide an accentuated aroma of tropical fruit, while keeping bitterness, alcohol content, and malt base balanced.', 6.5, 6);

COMMIT TRANSACTION;
