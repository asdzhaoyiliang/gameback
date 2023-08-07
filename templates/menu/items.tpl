<style type="text/css">
	.sortable-list-sub-<{$type}>{margin:5px 12px 5px 0;}
	.sortable-list-sub-<{$type}> td{width:17%;}
	h3 a{font-size:12px;font-weight:normal;}
	a.tabledrag-handle{
		background: url("style/images/draggable.png") no-repeat scroll 6px 7px transparent;
		height: 13px;
		margin: -0.4em 0.5em;
		padding: 0.42em 0.5em;
		width: 13px;
		display:block;
		cursor:move;
	}
	a.tabledrag-handle:hover {background-position:  6px -13px;}
	ul.sortable-list-root-tree h3,ul.sortable-list-root-leaf h3{ height:24px; line-height:24px; border-bottom:solid 1px #BECBD6;}
	.oper-parent span.oper{margin-left:40px; display:none;}
	.oper-parent:hover span.oper{ display:inline;}
</style>

<ul class="sortable-list-root-<{$type}>">
	<{foreach from=$menuTree item=menu}>
	<li id="<{$menu.mid}>">
		<div id="menu_line_<{$menu.mid}>" class="oper-parent">
			<h3>
				<em class="menu-icon l"><img src="<{$menu.icon}>" /></em><{$menu.name|t}>
					<span class="oper">
						<a href="javascript:void(0)" onclick="menu_edit(<{$menu.mid}>)">[<{'编辑'|t}>]</a>&nbsp;&nbsp;
						<a href="javascript:void(0)" onclick="menu_delete(<{$menu.mid}>)">[<{'删除'|t}>]</a>
					</span>
			</h3>

			<ul class="sortable-list-sub-<{$type}>">
				<{foreach from=$menu.children item=menu_sub}>
				<li id="<{$menu_sub.mid}>">
					<table class="itable itable-color" id="menu_line_<{$menu_sub.mid}>">
						<tr>
							<td style="width:2%;"><a class="tabledrag-handle" href="#" title="<{'拖放重新排序'|t}>">&nbsp;</a></td>
							<td><{$menu_sub.mid}></td>
							<td class="edit" id="<{$menu_sub.mid}>" field="name"><{$menu_sub.name|t}></td>
							<td style="width:35%;" class="edit" id="<{$menu_sub.mid}>" field="url"><{$menu_sub.url}></td>
							<td id="<{$menu_sub.mid}>">
								<a href="javascript:void(0)" class="change_status" status="<{$menu_sub.status}>" title="<{'改变菜单状态'|t}>">
									<{if $menu_sub.status == $smarty.const.MENU_STATUS_SHOW}>
									<{'显示'|t}>
									<{else}>
									<font color="red"><{'隐藏'|t}></font>
									<{/if}>
								</a>
							</td>
							<td><a href="javascript:void(0)" onclick="menu_delete(<{$menu_sub.mid}>)"><{'点击删除'|t}></a></td>
						</tr>
					</table>
				</li>
				<{/foreach}>
			</ul>
		</div>
	</li>
	<{/foreach}>
<ul>
<br/>
<input type="button" class="gbutton" id="save_menus_<{$type}>" value="<{'保存'|t}>"/>


<script type="text/javascript">

	$('.sortable-list-root-<{$type}>').sortable();
	$('.sortable-list-sub-<{$type}>').sortable({
		connectWith: ".sortable-list-sub-<{$type}>"
	}).enableSelection();

	//删除菜单
	function menu_delete(mid){
		$.dialog.confirm('<{'确定删除菜单?'|t}>', function(){
			$.ajax({
				type: "POST",
				url: "admin.php?ctrl=menu&act=submit&t=del",
				data: 'mid='+mid,
				timeout: 20000,
				error: function(){$.dialog.alert('<{'超时'|t}>');},
				success: function(result){
					if(result == 'success'){
						$.dialog.tips('<{'删除成功'|t}>');
						$('#menu_line_'+mid).remove();
					}else{
						$.dialog.alert('<{'删除失败'|t}>');
					}

				}
			});
		}, function(){
			$.dialog.tips('<{'取消操作'|t}>');
		});
	}

	//保存菜单排序
	$('#save_menus_<{$type}>').click(function(){
		var menu_root_ids;
		var menu_sub_ids = new Array();
		$('.sortable-list-root-<{$type}>').each(function(){
			menu_root_ids = $(this).sortable('toArray')
		});
		$('.sortable-list-sub-<{$type}>').each(function(){
			menu_sub_ids.push($(this).sortable('toArray'));
		});
		$.ajax({
			type: "POST",
			url: "admin.php?ctrl=menu&act=submit&t=save_weight&type=<{$type}>",
			data: 'menu_root_ids='+menu_root_ids+'&menu_sub_ids='+menu_sub_ids.join('|'),
			timeout: 20000,
			error: function(){alert('error')},
			success: function(result){
				if(result == 1) alert('<{'修改成功'|t}>');
			}
		});
	});

	$('.edit').editable("admin.php?ctrl=menu&act=submit&t=save_field", {
		indicator : "<img src='style/images/indicator.gif'>",
		height    : "15px",
		submit    : "<{'修改'|t}>",
		cancel    : "<{'取消'|t}>",
		tooltip   : "<{'点击修改'|t}>...",
		style  : "inherit"
	});

	//改变菜单状态：显示或隐藏
	$('.change_status').click(function(){
		var $this = $(this);
		var id = $(this).parent().attr('id');
		var value = $(this).attr('status')==1? 2: 1;
		$.ajax({
			type: "POST",
			url: "admin.php?ctrl=menu&act=submit&t=save_field",
			data: 'id='+id+'&field=status'+'&value='+value,
			timeout: 20000,
			error: function(){alert('error');},
			success: function(result){
				$this.attr('status', result);
				if(result == '1'){
					$this.html('<{'显示'|t}>');
				}
				if(result == '2'){
					$this.html('<font color="red"><{'隐藏'|t}></font>');
				}
			}
		});
	});

	//点击编辑时跳换到添加菜单
	function menu_edit(mid){
		$menu_tabs_<{$type}>.tabs( "url" , 1 , "admin.php?ctrl=menu&act=edit&mid="+mid );
		$menu_tabs_<{$type}>.tabs( "select" , 1 );
	}
</script>