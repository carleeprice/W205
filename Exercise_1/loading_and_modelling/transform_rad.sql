DROP TABLE after_care;

CREATE TABLE after_care AS
SELECT 
provider_id as id, 
hospital_name as hospital, 
h_state as h_state, 
measure_name as measure_name,
measure_id as measure_id,
CAST(denominator as FLOAT) as population,
CAST(score as FLOAT) as score
FROM rad_raw;