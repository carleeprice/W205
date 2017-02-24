SELECT s.h_state, COUNT(s.measure) as good_count
FROM state_standards s
JOIN national_standards n
ON s.measure = n.measure
WHERE (s.measure IN ('IMM_2', 'IMM_3_OP_27_FAC_ADHPCT', 'OP_2', 'OP_23', 'OP_4', 'STK_4', 'VTE_5') 
AND s.score > n.score)
OR (s.measure in ('ED_1b', 'ED_2b', 'OP_1', 'OP_18b', 'OP_20', 'OP_21', 'OP_22', 'OP_3b', 'OP_5', 'PC_01', 'VTE_6')
AND s.score < n.score)
GROUP BY s.h_state
ORDER BY good_count DESC
LIMIT 10;
