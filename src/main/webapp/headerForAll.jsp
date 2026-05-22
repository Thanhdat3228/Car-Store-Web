<%@ page contentType="text/html;charset=UTF-8" language="java" %>



<header class="site-header">
  <div class="container">
    <div class="header-inner">

      <!-- Brand + Navigation -->
      <div class="brand">
        <div class="logo">Car Store</div>

        <nav class="nav">
          <a href="index.jsp">Trang chủ</a>
          <a href="home.jsp">Mua xe</a>
          <a href="sellCar.jsp">Đăng bán</a>
          <a href="gioi-thieu.jsp">Giới thiệu</a>
          <a href="news.jsp">Tin tức</a>
        </nav>
      </div>

      <c:if test="${not empty sessionScope.user}">
        <div class="user-profile">
                                    <span class="greeting" style="color: white">Xin chào,
                                        <strong>${sessionScope.user}</strong></span>
          <a href="LogoutServlet" class="logout-btn"
             style="color: purple; text-decoration: none">[Đăng xuất]</a>
        </div>
      </c:if>

    </div>
  </div>
</header>
