<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="dao.CarDAO, model.Car"%>

<%
    String carIdStr = request.getParameter("carId");
    Car car = null;

    if (carIdStr != null) {
        int carId = Integer.parseInt(carIdStr);
        CarDAO dao = new CarDAO();
        car = dao.getCarById(carId);
    }
%>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Đăng ký lái thử</title>
    <link rel="stylesheet" href="css/testDrive.css">
</head>
<body>

<%
    if (car != null) {
%>

<div class="test-drive-container">

    <h2>THÔNG TIN ĐĂNG KÝ LÁI THỬ</h2>

    <form action="<%=request.getContextPath()%>/RegisterTestDriveServlet" method="post">

        <div class="form-group">
            <label>Ngày hẹn <span>*</span></label> <input type="date"
                                                          name="date" required>
        </div>

        <div class="form-group">
            <label>Thời gian <span>*</span></label> <input type="time"
                                                           name="time" required>
        </div>

        <div class="form-group">
            <label>Họ tên <span>*</span></label> <input type="text"
                                                        name="fullname" placeholder="Nguyễn Văn A" required>
        </div>

        <div class="form-group">
            <label>Số điện thoại <span>*</span></label> <input type="text"
                                                               name="phone" placeholder="0123456789" required>
        </div>

        <div class="form-group">
            <label>Sản phẩm đăng ký <span>*</span></label> <input type="text"
                                                                  value="<%=car.getBrand()%> <%=car.getModel()%> <%=car.getYear()%>"
                                                                  readonly>
        </div>

        <input type="hidden" name="carId" value="<%=car.getId()%>"> <input
            type="hidden" name="carName"
            value="<%=car.getBrand()%> <%=car.getModel()%> <%=car.getYear()%>">

        <div class="form-actions">
            <button type="submit" class="btn-primary">Xác nhận đăng ký
            </button>
            <a href="home.jsp" class="btn-cancel">Hủy</a>
        </div>

    </form>

</div>

<%
} else {
%>
<p style="text-align: center; margin-top: 50px;">Không tìm thấy
    thông tin xe.</p>
<%
    }
%>

</body>
</html>
