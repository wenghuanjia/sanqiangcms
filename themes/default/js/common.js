$(document).ready(function () {
	/*导航菜单*/
	$("#nav li").hover(function () {
		$(this).parent().find('.menucur').hide();
		$(this).find('.nav_menu').show();
	}, function () {
		$(this).find('.nav_menu').hide();

		$(this).parent().find('.menucur').show();
	});
	/*幻灯片效果*/
	$('.slideshow').smallslider({
		textPosition: 'top',
		textAlign: 'center',
		textSwitch: 2
	});
	$(".anli_list").click(function () {
		var sp = $(this).find("#sp").val();
		show("light");
		$("#con").html(sp);
	});
});
function height() {
	var height = $(document.body).outerHeight(true);
	$("#fade").css("height", height);
}
function show(tag) {
	var light = document.getElementById(tag);
	var fade = document.getElementById('fade');
	light.style.display = 'block';
	fade.style.display = 'block';
	height();
}
function hide(tag) {
	var light = document.getElementById(tag);
	var fade = document.getElementById('fade');
	light.style.display = 'none';
	fade.style.display = 'none';
}