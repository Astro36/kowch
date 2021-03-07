LOAD DATA INFILE './languages.csv' INTO TABLE languages FIELDS TERMINATED BY ',' (`id`, `description`);
LOAD DATA INFILE './pos.csv' INTO TABLE pos FIELDS TERMINATED BY ',' (`id`, `description`);
LOAD DATA INFILE './kinds.csv' INTO TABLE kinds FIELDS TERMINATED BY ',' (`id`, `description`);
LOAD DATA INFILE './categories.csv' INTO TABLE categories FIELDS TERMINATED BY ',' (`id`, `description`);

