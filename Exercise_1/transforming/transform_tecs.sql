DROP TABLE state_standards;

CREATE TABLE state_standards AS
SELECT 
h_state as h_state, 
condition as condition,
measure as measure,
CAST(score as FLOAT) as score
FROM tecs_raw;