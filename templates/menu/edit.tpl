<form method="post" class="form_menu_edit" action="admin.php?ctrl=menu&act=submit&t=edit&type=<{$type}>">
    <table class="itable itable-color">

        <tr id="show_mid" style="<{if !$menu.mid}>display:none<{/if}>;">
            <td><{'菜单id'|t}></td>
            <td><input value="<{$menu.mid}>" name="mid" readonly="true"/></td>
        </tr>

        <tr>
            <td><{'菜单名称'|t}></td>
            <td><input type="text" value="<{$menu.name}>" name="name"/></td>
        </tr>

        <tr>
            <td><{'链接地址'|t}></td>
            <td><input class="width-middle" type="text" value="<{$menu.url}>" name="url" /></td>
        </tr>

        <tr>
            <td><{'上级菜单'|t}></td>
            <td>
                <select name="parent">
                    <option value=""><{'<根'|t}>></option>
                    <{foreach from=$menuRoot item=tmp}>
                    <option value="<{$tmp.mid}>"><{$tmp.name}></option>
                    <{/foreach}>
                </select>
            </td>
        </tr>

        <tr>
            <td><{'排序'|t}></td>
            <td><input type="text" value="<{$menu.weight}>" name="weight"/></td>
        </tr>

        <tr>
            <td><{'菜单图标'|t}></td>
            <td>
                <input class="width-middle" type="text" value="<{$menu.icon}>" name="icon"/>
                <img src="<{$menu.icon}>" alt="no icon"/>
            </td>
        </tr>

        <tr>
            <td><input type="hidden"  name="type" value="<{$type}>" /></td>
            <td><input type="submit" class="gbutton"  name="submit" value="<{'提交'|t}>" /></td>
        </tr>
    </table>
</form>

<script type="text/javascript">
    $('.form_menu_edit').ajaxForm({
        complete: function(xhr) {
            var mid = JSON.parse(xhr.responseText);
            if(mid > 0){
                if($('#show_mid input[name="mid"]').val()){
                    $.dialog.alert('<{'修改成功'|t}>');
                }else{
                    $('#show_mid input[name="mid"]').val(mid);
                    $('#show_mid').show();
                    $.dialog.alert('<{'添加成功'|t}>');
                }
            }else if(mid == '-1'){
                $.dialog.alert('<{'操作失败失败'|t}>');
            }else{
                $.dialog.alert('<{'未知错误'|t}>');
            }
        }
    });
</script>