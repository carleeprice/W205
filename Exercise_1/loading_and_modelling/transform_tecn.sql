DROP TABLE national_standards;

CREATE TABLE national_standards AS
SELECT 
measure as measure,
CAST(score as FLOAT) as score
FROM tecn_raw;
