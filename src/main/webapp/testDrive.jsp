<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="dao.CarDAO, model.Car"%>
<%@ page import="dao.DBConnection"%>
<%@ page import="java.sql.Connection, java.sql.PreparedStatement, java.sql.ResultSet"%>
<%@ page import="java.time.LocalDate"%>

<%!
    private String htmlValue(Object value) {
        if (value == null) {
            return "";
        }

        return value.toString()
                .replace("&", "&amp;")
                .replace("\"", "&quot;")
                .replace("<", "&lt;")
                .replace(">", "&gt;");
    }
%>

<%
    String carIdStr = request.getParameter("carId");
    String error = request.getParameter("error");
    Car car = null;
    String loggedInUsername = (String) session.getAttribute("user");
    String loggedInPhone = (String) session.getAttribute("userPhone");

    if (carIdStr != null) {
        int carId = Integer.parseInt(carIdStr);
        CarDAO dao = new CarDAO();
        car = dao.getCarById(carId);
    }

    if ((loggedInPhone == null || loggedInPhone.trim().isEmpty())
            && loggedInUsername != null && !loggedInUsername.trim().isEmpty()) {
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement("SELECT phoneNumber FROM users WHERE username=?")) {
            ps.setString(1, loggedInUsername);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    loggedInPhone = rs.getString("phoneNumber");
                    session.setAttribute("userPhone", loggedInPhone);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
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

    <%
        if ("past".equals(error)) {
    %>
    <p class="form-error">Ngày hẹn và thời gian đăng ký không được ở quá khứ.</p>
    <%
        } else if ("true".equals(error)) {
    %>
    <p class="form-error">Không thể đăng ký lái thử. Vui lòng kiểm tra lại thông tin.</p>
    <%
        }
    %>

    <form action="<%=request.getContextPath()%>/RegisterTestDriveServlet" method="post">

        <div class="form-group">
            <label>Ngày hẹn <span>*</span></label> <input type="date"
                                                          id="testDate" name="date"
                                                          min="<%=LocalDate.now()%>" required>
            <small class="field-hint">Không thể chọn ngày trong quá khứ.</small>
        </div>

        <div class="form-group">
            <label>Thời gian <span>*</span></label> <input type="time"
                                                           id="testTime" name="time" required>
            <small class="field-hint">Nếu chọn hôm nay, thời gian phải lớn hơn thời điểm hiện tại.</small>
        </div>

        <div class="form-group">
            <label>Họ tên <span>*</span></label> <input type="text"
                                                        name="fullname" placeholder="Nguyễn Văn A"
                                                        value="<%=htmlValue(loggedInUsername)%>" required>
        </div>

        <div class="form-group">
            <label>Số điện thoại <span>*</span></label> <input type="text"
                                                               name="phone" placeholder="0123456789"
                                                               value="<%=htmlValue(loggedInPhone)%>" required>
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
            <a href="<%=request.getContextPath()%>/CarListServlet" class="btn-cancel">Hủy</a>
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

<script>
    const dateInput = document.getElementById('testDate');
    const timeInput = document.getElementById('testTime');

    if (dateInput && timeInput) {
        function pad(value) {
            return String(value).padStart(2, '0');
        }

        function todayString() {
            const now = new Date();
            return now.getFullYear() + '-' + pad(now.getMonth() + 1) + '-' + pad(now.getDate());
        }

        function nextAvailableTime() {
            const now = new Date();
            now.setSeconds(0, 0);
            now.setMinutes(now.getMinutes() + 1);
            return pad(now.getHours()) + ':' + pad(now.getMinutes());
        }

        function updateTimeLimit() {
            const today = todayString();
            dateInput.min = today;

            if (dateInput.value === today) {
                const minTime = nextAvailableTime();
                timeInput.min = minTime;

                if (timeInput.value && timeInput.value < minTime) {
                    timeInput.value = '';
                }
            } else {
                timeInput.removeAttribute('min');
            }
        }

        dateInput.addEventListener('change', updateTimeLimit);
        timeInput.addEventListener('focus', updateTimeLimit);
        document.querySelector('form').addEventListener('submit', function (event) {
            updateTimeLimit();

            if (!dateInput.checkValidity() || !timeInput.checkValidity()) {
                event.preventDefault();
                dateInput.reportValidity();
                timeInput.reportValidity();
            }
        });

        updateTimeLimit();
    }
</script>
</body>
</html>
