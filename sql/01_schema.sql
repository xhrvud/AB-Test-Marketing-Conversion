CREATE TABLE IF NOT EXISTS marketing_ab (
  user_id        bigint,
  test_group     text,
  converted      boolean,
  total_ads      int,
  most_ads_day   text,
  most_ads_hour  int
);
