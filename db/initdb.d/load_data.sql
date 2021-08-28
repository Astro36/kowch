COPY languages FROM '/docker-entrypoint-initdb.d/languages.csv' WITH (FORMAT CSV);
COPY pos FROM '/docker-entrypoint-initdb.d/pos.csv' WITH (FORMAT CSV);
COPY kinds FROM '/docker-entrypoint-initdb.d/kinds.csv' WITH (FORMAT CSV);
COPY categories FROM '/docker-entrypoint-initdb.d/categories.csv' WITH (FORMAT CSV);
COPY dictionary FROM '/docker-entrypoint-initdb.d/dictionary.csv' WITH (FORMAT CSV, ESCAPE '\');

