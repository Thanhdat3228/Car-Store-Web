document.getElementById("buyBtn").addEventListener("click", function (){
    document.getElementById("modal").style.display="block";
});

// đóng popup khi bấm nut X
document.getElementById("closeBtn").addEventListener("click", function (){
    document.getElementById("modal").style.display="none";
});

//chuyen sang trang form chi tiet
document.getElementById("goFormBtn").addEventListener("click", function (){
    window.location.href="/"
});
