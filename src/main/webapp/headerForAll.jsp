    <%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@ taglib uri="jakarta.tags.core" prefix="c" %>
    <script src="js/script.js"></script>

    <header class="site-header">
      <div class="container">
        <div class="header-inner">

          <!-- Brand + Navigation -->
          <div class="brand">
            <div class="logo">Car Store</div>

            <nav class="nav">
              <a href="CarListServlet">Trang chủ</a>
              <a href="home.jsp">Mua xe</a>
              <a href="sellCar.jsp">Đăng bán</a>
              <a href="gioi-thieu.jsp">Giới thiệu</a>
              <a href="news.jsp">Tin tức</a>
            </nav>
          </div>

            <c:choose>
            <c:when test="${not empty sessionScope.user}">
                <div class="user-profile">

                        <%-- Nút Quản trị (chỉ hiện với Admin) --%>
                    <c:if test="${sessionScope.role eq 'admin'}">
                        <a href="${pageContext.request.contextPath}/admin/cars"
                           class="btn btn-white"
                           style="padding:4px 8px;font-size:12px;text-decoration:none;">
                            Quản trị
                        </a>
                    </c:if>

                        <%-- Nút Icon User + Dropdown --%>
                    <div class="profile-wrapper" id="profileWrapper">
                        <button class="profile-btn btn btn-ghost" id="profileBtn"
                                onclick="toggleProfileMenu(event)">
                            <span class="profile-icon">&#128100;</span>
                            <span class="profile-uname">${sessionScope.user}</span>
                            <span class="profile-chevron" id="profileChevron">&#9660;</span>
                        </button>

                            <%-- Dropdown --%>
                        <div class="profile-menu" id="profileMenu">
                            <div class="profile-menu-header">
                                <div class="profile-menu-avatar">&#128100;</div>
                                <div class="profile-menu-info">
                                    <div class="profile-menu-name">${sessionScope.user}</div>
                                    <div class="profile-menu-phone">${sessionScope.userPhone}</div>
                                </div>
                            </div>

                            <div class="profile-menu-divider"></div>

                            <a href="${pageContext.request.contextPath}/profile.jsp"
                               class="profile-menu-item">
                                <span class="profile-menu-icon">&#128203;</span>
                                <span>Xem hồ sơ</span>
                            </a>

                            <a href="${pageContext.request.contextPath}/favorites.jsp"
                               class="profile-menu-item">
                                <span class="profile-menu-icon">&#10084;</span>
                                <span>Xe yêu thích</span>
                            </a>
                            <a href="${pageContext.request.contextPath}/my-test-drives.jsp"
                               class="profile-menu-item">
                                <span class="profile-menu-icon">&#128663;</span>
                                <span>Lịch lái thử</span>
                            </a>
                        </div>
                    </div>

                        <%-- Nút Đăng xuất --%>
                    <a href="${pageContext.request.contextPath}/LogoutServlet"
                       class="btn logout-btn"
                       style="text-decoration:none;">Đăng xuất</a>

                </div>
            </c:when>
            <c:otherwise>
                <div class="header-actions" style="position:absolute;top:16px;right:20px;">
                    <a href="login.jsp" class="btn btn-ghost" style="text-decoration:none;">Đăng nhập</a>
                    <a href="register.jsp" class="btn btn-primary" style="text-decoration:none;">Đăng ký</a>
                </div>
            </c:otherwise>
            </c:choose>

        </div>
      </div>
    </header>