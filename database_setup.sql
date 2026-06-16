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
('Mercedes-Benz','Mercedes E200 Exclusive',2026,1300,2489000000,'TP. Hồ Chí Minh','Thiết kế tinh tế “Sensual Purity”, tạo nên hình ảnh sang trọng và đậm chất quý ông doanh nhân.','image/mercedes-benz_e200.jpg'),
('Mercedes-Benz', 'GLC 200 4Matic 2025', 2025, 8000, 1879000000, 'Hà Nội', 'SUV đột phá, công nghệ Mild-Hybrid tiết kiệm, dẫn động 4MATIC và MBUX 2.0 thông minh.', 'image/mercedes-benz_glc200_2025.jpg'),
('Mercedes-Benz', 'GLC 200 4Matic 2022', 2025, 34000, 1399000000, 'Hà Nội', 'SUV hạng sang, nội thất rộng rãi, vận hành êm ái, lý tưởng cho gia đình.', 'image/mercedes-benz_glc200_2022.jpg');


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

--Mercedes-Benz GLC 200 4Matic 2025
INSERT INTO car_specs (car_id, seat_count, dimensions, wheel_type, weight, ground_clearance, engine, fuel_type)
VALUES (8, 5, '4670 x 1900 x 1650 mm', 'Mâm 18 inch hợp kim 5 chấu kép', 1760, 161, '2.0L I4 Tăng áp', 'Xăng');
--Mercedes-Benz GLC 200 4MATIC 2022
INSERT INTO car_specs (car_id, seat_count, dimensions, wheel_type, weight, ground_clearance, engine, fuel_type)
VALUES (9, 5, '4716 x 1890 x 1640 mm', 'Mâm 19 inch hợp kim', 1925,	145, '2.0L I4 Mild-Hybrid hoặc EQ Boost',	'Xăng / Hybrid');

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

--tạo bảng thông tin người dùng mua xe
CREATE TABLE offers(
    id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100),
    phone VARCHAR(20),
    message TEXT,
    price DOUBLE,
    create_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
)

    -- ============================================
-- Migration: Thêm bảng car_images (nhiều ảnh/xe)
-- Chạy file này trong MySQL
-- ============================================

-- Tạo bảng car_images
CREATE TABLE IF NOT EXISTS car_images (
    id INT AUTO_INCREMENT PRIMARY KEY,
    car_id INT NOT NULL,
    image_path VARCHAR(500) NOT NULL,-- đường dẫn tương đối, ví dụ: image/abc.jpg
    sort_order INT NOT NULL DEFAULT 0, -- thứ tự hiển thị (0 = ảnh đầu tiên)
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (car_id) REFERENCES cars(id) ON DELETE CASCADE
    );

-- ============================================
--thêm ảnh phụ
-- ============================================
INSERT INTO car_images (car_id, image_path, sort_order)
SELECT id, image, 0
FROM cars
WHERE image IS NOT NULL AND image != '';

-- ============================================
-- Ví dụ thêm ảnh phụ thủ công cho xe có ID = 1 (Toyota Camry):
-- ============================================
-- INSERT INTO car_images (car_id, image_path, sort_order) VALUES (1, 'image/tên-ảnh.jpg', 1);
-- INSERT INTO car_images (car_id, image_path, sort_order) VALUES (1, 'image/tên-ảnh.jpg', 2);
-- INSERT INTO car_images (car_id, image_path, sort_order) VALUES (1, 'image/tên-ảnh.jpg', 3);

-- 1. Bảng hãng xe
CREATE TABLE IF NOT EXISTS car_brands (
      id   INT AUTO_INCREMENT PRIMARY KEY,
      name VARCHAR(100) NOT NULL UNIQUE
    );

-- 2. Bảng dòng xe (liên kết hãng)
CREATE TABLE IF NOT EXISTS car_models_catalog (
       id INT AUTO_INCREMENT PRIMARY KEY,
       brand_id INT NOT NULL,
       model_name VARCHAR(150) NOT NULL,
    FOREIGN KEY (brand_id) REFERENCES car_brands(id) ON DELETE CASCADE
    );

-- 3. Bảng loại nhiên liệu
CREATE TABLE IF NOT EXISTS fuel_types (
       id INT AUTO_INCREMENT PRIMARY KEY,
       name VARCHAR(50) NOT NULL UNIQUE
    );

-- 4. Bảng kích thước la-zăng
CREATE TABLE IF NOT EXISTS wheel_sizes (
       id INT AUTO_INCREMENT PRIMARY KEY,
       size_label VARCHAR(50) NOT NULL UNIQUE
    );

-- ============================================
-- Seed: Hãng xe & dòng xe
-- ============================================
INSERT IGNORE INTO car_brands (name) VALUES
    ('Toyota'), ('Honda'), ('Mazda'), ('Ford'), ('KIA'),
    ('Hyundai'), ('Mercedes-Benz'), ('BMW'), ('Audi'),
    ('VinFast'), ('Mitsubishi'), ('Suzuki'), ('Nissan'),
    ('Chevrolet'), ('Peugeot'), ('Volvo'), ('Lexus'), ('Subaru');

INSERT IGNORE INTO car_models_catalog (brand_id, model_name)
SELECT id, m.model_name
FROM car_brands b
         JOIN (
    SELECT 'Toyota' AS brand, 'Camry' AS model_name UNION ALL

    SELECT 'Toyota','Vios' UNION ALL
    SELECT 'Toyota','Fortuner' UNION ALL
    SELECT 'Toyota','Yaris' UNION ALL
    SELECT 'Honda','Civic' UNION ALL
    SELECT 'Honda','CR-V' UNION ALL
    SELECT 'Honda','City' UNION ALL
    SELECT 'Honda','HR-V' UNION ALL
    SELECT 'Honda','Accord' UNION ALL
    SELECT 'Honda','BR-V' UNION ALL
    SELECT 'Mazda','Mazda 3' UNION ALL
    SELECT 'Mazda','Mazda 6' UNION ALL
    SELECT 'Mazda','CX-5' UNION ALL
    SELECT 'Mazda','CX-8' UNION ALL
    SELECT 'Ford','Ranger' UNION ALL
    SELECT 'Ford','Everest' UNION ALL
    SELECT 'Ford','Territory' UNION ALL
    SELECT 'Ford','Explorer' UNION ALL
    SELECT 'KIA','Seltos' UNION ALL
    SELECT 'KIA','Sorento' UNION ALL
    SELECT 'KIA','Carnival' UNION ALL
    SELECT 'KIA','K3' UNION ALL
    SELECT 'KIA','Sportage' UNION ALL
    SELECT 'KIA','Morning' UNION ALL
    SELECT 'Hyundai','Tucson' UNION ALL
    SELECT 'Hyundai','Santa Fe' UNION ALL
    SELECT 'Hyundai','Accent' UNION ALL
    SELECT 'Hyundai','Elantra' UNION ALL
    SELECT 'Hyundai','Creta' UNION ALL
    SELECT 'Mercedes-Benz','C 200' UNION ALL
    SELECT 'Mercedes-Benz','E 200' UNION ALL
    SELECT 'Mercedes-Benz','GLC 200' UNION ALL
    SELECT 'Mercedes-Benz','GLE 300d' UNION ALL
    SELECT 'Mercedes-Benz','S 450' UNION ALL
    SELECT 'Mercedes-Benz','A 200' UNION ALL
    SELECT 'BMW','320i' UNION ALL
    SELECT 'BMW','520i' UNION ALL
    SELECT 'BMW','X3' UNION ALL
    SELECT 'BMW','X5' UNION ALL
    SELECT 'BMW','X7' UNION ALL
    SELECT 'Audi','A4' UNION ALL
    SELECT 'Audi','A6' UNION ALL
    SELECT 'Audi','Q5' UNION ALL
    SELECT 'Audi','Q7' UNION ALL
    SELECT 'VinFast','VF 3' UNION ALL
    SELECT 'VinFast','VF 5' UNION ALL
    SELECT 'VinFast','VF 6' UNION ALL
    SELECT 'VinFast','VF 7' UNION ALL
    SELECT 'VinFast','VF 8' UNION ALL
    SELECT 'VinFast','VF 9' UNION ALL
    SELECT 'Mitsubishi','Xpander' UNION ALL
    SELECT 'Mitsubishi','Outlander' UNION ALL
    SELECT 'Mitsubishi','Triton' UNION ALL
    SELECT 'Mitsubishi','Eclipse Cross' UNION ALL
    SELECT 'Suzuki','Ertiga' UNION ALL
    SELECT 'Suzuki','XL7' UNION ALL
    SELECT 'Nissan','Terra' UNION ALL
    SELECT 'Nissan','Navara' UNION ALL
    SELECT 'Lexus','RX 350' UNION ALL
    SELECT 'Lexus','ES 250' UNION ALL
    SELECT 'Subaru','Forester' UNION ALL
    SELECT 'Subaru','Outback'
) m ON b.name = m.brand;

-- ============================================
-- Seed: Nhiên liệu
-- ============================================
INSERT IGNORE INTO fuel_types (name) VALUES
    ('Xăng'), ('Dầu diesel'), ('Hybrid'),
    ('Plug-in Hybrid (PHEV)'), ('Điện (EV)'), ('Xăng/Hybrid');

-- ============================================
-- Seed: Cỡ la-zăng
-- ============================================
INSERT IGNORE INTO wheel_sizes (size_label) VALUES
    ('14 inch'), ('15 inch'), ('16 inch'), ('17 inch'),
    ('18 inch'), ('19 inch'), ('20 inch'), ('21 inch'), ('22 inch');

