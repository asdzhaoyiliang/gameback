<form method="post" id="form_user_edit" action="admin.php?ctrl=user&act=submit&type=add_user">
    <table class="itable">

        <tr>
            <td width="80px"></td>
            <td id="add_user_msg"></td>
            <td></td>
        </tr>

        <tr>
            <td><{'用户名'|t}>:</td>
             <td><input type="text" value="" name="username"/><font color="red">*</font></td>
            <td></td>
        </tr>

        <tr>
            <td><{'用户组'|t}>:</td>
            <td>
                <select name="groupid">
                    <option value=""><{'选择'|t}>...</option>
                    <{foreach from=$groupNames key=k item=n}>
                       <option value="<{$k}>"><{$n}></option>
                    <{/foreach}>
                </select><font color="red">*</font>
            </td>
            <td></td>
        </tr>

        <tr>
            <td><{'姓名'|t}>:</td>
            <td><input type="text"  name="name"/><font color="red">*</font></td>
            <td></td>
        </tr>

        <tr>
            <td><{'部门'|t}></td>
            <td><input type="text" name="department"/></td>
            <td></td>
        </tr>

        <tr>
            <td><{'电话'|t}></td>
            <td><input type="text" name="tel"/></td>
            <td></td>
        </tr>

        <tr>
            <td>Email</td>
            <td><input type="text" name="email"/></td>
            <td></td>
        </tr>

        <tr>
            <td><{'有效期至'|t}></td>
            <td><input type="text" name="expiration" class="datepicker" value="<{$expiration}>"/></td>
            <td></td>
        </tr>

        <tr>
            <td></td>
            <td>
                <input type="submit" class="gbutton" value="<{'提交'|t}>"/>
                <input type="reset" class="gbutton" value="<{'重置'|t}>"/>
            </td>
            <td></td>
        </tr>
    </table>
</form>

<script type="text/javascript">
$( ".datepicker" ).datepicker();
$('#form_user_edit').ajaxForm({
   complete: function(xhr) {
      var result = xhr.responseText;
      $('#form_user_edit reset').trigger('click');
      $.dialog.alert(result);
   }
});
</script>