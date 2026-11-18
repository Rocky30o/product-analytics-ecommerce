WITH user_steps AS (
  SELECT
    user_id,
    MAX(CASE WHEN event_type = 'view' THEN 1 ELSE 0 END) AS viewed,
    MAX(CASE WHEN event_type = 'cart' THEN 1 ELSE 0 END) AS carted,
    MAX(CASE WHEN event_type = 'purchase' THEN 1 ELSE 0 END) AS purchased
  FROM events_clean
  GROUP BY user_id
)
SELECT
  SUM(viewed) AS viewers,
  SUM(viewed * carted) AS added_to_cart,
  SUM(viewed * carted * purchased) AS buyers,
  ROUND(100.0 * SUM(viewed * carted) / SUM(viewed), 2) AS view_to_cart_pct,
  ROUND(100.0 * SUM(viewed * carted * purchased) / SUM(viewed * carted), 2) AS cart_to_purchase_pct,
  ROUND(100.0 * SUM(viewed * carted * purchased) / SUM(viewed), 2) AS overall_conversion_pct,
  SUM(purchased) AS all_purchasers
FROM user_steps;
