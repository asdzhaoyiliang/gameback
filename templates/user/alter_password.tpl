<style>
    .itable-color tr:hover{background:none}
</style>

<div class="itabs ui-tabs ui-widget ui-widget-content ui-corner-all">
    <table class="itable itable-color">
        <tr>
            <td width="70%">
                <form method="post" id="form_change_password" action="admin.php?ctrl=user&act=submit&type=alter_password">
                    <table class="itable">
                        <tr>
                            <td></td>
                            <td id="change_password_msg" style="color:red;"></td>
                        </tr>

                        <tr>
                            <td><{'旧密码'|t}>:</td>
                            <td><input type="password" value="" name="old_password"/>
                            <font color="red">*</font></td>
                        </tr>

                        <tr>
                            <td><{'新密码'|t}>:</td>
                            <td><input type="password" value="" name="password" id="password" onKeyUp="pwStrength(this.value);compare_password();" onBlur="pwStrength(this.value);" />
                                <font color="red">*</font>
                                <table style='display:inline; width:100px; font-size:12px;'>
                                  <tr align="center" >
                                  <td width="33%" id="strength_L" style="background:#eeeeee;"><{'弱'|t}></td>
                                  <td width="33%" id="strength_M" style="background:#eeeeee;"><{'中'|t}></td>
                                  <td width="33%" id="strength_H" style="background:#eeeeee;"><{'强'|t}></td>
                                  </tr>
                                </table>
                                <{'包含大小写字母、数字和特殊字符会让你的密码更安全'|t}>
                            </td>
                        </tr>

                        <tr>
                            <td><{'重复密码'|t}>:</td>
                            <td>
                                <input type="password" value="" name="password2" id="password2" onKeyUp="compare_password();"/>
                                <font color="red">*</font>
                                <span id="password_compare_same" style="display:none;"><{'密码匹配'|t}>：<font color="green"><{'是'|t}></font></span>
                                <span id="password_compare_diff" style="display:none;"><{'密码匹配'|t}>：<font color="red"><{'否'|t}></font></span>
                            </td>
                        </tr>
                        <tr>
                            <td></td>
                            <td><input type="submit" class="gbutton" value="<{'确认'|t}>" name="submit"/>
                            <input type="reset" value="reset" style="display:none;" id="reset"/>
                            </td>
                        </tr>
                    </table>
                </form>
            </td>

            <td>
                <p style="font-weight:bolder; color:red;"><{'注意'|t}>：</p>
                <p>1、<{'用户密码长度不得低于8位'|t}></p>
                <p>2、<{'至少每90天进行一次密码修改'|t}></p>
                <p>3、<{'密码须由同时包含数字和字母'|t}></p>
                <p>4、<{'不得使用最近5次使用过的密码'|t}></p>
            </td>
        </tr>
    </table>
</div>

<script type="text/javascript">
$('#form_change_password').ajaxForm({
	beforeSend: function() {
		$('#change_password_msg').html('');
		if($('input[name="password"]').val() != $('input[name="password2"]').val()){
			$('#change_password_msg').html('<{'两次输入密码不匹配'|t}>');
			return false;
		}
    },
    complete: function(xhr) {
    	var msg = xhr.responseText;
    	$('#reset').trigger('click');
    	if(msg == 'success'){
    		$('#notice_marquee').hide();
    		msg = '<{'修改成功'|t}>';
    	}
    	$('#change_password_msg').html(msg);
        $.dialog.alert(msg);
    }
});

</script>