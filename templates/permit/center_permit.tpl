<form class="permit_setting_form" method="post" action="admin.php?ctrl=permit&act=group_permit_save">
<table class="itable itable-color">
<thead>
    <tr>
        <th><{'中央后台权限'|t}>：</th>
        <td><label>
            <input type="checkbox" class="check_all" name="permit_all" value="all" <{if $usergroup.center_modules_data && 'all'|in_array:$usergroup.center_modules_data }>checked<{/if}>/><{'所有权限'|t}></label>
            (<font color="red"><{'如果勾选所有权限，则直接认为具有所有权限'|t}></font>)
        </td>
    </tr>
</thead>
<tbody>
    <{foreach from=$centerPermitList key=group item=item}>
    <tr>
        <th><label>
            &nbsp;&nbsp;<input type="checkbox" class="check_row check_cancle" <{if $usergroup.center_modules_data && 'all'|in_array:$usergroup.center_modules_data }>checked<{/if}>/>&nbsp;&nbsp;<{$group}>
        </label></th>
        <td>
        <{foreach from=$item key=name item=row}>
            <div style="width:160px;min-height:22px;float:left;font-size:12px;"><label>
            <input class="check_cancle" type="checkbox" name="permits[]" value="<{$row.pid}>" <{if ($usergroup.center_permit_data && $row.pid|in_array:$usergroup.center_permit_data) || ($usergroup.center_modules_data && "all"|in_array:$usergroup.center_modules_data)}>checked<{/if}>/>
            <{$name}></label></div>
        <{/foreach}>
        </td>
       </tr>
    <{/foreach}>
    <tr>
        <td><input type="hidden" name="groupid" value="<{$usergroup.groupid}>"/>
        <input type="hidden" name="type" value="center"/>
        </td>
        <td><input type="submit" class="gbutton" value="<{'提交'|t}>" name="submit" style="float:right;"/></td>
    </tr>
</tbody>
</table>
</form>