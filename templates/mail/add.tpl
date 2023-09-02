<table class="itable itable-color">
    <tr>
        <td>邮件类型</td>
        <td>
            <select id="mail_id">
                <option value="9998">多语言邮件</option>
            </select>
        </td>
    </tr>

    <tr>
        <td>邮件原因</td>
        <td><textarea style="width:600px;height:20px;" name="reason"></textarea></td>
    </tr>

    <tr>
        <td>简体中文</td>
        <td>
            <span style="color: #ff0000;font-weight: bold">标题</span><br/>
            <textarea style="width:600px;height:20px;" name="title_1"></textarea><br/>
            <span style="color: #ff0000;font-weight: bold">内容</span><br/>
            <textarea style="width:600px;height:150px;" name="body_1"></textarea><br/>
        </td>
    </tr>

    <tr>
        <td>繁体中文</td>
        <td>
            <span style="color: #ff0000;font-weight: bold">标题</span><br/>
            <textarea style="width:600px;height:20px;" name="title_2"></textarea><br/>
            <span style="color: #ff0000;font-weight: bold">内容</span><br/>
            <textarea style="width:600px;height:150px;" name="body_2"></textarea><br/>
        </td>
    </tr>

    <tr>
        <td>英文</td>
        <td>
            <span style="color: #ff0000;font-weight: bold">标题</span><br/>
            <textarea style="width:600px;height:20px;" name="title_3"></textarea><br/>
            <span style="color: #ff0000;font-weight: bold">内容</span><br/>
            <textarea style="width:600px;height:150px;" name="body_3"></textarea><br/>
        </td>
    </tr>

    <tr>
        <td>收件人id</td>
        <td>
            <span style="color: #ff0000;font-weight: bold">多个角色ID时，请用英文逗号(,) 隔开，为空时发送给所有人</span><br/>
            <textarea style="width:600px;height:20px;" name="limit_role_guids"></textarea>
        </td>
    </tr>

    <tr>
        <th>开始时间</th>
        <td>
            <input type="text" name="start_time" class="datepicker"/>
        </td>
    </tr>
    <tr>
        <th>结束时间</th>
        <td>
            <input type="text" name="end_time" class="datepicker"/>
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
                html += '<option value="'+val.item_type+'|'+val.item_id+'|'+val.item_name+'">'+val.item_type+'|'+val.item_id+'|'+val.item_name+'</option>';
            })
            html +='</select></td>';
            html +='<td><input size="10" name="item_num[]" style="ime-mode:disabled" onblur="checknum(this)"/></td>';
            // html +=' <td><select name="bind[]"><option value="1">绑定</option><option value="0">非绑定</option></select></td>';
            html +='</tr>';
            $("#daoju").html(html+html+html);
        },'json')
    });

    var timepickerlang =
            {timeText: '<{'时间'|t}>',
            hourText: '<{'小时'|t}>',
            minuteText: '<{'分钟'|t}>',
            currentText: '<{'现在'|t}>',
            closeText: '<{'确定'|t}>'}
        $('.datepicker').datetimepicker(timepickerlang);


    function send(dom) {
        var data = {};
        data['type'] = 'language';

        var mail_id = $('#mail_id').val();
        var start_time = $('input[name="start_time"]').val();
        var end_time = $('input[name="end_time"]').val();
        // var title = $('input[name="title"]').val();
        var reason = $('textarea[name="reason"]').val();
        var limit_role_guids = $('textarea[name="limit_role_guids"]').val();
        // var content = $('textarea[name="content"]').val();
        var serverid = getServerId();
        var title1 = $('textarea[name="title_1"]').val();
        var body1 = $('textarea[name="body_1"]').val();
        var title2 = $('textarea[name="title_2"]').val();
        var body2 = $('textarea[name="body_2"]').val();
        var title3 = $('textarea[name="title_3"]').val();
        var body3 = $('textarea[name="body_3"]').val();

        if(reason == "") {alert('邮件原因必须填写'); return;}
        if(serverid == "") {alert('请选择服务器'); return;}

        var content = "language:1||"+title1+"||"+body1+"@2||"+title2+"||"+body2+"@3||"+title3+"||"+body3;
        data['mail_id'] = mail_id;
        data['start_time'] = start_time;
        data['end_time'] = end_time;
        data['reason'] = reason;
        data['content'] = content;
        data['serverid'] = serverid;
        data['limit_role_guids'] = limit_role_guids;

        var item = new Array();
        var ok = true;
        var msg = '物品填写有错误';
        $('.items').each(function() {
            var tmp = new Array()
            var itemName = $(this).val()
            var num = parseInt($(this).parent().next().children().val())

            if (!itemName) return;
            if (!num)    {ok = false; msg = itemName + ' 数量不能为空'; return false;}

                tmp.push(itemName);
            tmp.push(num);
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