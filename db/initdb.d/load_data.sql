LOAD DATA INFILE './languages.csv'
    INTO TABLE languages
    FIELDS
        TERMINATED BY ','
        OPTIONALLY ENCLOSED BY '"'
    (`id`, `description`);

LOAD DATA INFILE './pos.csv'
    INTO TABLE pos
    FIELDS
        TERMINATED BY ','
        OPTIONALLY ENCLOSED BY '"'
    (`id`, `description`);

LOAD DATA INFILE './kinds.csv'
    INTO TABLE kinds
    FIELDS
        TERMINATED BY ','
        OPTIONALLY ENCLOSED BY '"'
    (`id`, `description`);

LOAD DATA INFILE './categories.csv'
    INTO TABLE categories
    FIELDS
        TERMINATED BY ','
        OPTIONALLY ENCLOSED BY '"'
    (`id`, `description`);

LOAD DATA INFILE './dictionary.csv'
    INTO TABLE dictionary
    FIELDS
        TERMINATED BY ','
        OPTIONALLY ENCLOSED BY '"'
    (`id`, `word`, `language_id`, `pos_id`, `kind_id`, `definition`, `category_id`);

