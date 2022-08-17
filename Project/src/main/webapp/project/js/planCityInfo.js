var click = document.querySelectorAll('.wishList');

function clickMenuHandler(){
	for (var i = 0; i < click.length; i++){
    click[i].classList.toggle('btn-active');
	}
}


for (var i = 0; i < click.length; i++){    /* 단점: 메뉴가 백만개라면....? 또한 addEventListener는 시스템 성능에 악영향을 끼친다고 함 */
    click[i].addEventListener('click', clickMenuHandler);        
};