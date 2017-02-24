DROP TABLE patient_scores;

CREATE TABLE patient_scores AS
SELECT 
provider_id as id, 
hospital_name as hospital, 
h_state as h_state, 
hcahps_measure_id as condition,
hcahps_q as metric,
CAST(star_rating as FLOAT) as rating,
CAST(linear_mean_val as FLOAT) as score,
CAST(survey_count as FLOAT) as no_respondents,
CAST(survey_pct as FLOAT) as pct_respondents
FROM hcahps_raw;