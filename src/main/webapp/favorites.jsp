<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="headerForAll.jsp" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <title>Xe yêu thích - Car Store</title>
    <link rel="stylesheet" href="css/Styles.css"/>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600;800&display=swap" rel="stylesheet"/>
</head>
<body>

<% if (session.getAttribute("user") == null) {
    response.sendRedirect(request.getContextPath() + "/login.jsp");
    return;
}
%>

<main class="favorites-page">
    <h1>&#10084; Xe yêu thích</h1>
    <p class="muted" style="margin-bottom:28px;">Danh sách xe bạn đã lưu</p>

    <%-- Chức năng xe yêu thích sẽ được phát triển ở giai đoạn tiếp theo --%>
    <div class="favorites-empty">
        <div class="favorites-empty-icon">&#128149;</div>
        <p>Bạn chưa lưu xe yêu thích nào.<br>Hãy khám phá và bấm ♥ để lưu xe bạn thích!</p>
        <a href="index.jsp" class="btn btn-primary" style="text-decoration:none;">
            Khám phá xe ngay
        </a>
    </div>

    <a href="CarListServlet" class="back-link">&#8592; Quay về trang chủ</a>
</main>

<!-- Footer -->
<%@ include file="footer.jsp" %>
</body>
</html>
