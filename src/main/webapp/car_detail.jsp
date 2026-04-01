<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ page import="model.Car"%>
<%@ page import="model.CarSpecs"%>
<%
    Car car = (Car) request.getAttribute("car");
    if (car == null) {
        response.sendRedirect("home.jsp?error=notfound");
        return;
    }
%>

<%
    CarSpecs specs = (CarSpecs) request.getAttribute("specs");
    if (specs != null) {
%>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <title><%=car.getBrand()%> <%=car.getModel()%> - Car Store</title>
    <!-- css cho Toàn bộ trang-->
    <link rel="stylesheet" href="css/Styles.css">
    <link rel="stylesheet" href="css/carDetail.css" />
    <!--css cho popup thong bao dien thong tin khach hang-->
    <link rel="stylesheet" href="css/BuyCarNotice.css">
    <link
            href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;600;800&display=swap"
            rel="stylesheet" />
    <style>

    </style>
</head>
<body>
<!-- Header -->
<header class="site-header">
    <div class="container header-inner">
        <div class="brand">
            <div class="logo">Car Store</div>
            <nav class="nav">
                <a href="index.jsp">Trang chủ</a> <a href="home.jsp">Mua xe</a> <a
                    href="sellCar.html">Đăng bán</a> <a href="gioi-thieu.html">Giới
                thiệu</a> <a href="news.html">Tin tức</a>
            </nav>
        </div>

        <div class="header-actions">
            <button class="btn btn-primary">Tìm xe</button>
            <button class="btn btn-ghost">Hà Nội</button>
        </div>
    </div>
</header>

<!-- Main content -->
<main class="car-detail-container">
    <div class="car-detail-grid">
        <!-- Image Section -->
        <div class="car-image-section">
            <img
                    src="<%=car.getImage() != null && car.getImage().startsWith("image/") ? car.getImage() : "image/" + car.getImage()%>"
                    alt="<%=car.getBrand()%> <%=car.getModel()%>"
                    onerror="this.src='image/logo.png'">
        </div>

        <!-- Info Section -->
        <div class="car-info-section">
            <h1 class="car-title"><%=car.getBrand()%>
                <%=car.getModel()%></h1>
            <p class="car-subtitle">
                Năm
                <%=car.getYear()%>
                •
                <%=String.format("%,d", car.getMileage())%>
                km
            </p>

            <div class="price-large"><%=String.format("%,.0f", car.getPrice())%>
                ₫
            </div>

            <div class="info-row">
                <span class="info-label">Thương hiệu:</span> <span
                    class="info-value"><%=car.getBrand()%></span>
            </div>
            <div class="info-row">
                <span class="info-label">Mẫu xe:</span> <span class="info-value"><%=car.getModel()%></span>
            </div>
            <div class="info-row">
                <span class="info-label">Năm sản xuất:</span> <span
                    class="info-value"><%=car.getYear()%></span>
            </div>
            <div class="info-row">
                <span class="info-label">Số km đã đi:</span> <span
                    class="info-value"><%=String.format("%,d", car.getMileage())%>
						km</span>
            </div>
            <div class="info-row">
                <span class="info-label">Địa điểm:</span> <span class="info-value"><%=car.getLocation()%></span>
            </div>

            <div class="action-buttons">
                <form action="testDrive.jsp" method="get">
                    <input type="hidden" name="carId" value="<%=car.getId()%>">
                    <button type="submit" class="btn btn-primary btn-large">
                        Đăng ký lái thử</button>
                </form>
                <button id="buyBtn" class="btn btn-success btn-large">Đặt mua</button>
                <div id="modal" class="modal">
                    <div class="modal-content">
                        <span id="closeBtn" class="close">&times;</span>
                        <h2>Thông báo</h2>
                        <p>Quý khách vui lòng để lại thông tin để chúng tôi liên hệ tư vấn mua xe</p>
                        <button id="goFormBtn">Điền thông tin</button>

                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Description Section -->
    <div class="description-section">
        <h2>Mô tả chi tiết</h2>
        <p><%=car.getDescription() != null && !car.getDescription().isEmpty() ? car.getDescription()
                : "Chưa có mô tả chi tiết về xe này."%></p>
    </div>


    <!-- thong tin chi tiet xe -->

    <div class="description-section">
        <h2>Thông số kỹ thuật</h2>

        <div class="info-row">
            <span class="info-label">Số chỗ ngồi:</span> <span
                class="info-value"><%=specs.getSeatCount()%></span>
        </div>

        <div class="info-row">
            <span class="info-label">Kích thước (D x R x C):</span> <span
                class="info-value"><%=specs.getDimensions()%></span>
        </div>

        <div class="info-row">
            <span class="info-label">Chiều dài cơ sở:</span> <span
                class="info-value"><%=specs.getCarId()%></span>
            <!-- nếu bạn có cột riêng -->
        </div>

        <div class="info-row">
            <span class="info-label">Tự trọng / Tải trọng:</span> <span
                class="info-value"><%=specs.getWeight()%> kg</span>
        </div>

        <div class="info-row">
            <span class="info-label">Khoảng sáng gầm xe:</span> <span
                class="info-value"><%=specs.getGroundClearance()%> mm</span>
        </div>

        <div class="info-row">
            <span class="info-label">Lốp, la-zăng:</span> <span
                class="info-value"><%=specs.getWheelType()%></span>
        </div>

        <div class="info-row">
            <span class="info-label">Động cơ:</span> <span class="info-value"><%=specs.getEngine()%></span>
        </div>

        <div class="info-row">
            <span class="info-label">Loại nhiên liệu:</span> <span
                class="info-value"><%=specs.getFuelType()%></span>
        </div>
    </div>
    <%
    } else {
    %>
    <div class="description-section">
        <h2>Thông số kỹ thuật</h2>
        <p>Chưa có dữ liệu thông số kỹ thuật cho xe này.</p>
    </div>
    <%
        }
    %>

    <!-- Back button -->
    <div style="text-align: center; margin-bottom: 40px;">
        <a href="home.jsp" class="btn btn-ghost"
           style="text-decoration: none">← Quay lại danh sách</a>
    </div>

</main>

<!-- Footer -->
<footer class="site-footer">
    <div class="container footer-inner">
        <div class="brand-col">
            <div class="logo">Car Store</div>
            <p class="muted">Chợ ô tô tin cậy — Kết nối người mua & người
                bán</p>
        </div>
        <div class="links-col">
            <h4>Về chúng tôi</h4>
            <ul>
                <li><a href="gioi-thieu.html">Giới thiệu</a></li>
                <li><a href="#contact">Liên hệ</a></li>
            </ul>
        </div>
        <div class="contact-col">
            <h4>Hỗ trợ</h4>
            <p class="muted">hotline: 1900 0000</p>
        </div>
    </div>
    <div class="footer-bottom">
        <div class="container">© 2025 AutoSieuLuot. Bản quyền thuộc về
            AutoSieuLuot.</div>
    </div>
</footer>
    <script src="js/script.js"></script>
</body>
</html>