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
    <a href="CarListServlet" class="back-link">&#8592; Quay về trang chủ</a>
</main>

<!-- Footer -->
<%@ include file="footer.jsp" %>
</body>
</html>
