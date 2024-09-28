CREATE DATABASE online_shop;

USE online_shop;

-- Create table for users (customers)
CREATE TABLE Users (
    user_id INT PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(100) UNIQUE NOT NULL,
    password_hash VARCHAR(255) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    profile_info TEXT,
    sign_up_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Create table for categories
CREATE TABLE Categories (
    category_id INT PRIMARY KEY AUTO_INCREMENT,
    category_name VARCHAR(100) NOT NULL,
    description TEXT
);

-- Create table for products
CREATE TABLE Products (
    product_id INT PRIMARY KEY AUTO_INCREMENT,
    product_name VARCHAR(150) NOT NULL,
    category_id INT,
    price DECIMAL(10, 2) NOT NULL,
    stock INT DEFAULT 0,
    description TEXT,
    image_url VARCHAR(255),
    FOREIGN KEY (category_id) REFERENCES Categories(category_id)
);

-- Create table for shopping cart
CREATE TABLE ShoppingCart (
    cart_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT,
    product_id INT,
    quantity INT DEFAULT 1,
    date_added TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES Users(user_id),
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);

-- Create table for payment methods
CREATE TABLE PaymentMethods (
    payment_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT,
    method_name ENUM('Credit Card', 'PayPal', 'Cryptocurrency') NOT NULL,
    payment_details TEXT,
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
);

-- Create table for orders
CREATE TABLE Orders (
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT,
    total_price DECIMAL(10, 2) NOT NULL,
    order_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    payment_id INT,
    shipping_id INT,
    status ENUM('Pending', 'Shipped', 'Delivered') DEFAULT 'Pending',
    FOREIGN KEY (user_id) REFERENCES Users(user_id),
    FOREIGN KEY (payment_id) REFERENCES PaymentMethods(payment_id),
    FOREIGN KEY (shipping_id) REFERENCES Shipping(shipping_id)
);

-- Create table for order items (products in each order)
CREATE TABLE OrderItems (
    order_item_id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT,
    product_id INT,
    quantity INT DEFAULT 1,
    price DECIMAL(10, 2),
    FOREIGN KEY (order_id) REFERENCES Orders(order_id),
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);

-- Create table for shipping and delivery
CREATE TABLE Shipping (
    shipping_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT,
    shipping_address TEXT,
    shipping_option ENUM('Standard', 'Express', 'Overnight') NOT NULL,
    tracking_number VARCHAR(100),
    delivery_date DATE,
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
);

-- Create table for discounts and promos
CREATE TABLE Discounts (
    discount_id INT PRIMARY KEY AUTO_INCREMENT,
    code VARCHAR(50) UNIQUE NOT NULL,
    discount_percentage DECIMAL(5, 2),
    expiration_date DATE
);

-- Create table for order history
CREATE TABLE OrderHistory (
    history_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT,
    order_id INT,
    order_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    total_price DECIMAL(10, 2),
    FOREIGN KEY (user_id) REFERENCES Users(user_id),
    FOREIGN KEY (order_id) REFERENCES Orders(order_id)
);

-- Create table for loyalty program
CREATE TABLE LoyaltyProgram (
    loyalty_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT,
    points INT DEFAULT 0,
    level ENUM('Bronze', 'Silver', 'Gold') DEFAULT 'Bronze',
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
);
