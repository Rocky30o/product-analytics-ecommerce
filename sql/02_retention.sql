WITH first_visit AS (
  SELECT user_id, DATE_TRUNC('week', MIN(event_time)) AS cohort_week
  FROM events_clean
  GROUP BY user_id
),
activity AS (
  SELECT DISTINCT user_id, DATE_TRUNC('week', event_time) AS active_week
  FROM events_clean
)
SELECT
  f.cohort_week,
  DATE_DIFF('week', f.cohort_week, a.active_week) AS weeks_since_first,
  COUNT(DISTINCT a.user_id) AS users
FROM first_visit f
JOIN activity a ON f.user_id = a.user_id
GROUP BY 1, 2
ORDER BY 1, 2;