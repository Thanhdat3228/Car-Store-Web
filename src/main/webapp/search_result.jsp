<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Kết quả tìm kiếm</title>
</head>
<body>

<h2>Kết quả tìm kiếm</h2>
<p>${total} xe tìm thấy</p>

<div class="car-list">
    <c:forEach var="car" items="${cars}">
        <div class="car-card">
            <img src="${car.image}" alt="">
            <h3>${car.brand} ${car.model}</h3>
            <p>${car.year} • ${car.mileage} km</p>
            <p>${car.price} đ</p>
            <p>${car.location}</p>
        </div>
    </c:forEach>
</div>

</body>
</html>
