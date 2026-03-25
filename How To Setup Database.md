# Hướng dẫn Setup Database cho Website Bán Xe

## Yêu cầu
- MySQL Server đã được cài đặt
- MySQL Workbench hoặc phpMyAdmin (hoặc command line)

## Các bước thực hiện

### Bước 1: Mở MySQL
--Mở XAMPP control panel
--Start MySQL lên rồi chọn Admin

### Bước 2: Chạy Script SQL
1. Mở file `database_setup.sql` 
2. Copy toàn bộ nội dung
3. Paste vào MySQL và chạy

### Bước 3: Kiểm tra
Sau khi chạy script, bạn sẽ có:
- Database: `car_store`
- Bảng: `cars` với 6 xe mẫu

### Bước 4: Cấu hình kết nối (nếu cần)
--password và port(3306) em để mặc định ko cần cấu hình lại

## Cấu trúc bảng cars

| Cột | Kiểu dữ liệu | Mô tả |
|-----|-------------|-------|
| id | INT | ID tự động tăng (Primary Key) |
| brand | VARCHAR(50) | Thương hiệu xe |
| model | VARCHAR(100) | Mẫu xe |
| year | INT | Năm sản xuất |
| mileage | INT | Số km đã đi |
| price | BIGINT | Giá bán (VNĐ) |
| location | VARCHAR(100) | Địa điểm |
| description | TEXT | Mô tả chi tiết |
| image | VARCHAR(255) | Đường dẫn ảnh |
| created_at | TIMESTAMP | Thời gian tạo |



## Cấu trúc bảng carSpecs(thông số kỹ thuật xe):
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

## cấu trúc bảng User phục vụ filter
CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,--id
    username VARCHAR(50) NOT NULL UNIQUE,--tên đăng nhập
    password VARCHAR(100) NOT NULL,--password
    phoneNumber VARCHAR(20) NOT NULL,--số điện thoại
    role VARCHAR(20) DEFAULT 'user'--vai trò user hay admin
);
