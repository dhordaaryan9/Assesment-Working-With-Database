SELECT 
    l.location_name, 
    COUNT(r.res_id) as total_restaurants
FROM locations l
JOIN restaurants r ON l.location_id = r.location_id
GROUP BY l.location_name
ORDER BY total_restaurants DESC;


SELECT 
    r.has_online_order,
    r.has_book_table,
    AVG(rf.rating_value) as average_rating,
    SUM(rf.votes) as total_engagement
FROM restaurants r
JOIN ratings_fact rf ON r.res_id = rf.res_id
WHERE rf.rating_value > 0
GROUP BY r.has_online_order, r.has_book_table;


SELECT 
    r.name, 
    l.location_name,
    r.avg_cost_for_two,
    rf.rating_value,
    (r.avg_cost_for_two / NULLIF(rf.rating_value, 0)) as cost_per_rating_point
FROM restaurants r
JOIN locations l ON r.location_id = l.location_id
JOIN ratings_fact rf ON r.res_id = rf.res_id
WHERE rf.rating_value > 3.0
ORDER BY cost_per_rating_point ASC
LIMIT 50;