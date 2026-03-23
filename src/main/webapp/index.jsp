<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c"%>
<%@ taglib uri="jakarta.tags.fmt" prefix="fmt"%>
<%@ taglib uri="jakarta.tags.functions" prefix="fn"%>

<c:if test="${empty carList}">
    <jsp:forward page="HomeServlet" />
</c:if>



<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width,initial-scale=1" />
    <title>Chợ ô tô</title>
    <meta name="description"
          content="Chợ ô tô - Tìm, so sánh và mua xe nhanh chóng" />
    <link rel="stylesheet" href="css/Styles.css" />
    <link
            href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;600;800&display=swap"
            rel="stylesheet" />
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

        <c:if test="${not empty sessionScope.user}">
            <div class="user-profile">
                <span class="greeting" style="color: white">Xin chào, <strong>${sessionScope.user}</strong></span>
                <a href="LogoutServlet" class="logout-btn"
                   style="color: purple; text-decoration: none">[Đăng xuất]</a>
            </div>
        </c:if>


    </div>




</header>

<!-- Hero + Search -->
<section class="hero">
    <div class="container hero-inner">
        <div class="hero-content">
            <h1>Tìm xe ưng ý — Nhanh chóng &amp; An tâm</h1>
            <p>Hàng trăm tin đăng xe cũ và mới, thông tin minh bạch, hỗ trợ
                mua bán dễ dàng.</p>
            <div class="hero-ctas">
                <a class="btn btn-white" href="#buy"
                   style="background: transparent; border: 2px solid; color: yellow; text-decoration: none">Xem
                    xe ngay</a> <a class="btn btn-white" href="sellCar.html"
                                   style="background: transparent; border: 2px solid; color: red; text-decoration: none">Đăng
                bán xe</a>
            </div>
        </div>

        <div class="hero-image">
            <img src="image/mecedes.jpg" alt="Mercedes" />
        </div>
    </div>
</section>



<!-- Main content -->
<main class="container main-grid" id="buy">
    <!-- Sidebar filters -->
    <aside class="filters">
        <div class="card">
            <h3>Bộ lọc</h3>

            <label class="field-label">Hãng</label> <select>
            <option value="">Tất cả</option>
            <option>Kia</option>
            <option>Honda</option>
            <option>Mazda</option>
            <option>Ford</option>
            <option>Mercedes</option>
            <option>Toyota</option>
        </select> <label class="field-label">Năm</label> <select>
            <option value="">Tất cả</option>
            <option>2022</option>
            <option>2021</option>
            <option>2020</option>
            <option>2019</option>
            <option>2018</option>
        </select> <label class="field-label">Nhiên liệu</label> <select>
            <option value="">Tất cả</option>
            <option>Petrol(Xăng)</option>
            <option>Diesel(Dầu)</option>
            <option>Electric(Điện)</option>
        </select> <label class="field-label">Khoảng giá</label> <select>
            <option value="">Tất cả</option>
            <option>Dưới 200 triệu</option>
            <option>200 triệu - 500 triệu</option>
            <option>500 triệu - 1 tỷ</option>
            <option>Trên 1 tỷ</option>
        </select>
        </div>
    </aside>

    <!-- Listing area -->
    <section class="listings">
        <div class="listings-header">
            <div>
                <h2>Kết quả tìm kiếm</h2>
                <p class="muted">${fn:length(carList)} xe tìm thấy</p>
            </div>

            <form action="SortServlet" method="get">
                <div class="sort">
                    <label>Sắp xếp</label> <select name="sort"
                                                   onchange="this.form.submit()">
                    <option value="" ${empty param.sort ? 'selected' : ''}>Mặc
                        định</option>
                    <option value="lowToHigh"
                    ${param.sort == 'lowToHigh' ? 'selected' : ''}>Thấp →
                        Cao</option>
                    <option value="highToLow"
                    ${param.sort == 'highToLow' ? 'selected' : ''}>Cao →
                        Thấp</option>
                </select>
                </div>
            </form>

            <!-- Thanh Tim Kiem Xe -->
            <form action="SearchCarServlet" method="get">
                <div class="keyword">
                    <input type="text" name="keyword"
                           placeholder="Nhập tên xe cần tìm..." />
                    <button type="submit">Tìm</button>
                </div>
            </form>

        </div>


        <div class="grid-cards">
            <c:forEach var="car" items="${carList}">
                <article class="card car-card">
                    <a href="CarDetailServlet?id=${car.id}"
                       style="text-decoration: none; color: inherit">
                        <div class="card-media">
                            <img src="${car.image}" alt="${car.brand}${car.model}" />
                            <button class="fav" aria-label="Yêu thích">♥</button>
                        </div>
                        <div class="card-body">
                            <h4>${car.brand} ${car.model}</h4>
                            <p class="muted">${car.year}• ${car.mileage} km</p>
                            <div class="card-footer">
                                <div class="price">
                                    <fmt:formatNumber value="${car.price}" type="number"
                                                      groupingUsed="true" />
                                    ₫
                                </div>
                                <div class="location">${car.location}</div>
                            </div>
                        </div>
                    </a>
                </article>
            </c:forEach>
        </div>
    </section>


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
                <li><a href="#about">Giới thiệu</a></li>
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
</body>
</html>