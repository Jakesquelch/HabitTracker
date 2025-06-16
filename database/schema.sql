-- schema.sql
CREATE TABLE habits (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    description TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE completions (
    id SERIAL PRIMARY KEY,
    habit_id INT REFERENCES habits(id),
    completed_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);