<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@ include file="headerForAll.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <title>Lịch lái thử</title>
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/css/Styles.css">
</head>
<body>
<div class="test-drive-container">
    <h2>Lịch lái thử của tôi</h2>
    <div class="schedule-list">
        <c:forEach var="t" items="${myTestDrives}">

            <div class="schedule-card">

                <div class="schedule-header">
                    <h3>${t.carName}</h3>

                    <c:choose>
                        <c:when test="${t.status=='PENDING'}">
                            <span class="status pending">Chờ duyệt</span>
                        </c:when>

                        <c:when test="${t.status=='APPROVED'}">
                            <span class="status approved">Đã duyệt</span>
                        </c:when>

                        <c:otherwise>
                            <span class="status rejected">Từ chối</span>
                        </c:otherwise>
                    </c:choose>
                </div>

                <div class="schedule-body">

                    <p>
                        📅 <strong>Ngày:</strong>
                            ${t.testDate}
                    </p>

                    <p>
                        🕒 <strong>Giờ:</strong>
                            ${t.testTime}
                    </p>

                    <p>
                        🚗 <strong>Xe:</strong>
                            ${t.carName}
                    </p>

                </div>

            </div>

        </c:forEach>

    </div>
    <a href="index.jsp" class="back-link">&#8592; Quay về trang chủ</a>

</div>
<!-- Footer -->
<footer class="site-footer">
    <div class="container footer-inner">
        <div class="brand-col">
            <div class="logo">Car Store</div>
            <p class="muted">Chợ ô tô tin cậy — Kết nối người mua &amp; người bán</p>
        </div>
        <div class="links-col">
            <h4>Về chúng tôi</h4>
            <ul>
                <li><a href="gioi-thieu.jsp">Giới thiệu</a></li>
                <li><a href="#contact">Liên hệ</a></li>
            </ul>
        </div>
        <div class="contact-col">
            <h4>Hỗ trợ</h4>
            <p class="muted">Hotline: 1900 0000</p>
        </div>
    </div>
    <div class="footer-bottom">
        <div class="container">© 2025 AutoSieuLuot. Bản quyền thuộc về AutoSieuLuot.</div>
    </div>
</footer>
</body>
</html>