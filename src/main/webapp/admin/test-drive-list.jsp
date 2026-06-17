<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<link rel="stylesheet"
      href="${pageContext.request.contextPath}/admin/css/admin.css">
<link rel="stylesheet"
      href="${pageContext.request.contextPath}/admin/css/test-drive.css">
<link rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
<body>

<aside class="sidebar">
    <div class="brand">
        CAR<span style="color:white">STORE</span>
    </div>
    <ul class="nav-links">
        <li><a href="${pageContext.request.contextPath}/admin/cars" class="active"><i class="fas fa-car"></i> Quản lý kho xe</a></li>
        <li><a href="${pageContext.request.contextPath}/admin/test-drives"><i class="fas fa-calendar-check"></i>Lịch lái thử</a></li>
        <li><a href="${pageContext.request.contextPath}/admin/offers"><i class="fas fa-calendar-check"></i>Khách đề nghị giá</a></li>
        <li><a href="${pageContext.request.contextPath}/admin/catalog"><i class="fa fa-tags"></i> Quản lý hãng xe</a>
        <li><a href="${pageContext.request.contextPath}/CarListServlet"><i class="fas fa-home"></i> Xem trang web</a></li>
        <li style="margin-top:auto"><a href="${pageContext.request.contextPath}/LogoutServlet"><i class="fas fa-sign-out-alt"></i> Đăng xuất</a></li>
    </ul>
</aside>

<main class="main-content">
    <header class="top-header">

        <div></div>

        <div class="user-profile">
            <span>Admin User</span>
            <img src="https://ui-avatars.com/api/?name=Admin&background=4F46E5&color=fff">
        </div>
    </header>
    <section class="page-content">
        <div class="page-header">
            <h1 class="page-title">
                Danh sách đăng ký lái thử
            </h1>
        </div>
        <div class="table-container">
            <table>
                <thead>
                <tr>
                    <th>ID</th>
                    <th>Khách hàng</th>
                    <th>Số điện thoại</th>
                    <th>Xe đăng ký</th>
                    <th>Ngày lái thử</th>
                    <th>Giờ</th>
                    <th>Trạng thái</th>
                    <th>Thao tác</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="t" items="${testDrives}">
                    <tr>
                        <td>${t.id}</td>
                        <td>${t.fullName}</td>
                        <td>${t.phone}</td>
                        <td>${t.carName}</td>
                        <td>${t.testDate}</td>
                        <td>${t.testTime}</td>
                        <td>
                            <c:choose>
                                <c:when test="${t.status == 'PENDING'}">
                                <span class="status pending">
                                    Chờ duyệt
                                </span>
                                </c:when>
                                <c:when test="${t.status == 'APPROVED'}">
                                <span class="status approved">
                                    Đã duyệt
                                </span>
                                </c:when>
                                <c:otherwise>
                                <span class="status rejected">
                                    Từ chối
                                </span>
                                </c:otherwise>
                            </c:choose>
                        </td>
                        <td>
                            <c:if test="${t.status == 'PENDING'}">
                                <div class="actions">
                                    <a href="${pageContext.request.contextPath}/admin/approve-test-drive?id=${t.id}"
                                       class="btn btn-success btn-sm">
                                        <i class="fas fa-check"></i>
                                    </a>
                                    <a href="${pageContext.request.contextPath}/admin/reject-test-drive?id=${t.id}"
                                       class="btn btn-danger btn-sm">
                                        <i class="fas fa-times"></i>
                                    </a>
                                </div>
                            </c:if>
                        </td>
                    </tr>
                </c:forEach>
                <c:if test="${empty testDrives}">
                    <tr>
                        <td colspan="8"
                            style="text-align:center;padding:30px;">
                            Chưa có đăng ký lái thử nào
                        </td>
                    </tr>
                </c:if>
                </tbody>
            </table>
        </div>
    </section>
</main>
</body>
</html>