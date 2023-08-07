<form method="post" id="form" action="admin.php?ctrl=package&act=submit&type=add">
    <table class="itable itable-color">
        <tr>
            <th><{'包名'|t}></th>
            <td><input type="text" required value="<{$channel.flag}>" name="flag" <{if $package.flag}>readonly<{/if}>/>
            </td>
        </tr>

        <tr>
          <th width="160px;"><{'支付渠道'|t}></th>
          <td>
          <input type="text" required value="<{$channel.name}>" name="name"/> (0: 关闭充值 1: 苹果支付， 2： 爱贝支付)
          </td>
        </tr>
		
        <tr>
          <td></td>
          <td><input type="submit" class="gbutton"  value="<{'提交'|t}>" /></td>
        </tr>
      </table>
 </form>
<br/><br/>

<table  class="itable itable-color">
    <tr>
        <td>ID</td>
        <td>包名</td>
        <td>支付渠道</td>
        <td>创角时间</td>
        <td>操作</td>
    </tr>
    <{foreach from=$package item=item}>
    <tr>
        <td><{$item.id}></td>
        <td><{$item.flag}></td>
        <td><{$item.name}></td>
		<td><{$item.created_time}></td>
        <td>
            <a style="text-decoration: underline; cursor: pointer; color: #ff0000;" onclick="del(<{$item.id}>)" ">删除</a>
        </td>
    </tr>
    <{/foreach}>
</table>


<script type="text/javascript">
    $('#form').ajaxForm({
        complete: function(xhr) {
            var msg = xhr.responseText;//JSON.parse();
            if (msg)
                $.dialog.alert(msg)
            else
                $tabs.tabs( "load" , 0 )
        }
    });
    function del(id){
        $.post('admin.php?ctrl=package&act=submit',{id:id,type:'del'}, function(msg){
            if (msg)
                $.dialog.alert(msg)
            else
                $tabs.tabs( "load" , 0 )
        })
    }

</script>
