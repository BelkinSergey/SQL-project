CREATE TABLE users(
user_id SERIAL PRIMARY KEY,
name VARCHAR(100) NOT NULL,
email VARCHAR(100) NOT NULL,
created_at INT DEFAULT CURRENT_DATE
);

CREATE TABLE orders (
order_id SERIAL PRIMARY KEY,
user_id INT NOT NULL,
order_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
);

CREATE TABLE products(
product_id SERIAL PRIMARY KEY,
name VARCHAR(200) NOT NULL,
price DECIMAL(10, 2) NOT NULL CHECK (price>=0),
);

// промежуточная таблица
CREATE TABLE order_items(
order_item_id SERIAL PRIMARY KEY,
order_id INT NOT NULL,
product_id INT NOT NULL,
quantity INT NOT NULL CHECK (quantity > 0),
CONSTRAINT fk_order
FOREIGN KEY (order_id) REFERENCES orders(order_id)
ON DELETE CASCADE,
CONSTRAINT fk_product
FOREIGN KEY (product_id) REFERENCES products(product_id)
);