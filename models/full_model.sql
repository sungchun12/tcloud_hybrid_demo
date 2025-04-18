MODEL (
  name tcloud_hybrid_demo.full_model,
  kind FULL,
  cron '@daily',
  grain item_id,
  audits (assert_positive_order_ids),
);

SELECT
  item_id,
  COUNT(DISTINCT id) AS num_orders,
FROM
  tcloud_hybrid_demo.incremental_model
GROUP BY item_id