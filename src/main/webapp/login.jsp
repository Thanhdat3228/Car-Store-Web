<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Đăng nhập - Car Store</title>
    <link rel=stylesheet href="css/LoginStyles.css">
</head>
<body>
<div class="container">
    <h2>Đăng nhập</h2>
    <form action="LoginServlet" method="post">
        <div class="form-group">
            <input type="text" name="username" placeholder="Tên đăng nhập" required>
        </div>
        <div class="form-group">
            <input type="password" name="password" placeholder="Mật khẩu" required>
        </div>
        <button type="submit" class="btn">Đăng nhập</button>
    </form>

    <div class="switch">
        <p>Bạn chưa có tài khoản? <a href="register.jsp">Đăng ký ngay</a></p>
    </div>
</div>
</body>
</html>