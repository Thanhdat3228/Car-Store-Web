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

// ── Profile dropdown ──
function toggleProfileMenu(e) {
    e.stopPropagation();
    var menu    = document.getElementById('profileMenu');
    var chevron = document.getElementById('profileChevron');
    var isOpen  = menu.classList.contains('open');
    menu.classList.toggle('open', !isOpen);
    chevron.style.transform = isOpen ? 'rotate(0deg)' : 'rotate(180deg)';
}

document.addEventListener('click', function () {
    var menu    = document.getElementById('profileMenu');
    var chevron = document.getElementById('profileChevron');
    if (menu)    menu.classList.remove('open');
    if (chevron) chevron.style.transform = 'rotate(0deg)';
});
