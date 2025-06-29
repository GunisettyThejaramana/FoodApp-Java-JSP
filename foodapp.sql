CREATE DATABASE IF NOT EXISTS foodapp;
USE foodapp;

CREATE TABLE users (
  userid INT PRIMARY KEY,
  username VARCHAR(100),
  password VARCHAR(100),
  email VARCHAR(100),
  address TEXT
);

CREATE TABLE restaurants (
  restaurantid INT PRIMARY KEY,
  restaurantname VARCHAR(100),
  cuisine_type VARCHAR(100),
  rating FLOAT,
  delivery_time INT,
  image_path VARCHAR(255)
);

CREATE TABLE menu (
  menuid INT PRIMARY KEY,
  restaurantid INT,
  menu_name VARCHAR(100),
  description TEXT,
  price INT,
  is_available BOOLEAN,
  image_path VARCHAR(255)
);

CREATE TABLE orders (
  orderid INT PRIMARY KEY,
  userid INT,
  restaurantid INT,
  total_amount FLOAT,
  status VARCHAR(50),
  payment_mode VARCHAR(50)
);

CREATE TABLE order_items (
  orderitemid INT PRIMARY KEY,
  orderid INT,
  menuid INT,
  quantity INT,
  item_total FLOAT
);
INSERT INTO users (userid, username, password, email, address) VALUES
(1, 'john_doe', 'pass123', 'john@example.com', '123 Elm Street'),
(2, 'jane_smith', 'pass456', 'jane@example.com', '456 Maple Avenue'),
(3, 'admin', 'admin123', 'admin@foodapp.com', 'HQ Building');

INSERT INTO restaurants (restaurantid, restaurantname, cuisine_type, rating, delivery_time, image_path) VALUES
(101, 'Spice Garden', 'Indian', 4.5, 30, 'images/spice_garden.jpg'),
(102, 'Burger Hub', 'Fast Food', 4.2, 25, 'images/burger_hub.jpg'),
(103, 'Green Delight', 'Vegetarian', 4.7, 20, 'images/green_delight.jpg');

INSERT INTO menu (menuid, restaurantid, menu_name, description, price, is_available, image_path) VALUES
(201, 101, 'Paneer Butter Masala', 'Creamy paneer curry', 180, TRUE, 'images/paneer.jpg'),
(202, 101, 'Chicken Biryani', 'Spicy Hyderabadi biryani', 220, TRUE, 'images/biryani.jpg'),
(203, 102, 'Veg Burger', 'Crispy veggie burger', 80, TRUE, 'images/veg_burger.jpg'),
(204, 102, 'Cheese Burger', 'Juicy beef burger with cheese', 120, TRUE, 'images/cheese_burger.jpg'),
(205, 103, 'Green Salad', 'Fresh organic salad', 70, TRUE, 'images/salad.jpg');

INSERT INTO orders (orderid, userid, restaurantid, total_amount, status, payment_mode) VALUES
(301, 1, 101, 400.0, 'Delivered', 'COD'),
(302, 2, 102, 200.0, 'Preparing', 'Online');

INSERT INTO order_items (orderitemid, orderid, menuid, quantity, item_total) VALUES
(401, 301, 201, 1, 180.0),
(402, 301, 202, 1, 220.0),
(403, 302, 203, 2, 160.0);
