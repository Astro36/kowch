CREATE TABLE languages (
    `id`           TINYINT     NOT NULL AUTO_INCREMENT,
    `description`  VARCHAR(3)  NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE pos (
    `id`           TINYINT     NOT NULL AUTO_INCREMENT,
    `description`  VARCHAR(6)  NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE kinds (
    `id`           TINYINT     NOT NULL AUTO_INCREMENT,
    `description`  VARCHAR(3)  NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE categories (
    `id`           TINYINT     NOT NULL AUTO_INCREMENT,
    `description`  VARCHAR(6)  NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE words (
    `id`           INT           NOT NULL AUTO_INCREMENT,
    `word`         VARCHAR(150)  NOT NULL,
    `language_id`  TINYINT       NOT NULL,
    `pos_id`       TINYINT       NOT NULL,
    `kind_id`      TINYINT       NOT NULL,
    `definition`   TEXT          NOT NULL,
    `category_id`  TINYINT       NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (language_id) REFERENCES languages (id) ON UPDATE RESTRICT ON DELETE RESTRICT,
    FOREIGN KEY (pos_id) REFERENCES pos (id) ON UPDATE RESTRICT ON DELETE RESTRICT,
    FOREIGN KEY (kind_id) REFERENCES kinds (id) ON UPDATE RESTRICT ON DELETE RESTRICT,
    FOREIGN KEY (category_id) REFERENCES categories (id) ON UPDATE RESTRICT ON DELETE RESTRICT
);

