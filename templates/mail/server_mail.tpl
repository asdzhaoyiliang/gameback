<table class="itable itable-color">
    <tr >
        <td>邮件标题</td>
        <td><input type="text" value="系统邮件" style="width:200px;" name="title" /></td>
    </tr>

    <tr>
        <td>邮件内容</td>
        <td><textarea style="width:600px;height:150px;" name="content"></textarea></td>
    </tr>

    <tr style="display:none">
        <td>赠送条件: 等级≥</td>
        <td><input type="text" value="0" name="limit_level" nblur="checknum(this)"/></td>
    </tr>
    <tr>
        <td>金钱数量</td>
        <td>
            <{foreach from=$moneyType item=item key=key}>
            &nbsp;&nbsp;<{$item}> x <input type="text" id="<{$key}>" maxlength="7" style="width:60px;" onblur="checknum(this)"/>
            <{/foreach}>
        </td>
    </tr>

    <tr>
        <td>道具</td>
        <td>
            <table style="width:700px;"><tr><td>
                <table style="width:350px;">
                    <thead>
                        <tr>
                            <td width="50%">名称</td>
                            <td width="25%">数量</td>
                            <td width="25%">状态</td>
                        </tr>
                    </thead>
                    <tbody id="daoju">
                    </tbody>
                </table>
            </td><td>
            </td></tr></table>
        </td>
    </tr>

    <tr>
        <td>选择服务器</td>
        <td><{$server}></td>
    </tr>

    <tr>
        <td> </td>
        <td><button class="gbutton" onclick="send(this)">发送</button></td>
    </tr>
</table>


<script type="text/javascript">
    $(document).ready(function(){
        $.post("admin.php?ctrl=mail&act=getItem",function(msg){
            var html='';
            html +='<tr>';
            html +='<td><select name="item_name[]" class="items">';
            html +='<option value="">--请选择--</option>';
            $.each(msg,function(key,val){
                html += '<option value="'+val.item_id+'|'+val.item_name+'">'+val.item_id+'|'+val.item_name+'</option>';
            })
            html +='</select></td>';
            html +='<td><input size="10" name="item_num[]" style="ime-mode:disabled" onblur="checknum(this)"/></td>';
            html +=' <td><select name="bind[]"><option value="1">绑定</option><option value="0">非绑定</option></select></td>';
            html +='</tr>';
            $("#daoju").html(html+html+html);
        },'json')
    });

    function send(dom) {
        var data = {};

        var title = $('input[name="title"]').val();
        var content = $('textarea[name="content"]').val();
        var serverid = getServerId();
        var limit_level = $('input[name="limit_level"]').val();

        if(title == "")   {alert('邮件标题必须填写');return;}
        if(content == "") {alert('邮件内容必须填写'); return;}
        if(serverid == "") {alert('请选择服务器'); return;}
        if(limit_level == "") {alert('等级限制必须填写'); return;}

        data['title'] = title;
        data['content'] = content;
        data['serverid'] = serverid;
        data['limit_level'] = limit_level;
		
        if ($('#yuanbao').val() != "")     data['yuanbao'] = $('#yuanbao').val();
        if ($('#gold').val() != "")        data['gold'] = $('#gold').val();

        var item = new Array();
        var ok = true;
        var msg = '物品填写有错误';
        $('.items').each(function() {
            var tmp = new Array()
            var itemName = $(this).val()
            var num = parseInt($(this).parent().next().children().val())
            var status = $(this).parent().next().next().children().val();

            if (!itemName) return;
            if (!num)    {ok = false; msg = itemName + ' 数量不能为空'; return false;}
            if (!status) {ok = false;msg = itemName + ' 状态不能为空';return false;}

            tmp.push(itemName);
            tmp.push(num);
            tmp.push(status);
            item.push(tmp);
        })
        if (!ok) {alert(msg);return;}

        if (item.length)  data['item'] = item;

        $.post("admin.php?ctrl=mail&act=add_submit", {data: data}, function(msg) {
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