CREATE TABLE languages (
    id           smallserial           PRIMARY KEY,
    description  character varying(6)  NOT NULL
);

CREATE TABLE pos (
    id           smallserial            PRIMARY KEY,
    description  character varying(12)  NOT NULL
);

CREATE TABLE kinds (
    id           smallserial           PRIMARY KEY,
    description  character varying(6)  NOT NULL
);

CREATE TABLE categories (
    id           smallserial            PRIMARY KEY,
    description  character varying(12)  NOT NULL
);

CREATE TABLE dictionary (
    id           serial                  PRIMARY KEY,
    word         character varying(300)  NOT NULL,
    language_id  smallint                NOT NULL REFERENCES languages (id),
    pos_id       smallint                NOT NULL REFERENCES pos (id),
    kind_id      smallint                NOT NULL REFERENCES kinds (id),
    definition   text                    NOT NULL,
    category_id  smallint                NOT NULL REFERENCES categories (id)
);

CREATE MATERIALIZED VIEW mv_dictionary AS
    WITH normalized_words AS (
        SELECT
            id,
            REGEXP_REPLACE(word, '[-^·]', '') AS word
        FROM dictionary
        WHERE word NOT LIKE '% %'
    )
    SELECT
        D.id,
        N.word AS word,
        D.word AS original_word,
        LEFT(N.word, 1) AS start_char,
        RIGHT(N.word, 1) AS end_char,
        language_id,
        pos_id,
        kind_id,
        definition,
        category_id
    FROM dictionary AS D
        INNER JOIN normalized_words AS N
            ON D.id = N.id
    WHERE CHAR_LENGTH(N.word) >= 2;

CREATE INDEX ON mv_dictionary (word);
CREATE INDEX ON mv_dictionary (start_char, end_char);

