SELECT corr(p.score, r.rating)
FROM patient_scores p
JOIN relative_ratings r
ON p.id = r.id
WHERE p.metric LIKE '%score' 
AND p.score > 0
AND r.rating > 0;