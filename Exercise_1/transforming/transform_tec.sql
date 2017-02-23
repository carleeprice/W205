DROP TABLE quant_measures;

CREATE TABLE quant_measures AS
SELECT 
provider_id as id, 
hospital_name as hospital, 
h_state as h_state, 
condition as condition,
measure as measure,
CAST(score as FLOAT) as score,
CAST(sample as FLOAT) as sample_size
FROM tec_raw;