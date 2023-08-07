<table class="itable itable-color">
    <tr>
        <td style="width: 80px;">
            <select id="item_type">
                <option value="1">账号</option>
                <option value="2">角色名</option>
                <option value="3">角色ID</option>
            </select>
        </td>
        <td><input type="text" name="item_value" /></td>
    </tr>
    <tr>
        <td>GM等级：</td>
        <td>
            <select id="gm_level">
                <{section name=foo start=1 loop=11}>
                <option value="<{$smarty.section.foo.index}>"><{$smarty.section.foo.index}></option>
                <{/section}>
            </select>
        </td>
    </tr>

    <tr>
        <td>姓名：</td>
        <td><input type="text" name="real_name" /></td>
    </tr>
    <tr>
        <td>说明：</td>
        <td><input type="text" name="position" /></td>
    </tr>
    <tr>
        <td>选择服务器</td>
        <td><{$server}></td>
    </tr>
    <tr>
        <td> </td>
        <td><button class="gbutton" onclick="submit()">提交</button></td>
    </tr>
</table>


<script type="text/javascript">

    function submit() {
        var data = {};

        var item_type = $('#item_type').children('option:selected').val();
        var item_value = $('input[name="item_value"]').val();
        var real_name = $('input[name="real_name"]').val();
        var position = $('input[name="position"]').val();
        var gm_level = $('#gm_level').children('option:selected').val();
        var serverid = getServerId();

        if( item_value == "") { alert( '请填写账号/角色名称/角色ID'); return;}
        if (!serverid)        { alert('请选择服务器');  return;}

        data['item_type'] = item_type;
        data['item_value'] = item_value;
        data['gm_level'] = gm_level;
        data['serverid'] = serverid;

        if(real_name != '') data['real_name'] = real_name;
        if(position != '') data['position'] = position;

        $.post("admin.php?ctrl=insider&act=insider_add", {data: data}, function(msg) {
            if (msg == 'success') {
                $tabs.tabs('select', 1)
            }else{
                alert(msg)
            }
        })
    }

    function checknum(elem) {
        if (elem.value && elem.value != parseInt(elem.value))
            elem.value = ''
    }
</script>