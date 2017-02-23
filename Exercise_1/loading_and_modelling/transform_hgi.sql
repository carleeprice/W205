DROP TABLE relative_ratings;

CREATE TABLE relative_ratings AS
SELECT 
provider_id as id, 
hospital_name as hospital, 
h_state as h_state, 
CAST(oall_rating as FLOAT) as rating
FROM hgi_raw;