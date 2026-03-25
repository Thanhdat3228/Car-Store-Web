<%@ page language="java" contentType="text/html; charset=UTF-8" %>
    <!DOCTYPE html>
    <html lang="vi">

    <head>
        <meta charset="UTF-8">
        <title>Đăng ký - Car Store</title>
        <link rel="stylesheet" href="css/LoginStyles.css">
    </head>

    <body>
        <div class="container">
            <h2>Đăng ký</h2>
            <form action="RegisterServlet" method="post">
                <div class="form-group">
                    <input type="text" name="username" placeholder="Tên đăng nhập" required>
                </div>
                <div class="form-group">
                    <input type="password" name="password" placeholder="Mật khẩu" required>
                </div>

                <div class="form-group">
                    <input type="tel" name="phoneNumber" placeholder="Số điện thoại" required>
                </div>

                <button type="submit" class="btn">Đăng ký</button>
            </form>

            <div class="switch">
                <p>Đã có tài khoản? <a href="login.jsp">Đăng nhập</a></p>
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
        <script>
            document.addEventListener("DOMContentLoaded", function () {
                const urlParams = new URLSearchParams(window.location.search);
                    if (urlParams.has('success') && urlParams.get('success') === 'register') {
                        Swal.fire({
                            title: 'Đăng ký thành công!',
                            text: 'Mời bạn đăng nhập để tiếp tục.',
                            icon: 'success',
                            confirmButtonText: 'Đăng nhập',
                            timer: 3000,
                            timerProgressBar: true
                        }).then((result) => {
                            window.location.href = 'login.jsp';
                        });
                    }
            });
        </script>
    </body>

    </html>