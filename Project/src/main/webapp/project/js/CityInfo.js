var currentMenu;
var menuLinks = document.querySelectorAll('.menu-link');

function clickMenuHandler(){
    if (currentMenu){
        currentMenu.classList.remove('menu-active');  
    }   
    this.classList.add('menu-active');
    currentMenu = this;
}


for (var i = 0; i < menuLinks.length; i++){    /* 단점: 메뉴가 백만개라면....? 또한 addEventListener는 시스템 성능에 악영향을 끼친다고 함 */
    menuLinks[i].addEventListener('click', clickMenuHandler);        
}
