SELECT ActiveHosp.id, ActiveHosp.hospital, COUNT(q.measure) AS good_count, AVG(q.score) AS avg_score
FROM (SELECT id, hospital, COUNT(DISTINCT measure) AS count
FROM quant_measures
WHERE score > 0 
GROUP BY id, hospital
HAVING count > 10
) AS ActiveHosp
LEFT JOIN quant_measures q
ON ActiveHosp.id = q.id
JOIN state_standards s
ON q.h_state = s.h_state
AND q.measure = s.measure
WHERE (q.measure IN ('IMM_2', 'IMM_3_OP_27_FAC_ADHPCT', 'OP_2', 'OP_23', 'OP_29', 'OP_30', 'OP_4', 'STK_4', 'VTE_5') 
AND q.score > s.score)
OR (q.measure in ('ED_1b', 'ED_2b', 'OP_1', 'OP_18b', 'OP_20', 'OP_21', 'OP_22', 'OP_3b', 'OP_5', 'PC_01', 'VTE_6')
AND q.score < s.score)
GROUP BY ActiveHosp.hospital, ActiveHosp.id
ORDER BY good_count DESC, avg_score DESC
LIMIT 10;
