var myPlan = function() {
	var mP = document.getElementById("mP");
	var wL = document.getElementById("wL");
	if(mP.style.display === 'none') {
		mP.style.display = 'block';
		wL.style.display = 'none';
	}
}
var wishList = function() {
	var mP = document.getElementById("mP");
	var wL = document.getElementById("wL");
	if(wL.style.display === 'none') {
		mP.style.display = 'none';
		wL.style.display = 'block';
	}
}