$(function () {
	//header下拉菜单
	$('.select_a').hover(function () {
		$('.select_ul').slideDown();
	}, function () {
		setTimeout(function () {
			if (!$('.select_ul .select_nav .select_list>ul').hasClass('hover')) {
				$('.select_ul').slideUp();
			}
		}, 100);
	});
	$('.select_ul').hover(function () {
		$('.select_ul .select_nav .select_list>ul').addClass('hover');
	}, function () {
		$('.select_ul .select_nav .select_list>ul').removeClass();
		$('.select_ul').slideUp();
	});


	$('#list1').hover(function () {
		$('#slist1').slideDown();
	}, function () {
		setTimeout(function () {
			if (!$('#slist1').hasClass('hover')) {
				$('#slist1').slideUp();
			}
		}, 100);
	});
	$('#slist1').hover(function () {
		$('#slist1').addClass('hover');
	}, function () {
		$('#slist1').removeClass();
		$('#slist1').slideUp();
	});

	$('#list2').hover(function () {
		$('#slist2').slideDown();
	}, function () {
		setTimeout(function () {
			if (!$('#slist2').hasClass('hover')) {
				$('#slist2').slideUp();
			}
		}, 100);
	});
	$('#slist2').hover(function () {
		$('#slist2').addClass('hover');
	}, function () {
		$('#slist2').removeClass();
		$('#slist2').slideUp();
	});

	/*$('#list3').hover(function(){
		if($('#slist3').find('li')!=''){
			$('#slist3').slideDown();
		}
	},function(){
		setTimeout(function(){
			if(!$('#slist3').hasClass('hover')){
				$('#slist3').slideUp();
			}
		},100);
	});
	$('#slist3').hover(function(){
		$('#slist3').addClass('hover');
	},function(){
		$('#slist3').removeClass();
		$('#slist3').slideUp();
	});*/

	$('#list4').hover(function () {
		$('#slist4').slideDown();
	}, function () {
		setTimeout(function () {
			if (!$('#slist4').hasClass('hover')) {
				$('#slist4').slideUp();
			}
		}, 100);
	});
	$('#slist4').hover(function () {
		$('#slist4').addClass('hover');
	}, function () {
		$('#slist4').removeClass();
		$('#slist4').slideUp();
	});

	$('#list5').hover(function () {
		$('#slist5').slideDown();
	}, function () {
		setTimeout(function () {
			if (!$('#slist5').hasClass('hover')) {
				$('#slist5').slideUp();
			}
		}, 100);
	});
	$('#slist5').hover(function () {
		$('#slist5').addClass('hover');
	}, function () {
		$('#slist5').removeClass();
		$('#slist5').slideUp();
	});

	$('#list6').hover(function () {
		$('#slist6').slideDown();
	}, function () {
		setTimeout(function () {
			if (!$('#slist6').hasClass('hover')) {
				$('#slist6').slideUp();
			}
		}, 100);
	});
	$('#slist6').hover(function () {
		$('#slist6').addClass('hover');
	}, function () {
		$('#slist6').removeClass();
		$('#slist6').slideUp();
	});

	$('#list7').hover(function () {
		$('#slist7').slideDown();
	}, function () {
		setTimeout(function () {
			if (!$('#slist7').hasClass('hover')) {
				$('#slist7').slideUp();
			}
		}, 100);
	});
	$('#slist7').hover(function () {
		$('#slist7').addClass('hover');
	}, function () {
		$('#slist7').removeClass();
		$('#slist7').slideUp();
	});


	$('.select_ul li').mouseover(function () {
		$(this).css('text-decoration', 'underline');
	});
	$('.select_ul li').mouseleave(function () {
		$(this).css('text-decoration', 'none');
	});

	//更多产品服务按钮
	$('#img_btn').mouseover(function () {
		$('#img_btn').removeClass();
		$('#img_btn').addClass('img_btn_on');
	});
	$('#img_btn').mouseleave(function () {
		$('#img_btn').removeClass();
		$('#img_btn').addClass('img_btn');
	});

	//新闻图片切换
	$('#n_li1').click(function () {
		$('#ln1').removeClass();
		$('#ln2').removeClass();
		$('#ln3').removeClass();
		$('#ln1').addClass('lnews');
		$('#ln2').addClass('lnews_hide');
		$('#ln3').addClass('lnews_hide');
	});
	$('#n_li2').click(function () {
		$('#ln1').removeClass();
		$('#ln2').removeClass();
		$('#ln3').removeClass();
		$('#ln1').addClass('lnews_hide');
		$('#ln2').addClass('lnews');
		$('#ln3').addClass('lnews_hide');
	});
	$('#n_li3').click(function () {
		$('#ln1').removeClass();
		$('#ln2').removeClass();
		$('#ln3').removeClass();
		$('#ln1').addClass('lnews_hide');
		$('#ln2').addClass('lnews_hide');
		$('#ln3').addClass('lnews');
	});

	//联系我们检查
	$('input[name=name]').on('focus', function () {
		$('input[name=name]').next('span').html('');
	});
	$('input[name=phone]').on('focus', function () {
		$('input[name=phone]').next('span').html('');
	});
	$('input[name=content]').on('focus', function () {
		$('input[name=content]').next('span').html('');
	});
	$('form').submit(function () {
		if ($('input[name=name]').val() == '') {
			$('input[name=name]').next('span').html('姓名不能为空!');
			return false;
		} else if ($('input[name=phone]').val() == '') {
			$('input[name=phone]').next('span').html('电话不能为空!');
			return false;
		} else if ($('input[name=content]').val() == '') {
			$('input[name=content]').next('span').html('内容不能为空!');
			return false;
		}
	});
})