ALTER TABLE city_has_country ADD FOREIGN KEY (city_id) REFERENCES cities(id_city);