-- Get most common maintenence issues
SELECT issue_reported, COUNT(*) AS frequency
FROM fleet_maintenance
GROUP BY issue_reported
ORDER BY frequency DESC
LIMIT 5;


-- Find Total Maintenance Cost Per Aircraft
SELECT aircraft_id, SUM(cost) AS total_maintenance_cost
FROM fleet_maintenance
GROUP BY aircraft_id
ORDER BY total_maintenance_cost DESC;


-- Monthly Maintenance Cost Trend
SELECT DATE_TRUNC('month', maintenance_date) AS month, 
       SUM(cost) AS total_cost
FROM fleet_maintenance
GROUP BY month
ORDER BY month;


-- List of Pending or In-Progress Maintenance Tasks
SELECT * FROM fleet_maintenance
WHERE status IN ('Pending', 'In Progress')
ORDER BY maintenance_date DESC;
