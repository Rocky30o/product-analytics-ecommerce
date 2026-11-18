SELECT
  DATE_TRUNC('day', event_time) AS day,
  COUNT(DISTINCT user_id) AS dau,
  COUNT(DISTINCT CASE WHEN event_type = 'purchase' THEN user_id END) AS buyers,
  SUM(CASE WHEN event_type = 'purchase' THEN price ELSE 0 END) AS revenue,
  COUNT(DISTINCT CASE WHEN event_type = 'purchase' THEN user_session END) AS orders
FROM events_clean
GROUP BY 1
ORDER BY 1;