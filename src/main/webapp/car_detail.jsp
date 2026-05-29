<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<<<<<<< HEAD
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
=======
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@ taglib uri="jakarta.tags.fmt" prefix="fmt" %>
<%@ taglib uri="jakarta.tags.functions" prefix="fn" %>
<%@ include file="headerForAll.jsp" %>
>>>>>>> 7648003986068ddb52998a82abb4dfb3815cb194

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width,initial-scale=1">
<<<<<<< HEAD
    <title><%=car.getBrand()%> <%=car.getModel()%> - Car Store</title>

    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/Styles.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/carDetail.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/BuyCarNotice.css">

    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;600;800&display=swap"
          rel="stylesheet">
=======
    <title><c:out value="${car.brand}"/> <c:out value="${car.model}"/> - Car Store</title>
    <!-- css cho Toàn bộ trang-->
    <link rel="stylesheet" href="css/Styles.css">
    <link rel="stylesheet" href="css/carDetail.css" />
    <!--css cho popup thong bao dien thong tin khach hang-->
    <link rel="stylesheet" href="css/BuyCarNotice.css">
    <link
            href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;600;800&display=swap"
            rel="stylesheet" />
>>>>>>> 7648003986068ddb52998a82abb4dfb3815cb194
</head>

<body>

<<<<<<< HEAD
<%@ include file="headerForAll.jsp" %>

<main class="car-detail-container">
    <div class="car-detail-grid">
        <div class="car-image-section">
            <img
                    src="<%=request.getContextPath()%>/<%=car.getImage() != null && car.getImage().startsWith("image/") ? car.getImage() : "image/" + car.getImage()%>"
                    alt="<%=car.getBrand()%> <%=car.getModel()%>"
                    onerror="this.src='<%=request.getContextPath()%>/image/logo.png'">
=======
<!-- Kiểm tra car có tồn tại không -->
<c:if test="${empty car}">
    <c:redirect url="home.jsp?error=notfound"/>
</c:if>

<!-- Main content -->
<main class="car-detail-container">
    <div class="car-detail-grid">
        <!-- Image Gallery Section -->
        <div class="car-image-section">

            <%-- Ảnh chính lớn --%>
            <div class="gallery-main">
                <c:set var="firstImage" value="${not empty imageList ? imageList[0] : car.image}"/>
                <c:set var="firstSrc" value="${firstImage.startsWith('image/') ? firstImage : 'image/'.concat(firstImage)}"/>
                <img id="galleryMainImg"
                     src="${firstSrc}"
                     alt="<c:out value="${car.brand}"/> <c:out value="${car.model}"/>">
                <script>
                    // Khi ảnh bị lỗi (không load được), thay bằng logo mặc định
                    document.getElementById("carImg").addEventListener("error", function() {
                        this.src = "images/logo.png";
                    });
                </script>

                <%-- Badge hiển thị "1 / N" --%>
                <c:if test="${fn:length(imageList) > 1}">
                    <span class="gallery-count-badge" id="galleryBadge">
                        1 / ${fn:length(imageList)}
                    </span>
                </c:if>
            </div>

            <%-- Thumbnail strip — ẩn tự động nếu chỉ có 1 ảnh (CSS :has) --%>
            <div class="gallery-thumbs">
                <c:forEach var="imgPath" items="${imageList}" varStatus="st">
                    <c:set var="thumbSrc" value="${imgPath.startsWith('image/') ? imgPath : 'image/'.concat(imgPath)}"/>
                    <div class="gallery-thumb ${st.index == 0 ? 'active' : ''}"
                         data-src="${thumbSrc}"
                         data-index="${st.index}"
                         onclick="switchImage(this)">
                        <img src="${thumbSrc}"
                             alt="Ảnh ${st.index + 1}"
                             onerror="this.src='image/logo.png'">
                    </div>
                </c:forEach>
            </div>

>>>>>>> 7648003986068ddb52998a82abb4dfb3815cb194
        </div>

        <div class="car-info-section">
            <h1 class="car-title">
<<<<<<< HEAD
                <%=car.getBrand()%> <%=car.getModel()%>
            </h1>

            <p class="car-subtitle">
                Năm <%=car.getYear()%> • <%=String.format("%,d", car.getMileage())%> km
            </p>

            <div class="price-large">
                <%=String.format("%,.0f", car.getPrice())%> ₫
=======
                <c:out value="${car.brand}"/> <c:out value="${car.model}"/>
            </h1>
            <p class="car-subtitle">
                Năm <c:out value="${car.year}"/>
                •
                <fmt:formatNumber value="${car.mileage}" type="number" groupingUsed="true"/> km
            </p>

            <div class="price-large">
                <fmt:formatNumber value="${car.price}" type="number" groupingUsed="true"/> ₫
>>>>>>> 7648003986068ddb52998a82abb4dfb3815cb194
            </div>

            <div class="info-row">
                <span class="info-label">Thương hiệu:</span>
<<<<<<< HEAD
                <span class="info-value"><%=car.getBrand()%></span>
=======
                <span class="info-value"><c:out value="${car.brand}"/></span>
>>>>>>> 7648003986068ddb52998a82abb4dfb3815cb194
            </div>

            <div class="info-row">
                <span class="info-label">Mẫu xe:</span>
<<<<<<< HEAD
                <span class="info-value"><%=car.getModel()%></span>
=======
                <span class="info-value"><c:out value="${car.model}"/></span>
>>>>>>> 7648003986068ddb52998a82abb4dfb3815cb194
            </div>

            <div class="info-row">
                <span class="info-label">Năm sản xuất:</span>
<<<<<<< HEAD
                <span class="info-value"><%=car.getYear()%></span>
=======
                <span class="info-value"><c:out value="${car.year}"/></span>
>>>>>>> 7648003986068ddb52998a82abb4dfb3815cb194
            </div>

            <div class="info-row">
                <span class="info-label">Số km đã đi:</span>
<<<<<<< HEAD
                <span class="info-value"><%=String.format("%,d", car.getMileage())%> km</span>
=======
                <span class="info-value">
                    <fmt:formatNumber value="${car.mileage}" type="number" groupingUsed="true"/> km
                </span>
>>>>>>> 7648003986068ddb52998a82abb4dfb3815cb194
            </div>

            <div class="info-row">
                <span class="info-label">Địa điểm:</span>
<<<<<<< HEAD
                <span class="info-value"><%=car.getLocation()%></span>
            </div>

            <div class="action-buttons">
                <form action="<%=request.getContextPath()%>/TestDriveAuthServlet" method="get">
                    <input type="hidden" name="carId" value="<%=car.getId()%>">
=======
                <span class="info-value"><c:out value="${car.location}"/></span>
            </div>

            <div class="action-buttons">
                <form action="testDrive.jsp" method="get">
                    <input type="hidden" name="carId" value="<c:out value="${car.id}"/>">
>>>>>>> 7648003986068ddb52998a82abb4dfb3815cb194
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
                            <input type="email" name="email" placeholder="Email" required>
                            <input type="tel" name="phone" placeholder="Số điện thoại" required>
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
<<<<<<< HEAD
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
=======
            <c:choose>
                <c:when test="${not empty car.description}">
                    <c:out value="${car.description}"/>
                </c:when>
                <c:otherwise>
                    Chưa có mô tả chi tiết về xe này.
                </c:otherwise>
            </c:choose>
        </p>
    </div>

    <!-- Thông số kỹ thuật -->
    <c:choose>
        <c:when test="${not empty specs}">
            <div class="description-section">
                <h2>Thông số kỹ thuật</h2>

                <div class="info-row">
                    <span class="info-label">Số chỗ ngồi:</span>
                    <span class="info-value"><c:out value="${specs.seatCount}"/></span>
                </div>
                <div class="info-row">
                    <span class="info-label">Kích thước (D x R x C):</span>
                    <span class="info-value"><c:out value="${specs.dimensions}"/></span>
                </div>
                <div class="info-row">
                    <span class="info-label">Tự trọng / Tải trọng:</span>
                    <span class="info-value"><c:out value="${specs.weight}"/> kg</span>
                </div>
                <div class="info-row">
                    <span class="info-label">Khoảng sáng gầm xe:</span>
                    <span class="info-value"><c:out value="${specs.groundClearance}"/> mm</span>
                </div>
                <div class="info-row">
                    <span class="info-label">Lốp, la-zăng:</span>
                    <span class="info-value"><c:out value="${specs.wheelType}"/></span>
                </div>
                <div class="info-row">
                    <span class="info-label">Động cơ:</span>
                    <span class="info-value"><c:out value="${specs.engine}"/></span>
                </div>
                <div class="info-row">
                    <span class="info-label">Loại nhiên liệu:</span>
                    <span class="info-value"><c:out value="${specs.fuelType}"/></span>
                </div>
            </div>
        </c:when>
        <c:otherwise>
            <div class="description-section">
                <h2>Thông số kỹ thuật</h2>
                <p>Chưa có dữ liệu thông số kỹ thuật cho xe này.</p>
            </div>
        </c:otherwise>
    </c:choose>
>>>>>>> 7648003986068ddb52998a82abb4dfb3815cb194

        <%
            }
        %>
    </div>

    <div style="text-align: center; margin-bottom: 40px;">
<<<<<<< HEAD
        <a href="<%=request.getContextPath()%>/home.jsp" class="btn btn-ghost"
           style="text-decoration: none">
            ← Quay lại danh sách
        </a>
=======
        <a href="home.jsp" class="btn btn-ghost" style="text-decoration: none">← Quay lại danh sách</a>
>>>>>>> 7648003986068ddb52998a82abb4dfb3815cb194
    </div>
</main>

<footer class="site-footer">
    <div class="container footer-inner">
        <div class="brand-col">
            <div class="logo">Car Store</div>
<<<<<<< HEAD
            <p class="muted">Chợ ô tô tin cậy — Kết nối người mua & người bán</p>
=======
            <p class="muted">Chợ ô tô tin cậy — Kết nối người mua &amp; người bán</p>
>>>>>>> 7648003986068ddb52998a82abb4dfb3815cb194
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
<<<<<<< HEAD
        <div class="container">
            © 2025 AutoSieuLuot. Bản quyền thuộc về AutoSieuLuot.
        </div>
    </div>
</footer>

<script src="<%=request.getContextPath()%>/js/script.js"></script>

=======
        <div class="container">© 2025 Car Store. Bản quyền thuộc về Car Store.</div>
    </div>
</footer>
<script src="js/script.js"></script>
<script>
    const totalImages = document.querySelectorAll('.gallery-thumb').length;
    const mainImg    = document.getElementById('galleryMainImg');
    const badge      = document.getElementById('galleryBadge');

    function switchImage(thumbEl) {
        const newSrc = thumbEl.dataset.src;
        const idx    = parseInt(thumbEl.dataset.index);

        // Fade out → đổi src → fade in
        mainImg.classList.add('fade');
        setTimeout(() => {
            mainImg.src = newSrc;
            mainImg.classList.remove('fade');
        }, 200);

        // Cập nhật badge "X / N"
        if (badge) badge.textContent = (idx + 1) + ' / ' + totalImages;

        // Cập nhật viền active trên thumbnail
        document.querySelectorAll('.gallery-thumb').forEach(t => t.classList.remove('active'));
        thumbEl.classList.add('active');

        // Cuộn thumbnail đang chọn vào giữa nếu bị khuất
        thumbEl.scrollIntoView({ behavior: 'smooth', block: 'nearest', inline: 'center' });
    }
</script>
>>>>>>> 7648003986068ddb52998a82abb4dfb3815cb194
</body>
</html>