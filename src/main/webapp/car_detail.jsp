<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ page import="model.Car"%>
<%@ page import="model.CarSpecs"%>

<%
    Car car = (Car) request.getAttribute("car");
    if (car == null) {
        response.sendRedirect(request.getContextPath() + "/home.jsp?error=notfound");
        return;
    }

    CarSpecs specs = (CarSpecs) request.getAttribute("specs");
%>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <title><%=car.getBrand()%> <%=car.getModel()%> - Car Store</title>

    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/Styles.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/carDetail.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/BuyCarNotice.css">

    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;600;800&display=swap"
          rel="stylesheet">
</head>

<body>

<%@ include file="headerForAll.jsp" %>

<main class="car-detail-container">
    <div class="car-detail-grid">
        <div class="car-image-section">
            <img
                    src="<%=request.getContextPath()%>/<%=car.getImage() != null && car.getImage().startsWith("image/") ? car.getImage() : "image/" + car.getImage()%>"
                    alt="<%=car.getBrand()%> <%=car.getModel()%>"
                    onerror="this.src='<%=request.getContextPath()%>/image/logo.png'">
        </div>

        <div class="car-info-section">
            <h1 class="car-title">
                <%=car.getBrand()%> <%=car.getModel()%>
            </h1>

            <p class="car-subtitle">
                Năm <%=car.getYear()%> • <%=String.format("%,d", car.getMileage())%> km
            </p>

            <div class="price-large">
                <%=String.format("%,.0f", car.getPrice())%> ₫
            </div>

            <div class="info-row">
                <span class="info-label">Thương hiệu:</span>
                <span class="info-value"><%=car.getBrand()%></span>
            </div>

            <div class="info-row">
                <span class="info-label">Mẫu xe:</span>
                <span class="info-value"><%=car.getModel()%></span>
            </div>

            <div class="info-row">
                <span class="info-label">Năm sản xuất:</span>
                <span class="info-value"><%=car.getYear()%></span>
            </div>

            <div class="info-row">
                <span class="info-label">Số km đã đi:</span>
                <span class="info-value"><%=String.format("%,d", car.getMileage())%> km</span>
            </div>

            <div class="info-row">
                <span class="info-label">Địa điểm:</span>
                <span class="info-value"><%=car.getLocation()%></span>
            </div>

            <div class="action-buttons">
                <form action="<%=request.getContextPath()%>/TestDriveAuthServlet" method="get">
                    <input type="hidden" name="carId" value="<%=car.getId()%>">
                    <button type="submit" class="btn btn-primary btn-large">
                        Đăng ký lái thử
                    </button>
                </form>

                <button id="buyBtn" class="btn btn-success btn-large">Liên hệ</button>

                <div id="modal" class="modal">
                    <div class="modal-content">
                        <span id="closeBtn" class="close">&times;</span>
                        <h2>Gửi đề nghị giá</h2>

                        <form action="<%=request.getContextPath()%>/MakeOfferServlet" method="post">
                            <input type="hidden" name="carId" value="<%=car.getId()%>">

                            <input type="text" name="firstName" placeholder="Tên" required>
                            <input type="text" name="lastName" placeholder="Họ và lót" required>
                            <input type="text" name="email" placeholder="Email" required>
                            <input type="text" name="phone" placeholder="Số điện thoại" required>

                            <textarea name="message" placeholder="Lời đề nghị của bạn"></textarea>

                            <input type="number" name="price" placeholder="Giá mong muốn" required>
                            <button type="submit">Gửi</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="description-section">
        <h2>Mô tả chi tiết</h2>
        <p>
            <%=car.getDescription() != null && !car.getDescription().isEmpty()
                    ? car.getDescription()
                    : "Chưa có mô tả chi tiết về xe này."%>
        </p>
    </div>

    <div class="description-section">
        <h2>Thông số kỹ thuật</h2>

        <%
            if (specs != null) {
        %>

        <div class="info-row">
            <span class="info-label">Số chỗ ngồi:</span>
            <span class="info-value"><%=specs.getSeatCount()%></span>
        </div>

        <div class="info-row">
            <span class="info-label">Kích thước:</span>
            <span class="info-value"><%=specs.getDimensions()%></span>
        </div>

        <div class="info-row">
            <span class="info-label">Tự trọng / Tải trọng:</span>
            <span class="info-value"><%=specs.getWeight()%> kg</span>
        </div>

        <div class="info-row">
            <span class="info-label">Khoảng sáng gầm xe:</span>
            <span class="info-value"><%=specs.getGroundClearance()%> mm</span>
        </div>

        <div class="info-row">
            <span class="info-label">Lốp, la-zăng:</span>
            <span class="info-value"><%=specs.getWheelType()%></span>
        </div>

        <div class="info-row">
            <span class="info-label">Động cơ:</span>
            <span class="info-value"><%=specs.getEngine()%></span>
        </div>

        <div class="info-row">
            <span class="info-label">Loại nhiên liệu:</span>
            <span class="info-value"><%=specs.getFuelType()%></span>
        </div>

        <%
        } else {
        %>

        <p>Chưa có dữ liệu thông số kỹ thuật cho xe này.</p>

        <%
            }
        %>
    </div>

    <div style="text-align: center; margin-bottom: 40px;">
        <a href="<%=request.getContextPath()%>/home.jsp" class="btn btn-ghost"
           style="text-decoration: none">
            ← Quay lại danh sách
        </a>
    </div>
</main>

<footer class="site-footer">
    <div class="container footer-inner">
        <div class="brand-col">
            <div class="logo">Car Store</div>
            <p class="muted">Chợ ô tô tin cậy — Kết nối người mua & người bán</p>
        </div>

        <div class="links-col">
            <h4>Về chúng tôi</h4>
            <ul>
                <li><a href="<%=request.getContextPath()%>/gioi-thieu.jsp">Giới thiệu</a></li>
                <li><a href="#contact">Liên hệ</a></li>
            </ul>
        </div>

        <div class="contact-col">
            <h4>Hỗ trợ</h4>
            <p class="muted">hotline: 1900 0000</p>
        </div>
    </div>

    <div class="footer-bottom">
        <div class="container">
            © 2025 AutoSieuLuot. Bản quyền thuộc về AutoSieuLuot.
        </div>
    </div>
</footer>

<script src="<%=request.getContextPath()%>/js/script.js"></script>

</body>
</html>