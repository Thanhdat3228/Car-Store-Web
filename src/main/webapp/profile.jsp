<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="headerForAll.jsp" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <title>Hồ sơ cá nhân - Car Store</title>
    <link rel="stylesheet" href="css/Styles.css"/>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600;800&display=swap" rel="stylesheet"/>
</head>
<body>

<% if (session.getAttribute("user") == null) {
    response.sendRedirect(request.getContextPath() + "/login.jsp");
    return;
}
%>

<main class="profile-page">
    <div class="profile-card">

        <div class="profile-card-header">
            <div class="profile-card-avatar">&#128100;</div>
            <div class="profile-card-username"><%= session.getAttribute("user") %></div>
            <span class="profile-card-role">
                <%= "admin".equals(session.getAttribute("role")) ? "Quản trị viên" : "Thành viên" %>
            </span>
        </div>

        <div class="profile-card-body">
            <div class="profile-info-row">
                <span class="profile-info-icon">&#128100;</span>
                <span class="profile-info-label">Tên đăng nhập</span>
                <span class="profile-info-value"><%= session.getAttribute("user") %></span>
            </div>
            <div class="profile-info-row">
                <span class="profile-info-icon">&#128222;</span>
                <span class="profile-info-label">Số điện thoại</span>
                <span class="profile-info-value">
                    <%= session.getAttribute("userPhone") != null
                            ? session.getAttribute("userPhone") : "Chưa cập nhật" %>
                </span>
            </div>
            <div class="profile-info-row">
                <span class="profile-info-icon">&#127989;</span>
                <span class="profile-info-label">Vai trò</span>
                <span class="profile-info-value">
                    <%= "admin".equals(session.getAttribute("role")) ? "Quản trị viên" : "Thành viên" %>
                </span>
            </div>
        </div>

    </div>
    <a href="index.jsp" class="back-link">&#8592; Quay về trang chủ</a>
</main>

<!-- Footer -->
<footer class="site-footer">
    <div class="container footer-inner">
        <div class="brand-col">
            <div class="logo">Car Store</div>
            <p class="muted">Chợ ô tô tin cậy — Kết nối người mua &amp; người bán</p>
        </div>
        <div class="links-col">
            <h4>Về chúng tôi</h4>
            <ul>
                <li><a href="gioi-thieu.jsp">Giới thiệu</a></li>
                <li><a href="#contact">Liên hệ</a></li>
            </ul>
        </div>
        <div class="contact-col">
            <h4>Hỗ trợ</h4>
            <p class="muted">Hotline: 1900 0000</p>
        </div>
    </div>
    <div class="footer-bottom">
        <div class="container">© 2025 AutoSieuLuot. Bản quyền thuộc về AutoSieuLuot.</div>
    </div>
</footer>
</body>
</html>
