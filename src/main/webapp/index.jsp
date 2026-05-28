
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib uri="jakarta.tags.core" prefix="c" %>
        <%@ taglib uri="jakarta.tags.fmt" prefix="fmt" %>
            <%@ taglib uri="jakarta.tags.functions" prefix="fn" %>

               

<%@ include file="headerForAll.jsp" %>
                <!DOCTYPE html>
                <html lang="vi">

                <head>
                    <meta charset="utf-8" />
                    <meta name="viewport" content="width=device-width,initial-scale=1" />
                    <title>Chợ ô tô</title>
                    <meta name="description" content="Chợ ô tô - Tìm, so sánh và mua xe nhanh chóng" />
                    <link rel="stylesheet" href="css/Styles.css" />
                    <link rel="stylesheet" href="css/Car_Card.css">
                    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;600;800&display=swap"
                        rel="stylesheet" />
                </head>

                <body>

                    <!-- Hero + Search -->
                    <section class="hero">
                        <div class="container hero-inner">
                            <div class="hero-content">
                                <h1>Tìm xe ưng ý — Nhanh chóng &amp; An tâm</h1>
                                <p>Hàng trăm tin đăng xe cũ và mới, thông tin minh bạch, hỗ trợ
                                    mua bán dễ dàng.</p>
                                <div class="hero-ctas">
                                    <a class="btn btn-white" href="home.jsp"
                                        style="background: transparent; border: 2px solid; color: yellow; text-decoration: none">Xem
                                        xe ngay</a> <a class="btn btn-white" href="sellCar.jsp"
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
                        <!-- Bộ lọc nâng cao -->
                        <aside class="filters">
                            <div class="card">
                                <h3>Bộ lọc</h3>

                                <form action="AdvancedFilterServlet" method="get">

                                    <!-- Hãng -->
                                    <label class="field-label">Hãng</label>
                                    <select name="brand">
                                        <option value="">Tất cả</option>
                                        <option value="Kia"
                                        ${param.brand == 'Kia' ? 'selected' : ''}>
                                            Kia
                                        </option>
                                        <option value="Honda"
                                        ${param.brand == 'Honda' ? 'selected' : ''}>
                                            Honda
                                        </option>
                                        <option value="Mazda"
                                        ${param.brand == 'Mazda' ? 'selected' : ''}>
                                            Mazda
                                        </option>
                                        <option value="Ford"
                                        ${param.brand == 'Ford' ? 'selected' : ''}>
                                            Ford
                                        </option>
                                        <option value="Mercedes"
                                        ${param.brand == 'Mercedes' ? 'selected' : ''}>
                                            Mercedes
                                        </option>
                                        <option value="Toyota"
                                        ${param.brand == 'Toyota' ? 'selected' : ''}>
                                            Toyota
                                        </option>
                                    </select>

                                    <!-- Năm -->
                                    <label class="field-label">Năm</label>
                                    <select name="year">
                                        <option value="">Tất cả</option>
                                        <option value="2022"
                                        ${param.year == '2022' ? 'selected' : ''}>
                                            2022
                                        </option>
                                        <option value="2021"
                                        ${param.year == '2021' ? 'selected' : ''}>
                                            2021
                                        </option>
                                        <option value="2020"
                                        ${param.year == '2020' ? 'selected' : ''}>
                                            2020
                                        </option>
                                        <option value="2019"
                                        ${param.year == '2019' ? 'selected' : ''}>
                                            2019
                                        </option>
                                        <option value="2018"
                                        ${param.year == '2018' ? 'selected' : ''}>
                                            2018
                                        </option>
                                    </select>
                                    <!-- Giá -->
                                    <label class="field-label">Khoảng giá</label>
                                    <select name="price" >
                                        <option value="">Tất cả</option>
                                        <option value="under200"
                                        ${param.price == 'under200' ? 'selected' : ''}>
                                            Dưới 200 triệu
                                        </option>
                                        <option value="200to500"
                                        ${param.price == '200to500' ? 'selected' : ''}>
                                            200 triệu - 500 triệu
                                        </option>
                                        <option value="500to1b"
                                        ${param.price == '500to1b' ? 'selected' : ''}>
                                            500 triệu - 1 tỷ
                                        </option>
                                        <option value="over1b"
                                        ${param.price == 'over1b' ? 'selected' : ''}>
                                            Trên 1 tỷ
                                        </option>
                                    </select>
                                    <button type="submit" class="filter-btn">
                                        Lọc xe
                                    </button>
                                </form>
                            </div>
                        </aside>

                        <!-- Listing area -->
                        <section class="listings">
                            <div class="listings-header">
                                <div>
                                    <h2>Kết quả tìm kiếm</h2>
                                    <p class="muted">
                                        <c:choose>
                                            <c:when test="${not empty carList}">
                                                ${fn:length(carList)} xe tìm thấy
                                            </c:when>
                                            <c:otherwise>
                                                Không tìm thấy xe
                                            </c:otherwise>

                                        </c:choose>
                                    </p>
                                </div>

                                <form action="SortServlet" method="get">
                                    <div class="sort">
                                        <label>Sắp xếp</label> <select name="sort" onchange="this.form.submit()">
                                            <option value="" ${empty param.sort ? 'selected' : '' }>Mặc
                                                định</option>
                                            <option value="lowToHigh" ${param.sort=='lowToHigh' ? 'selected' : '' }>Thấp
                                                →
                                                Cao</option>
                                            <option value="highToLow" ${param.sort=='highToLow' ? 'selected' : '' }>Cao
                                                →
                                                Thấp</option>
                                        </select>
                                    </div>
                                </form>

                                <!-- Thanh Tim Kiem Xe -->
                                <form action="SearchCarServlet" method="get">
                                    <div class="keyword">
                                        <input type="text" name="keyword" placeholder="Nhập tên xe cần tìm..." />
                                        <button type="submit" class="search-btn">Tìm</button>
                                    </div>
                                </form>

                            </div>


                            <div class="grid-cards">
                                <c:forEach var="car" items="${carList}">
                                    <article class="card car-card">
                                        <a href="CarDetailServlet?id=${car.id}" class="card-link">
                                            <div class="card-media">
                                                <img src="${car.image}" alt="${car.brand} ${car.model}" />
                                                <button class="fav" aria-label="Yêu thích">♥</button>
                                            </div>
                                            <div class="card-body">
                                                <h4 class="card-title">${car.brand} ${car.model}</h4>
                                                <div class="card-info">
                                                    <span>📅 ${car.year}</span>
                                                    <span>🚗 ${car.mileage} km</span>
                                                    <span>👥 ${car.specs.seatCount} chỗ</span>
                                                    <span>⛽ ${car.specs.fuelType}</span>
                                                    <span>📍 ${car.location}</span>
                                                </div>
                                                    <div class="price">
                                                        <fmt:formatNumber value="${car.price}" type="number" groupingUsed="true" /> ₫
                                                    </div>
                                                <div class="card-footer">
                                                    <button class="btn btn-primary">Liên hệ</button>
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