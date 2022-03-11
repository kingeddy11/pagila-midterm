-- PART 1:
-- Rewrite the SQL table below to use a maximally efficient column order.
-- You may directly modify this table.

CREATE TABLE project (
    id SERIAL PRIMARY KEY, 4
    author_id BIGINT NOT NULL, 8
    target_type VARCHAR(2), -1
    target_id INTEGER, 4
    developer_addr INET, -1
    developer_id UUID, 16
    title CHAR(256), 1
    data TEXT, -1
    project_id INTEGER NOT NULL UNIQUE, 4
    action SMALLINT NOT NULL, 2
    created_at TIMESTAMP WITH TIME ZONE, 8
    updated_at TIMESTAMPTZ 8
);

--modified table
CREATE TABLE project (
    developer_id UUID,
    created_at TIMESTAMP WITH TIME ZONE,
    updated_at TIMESTAMPTZ
    author_id BIGINT NOT NULL,
    id SERIAL PRIMARY KEY,
    target_id INTEGER,
    project_id INTEGER NOT NULL UNIQUE,
    action SMALLINT NOT NULL,
    title CHAR(256),
    target_type VARCHAR(2),
    developer_addr INET,
    data TEXT,
);

-- PART 2:
-- Complete the table below describing the number of bytes used by the row created by the following insert statement.
-- Use the original column order defined above,
-- and not your modified order from part 1.

INSERT INTO project VALUES (
    0,
    55,
    NULL,
    NULL,
    NULL,
    'A0EEBC99-9C0B-4EF8-BB6D-6BB9BD380A11',
    NULL,
    NULL,
    88,
    12,
    'now',
    '2022-03-09T18:34:27+00:00'
);

-- Header: 32
-- Data: 56
-- Padding: 0
-- Total: 88
