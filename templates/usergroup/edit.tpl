<h3>
    <{if $usergroup.groupid}>
    修改用户组 - <{$usergroup.name}>
    <{else}><{'添加用户组'|t}><{/if}>
</h3>
<form id="usergroup_edit_form" method="post" action="admin.php?ctrl=usergroup&act=edit_submit">
<table id="usergroup_edit" class="itable itable-color">
    <tr>
        <th width="20%"><{'组名称'|t}>：</th>
        <td><input type="text" value="<{$usergroup.name}>" name="name"/></td>
    </tr>
    <tr>
        <th><{'描述/说明'|t}>：</th>
        <td><textarea type="text" name="description" style="width:300px;height:80px;"><{$usergroup.description}></textarea></td>
    </tr>
    
    <tr>
    <th><{'ip白名单'|t}>：</th>
    <td>
    <textarea type="text" name="allow_ip" style="width:200px;height:100px;"><{$usergroup.allow_ip_data_show}></textarea>
    <p style="display:block;width:280px;float:right;">
                <{'为空则任意ip均可访问'|t}><br/>
                <{'否则只允许白名单上的ip访问'|t}><br/>
                <{'每个ip使用换行隔开'|t}><br/>
		<!-- 支持规则: 单个ip: 192.168.1.1 <br>
		网段区间: 210.10.2.1-20 <br>
		整个网段: 222.34.4.* <br>
		多个ip: 10.10.10.[1|2|3|4] -->
    </p>
    </td></tr>
    <tr><td>复制权限</td>
    <td>
    <select name="copy_usergroup">
    
    </select>
    </td></tr>
    <tr><td></td>
    <td><input type="submit" class="gbutton" value="<{'提交'|t}>" name="submit" style="float:right;"/></td></tr>
</table>
<input type="hidden" name="groupid" value="<{$usergroup.groupid}>"/>
</form>
<script type="text/javascript">
$("select[name=copy_usergroup]").html($("#usergroup_select").html());
$('#usergroup_edit_form').ajaxForm({
    complete: function(xhr) {
        var msg =xhr.responseText;
        $.dialog.alert(msg);
        if(msg=='success'){$usergroup_tabs.tabs('load', 0);}
    }
});
</script>