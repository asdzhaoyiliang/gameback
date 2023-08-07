<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
	<title><{$web_name|t}></title>

	<link href="style/images/favicon.ico" type="image/x-icon" rel="icon" />
	<link href="style/css/admin.css?ver=20130815" type="text/css" rel="stylesheet">

	<!-------引入jquery----->
	<script type="text/javascript" src="style/js/jquery-1.8.1.min.js"></script>
	<script type="text/javascript" src="style/js/jquery.cookie.js" defer></script>

	<!-------引入jquery ui和css样式----->
	<script type="text/javascript" src="style/js/jquery-ui-1.8.23.custom.min.js" defer></script>
	<link href="style/css/smoothness/jquery-ui-1.8.23.custom.css" type="text/css" rel="stylesheet">

	<!-- jquery-ui-timepicker-addon.js使日期选择精确到时间选择 -->
	<script type="text/javascript" src="style/js/jquery-ui-timepicker-addon.js" defer></script>
	<script type="text/javascript" src="style/js/jquery.ui.datepicker-zh-CN.js" defer></script>

	<!-- jquery.dataTables.min.js表格插件 -->
	<script type="text/javascript" src="style/js/jquery.dataTables.min.js" defer></script>
	<script type="text/javascript" src="style/js/dataTables.plugins.js" defer></script>

	<!-- jquery.jeditable.js可实现点击页面元素直接编辑 -->
	<script type="text/javascript" src="style/js/jquery.jeditable.js" defer></script>

	<!-- lhgdialog.min.js 实现弹出框效果-->
	<script type="text/javascript" src="style/js/dialog/lhgdialog.min.js?skin=<{if $smarty.cookies.skin}><{$smarty.cookies.skin}><{else}>skin4<{/if}>&self=true" defer></script>

	<!-- highcharts.js charts图表-->
	<script type="text/javascript" src="style/js/highcharts/highcharts.js"></script>
	<script type="text/javascript" src="style/js/highcharts/modules/exporting.js"></script>

	<!-- jquery.form.js 实现表单的ajax-->
	<script type="text/javascript" src="style/js/jquery.form.js" defer></script>
	<script type="text/javascript" src="style/js/common.js?ver=20130123" defer></script>

	<!-- Flash图形插件 -->
	<script type="text/javascript" src="style/js/FusionCharts.js" defer></script>
	<link href="style/css/demo_page.css" type="text/css" rel="stylesheet">
	<link href="style/css/demo_table.css" type="text/css" rel="stylesheet">

	<!--  弹层组件 -->
	<script type="text/javascript" src="style/layer/layer.min.js" defer></script>

	<!-- 提示信息插件 -->
	<script type="text/javascript" src="style/jquery.qtip.custom/jquery.qtip.min.js" defer></script>
	<link href="style/jquery.qtip.custom/jquery.qtip.min.css"  rel="stylesheet">

	<!-- 编辑器 -->
	<script type="text/javascript" src="style/editor/editor_config.js" defer ></script>
	<script type="text/javascript" src="style/editor/editor.js" defer ></script>

	<!-- skin放最后防止样式被覆盖 -->
	<link href="style/<{if $smarty.cookies.skin}><{$smarty.cookies.skin}><{else}>skin4<{/if}>/skin.css" type="text/css" rel="stylesheet">
</head>

<body>

<div id="container">
	<!-- header begin-->
	<div id="header">
		<div class="cl overflow" id="top">
			<a class="l mt10" id="logo" title="<{'首页'|t}>" href="/"></a>
			<div class="r mt30" id="user-nav" style="margin-right: 20px">
				<span><{'你好'|t}>  <{$_username}></span>
				<a class="ml10 logout" target="_top" href="<{$login_url}>"><{'退出'|t}></a>
			</div>
		</div>
		<div class="cl" id="nav">
			<div class="left">
				<a href="javascript:void(0)" id="togglemenu"><{'隐藏菜单'|t}></a>
				<a href="javascript:void(0)" id="allmenu"><{'功能地图'|t}></a>
			</div>
			<div id="skin" class="left">
				<ul id="skinlist">
					<li id="s1">
						<div <{if $smarty.cookies.skin == 'skin1'}>class="sel"<{/if}> style=" width:14px; height:14px;" title="绿"></div>
			</li>
			<li id="s2">
				<div <{if $smarty.cookies.skin == 'skin2'}>class="sel"<{/if}> style=" width:14px; height:14px;" title="蓝"></div>
		</li>
		<li id="s3">
			<div <{if $smarty.cookies.skin == 'skin3'}>class="sel"<{/if}> style=" width:14px; height:14px;" title="棕"></div>
	</li>
	<li id="s4">
		<div <{if $smarty.cookies.skin == 'skin4' || !$smarty.cookies.skin}>class="sel"<{/if}> style=" width:14px; height:14px;" title="灰"></div>
</li>
</ul>
</div>
<div class="right" style="width:625px;overflow:hidden">
	<{if $notice}>
	<marquee id="notice_marquee" onMouseOut="this.start()" onMouseOver="this.stop()" scrollamount="3">
		<{$notice}>
	</marquee>
	<{/if}>
</div>
</div>
</div>
<!-- header end-->

<!-- content begin-->
<div id="content">
	<div id="viewport-left">
		<div class="vl-box-1" id="analyse-basic">
			<div class="box-1-title"><{'- 全部收起'|t}></div>
			<{foreach from=$menuTree item=menu}>
			<div class="vl-box-2 no-line">
				<{if $menu.url != ''}>
				<div class="box-2-title top-menu-has-url click-menu" url="<{$menu.url}>" id="menu_taxonomy_<{$menu_sub.mid}>">
					<em class="menu-icon l">
						<img src="<{if $smarty.cookies.skin}><{$menu.icon|regex_replace:'/skin./':$smarty.cookies.skin}><{else}><{$menu.icon}><{/if}>" />
					</em>
					<span class="l"><{$menu.name|t}></span>
				</div>
				<{else}>
				<div class="box-2-title">
					<em class="menu-icon l">
						<img src="<{if $smarty.cookies.skin}><{$menu.icon|regex_replace:'/skin./':$smarty.cookies.skin}><{else}><{$menu.icon}><{/if}>" />
					</em>
					<span class="l"><{$menu.name|t}></span>
					<span class="arrow-up arrow-up-darkblue r" style="display: none;"></span>
				</div>
				<{/if}>
				<ul>
					<{foreach from=$menu.children item=menu_sub}>
					<li>
						<a class="click-menu" href="javascript:void(0)" url="<{if $menu_sub.url}><{$menu_sub.url}><{else}>test.php<{/if}>" id="menu_taxonomy_<{$menu_sub.mid}>">
							<{$menu_sub.name|t}>
						</a>
					</li>
					<{/foreach}>
				</ul>
			</div>
			<{/foreach}>
		</div>
	</div>
	<div id="main-content"></div>
</div>
<!-- content end-->
</div>
<!-- container end-->


<div style="clear: both;"></div>
<div id="footer"> </div>

<!-- 返回顶部 begin-->
<div id="top-back" onclick="goTop();"></div>
<!-- 返回顶部 end-->

<!-- 功能地图 being -->
<div id="opacity"></div>
<div class="none" id="function-map">
	<{foreach from=$menuTree item=i}>
	<li>
		<span class="map-tit" <{if $i.url != ''}>style="cursor:pointer" onclick="$('#menu_taxonomy_<{$i_sub.mid}>').click()"<{/if}>>
		<{$i.name|t}>
		</span>
		<{foreach from=$i.children item=i_sub}>
			<span class="map-con">
				<a class="map-menu" href="#" onclick="$('#menu_taxonomy_<{$i_sub.mid}>').click()" url="<{if $i_sub.url}><{$i_sub.url}><{else}>test.php<{/if}>" id="menu_taxonomy_<{$i_sub.mid}>"><{$i_sub.name|t}></a>
			</span>
		<{/foreach}>
	</li>
	<{/foreach}>
</div>
<!-- 功能地图 end -->

<!-- 页脚悬浮小工具 bgein -->
<div class="fixDiv">
	<span onclick="showFix()" title="<{'物品查询'|t}>">
		<img style="margin-top:4px; position:relative" src="style/images/alert.gif">
	</span>
	<span style="display:none;" id="fixInput">
		<input type="text" style="height:14px;line-height:14px;width:90px; position:relative;top:-2px;" id="scontent" size="10">
		<input type="button" onclick="searchId()" style="height:20px; font-size:12px; position:relative;top:-2px;" size="2" value="查询">
		<div id="search-result"></div>
	</span>
	<span onclick="colorPicker()" title="<{'颜色选择器'|t}>">
		<img style="margin-top:4px; position:relative" src="style/images/color.png" />
	</span>
	<span onclick="$('#allmenu').click();" title="<{'栏目导航'|t}>">
		<img style="margin-top:4px; position:relative" src="style/images/dh.png" />
	</span>
	<span onclick="calculator();" title="<{'计算器'|t}>">
		<img style="margin-top:4px; position:relative" src="style/images/calculator.gif" />
	</span>
</div>
<!-- 页脚悬浮小工具 end -->

<script type="text/javascript">
	$(document).ready(
			function(){
				document.onkeydown = function(){
					var oEvent = window.event;
					if(oEvent.altKey){
						if(oEvent.keyCode == 49){
							$('#togglemenu').click();
						}else if(oEvent.keyCode == 50){
							if($('#function-map').is(':visible')){
								$('#function-map').click();
							}else{
								$('#allmenu').click();
							}
						}else if(oEvent.keyCode == 51){
							var index = $('#skinlist').find('div.sel').parent().index() + 1;
							if(index == 4){
								index = 0;
							}
							$('#skinlist').find('li:eq('+index+')').click();
						}
					}
				}
			}
	);

	function showFix(){
		$('#fixInput').toggle();
	}

	function searchId(){
		$.ajax({
			type: "POST",
			url: "admin.php?ctrl=index&act=item_info",
			data: "content="+$('#scontent').val() ,
			timeout: 20000,
			error: function(){alert('error'); },
			success: function(html){
				$("#search-result").html(html);
			}
		});
	}

	function page_ajax(obj,warning_id){
		if(warning_id == '') return;
		$.ajax({
			"type" : "post",
			"url" : "admin.php?ctrl=warning&act=warning_alert",
			"async":false,
			"data": "warning_id="+warning_id,
			"timeout": 50000,
			"error": function(){str = '报警消息加载不上!';},
			"success" : function(html){
				str = html;
			}
		});
		$(obj).parent().parent().parent().html(str);
	}

	function turn_to(menu_id){
		$.cookie('selected_menu_id',menu_id);
		window.location.reload();
	}
</script>
</body>
</html>