<table id="usergroup_table" style="width:100%;">
  <tr>
    <td width="40%" valign="top">
        [<a href="javascript:void(0)" onclick="add_usergroup()"><{'添加'|t}></a>]
        <table id="usergroup_list" class="itable" style="text-align:left;margin-top:15px;">
            <tr>
                <th width="30%"><{'名称'|t}></th>
                <th width="30%"><{'描述'|t}></th>
                <th width="40%"><{'操作'|t}></th>
            </tr>
            <{foreach from=$groupList item=item}>
            <tr>
                <td><{$item.name}></td>
                <td><{$item.description}></td>
                <td><a href="javascript:void(0)" onclick="edit_usergroup(<{$item.groupid}>)"><{'编辑'|t}></a> | 
                <a href="javascript:void(0)" onclick="delete_usergroup(<{$item.groupid}>)"><{'删除'|t}></a></td>
            </tr>    
            <{/foreach}>
        </table>
    </td>
    <td id="usergroup_edit_content">
    </td>
  </tr>
</table>
<select style="display:none;" id="usergroup_select">
    <option value="">请选择..</option>
    <{foreach from=$groupList item=item}>
        <option value="<{$item.groupid}>"><{$item.name}></option>
    <{/foreach}>
</select>
<script type="text/javascript">
$('#usergroup_edit_content').load('admin.php?ctrl=usergroup&act=edit');
$('#usergroup_list tr:even').addClass('even');
$('#usergroup_list tr:odd').addClass('odd');
$("#usergroup_list tr").hover(
    function () {
       $(this).addClass("hover");
    },
    function () {
       $(this).removeClass("hover");
    }
);
function edit_usergroup(groupid){
	$('#usergroup_edit_content').load('admin.php?ctrl=usergroup&act=edit&groupid='+groupid);
}

function delete_usergroup(groupid){
	if(confirm('<{'确定删除用户组?'|t}>')){
        $.ajax({
            type: "POST",
            url: "admin.php?ctrl=usergroup&act=delete",
            data: 'groupid='+groupid,
            timeout: 20000,
	        error: function(){$.dialog.alert('<{'超时'|t}>');},
            success: function(result){
                if(result == 'success'){
                	$usergroup_tabs.tabs('load', 0);
                }else{
                    $.dialog.alert('<{'删除失败'|t}>');
                }
              
            }
        });
    }
}
function add_usergroup(){
    $('#usergroup_edit_content').load('admin.php?ctrl=usergroup&act=edit');
}
</script>