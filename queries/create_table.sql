-- SQL to create table

CREATE TABLE fleet_maintenance (
    id SERIAL PRIMARY KEY,
    aircraft_id VARCHAR(10),
    maintenance_date DATE,
    issue_reported TEXT,
    status VARCHAR(20),
    cost DECIMAL(10,2)
);
