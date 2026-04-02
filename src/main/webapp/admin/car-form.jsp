<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="vi">

<head>
    <meta charset="UTF-8">
    <title>${car != null ? 'Sửa thông tin xe' : 'Thêm xe mới'} - Admin Dashboard</title>
    <link rel="stylesheet" href="/admin/css/admin.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
</head>

<body>

<!-- Sidebar -->
<aside class="sidebar">
    <div class="brand">
        CAR<span style="color:white">STORE</span>
    </div>
    <ul class="nav-links">
        <li><a href="${pageContext.request.contextPath}/admin/cars" class="active"><i class="fas fa-car"></i> Quản lý kho xe</a></li>
        <li><a href="#"><i class="fas fa-calendar-check"></i> Lịch lái thử</a></li>
        <li><a href="#"><i class="fas fa-users"></i> Khách hàng</a></li>
        <li><a href="#"><i class="fas fa-chart-line"></i> Thống kê</a></li>
        <li><a href="${pageContext.request.contextPath}/index.jsp"><i class="fas fa-home"></i> Xem trang web</a></li>
        <li style="margin-top:auto"><a href="${pageContext.request.contextPath}/LogoutServlet"><i class="fas fa-sign-out-alt"></i> Đăng
            xuất</a></li>
    </ul>
</aside>

<!-- Main Content -->
<main class="main-content">
    <header class="top-header">
        <div class="search-bar"></div>
        <div class="user-profile">
            <span>Admin User</span>
            <img src="https://ui-avatars.com/api/?name=Admin&background=4F46E5&color=fff" alt="Admin">
        </div>
    </header>

    <section class="page-content">
        <div class="page-header">
            <h1 class="page-title">${car != null ? 'Sửa thông tin xe' : 'Thêm xe mới vào kho'}</h1>
            <a href="${pageContext.request.contextPath}/admin/cars" class="btn btn-primary"><i class="fas fa-arrow-left"></i> Quay lại</a>
        </div>

        <div class="form-container">
            <form action="/UploadCarToSellServlet" method="post"
                  enctype="multipart/form-data">
                <c:if test="${car != null}">
                    <input type="hidden" name="id" value="${car.id}">
                </c:if>

                <div class="form-grid">
                    <div class="section-title">Thông tin chung</div>

                    <div class="form-group">
                        <label>Thương hiệu:</label>
                        <input type="text" name="brand" required value="${car != null ? car.brand : ''}">
                    </div>

                    <div class="form-group">
                        <label>Mẫu xe:</label>
                        <input type="text" name="model" required value="${car != null ? car.model : ''}">
                    </div>

                    <div class="form-group">
                        <label>Năm sản xuất:</label>
                        <input type="number" name="year" required value="${car != null ? car.year : ''}">
                    </div>

                    <div class="form-group">
                        <label>Số km đã đi (Mileage):</label>
                        <input type="number" name="mileage" required
                               value="${car != null ? car.mileage : ''}">
                    </div>

                    <div class="form-group">
                        <label>Giá bán (VNĐ):</label>
                        <input type="number" name="price" required value="${car != null ? car.price : ''}">
                    </div>

                    <div class="form-group">
                        <label>Vị trí trưng bày / Đăng bán:</label>
                        <input type="text" name="location" required
                               value="${car != null ? car.location : ''}">
                    </div>

                    <div class="form-group full-width">
                        <label>Mô tả tổng quản:</label>
                        <textarea name="description"
                                  required>${car != null ? car.description : ''}</textarea>
                    </div>

                    <div class="form-group full-width">
                        <label>Hình ảnh xe mới ${car != null ? '(Bỏ trống nếu không muốn đổi ảnh)' :
                                ''}:</label>
                        <c:if test="${car != null}">
                            <div style="margin-bottom:10px;">
                                <p style="color:var(--text-muted);font-size:0.85rem">Ảnh hiện tại:</p>
                                <img src="/${car.image}" style="width:150px;border-radius:6px;">
                            </div>
                        </c:if>
                        <input type="file" name="image" accept="image/*" ${car==null ? 'required' : '' }
                               style="color:var(--text-main)">
                    </div>


                    <div class="section-title">Thông số kỹ thuật</div>

                    <div class="form-group">
                        <label>Số chỗ ngồi:</label>
                        <input type="number" name="seat_Count" required
                               value="${specs != null ? specs.seatCount : ''}">
                    </div>

                    <div class="form-group">
                        <label>Kích thước (D x R x C):</label>
                        <input type="text" name="dimensions" placeholder="Ví dụ: 4885 x 1840 x 1445 mm"
                               required value="${specs != null ? specs.dimensions : ''}">
                    </div>

                    <div class="form-group">
                        <label>Tự trọng / Tải trọng (kg):</label>
                        <input type="number" name="weight" placeholder="Ví dụ: 1515" required
                               value="${specs != null ? specs.weight : ''}">
                    </div>

                    <div class="form-group">
                        <label>Khoảng sáng gầm xe (mm):</label>
                        <input type="number" name="ground_clearance" required
                               value="${specs != null ? specs.groundClearance : ''}">
                    </div>

                    <div class="form-group">
                        <label>Lốp, la-zăng (wheels):</label>
                        <input type="text" name="wheels" required
                               value="${specs != null ? specs.wheelType : ''}">
                    </div>

                    <div class="form-group">
                        <label>Động cơ:</label>
                        <input type="text" name="engine" required
                               value="${specs != null ? specs.engine : ''}">
                    </div>

                    <div class="form-group">
                        <label>Loại nhiên liệu (Xăng, Dầu, Hybrid...):</label>
                        <input type="text" name="fuel_type" required
                               value="${specs != null ? specs.fuelType : ''}">
                    </div>

                    <div class="form-group full-width" style="margin-top: 1rem;">
                        <button type="submit" class="btn btn-primary"
                                style="width: 100%; font-size: 1.1rem; padding: 0.8rem;">
                            <form action="${pageContext.request.contextPath}/UploadCarToSellServlet" method="post" enctype="multipart/form-data"> <i>Đăng bán xe</i>
                        </button>
                    </div>

                </div>
            </form>
        </div>
    </section>
</main>

</body>

</html>