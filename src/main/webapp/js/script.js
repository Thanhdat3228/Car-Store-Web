document.getElementById("buyBtn").addEventListener("click", function (){
    document.getElementById("modal").style.display="flex";
});


// đóng popup khi bấm nut X
document.getElementById("closeBtn").addEventListener("click", function (){
    document.getElementById("modal").style.display="none";
});

window.addEventListener("click", function (event){
    const modal=document.getElementById("modal");
    if(event.target===modal){
        modal.style.display="none";
    }
});
