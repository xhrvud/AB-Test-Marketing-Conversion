-- Row count
SELECT COUNT(*) FROM marketing_ab;

-- Distribution of users across test groups
SELECT test_group, COUNT(*) AS users
FROM marketing_ab
GROUP BY test_group;

-- Conversion rate by group
SELECT
  test_group,
  COUNT(*) AS users,
  SUM(CASE WHEN converted THEN 1 ELSE 0 END) AS conversions,
  ROUND(
    SUM(CASE WHEN converted THEN 1 ELSE 0 END)::numeric / COUNT(*),
    4
  ) AS conversion_rate
FROM marketing_ab
GROUP BY test_group;

-- Duplicate users check
SELECT COUNT(*) - COUNT(DISTINCT user_id) AS duplicate_users
FROM marketing_ab;

-- Missing values check
SELECT
  SUM(CASE WHEN user_id IS NULL THEN 1 ELSE 0 END) AS null_user_id,
  SUM(CASE WHEN test_group IS NULL THEN 1 ELSE 0 END) AS null_group,
  SUM(CASE WHEN converted IS NULL THEN 1 ELSE 0 END) AS null_converted
FROM marketing_ab;
