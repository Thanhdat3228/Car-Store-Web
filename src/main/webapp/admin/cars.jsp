<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Quản lý xe - Admin Dashboard</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/admin/css/admin.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
</head>
<body>

<!-- Sidebar -->
<aside class="sidebar">
    <div class="brand">
        CAR<span style="color:white">STORE</span>
    </div>
    <ul class="nav-links">
        <li><a href="${pageContext.request.contextPath}/admin/cars.jsp" class="active"><i class="fas fa-car"></i> Quản lý kho xe</a></li>
        <li><a href="#"><i class="fas fa-calendar-check"></i> Lịch lái thử</a></li>
        <li><a href="#"><i class="fas fa-users"></i> Khách hàng</a></li>
        <li><a href="#"><i class="fas fa-chart-line"></i> Thống kê</a></li>
        <li><a href="${pageContext.request.contextPath}/index.jsp"><i class="fas fa-home"></i> Xem trang web</a></li>
        <li style="margin-top:auto"><a href="${pageContext.request.contextPath}/LogoutServlet"><i class="fas fa-sign-out-alt"></i> Đăng xuất</a></li>
    </ul>
</aside>

<!-- Main Content -->
<main class="main-content">
    <header class="top-header">
        <div class="search-bar">
            <!-- Search bar can be added here later -->
        </div>
        <div class="user-profile">
            <span>Admin User</span>
            <img src="https://ui-avatars.com/api/?name=Admin&background=4F46E5&color=fff" alt="Admin">
        </div>
    </header>

    <section class="page-content">
        <div class="page-header">
            <h1 class="page-title">Danh sách xe</h1>
            <a href="${pageContext.request.contextPath}/admin/car-form.jsp" class="btn btn-primary"><i class="fas fa-plus"></i> Thêm xe mới</a>
        </div>

        <c:if test="${not empty param.msg}">
            <div class="alert">
                <i class="fas fa-check-circle"></i>
                <c:choose>
                    <c:when test="${param.msg == 'deleted'}">Đã xóa xe thành công!</c:when>
                    <c:when test="${param.msg == 'added'}">Đã thêm xe mới thành công!</c:when>
                    <c:when test="${param.msg == 'updated'}">Đã cập nhật xe thành công!</c:when>
                </c:choose>
            </div>
        </c:if>

        <div class="table-container">
            <table>
                <thead>
                <tr>
                    <th>Hình ảnh</th>
                    <th>Mã xe</th>
                    <th>Thương hiệu</th>
                    <th>Mẫu xe</th>
                    <th>Năm SX</th>
                    <th>Giá bán</th>
                    <th>Thao tác</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="car" items="${listCars}">
                    <tr>
                        <td>
                            <img src="${pageContext.request.contextPath}/${car.image}" alt="Car Image" class="car-img-sm" onerror="this.src='https://via.placeholder.com/80x50?text=No+Image'">
                        </td>
                        <td>${car.id}</td>
                        <td>${car.brand}</td>
                        <td>${car.model}</td>
                        <td>${car.year}</td>
                        <td class="price-tag"><fmt:formatNumber value="${car.price}" pattern="#,###"/> VNĐ</td>
                        <td class="actions">
                            <a href="${pageContext.request.contextPath}/admin/editCar?id=${car.id}" class="btn btn-sm btn-primary"><i class="fas fa-edit"></i></a>
                            <a href="${pageContext.request.contextPath}/admin/deleteCar?id=${car.id}" class="btn btn-sm btn-danger" onclick="return confirm('Bạn có chắc chắn muốn xóa chiếc xe này?');"><i class="fas fa-trash"></i></a>
                        </td>
                    </tr>
                </c:forEach>
                <c:if test="${empty listCars}">
                    <tr>
                        <td colspan="7" style="text-align:center; padding: 2rem;">Chưa có xe nào trong kho.</td>
                    </tr>
                </c:if>
                </tbody>
            </table>
        </div>
    </section>
</main>

</body>
</html>
