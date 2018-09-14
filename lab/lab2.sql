CREATE TABLE countries(
	country_id SERIAL PRIMARY KEY,
	country_name VARCHAR(50),
	region_id INT,
	population INT
);
INSERT INTO countries (country_id,country_name,region_id,population) VALUES (DEFAULT,'CHINA',11,1230000001);
INSERT INTO countries (country_id, country_name) VALUES (2, 'SOUTH KOREA');

UPDATE countries SET region_id = NULL;

INSERT INTO countries  VALUES(DEFAULT,'Kz', 5, 34796);
INSERT INTO countries  VALUES(DEFAULT,'England ', 4, 1876543456);
INSERT INTO countries  VALUES(DEFAULT,'Usa', 8, 12399131);

ALTER TABLE countries ALTER COLUMN country_name SET DEFAULT 'Kazakhstan';

INSERT INTO countries (country_name, region_id, population) VALUES (DEFAULT, 5, 45600);

INSERT INTO countries DEFAULT VALUES;

CREATE TABLE IF NOT EXISTS countries_new (LIKE countries);

INSERT INTO countries_new SELECT * FROM countries;

UPDATE countries_new SET region_id = 1 WHERE region_id IS NULL
RETURNING *;

UPDATE countries_new SET population = population * 1.1
RETURNING country_name, population AS "New Population";

DELETE FROM countries WHERE population < 100000
RETURNING *;

DELETE FROM countries_new USING countries WHERE countries_new.country_id = countries.country_id
RETURNING *;

DELETE FROM countries
RETURNING *;