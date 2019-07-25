#!/bin/bash

export PGPASSWORD=andrewpower;
psql --host=127.0.0.1 --port=5432 --dbname=postgres --username=admin << EOF

CREATE TABLE people(
id SERIAL PRIMARY KEY,
email VARCHAR (255) UNIQUE NOT NULL,
name VARCHAR (255) NOT NULL,
questions jsonb,
created TIMESTAMP DEFAULT now() NOT NULL,
modified TIMESTAMP DEFAULT now() NOT NULL,
deactivated boolean DEFAULT false NOT NULL
);

CREATE TABLE questions(
id SERIAL PRIMARY KEY,
question VARCHAR (255) UNIQUE NOT NULL,
shadow INTEGER DEFAULT 1 NOT NULL,
reverse_shadow INTEGER DEFAULT 1 NOT NULL,
created TIMESTAMP DEFAULT now() NOT NULL,
modified TIMESTAMP DEFAULT now() NOT NULL,
deactivated boolean DEFAULT false NOT NULL
);

EOF

echo "Database has been seeded."
