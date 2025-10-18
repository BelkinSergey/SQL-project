//пункт а и с
SELECT u.name
FROM users AS u
JOIN orders AS o ON u.user_id = o.user_id
JOIN order_items AS oi ON o.order_id = oi.order_id
JOIN products AS p ON oi.product_id = p.product_id
postgres-# WHERE p.name = 'Beer'
postgres-# ORDER BY u.name DESC;

//пункт б
SELECT u.name, SUM(price * quantity) AS total_price FROM users AS u
JOIN orders AS o ON u.user_id = o.user_id
JOIN order_items AS oi ON o.order_id = oi.order_id
JOIN products AS p on oi.product_id = p.product_id
GROUP BY u.name;

// пункт д
UPDATE products
SET price = 550
WHERE name = 'Meet';

//пункт е
DELETE FROM orders
WHERE order_id = 4;