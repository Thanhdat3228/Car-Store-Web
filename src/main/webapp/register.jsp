<%@ page language="java" contentType="text/html; charset=UTF-8" %>
    <!DOCTYPE html>
    <html lang="vi">

    <head>
        <meta charset="UTF-8">
        <title>Đăng ký - Car Store</title>
        <link rel="stylesheet" href="css/LoginStyles.css">
    </head>

    <body>
    <div class="center_wrapper">
        <div class="container">
            <h2>Đăng ký</h2>
            <form action="RegisterServlet" method="post">
                <div class="form-group">
                    <input type="text" name="username" placeholder="Tên đăng nhập" required>
                </div>
                <div class="form-group password-box">
                    <input type="password" id="password" name="password"
                           placeholder="Mật khẩu"
                           minlength="8"
                           title="Mật khẩu phải có ít nhất 8 kí tự"
                           required>

                    <span class="toggle-password" onclick="togglePassword()">👁</span>
                </div>

                <div class="form-group">
                    <input type="tel" name="phoneNumber" placeholder="Số điện thoại"
                                                         pattern="[0-9]{10}"
                                                         maxlength="10"
                                                         title="Số điện thoại phải đủ 10 chữ số" required>
                </div>

                <button type="submit" class="btn">Đăng ký</button>
            </form>

            <div class="switch">
                <p>Đã có tài khoản? <a href="login.jsp">Đăng nhập</a></p>
            </div>
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
    <script>
        function togglePassword() {
            const password = document.getElementById("password");

            if (password.type === "password") {
                password.type = "text";
            } else {
                password.type = "password";
            }
        }
    </script>
    </body>

    </html>