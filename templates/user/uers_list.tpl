<table id="user_list" class="itable">
    <thead>
        <tr>
            <th><{'用户名'|t}></th>
            <th><{'姓名'|t}></th>
            <th><{'部门'|t}></th>
            <th><{'用户组'|t}></th>
            <th><{'创建时间'|t}></th>
            <th><{'最后登录时间'|t}></th>
            <th><{'最后登录ip'|t}></th>
            <th><{'过期时间'|t}></th>
            <th><{'email'|t}></th>
            <th><{'电话'|t}></th>
            <th><{'账号状态'|t}></th>
            <th><{'操作'|t}></th>
        </tr>
    </thead>
    <tbody>
        <{foreach from=$list item=item}>
            <tr>
                <td><{$item.username}></td>
                <td><{$item.name}></td>
                <td class="edit_department" id="<{$item.uid}>" field="department"><{$item.department}></td>
                <td class="edit_group" id="<{$item.uid}>" field="groupid"><{$item.groupname}></td>
                <td><{$item.created_format}></td>
                <td><{$item.last_login_time_format}></td>
                <td><{$item.last_login_ip}></td>
                <td><a uid="<{$item.uid}>" class="delay_account" href="javascript:void(0)" title="点击延长账号使用期限"><{$item.expiration_format}></td>
                <td class="edit" id="<{$item.uid}>" field="email"><{$item.email}></td>
                <td class="edit" id="<{$item.uid}>" field="tel"><{$item.tel}></td>
                <td><{$item.status_msg}></td>
                <td>
                    <{if $item.status <> $smarty.const.USER_STATUS_NORMAL }>
                        <a href="javascript:void(0)" onclick="forbid_user(<{$item.uid}>, 1)" title="封禁帐号"><font color="red"><{'解'|t}></font></a>
                    <{else}>
                        <a href="javascript:void(0)" onclick="forbid_user(<{$item.uid}>, 2)" title="解封帐号"><{'封'|t}></a>
                    <{/if}>
                    |
                    <a href="javascript:void(0)" onclick="del_user(<{$item.uid}>)" title="删除帐号"><{'删'|t}></a> |
                    <a href="javascript:void(0)" onclick="reset_password(<{$item.uid}>)" title="重置密码"><{'密'|t}></a> |
                    <a href="javascript:void(0)" onclick="clear_login_err('<{$item.username}>')" title="清空错误登录次数"><{'清'|t}></a>
                </td>
            </tr>
        <{/foreach}>
    </tbody>
</table>


<script type="text/javascript">
var tTable = $("#user_list").dataTable({
    "oLanguage": {
        "sUrl": "style/js/dt_cn.txt"
    },
    "aaSorting": [
        [ 3, "asc" ]
    ],
    "iDisplayLength":100,
    "sPaginationType": "full_numbers",
    "sDom": '<"top"lfp>rt<"bottom"ip><"clear">',

    "bFilter": true
});

//修改部门
$('.edit_department').editable("admin.php?ctrl=user&act=submit&type=alter_department", {
    indicator : "<img src='style/images/indicator.gif'>",
    height    : "15px",
    submit    : "<{'修改'|t}>",
    cancel    : "<{'取消'|t}>",
    tooltip   : "<{'点击修改'|t}>...",
    style  : "inherit"
});

//修改用户组
$('.edit_group').editable("admin.php?ctrl=user&act=submit&type=alter_userGrounp", {
    indicator : "<img src='style/images/indicator.gif'>",
    type   : 'select',
    data : <{$groupNames}>,
    height    : "15px",
    submit    : "<{'修改'|t}>",
    cancel    : "<{'取消'|t}>",
    tooltip   : "<{'点击修改'|t}>...",
    style  : "inherit"
});


//延长有限期
$('.delay_account').click(function(){
    var uid = $(this).attr('uid');
    var expiration_format = $(this).html();
    var th_is = $(this);
    $.ajax({
        type: "POST",
        url: "admin.php?ctrl=user&act=submit&type=delay_account",
        data: "uid="+uid+"&expiration_format="+expiration_format,
        timeout: 20000,
        error: function(){alert('error')},
        success: function(result){
            th_is.html(result);
        }
    });
});

//封禁&解封账号
function forbid_user(uid, status){
    if(confirm('<{'确定操作该账号?'|t}>')){
        $.ajax({
          type: "POST",
          url: "admin.php?ctrl=user&act=submit&type=ben_user",
          data: "value="+status+"&id="+uid,
          timeout: 20000,
          error: function(){alert('error')},
          success: function(result){
               $tabs.tabs('load', 0);
          }
        });
    }
}

//删除账号
function del_user(uid){
	if(confirm('<{'确定删除该账号?'|t}>')){
		$.ajax({
	      type: "POST",
	      url: "admin.php?ctrl=user&act=submit&type=delete_user",
	      data: "uid="+uid,
	      timeout: 20000,
	      error: function(){alert('error')},
	      success: function(result){
	    	   $tabs.tabs('load', 0); //重新加载列表
	      }
	    });
	}
}

//重置密码
function reset_password(uid){
    if(confirm('<{'确定重置密码?'|t}>')){
        $.ajax({
          type: "POST",
          url: "admin.php?ctrl=user&act=submit&type=reset_password",
          data: "uid="+uid,
          timeout: 20000,
          error: function(){alert('error')},
          success: function(result){
        	  $.dialog.alert(result);
          }
        });
    }
}

//清空错误登录次数
function clear_login_err(username){
    if(confirm('<{'确定清空错误登录次数?'|t}>')){
        $.ajax({
          type: "POST",
          url: "admin.php?ctrl=user&act=submit&type=clear_login_err",
          data: "username="+username,
          timeout: 20000,
          error: function(){alert('error')},
          success: function(result){
        	  $.dialog.alert(result);
          }
        });
    }
}
</script>