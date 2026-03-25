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
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
        <script>
            document.addEventListener("DOMContentLoaded", function () {
                const urlParams = new URLSearchParams(window.location.search);
                if (urlParams.has('success') && urlParams.get('success') === 'login') {
                    Swal.fire({
                        title: 'Đăng nhập thành công!',
                        text: 'Chào mừng bạn đến với Car Store.',
                        icon: 'success',
                        confirmButtonText: 'Đồng ý',
                        timer: 2000,
                        timerProgressBar: true
                    }).then((result) => {
                        window.location.href = 'index.jsp';
                    });
                }
            });
        </script>
    </body>

    </html>