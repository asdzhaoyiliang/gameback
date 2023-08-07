<form method="post" id="form" action="admin.php?ctrl=channel&act=submit&type=add">
    <table class="itable itable-color">
        <tr>
            <th><{'标识'|t}></th>
            <td><input type="text" required value="<{$channel.flag}>" name="flag" <{if $channel.flag}>readonly<{/if}>/>
            </td>
        </tr>

        <tr>
          <th width="160px;"><{'名称'|t}></th>
          <td>
          <input type="text" required value="<{$channel.name}>" name="name"/>
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
        <td>渠道ID</td>
        <td>渠道标识</td>
        <td>渠道名称</td>
        <td>创角时间</td>
        <td>操作</td>
    </tr>
    <{foreach from=$channel item=item}>
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
        $.post('admin.php?ctrl=channel&act=submit',{id:id,type:'del'}, function(msg){
            if (msg)
                $.dialog.alert(msg)
            else
                $tabs.tabs( "load" , 0 )
        })
    }

</script>
