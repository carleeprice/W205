SELECT q.measure, COUNT(q.score) AS count
FROM quant_measures q
WHERE (q.measure IN ('IMM_2', 'IMM_3_OP_27_FAC_ADHPCT', 'OP_2', 'OP_23', 'OP_29', 'OP_30', 'OP_31', 'OP_4',  'STK_4', 'VTE_5') 
AND q.score < 75)
OR (q.measure IN ('ED_1b', 'ED_2b', 'OP_1', 'OP_3b', 'OP_5', 'OP_18b', 'OP_20', 'OP_21')
AND q.score > 95)
OR (q.measure IN ('PC_01', 'OP_22', 'VTE_6')
AND q.score > 5)
GROUP BY q.measure
ORDER BY count DESC
LIMIT 10;