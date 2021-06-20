CREATE VIEW v_words AS
    SELECT
        `id`,
        REGEXP_REPLACE(`word`, '[-^·]', '') AS `word`,
        `word` AS `original_word`,
        LEFT(`word`, 1) AS `start_char`,
        RIGHT(`word`, 1) AS `end_char`,
        `language_id`,
        `pos_id`,
        `kind_id`,
        `definition`,
        `category_id`
    FROM words
    WHERE LENGTH(`word`) >= 2 AND `word` NOT LIKE '% %';

