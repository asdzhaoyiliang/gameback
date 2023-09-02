<style>
    .txt{margin-left:8px;margin-right:2px;}
</style>

<form method="post" id="benefit_edit_form" action="admin.php?ctrl=benefit&act=submit&type=edit">
<table class="itable">
    <tr>
        <td width="50%" valign="top">
            <h3>基础信息</h3>
            <table class="itable itable-color">
                <input value="<{$benefit.benefit_id}>" name="benefit_id" style="display:none"/>

                <tr>
                    <th><{'福利名称'|t}></th>
                    <td><input type="text" value="<{$benefit.name}>" name="name""/></td>
                </tr>
                <tr>
                    <th><{'备注'|t}></th>
                    <td>
                        <input type="text" value="<{$benefit.reason}>" name="reason"/>
                    </td>
                </tr>


                <tr>
                    <th><{'首次福利邮件id'|t}></th>
                    <td>
                        <input type="text" value="<{$benefit.first_mail}>" name="first_mail" />
                    </td>
                </tr>
                <tr>
                    <th><{'固定福利邮件id'|t}></th>
                    <td>
                        <input type="text" value="<{$benefit.common_mail}>" name="common_mail" />
                    </td>
                </tr>
                <tr>
                    <th><{'周期类型'|t}></th>
                    <td>
                        <select name="cycle">
                            <option value=""> --请选择-- </option>
                            <option value="1"<{if $benefit.cycle eq 1}> selected = selected <{/if}>> 每日 </option>
                            <option value="2"<{if $benefit.cycle eq 2}> selected = selected <{/if}>> 每周 </option>
                            <option value="3"<{if $benefit.cycle eq 3}> selected = selected <{/if}>> 每月 </option>
                        </select>

                    </td>
                </tr>

                <tr>
                    <th><{'周期'|t}></th>
                    <td>
                        <input type="text" value="<{$benefit.day}>" name="day" />
                    </td>
                </tr>
                <tr>
                    <th><{'发放时间点'|t}></th>
                    <td>
                        <input type="text" value="<{$benefit.send_time}>" name="send_time" />
                    </td>
                </tr>

            </table>
            <input type="submit" class="gbutton" id="save" value="<{'保存'|t}>" />
        </td>


    </tr>
</table>
</form>


<script type="text/javascript">


$('#benefit_edit_form').ajaxForm({
	beforeSend: function() {

        $('#save').val("提交中...")
        $('#save').prop('disabled', true)
    },
    complete: function(xhr) {
        $('#save').val("保存")
        $('#save').prop('disabled', false)
        var msg = xhr.responseText;//JSON.parse();
        if (msg == 1)
            $tabs.tabs('select',0);
        else
            $.dialog.alert(msg);
    }
});
</script>
