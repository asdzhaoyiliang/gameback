<style>
    .txt{margin-left:8px;margin-right:2px;}
</style>

<form method="post" id="benefit_edit_form" action="admin.php?ctrl=benefituser&act=submit&type=edit">
<table class="itable">
    <tr>
        <td width="50%" valign="top">
            <h3>基础信息</h3>
            <table class="itable itable-color">
                <input value="<{$benefit.id}>" name="id" style="display:none"/>

                <tr>
                    <th><{'福利id'|t}></th>
                    <td><input type="text" value="<{$benefit.benefit_id}>" name="benefit_id""/></td>
                </tr>
                <tr>
                    <th><{'玩家'|t}></th>
                    <td>
                        <textarea style="width:600px;height:200px;" name="users"></textarea>
                    </td>
                </tr>
                <tr>
                    <th><{'备注'|t}></th>
                    <td>
                        <input type="text" value="<{$benefit.reason}>" name="reason"/>
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
