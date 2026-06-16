<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Quản lý danh mục - Admin Dashboard</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/admin/css/admin.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/admin/css/catalog.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
</head>
<body>
<!-- Sidebar -->
<aside class="sidebar">
    <div class="brand">CAR<span style="color:white">STORE</span></div>
    <ul class="nav-links">
        <li><a href="${pageContext.request.contextPath}/admin/cars" class="active"><i class="fas fa-car"></i> Quản lý kho xe</a></li>
        <li><a href="${pageContext.request.contextPath}/admin/test-drives"><i class="fas fa-calendar-check"></i>Lịch lái thử</a></li>
        <li><a href="${pageContext.request.contextPath}/admin/catalog"><i class="fa fa-tags"></i> Quản lý hãng xe</a>
        <li><a href="${pageContext.request.contextPath}/CarListServlet"><i class="fas fa-home"></i> Xem trang web</a></li>
        <li style="margin-top:auto"><a href="${pageContext.request.contextPath}/LogoutServlet"><i class="fas fa-sign-out-alt"></i> Đăng xuất</a></li>
    </ul>
</aside>
<main class="main-content">
    <header class="top-header">
        <div class="search-bar"></div>
        <div class="user-profile">
            <span>Admin User</span>
            <img src="https://ui-avatars.com/api/?name=Admin&background=4F46E5&color=fff" alt="Admin">
        </div>
    </header>
    <section class="page-content">
        <div class="page-header">
            <h1 class="page-title">Quản lý danh mục thông số</h1>
        </div>
        <c:if test="${not empty param.msg}">
            <div class="alert"><i class="fas fa-check-circle"></i> Cập nhật danh mục thành công!</div>
        </c:if>
        <!-- Tabs -->
        <div class="tab-bar">
            <button class="tab-btn active" onclick="switchTab('brands', this)"><i class="fas fa-industry"></i> Hãng xe
            </button>
            <button class="tab-btn" onclick="switchTab('models', this)"><i class="fas fa-car-side"></i> Dòng xe</button>
            <button class="tab-btn" onclick="switchTab('fuels', this)"><i class="fas fa-gas-pump"></i> Nhiên liệu
            </button>
            <button class="tab-btn" onclick="switchTab('wheels', this)"><i class="fas fa-circle-notch"></i> La-zăng
            </button>
        </div>
        <!-- Tab: Hãng xe -->
        <div id="tab-brands" class="tab-panel active">
            <div class="catalog-card">
                <h3>Danh sách hãng xe</h3>
                <form method="post" action="${pageContext.request.contextPath}/admin/catalog" class="inline-add-form">
                    <input type="hidden" name="action" value="addBrand">
                    <input type="text" name="brandName" placeholder="Tên hãng xe mới..." required>
                    <button type="submit" class="btn btn-primary"><i class="fas fa-plus"></i> Thêm</button>
                </form>
                <table>
                    <thead>
                    <tr>
                        <th>#</th>
                        <th>Tên hãng xe</th>
                        <th>Thao tác</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="b" items="${brands}" varStatus="s">
                        <tr>
                            <td>${s.index + 1}</td>
                            <td><strong>${b.name}</strong></td>
                            <td>
                                <form method="post" action="${pageContext.request.contextPath}/admin/catalog"
                                      onsubmit="return confirm('Xóa hãng này sẽ xóa tất cả dòng xe liên quan. Tiếp tục?')">
                                    <input type="hidden" name="action" value="deleteBrand">
                                    <input type="hidden" name="brandId" value="${b.id}">
                                    <button type="submit" class="btn btn-sm btn-danger"><i class="fas fa-trash"></i>
                                    </button>
                                </form>
                            </td>
                        </tr>
                    </c:forEach>
                    <c:if test="${empty brands}">
                        <tr>
                            <td colspan="3" class="empty-row">Chưa có hãng xe nào.</td>
                        </tr>
                    </c:if>
                    </tbody>
                </table>
            </div>
        </div>
        <!-- Tab: Dòng xe -->
        <div id="tab-models" class="tab-panel">
            <div class="catalog-card">
                <h3>Danh sách dòng xe</h3>
                <form method="post" action="${pageContext.request.contextPath}/admin/catalog" class="inline-add-form">
                    <input type="hidden" name="action" value="addModel">
                    <select name="brandId" required>
                        <option value="">-- Chọn hãng xe --</option>
                        <c:forEach var="b" items="${brands}">
                            <option value="${b.id}">${b.name}</option>
                        </c:forEach>
                    </select>
                    <input type="text" name="modelName" placeholder="Tên dòng xe mới..." required>
                    <button type="submit" class="btn btn-primary"><i class="fas fa-plus"></i> Thêm</button>
                </form>
                <table>
                    <thead>
                    <tr>
                        <th>#</th>
                        <th>Hãng xe</th>
                        <th>Dòng xe</th>
                        <th>Thao tác</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="m" items="${allModels}" varStatus="s">
                        <tr>
                            <td>${s.index + 1}</td>
                            <td>
                                <c:forEach var="b" items="${brands}">
                                    <c:if test="${b.id == m.brandId}">${b.name}</c:if>
                                </c:forEach>
                            </td>
                            <td>${m.modelName}</td>
                            <td>
                                <form method="post" action="${pageContext.request.contextPath}/admin/catalog"
                                      onsubmit="return confirm('Xóa dòng xe này?')">
                                    <input type="hidden" name="action" value="deleteModel">
                                    <input type="hidden" name="modelId" value="${m.id}">
                                    <button type="submit" class="btn btn-sm btn-danger"><i class="fas fa-trash"></i>
                                    </button>
                                </form>
                            </td>
                        </tr>
                    </c:forEach>
                    <c:if test="${empty allModels}">
                        <tr>
                            <td colspan="4" class="empty-row">Chưa có dòng xe nào.</td>
                        </tr>
                    </c:if>
                    </tbody>
                </table>
            </div>
        </div>
        <!-- Tab: Nhiên liệu -->
        <div id="tab-fuels" class="tab-panel">
            <div class="catalog-card">
                <h3>Loại nhiên liệu</h3>
                <form method="post" action="${pageContext.request.contextPath}/admin/catalog" class="inline-add-form">
                    <input type="hidden" name="action" value="addFuel">
                    <input type="text" name="fuelName" placeholder="Loại nhiên liệu mới..." required>
                    <button type="submit" class="btn btn-primary"><i class="fas fa-plus"></i> Thêm</button>
                </form>
                <table>
                    <thead>
                    <tr>
                        <th>#</th>
                        <th>Loại nhiên liệu</th>
                        <th>Thao tác</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="f" items="${fuelTypes}" varStatus="s">
                        <tr>
                            <td>${s.index + 1}</td>
                            <td>${f[1]}</td>
                            <td>
                                <form method="post" action="${pageContext.request.contextPath}/admin/catalog"
                                      onsubmit="return confirm('Xóa loại nhiên liệu này?')">
                                    <input type="hidden" name="action" value="deleteFuel">
                                    <input type="hidden" name="fuelId" value="${f[0]}">
                                    <button type="submit" class="btn btn-sm btn-danger"><i class="fas fa-trash"></i>
                                    </button>
                                </form>
                            </td>
                        </tr>
                    </c:forEach>
                    <c:if test="${empty fuelTypes}">
                        <tr>
                            <td colspan="3" class="empty-row">Chưa có loại nhiên liệu nào.</td>
                        </tr>
                    </c:if>
                    </tbody>
                </table>
            </div>
        </div>
        <!-- Tab: La-zăng -->
        <div id="tab-wheels" class="tab-panel">
            <div class="catalog-card">
                <h3>Kích thước la-zăng</h3>
                <form method="post" action="${pageContext.request.contextPath}/admin/catalog" class="inline-add-form">
                    <input type="hidden" name="action" value="addWheel">
                    <input type="text" name="wheelLabel" placeholder="Ví dụ: 23 inch..." required>
                    <button type="submit" class="btn btn-primary"><i class="fas fa-plus"></i> Thêm</button>
                </form>
                <table>
                    <thead>
                    <tr>
                        <th>#</th>
                        <th>Kích thước</th>
                        <th>Thao tác</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="w" items="${wheelSizes}" varStatus="s">
                        <tr>
                            <td>${s.index + 1}</td>
                            <td>${w[1]}</td>
                            <td>
                                <form method="post" action="${pageContext.request.contextPath}/admin/catalog"
                                      onsubmit="return confirm('Xóa kích thước la-zăng này?')">
                                    <input type="hidden" name="action" value="deleteWheel">
                                    <input type="hidden" name="wheelId" value="${w[0]}">
                                    <button type="submit" class="btn btn-sm btn-danger"><i class="fas fa-trash"></i>
                                    </button>
                                </form>
                            </td>
                        </tr>
                    </c:forEach>
                    <c:if test="${empty wheelSizes}">
                        <tr>
                            <td colspan="3" class="empty-row">Chưa có kích thước nào.</td>
                        </tr>
                    </c:if>
                    </tbody>
                </table>
            </div>
        </div>
    </section>
</main>
<script>
    function switchTab(name, btn) {
        document.querySelectorAll('.tab-panel').forEach(p => p.classList.remove('active'));
        document.querySelectorAll('.tab-btn').forEach(b => b.classList.remove('active'));
        document.getElementById('tab-' + name).classList.add('active');
        btn.classList.add('active');
    }
</script>
</body>
</html>