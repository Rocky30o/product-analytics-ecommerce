# Assumptions

- Data: REES46 e-commerce events, November 2019 only (67.5M rows)
- Sampling: ~10% of users (hash(user_id) % 10 = 0), all events kept per user
- Event types in the sample: view, cart, purchase
- Missing category_code (32%) and brand (14%) are kept
- Duplicates removed with SELECT DISTINCT; prices <= 0 removed
- Cleaned table: events_clean (6,697,953 rows)
- 15 Nov has zero purchase events. Daily revenue/conversion for 14-17 Nov
  is flagged as unreliable. Monthly funnel and retention are unaffected.
- The 28 Oct retention cohort is excluded because data starts on 1 Nov.