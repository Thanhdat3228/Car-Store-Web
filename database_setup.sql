-- ============================================
-- Script tạo Database cho Website Bán Xe
-- ============================================

-- Tạo database (nếu chưa tồn tại)
CREATE DATABASE IF NOT EXISTS car_store;
USE car_store;


-- Tạo bảng cars
CREATE TABLE IF NOT EXISTS cars (
    id INT AUTO_INCREMENT PRIMARY KEY,
    brand VARCHAR(50) NOT NULL,
    model VARCHAR(100) NOT NULL,
    year INT NOT NULL,
    mileage INT NOT NULL,
    price BIGINT NOT NULL,
    location VARCHAR(100) NOT NULL,
    description TEXT,
    image VARCHAR(255),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Chèn dữ liệu mẫu (tùy chọn)
INSERT INTO cars (brand, model, year, mileage, price, location, description, image) VALUES
('Toyota', 'Camry 2.5Q', 2020, 45000, 850000000, 'Hà Nội', 'Xe nhập khẩu nguyên chiếc, bảo dưỡng định kỳ đầy đủ. Nội thất sang trọng, tiết kiệm nhiên liệu.', 'image/toyota-cambry.jpg'),
('Honda', 'Civic RS', 2019, 60000, 720000000, 'TP. Hồ Chí Minh', 'Xe thể thao, động cơ mạnh mẽ, phù hợp cho giới trẻ yêu thích tốc độ.', 'image/honda-civic.jpg'),
('Mazda', 'Mazda 3', 2021, 30000, 450000000, 'Đà Nẵng', 'Thiết kế hiện đại, công nghệ tiên tiến, an toàn cao.', 'image/mazda-3.jpg'),
('Ford', 'Ranger Wildtrak', 2018, 80000, 650000000, 'Hà Nội', 'Xe bán tải mạnh mẽ, phù hợp địa hình khó khăn.', 'image/fordranger.jpg'),
('KIA', 'Carnival Signature 2.5', 2022, 12000, 1590000000, 'TP. Hồ Chí Minh', 'Xe 7 chỗ sang trọng, đầy đủ tiện nghi, phù hợp gia đình.', 'image/KIA.jpg'),
('BMW', 'BMW 2025', 2025, 90000, 1330000000, 'Hà Nội', 'Xe cao cấp, công nghệ hiện đại nhất.', 'image/BMW.jpg'),
('Mercedes-Benz','Mercedes E200 Exclusive',2026,1300,2489000000,'TP. Hồ Chí Minh','Thiết kế tinh tế “Sensual Purity”, tạo nên hình ảnh sang trọng và đậm chất quý ông doanh nhân.','image/mercedes-benz_e200.jpg');



-- Tạo bảng carSpecs(thông số kỹ thuật xe)
	CREATE TABLE car_specs (
    id INT AUTO_INCREMENT PRIMARY KEY,
    car_id INT NOT NULL, -- liên kết với bảng cars
    seat_count INT, -- số chỗ ngồi
    dimensions VARCHAR(100), -- dài x rộng x cao
    wheel_type VARCHAR(100), -- loại mâm/lốp
    weight INT, -- tự trọng/tải trọng
    ground_clearance INT, -- khoảng sáng gầm xe (mm)
    engine VARCHAR(100), -- loại động cơ
    fuel_type VARCHAR(50), -- loại nhiên liệu
    FOREIGN KEY (car_id) REFERENCES cars(id) ON DELETE CASCADE
);

-- chèn dữ liệu mẫu vào
-- Toyota Camry 2.5Q (2020)
INSERT INTO car_specs (car_id, seat_count, dimensions, wheel_type, weight, ground_clearance, engine, fuel_type)
VALUES (1, 5, '4885 x 1840 x 1445 mm', 'Mâm 18 inch hợp kim', 1515, 140, '2.5L I4 DOHC Dual VVT-i', 'Xăng');

-- Honda Civic RS (2019)
INSERT INTO car_specs (car_id, seat_count, dimensions, wheel_type, weight, ground_clearance, engine, fuel_type)
VALUES (2, 5, '4648 x 1799 x 1416 mm', 'Mâm 17 inch thể thao', 1300, 133, '1.5L VTEC Turbo', 'Xăng');

-- Mazda Mazda 3 (2021)
INSERT INTO car_specs (car_id, seat_count, dimensions, wheel_type, weight, ground_clearance, engine, fuel_type)
VALUES (3, 5, '4660 x 1795 x 1435 mm', 'Mâm 18 inch hợp kim', 1300, 135, '1.5L Skyactiv-G', 'Xăng');

-- Ford Ranger Wildtrak (2018)
INSERT INTO car_specs (car_id, seat_count, dimensions, wheel_type, weight, ground_clearance, engine, fuel_type)
VALUES (4, 5, '5362 x 1860 x 1848 mm', 'Mâm 18 inch off-road', 2200, 200, '2.0L Bi-Turbo Diesel', 'Dầu');

-- KIA Carnival Signature 2.5 (2022)
INSERT INTO car_specs (car_id, seat_count, dimensions, wheel_type, weight, ground_clearance, engine, fuel_type)
VALUES (5, 7, '5155 x 1995 x 1775 mm', 'Mâm 19 inch đa chấu', 2200, 180, '2.2L Diesel hoặc 3.5L V6', 'Dầu hoặc Xăng');

-- BMW BMW 2025
INSERT INTO car_specs (car_id, seat_count, dimensions, wheel_type, weight, ground_clearance, engine, fuel_type)
VALUES (6, 5, '4820 x 1900 x 1450 mm', 'Mâm 19 inch thể thao', 1650, 145, '2.0L TwinPower Turbo hoặc hybrid', 'Xăng / Hybrid');

-- Mercedes-Benz e200
INSERT INTO car_specs (car_id, seat_count, dimensions, wheel_type, weight, ground_clearance, engine, fuel_type)
VALUES (7, 5, '4949 x 1880 x 1468 mm', 'Mâm 18 inch hợp kim', 1707, 150, 'I4 2.0L TwinPower Turbo hoặc EQ Boost', 'Xăng');
-- tạo bảng đăng ký lái thử
CREATE TABLE test_drive_registration (
    id INT AUTO_INCREMENT PRIMARY KEY,

    car_id INT NOT NULL,
    car_name VARCHAR(255) NOT NULL,

    full_name VARCHAR(100) NOT NULL,
    phone VARCHAR(20) NOT NULL,

    test_date DATE NOT NULL,
    test_time TIME NOT NULL,

    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Tạo bảng User phục vụ login
CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL UNIQUE,
    password VARCHAR(100) NOT NULL,
    phoneNumber VARCHAR(20) NOT NULL,
    role VARCHAR(20) DEFAULT 'user'
);
