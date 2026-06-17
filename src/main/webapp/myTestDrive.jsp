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
<!-- Footer -->
<%@ include file="footer.jsp" %>
</body>
</html>