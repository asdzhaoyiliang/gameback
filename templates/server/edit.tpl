<style>
    .txt{margin-left:8px;margin-right:2px;}
</style>

<form method="post" id="server_edit_form" action="admin.php?ctrl=server&act=submit&type=edit">
<table class="itable">
    <tr>
        <td width="50%" valign="top">
            <h3>基础信息</h3>
            <table class="itable itable-color">
                <input value="<{$server.id}>" name="id" style="display:none"/>
                <tr>
                    <th><{'服务器ID'|t}></th>
                    <td><input type="text" value="<{$server.server_id}>" name="server_id" onkeyup="setApi(this.value)"/></td>
                </tr>
                <tr>
                    <th><{'GroupID'|t}></th>
                    <td><input type="text" value="<{$server.group_id}>" name="group_id" onkeyup="setApi(this.value)"/></td>
                </tr>
                <tr>
                    <th><{'名称'|t}></th>
                    <td>
                        <input type="text" value="<{$server.name}>" name="name"/>
                    </td>
                </tr>


                <tr>
                    <th><{'服务器IP'|t}></th>
                    <td>
                        <input type="text" value="<{$server.server_ip}>" name="server_ip" />
                    </td>
                </tr>
                <tr>
                    <th><{'服务器端口'|t}></th>
                    <td>
                        <input type="text" value="<{$server.server_port}>" name="server_port" />
                    </td>
                </tr>
                <tr>
                    <th><{'渠道'|t}></th>
                    <td>
                        <select name="channel">
                                <option value=""> --请选择-- </option>
                            <{foreach from=$channel item=item}>
                                <option value="<{$item.flag}>" <{if $server.channel eq $item.flag}> selected = selected <{/if}> > <{$item.name}> </option>
                            <{/foreach}>
                        </select>

                    </td>
                </tr>
            </table>
            <input type="submit" class="gbutton" id="save" value="<{'保存'|t}>" />
        </td>


    </tr>
</table>
</form>


<script type="text/javascript">
 function setApi(ip) {
     $('#api').val("http://" + ip + '/hhsy/single/api.php')
 }

var timepickerlang =
{timeText: '<{'时间'|t}>',
    hourText: '<{'小时'|t}>',
    minuteText: '<{'分钟'|t}>',
    currentText: '<{'现在'|t}>',
    closeText: '<{'确定'|t}>'}
$('.datepicker').datetimepicker(timepickerlang);

$('#server_edit_form').ajaxForm({
	beforeSend: function() {
        var server_id = $('input[name="server_id"]').val();
        if(server_id == ""){
        	$.dialog.alert('服务器ID不能为空');
            return false;
        }
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
