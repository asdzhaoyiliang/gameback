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
                    <th><{'区服ID'|t}></th>
                    <td><input type="text" value="<{$server.server_id}>" name="server_id" onkeyup="setApi(this.value)"/></td>
                </tr>
                <tr>
                    <th><{'合服ID'|t}></th>
                    <td><input type="text" value="<{$server.merge_id}>" name="merge_id" onkeyup="setApi(this.value)"/></td>
                </tr>
                <tr>
                    <th><{'名称'|t}></th>
                    <td>
                        <input type="text" value="<{$server.name}>" name="name"/>
                    </td>
                </tr>

                <tr>
                    <th><{'状态'|t}></th>
                    <td>
                        <select name="status">
                             <{foreach from = $serverStatus key = key item = item}>
                                <option value="<{$key}>" <{if $server.status == $key}>selected<{/if}> ><{$item}></option>
                            <{/foreach}>
                        </select>
                    </td>
                </tr>
                <tr>
                    <th><{'游戏版本'|t}></th>
                    <td>
                        <input type="text" value="<{$server.game_version}>" name="game_version"/>
                    </td>
                </tr>


                <tr>
                    <th><{'开服时间'|t}></th>
                    <td>
                        <input type="text" value="<{$server.open_time}>" name="open_time" class="datepicker"/>
                    </td>
                </tr>
                <tr>
                    <th><{'关服时间'|t}></th>
                    <td>
                        <input type="text" value="<{$server.close_time}>" name="close_time" class="datepicker"/>
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
        </td>

        <td valign="top">
            <{if $purview_database_setting == 1}>
                <h3>数据库</h3>
                <table class="itable itable-color">
                    <tr>
                        <th><{'mysql主机'|t}></th>
                        <td><input type="text" value="<{$server.mysql_host}>" name="mysql_host" onkeyup="setApi(this.value)"/></td>
                    </tr>


                    <tr>
                        <th><{'mysql端口'|t}></th>
                        <td>
                            <input type="text" value="<{$server.mysql_port}>" name="mysql_port"/>
                        </td>
                    </tr>
                    <tr>
                        <th><{'mysql用户名'|t}></th>
                        <td>
                            <input type="text" value="<{$server.mysql_user}>" name="mysql_user"/>
                        </td>
                    </tr>
                    <tr>
                        <th><{'mysql密码'|t}></th>
                        <td>
                            <input type="password" value="<{$server.mysql_passwd}>" name="mysql_passwd"/>
                        </td>
                    </tr>

                    <tr>
                        <th><{'actor 数据库名'|t}></th>
                        <td>
                            <input type="text" value="<{$server.actor_table}>" name="actor_table"/>
                        </td>
                    </tr>
                    <tr>
                        <th><{'log 数据库名'|t}></th>
                        <td>
                            <input type="text" value="<{$server.log_table}>" name="log_table"/>
                        </td>
                    </tr>
                </table>
            <{/if}>

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
