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
    <style>
        .stat-box {
            display: inline-block;
            width: 200px;
            margin: 10px;
            padding: 20px;
            background: #4962bb;
            border-radius: 8px;
            text-align: center;
        }
        .stat-box h2 {
            margin: 0;
            font-size: 2em;
        }
    </style>
</head>
<body>

<!-- Sidebar -->
<aside class="sidebar">
    <div class="brand">
        CAR<span style="color:white">STORE</span>
    </div>
    <ul class="nav-links">
        <li><a href="${pageContext.request.contextPath}/admin/dashboard"><i class="fas fa-chart-bar"></i> Thống kê</a></li>
        <li><a href="${pageContext.request.contextPath}/admin/cars" class="active"><i class="fas fa-car"></i> Quản lý kho xe</a></li>
        <li><a href="${pageContext.request.contextPath}/admin/test-drives"><i class="fas fa-calendar-check"></i>Lịch lái thử</a></li>
        <li><a href="${pageContext.request.contextPath}/admin/offers"><i class="fas fa-hand-holding-usd"></i>Khách đề nghị giá</a></li>
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

    <h1>Thống kê hệ thống</h1>

<div class="stat-box">
    <h2>${carCount}</h2>
    <p>Số lượng xe</p>
</div>

<div class="stat-box">
    <h2>${offerCount}</h2>
    <p>Yêu cầu liên hệ</p>
</div>

<div class="stat-box">
    <h2>${testDrivePendingCount}</h2>
    <p>Lịch lái thử chờ duyệt</p>
</div>
</main>
</body>
</html>
