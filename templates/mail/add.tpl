<table class="itable itable-color">
    <tr>
        <td>
            <select class="condition" name="condition">
                <option value="1">角色ID</option>
                <option value="2">角色名字</option>
            </select>
        </td>
        <td>
            <span style="color: #ff0000;font-weight: bold">多个角色ID、角色名字、账号时，请用 英文逗号(,) 隔开</span><br/>
            <textarea name="rolelist" style="width: 600px; height: 150px"></textarea>
        </td>
    </tr>

    <{if $type == 'mail'}>
        <tr >
            <td>标题</td>
            <td><input type="text" value="系统邮件" style="width:200px;" name="title" /></td>
        </tr>
    <{/if}>

    <tr>
        <td>主要内容</td>
        <td><textarea style="width:600px;height:150px;" name="content"></textarea></td>
    </tr>

    <tr>
        <td>金钱数量</td>
        <td>
            <{foreach from=$moneyType item=item key=key}>
            &nbsp;&nbsp;<{$item}> x <input type="text" id="<{$key}>" name="<{$key}>"  maxlength="7" style="width:60px;" onblur="checknum(this)"/>
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
    data['type'] = '<{$type}>';

    var condition = $(".condition").children("option:selected").val();
    var rolelist = $('textarea[name="rolelist"]').val()
    var title = $('input[name="title"]').val();
    var content = $('textarea[name="content"]').val();
    var serverid = getServerId();
    // var duration = $('input[name="duration"]').val();

    if(rolelist == ""){alert( '角色ID必须填写');return;}
    if(title == "")   {alert('邮件标题必须填写');return;}
    if(content == "") {alert('邮件内容必须填写'); return;}
    if (!serverid)    {alert('请选择服务器'); return;}
    if (serverid == 999999999){alert('服务器选择有误'); return;}

    data['condition'] = condition;
    data['rolelist'] = rolelist;
    data['title'] = title;
    data['content'] = content;
    data['serverid'] = serverid;
   //  data['duration'] = duration;

    if ($('#yuanbao').val() != "") 	   data['yuanbao'] = $('#yuanbao').val();
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

    var i = layer.load()
    $(dom).prop('disabled', true)
    $.post("admin.php?ctrl=mail&act=add_submit", {data: data}, function(msg) {
        layer.close(i)
        $(dom).prop('disabled', false)
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