$(document).ready(function(){
	$('.top-menu-has-url').click(function(){
		$('#main-content').load($(this).attr('url'));
		$('em.menu-icon-point').remove();
		$('#viewport-left a').removeClass('selected');
		$(this).append('<em class="menu-icon-point"></em>');
		$.cookie('selected_menu_id', $(this).attr('id'));
	});
	$('#viewport-left a').click(function(){
		var title = $(this).html().replace(/<em\s*[^>]*>(.*?)<\/em>/ig,"");
		var oldtit = $('title').html().split(' - ');
		var oldtitname = oldtit[0];
		document.title = oldtitname+' - '+title;
		$('#main-content').html('Loading Page '+$(this).attr('url')+'   ...');
		$('#main-content').load($(this).attr('url'));
		$('#viewport-left a').removeClass('selected');
		$(this).addClass('selected');
		$('em.menu-icon-point').remove();
		$(this).append('<em class="menu-icon-point"></em>');
		//$("html,body").animate({scrollTop:"0px"},200);
		$.cookie('selected_menu_id', $(this).attr('id'));
	});
  
	$('.vl-box-1 .box-1-title').toggle(function() {
		$(this).parents('.vl-box-1').find('ul').slideUp();
		$(this).html('+全部展开');
	}, function() {
		$(this).parents('.vl-box-1').find('ul').slideDown();
		$(this).html('- 全部收起');
	});


	$('.vl-box-2 .box-2-title').on('mouseover', function() {
		$(this).find('.arrow-up').show();
	}).on('mouseout', function() {
		$(this).find('.arrow-up').hide();
	}).toggle(function() {
		$(this).find('.arrow-up').toggleClass('arrow-down-darkblue');
		$(this).parent().find('ul').slideToggle('fast');
	}, function() {
		$(this).parent().find('ul').slideToggle('fast');
		$(this).find('.arrow-up').toggleClass('arrow-down-darkblue');
	});


	$('.vl-box-2 .box-2-title .arrow-up').hide();
	$('#viewport-left ul').show();
	$('.arrow-up').addClass('arrow-down-darkblue');
  
	var selected_menu_id = $.cookie('selected_menu_id');
	if(selected_menu_id){
		$('#'+selected_menu_id).trigger('click');
	}else{
		$('#viewport-left .click-menu:first').trigger('click');
	}
	
	// 隐藏，显示菜单
	$('#togglemenu').click(function(){
		var t = $(this);
		var html = t.html();
		if(html == '隐藏菜单'){
			$('#viewport-left').hide()
			$('#main-content').width('100%');
			t.html('显示菜单');
		}else{
			$('#viewport-left').show()
			$('#main-content').width('84%');
			t.html('隐藏菜单');
		}
	});
	
	// 功能地图
	var fun_m = $('#function-map');
	$('#allmenu').click(function(){
		$('#opacity').addClass('opacity');
		var offset = fun_m.offset();
		var w = (document.body.clientWidth - fun_m.width())/2;
		fun_m.css('left',w+'px');
		fun_m.css('top','130px');
		fun_m.fadeIn();
	});
	fun_m.click(function(){
		$('#opacity').removeClass('opacity');
		fun_m.fadeOut();
	});
	
	// 更换皮肤
 	$("#skinlist>li").click(function(){
		 var adminskin = $(this).index() + 1;
		 var csshref = "style/skin"+adminskin+"/skin.css";
		 var dialogcss = "style/js/dialog/skins/skin"+adminskin+".css";
		 $.cookie('skin', 'skin'+adminskin, {expires : 2592000});
		 $("#skinlist>li").each(function(){$(this).children('div').attr('class', '')});
		 // 更换css
		 $('link').each(function(){
			 if($(this).attr('href').match(/skin.css$/)){
				 $(this).attr('href',csshref);
			 }
			 if($(this).attr('href').match(/dialog/)){
				 $(this).attr('href',dialogcss);
			 }			 
		 });
		 $(this).children('div').attr('class', 'sel');
		 $('em.menu-icon img').each(function(){
			var src = $(this).attr('src').replace(/\/skin.\//, '/skin'+adminskin+'/');
			$(this).attr('src', src);
		 });
	 });

});



var O_color="#eeeeee";   
var L_color="#FF0000";   
var M_color="#FF9900";   
var H_color="#33CC00";   
var Lcolor, Mcolor, Hcolor;
//显示颜色   
function pwStrength(pwd){
	if (pwd==null||pwd==''){   
		   Lcolor=Mcolor=Hcolor=O_color;   
	}else{
		if(pwd.length < 8){
			S_level = 1;
		}else{
			S_level=checkStrong(pwd);
		}
	   
		switch(S_level) {   
			case 0:   
			Lcolor=Mcolor=Hcolor=O_color;   
			case 1:   
			Lcolor=L_color;   
			Mcolor=Hcolor=O_color;   
			break;   
			case 2:   
			Lcolor=Mcolor=M_color;   
			Hcolor=O_color;   
			break;   
			default:   
			Lcolor=Mcolor=Hcolor=H_color;   
		}   
	}   
document.getElementById("strength_L").style.background=Lcolor;   
document.getElementById("strength_M").style.background=Mcolor;   
document.getElementById("strength_H").style.background=Hcolor;   
return;   
}
//返回强度级别
function checkStrong(sPW){   
	if (sPW.length<=4)   
	return 0; //密码太短   
	Modes=0;   
	for (i=0;i<sPW.length;i++){   
	//密码模式   
	Modes|=CharMode(sPW.charCodeAt(i));   
	}   
	return bitTotal(Modes);   
}
//bitTotal函数   
//计算密码模式   
function bitTotal(num){   
    modes=0;   
    for (i=0;i<4;i++){   
    if (num & 1) modes++;   
    num>>>=1;   
    }   
    return modes;   
}
//判断输入密码的类型   
function CharMode(iN){   
    if (iN>=48 && iN <=57) //数字   
        return 1;   
    if (iN>=65 && iN <=90) //大写   
        return 2;   
    if (iN>=97 && iN <=122) //小写   
        return 4;
    else   
        return 8;    
}

function compare_password(){
	var p1 = document.getElementById("password").value;
	var p2 = document.getElementById("password2").value;
	if(p1 == p2){
        $('#password_compare_same').show();
        $('#password_compare_diff').hide();
    }else{
    	$('#password_compare_same').hide();
        $('#password_compare_diff').show();
    }
}

function check_all(status, id){
    $('#'+id).find('input[type="checkbox"]').attr('checked', status);
}

function getCheckboxId(name){
    var checkboxs = document.getElementsByName(name);
    var str = '';
    for(var i = 0,len = checkboxs.length; i < len; i ++ ){
        if(checkboxs[i].checked == true)str += '&'+name+'[]=' + checkboxs[i].value;
    }
    return str;
}

function in_array(stringToSearch, arrayToSearch) {
	for (s = 0; s < arrayToSearch.length; s++) {
		thisEntry = arrayToSearch[s].toString();
		if (thisEntry == stringToSearch) {
			return true;
		}
	}
	return false;
}
$(window).load(function(){
    //点击返回顶部
    function topBack(){
        var sh = $(window).scrollTop();
        if(sh>100){
            $("#top-back").fadeIn();
        }else{
            $("#top-back").fadeOut();  
        }   
    }
    $(window).scroll(function(){
        topBack();  
    })
    $(window).resize(function(){
        topBack();  
    })  
});
function goTop(){
	$("html,body").animate({scrollTop:"0px"},200)
}
function colorPicker(){
	$.dialog({
		width: '320px',
		height: '320px',
		top: '10%',
		title : '颜色选择器',
		left: '99%',
		fixed: true,
		content: 'url:style/colorPicker/index.html'
	});
}
function calculator(){
    $.dialog({
        width: '320px',
        height: '320px',
        top: '10%',
        title : '计算器',
        left: '99%',
        fixed: true,
        content: 'url:style/calculator/index.html'
    });
}
/**
 * 获取所有代理列表
 * @param lang json 格式：{'all_agent':'<{"所有代理"|t}>', 'time_out':'<{"超时"|t}>'} 
 * @param area bool 是(ture)否(false,默认)限时大陆、海外
 */
function agentOption(lang, area, obj){
	var agentopt;
	if(typeof(obj) == 'undefined')
		agentopt = $('#agentopt');
	else agentopt = obj;
	
	var optstr = '<option value="all">'+lang.all_agent+'</option>';
	if(area){
		optstr += '<option value="mainland">'+lang.mainland+'</option>';
		optstr += '<option value="abroad">'+lang.abroad+'</option>';
	}
	$.ajax({
		"type" : "post",
		"url" : "admin.php?ctrl=server&act=agent_option",
		"timeout": 50000,
		"error": function(){
				$.dialog.alert(lang.time_out);
			},
		"success" : function(ret){
			agentopt.html(optstr+ret);
		},
		async:false
	});
}
/**
 * 根据代理获取服务器信息
 * @param lang json 格式：{'all_server':'<{"所有服务器"|t}>', 'time_out':'<{"超时"|t}>'} 
 */
function serverOption(agent, sync, lang, obj){
	var serveropt;
	if(typeof(obj) == 'undefined')
		serveropt = $('#serveropt');
	else serveropt = obj;
	
	var optstr = '<option value="all">'+lang.all_server+'</option>';
	if(agent != 'all'){
		$.ajax({
			"type" : "post",
			"url" : "admin.php?ctrl=server&act=server_option",
			"data": "agent="+agent+"&sync="+sync,
			"timeout": 50000,
			"error": function(){
					$.dialog.alert(lang.time_out);
				},
			"success" : function(ret){
				serveropt.html(optstr+ret);
			}
		});
	}else{
		serveropt.html(optstr);
	}
}

function randomChar(l) {
    var x="abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789.=+-~!@#$%^&*()_";
    var tmp="";
    for(var i=0;i< l;i++) {
        tmp += x.charAt(Math.ceil(Math.random()*100000000)%x.length);
    }
    return tmp;
}

function gotoRole(role_id) {
    $.cookie('jump_roleid', role_id)
    $('#menu_taxonomy_' + 139).click()
}

// UTF8字符集实际长度计算
function strlen(str){
    var realLength = 0;
    var len = str.length;
    var charCode = -1;
    for(var i = 0; i < len; i++){
        charCode = str.charCodeAt(i);
        if (charCode >= 0 && charCode <= 128) {
            realLength += 1;
        }else{
            // 如果是中文则长度加3
            realLength += 3;
        }
    }
    return realLength;
}

$(function() {
    $('body').on('mouseover', '.datetime', function() {
        $('.datetime').datetimepicker(
            {
                timeFormat: 'hh:mm:ss',
                showSecond: true,
                timeText: '时间',
                hourText: '小时',
                minuteText: '分钟',
                secondText: '秒钟',
                currentText: '现在',
                closeText: '确定'
            }
        )
    })

    $('body').on('mouseover', '.datetime_nosec', function() {
        $('.datetime_nosec').datetimepicker(
            {
                timeFormat: 'hh:mm',
                showSecond: false,
                timeText: '时间',
                hourText: '小时',
                minuteText: '分钟',
                secondText: '秒钟',
                currentText: '现在',
                closeText: '确定'
            }
        )
    })

    $('body').on('mouseover', '.date', function() {
        $(this).datepicker()
    })
})