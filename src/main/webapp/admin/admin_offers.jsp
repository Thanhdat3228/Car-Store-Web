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
        <li><a href="${pageContext.request.contextPath}/admin/cars" class="active"><i class="fas fa-car"></i> Quản lý kho xe</a></li>
        <li><a href="${pageContext.request.contextPath}/admin/test-drives"><i class="fas fa-calendar-check"></i>Lịch lái thử</a></li>
        <li><a href="${pageContext.request.contextPath}/admin/offers"><i class="fas fa-calendar-check"></i>Khách đề nghị giá</a></li>
        <li><a href="${pageContext.request.contextPath}/admin/catalog"><i class="fa fa-tags"></i> Quản lý hãng xe</a>
        <li><a href="${pageContext.request.contextPath}/CarListServlet"><i class="fas fa-home"></i> Xem trang web</a></li>
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
<h2>Thống kê Offer</h2>
<table border="1" cellpadding="5">
    <tr>
        <th>Họ tên</th>
        <th>Email</th>
        <th>Số điện thoại</th>
        <th>Lời đề nghị</th>
        <th>Giá mong muốn</th>
    </tr>
    <c:forEach var="offer" items="${offers}">
        <tr>
            <td>${offer.firstName} ${offer.lastName}</td>
            <td>${offer.email}</td>
            <td>${offer.phone}</td>
            <td>${offer.message}</td>
            <td><fmt:formatNumber value="${offer.price}" type="number" groupingUsed="true"/> ₫
            </td>
        </tr>
    </c:forEach>
</table>
</main>
</body>
</html>
