 SELECT 
    a.*,
    (a.amount_ngn - b.avg_amount) / std_dev AS z_score
FROM fraud_transactions a
JOIN (	
    SELECT AVG(amount_ngn) AS avg_amount,
        STDDEV(amount_ngn) AS std_dev
    FROM fraud_transactions
) b ON 1 = 1
WHERE (a.amount_ngn - b.avg_amount) / std_dev > 3 AND 
    transaction_type <> 'Bill Payment'
ORDER BY 2 DESC