CREATE DATABASE carservice;
USE carservice;

CREATE TABLE service_data (
service_id INT,
customer_id VARCHAR(10),
car_model VARCHAR(50),
service_type VARCHAR(50),
booking_type VARCHAR(20),
appointment_date VARCHAR(20),
service_date VARCHAR(20),
delivery_date VARCHAR(20),
labour_cost INT,
parts_cost INT,
total_cost INT,
rating INT
);

SELECT * FROM service_data;

SELECT COUNT(*) FROM service_data;

SELECT DISTINCT car_model
FROM service_data;

SELECT DISTINCT service_type
FROM service_data;

SET SQL_SAFE_UPDATES=0;

UPDATE service_data
SET appointment_date = NULL
WHERE appointment_date = '';

SELECT *
FROM service_data
WHERE appointment_date IS NULL;

SELECT rating, COUNT(*)
FROM service_data
GROUP BY rating;

SELECT booking_type, COUNT(*) AS total
FROM service_data
GROUP BY booking_type;

SELECT AVG(DATEDIFF(delivery_date, service_date)) AS avg_service_days
FROM service_data;

SELECT booking_type,
AVG(DATEDIFF(
STR_TO_DATE(delivery_date,'%Y-%m-%d'),
STR_TO_DATE(service_date,'%Y-%m-%d')
)) AS avg_days
FROM service_data
GROUP BY booking_type;

SELECT booking_type,
AVG(DATEDIFF(delivery_date, service_date)) AS avg_days
FROM service_data
GROUP BY booking_type;

SELECT SUM(total_cost)
FROM service_data;

SELECT service_type,
SUM(total_cost) AS revenue
FROM service_data
GROUP BY service_type
ORDER BY revenue DESC;

SELECT car_model,
SUM(total_cost) AS revenue
FROM service_data
GROUP BY car_model
ORDER BY revenue DESC;

SELECT AVG(rating)
FROM service_data;

SELECT service_type,
AVG(rating)
FROM service_data
GROUP BY service_type;

SELECT 
DATEDIFF(delivery_date, service_date) AS delay_days,
AVG(rating) AS avg_rating
FROM service_data
GROUP BY delay_days;