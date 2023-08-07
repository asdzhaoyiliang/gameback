<table class="itable itable-color">
    <tr>
        <th colspan="11" style="text-align: center;">批列表</th>
    </tr>
    <tr>
        <td>批号</td>
        <td>批名</td>
        <td>道具ID</td>
        <td>同批号使用限制</td>
        <td>使用次数</td>
        <td>有效时间</td>
        <td>服务器</td>
        <td>描述</td>
        <td>互斥组</td>
        <td>操作</td>
        <td>卡号</td>
    </tr>

    <{foreach from=$batch item=item}>
    <tr>
        <td><{$item.id}></td>
        <td><{$item.name}></td>
        <td><{$item.item_id}></td>
        <td><{$item.limit_pi}></td>
        <td><{$item.limit_times}></td>
        <td><{$item.stime}> - <{$item.etime}></td>
        <td>
            <{if $item.serverid==999999999}>
            全服
            <{else}>
                <{$item.serverid}>
            <{/if}>
        </td>
        <td><{$item.des}></td>
        <td><{$item.mutex}></td>
        <td onclick="del(<{$item.id}>)"><a style="text-decoration: solid; color: #ff0000; cursor: pointer;">删除</a></td>
        <td onclick="delcard(<{$item.id}>)"><a style="text-decoration: solid; color: #ff0000; cursor: pointer;">删卡</a></td>
    </tr>
    <{/foreach}>
</table>
<br/><br/>
<form method="post" id="form_submit" action="admin.php?ctrl=cdkey&act=submit&type=pi_add">
<table class="itable itable-color">
    <tr>
        <th colspan="2" style="text-align: center;">增加批</th>
    </tr>
    <tr>
        <td width="100px">批名：</td>
        <td><input type="text" name="name" value="" ><span style="color:red;">*</span></td>
    </tr>
    <tr>
        <td width="100px">礼包内容: (一行一个奖励:  类型，ID,数量,绑定)</td>
        <td><textarea style="width: 400px;height: 100px;" name="item_id"/><br>
            类型:   物品: 0  绑元:  5 元宝: 10  <br>
        </td>

    </tr>
    <tr>
        <td>同批号使用限制：</td>
        <td><input type="text" name="limit_pi" value="" onblur="checknum(this)"> <span style="color: red;">*</span></td>
    </tr>
    <tr>
        <td>使用次数<br/>(单码使用限制)：</td>
        <td><input type="text" name="limit_times" value="" onblur="checknum(this)"> <span style="color: red;">*</span></td>
    </tr>


    <tr>
        <td>有效时间：</td>
        <td>
            开始时间：<input type="text" name="stime" class="datetimepicker" value="<{$expiration}>"/><br/>
            结束时间：<input type="text" name="etime" class="datetimepicker" value="<{$expiration}>"/>
        </td>
    </tr>

    <tr>
        <td>选择服务器</td>
        <td>
            <input type="checkbox"  name="allServer" value="999999999" >全服
            <br/>--------------------------------- <span style="color: red;">*</span><br/>
            <{$server}>
        </td>
    </tr>

    <tr>
        <td>描述：</td>
        <td><textarea name="des" style="width: 600px;height: 100px;"></textarea></td>
    </tr>
    <tr>
        <td width="100px">互斥组：</td>
        <td><input type="text" name="mutex" value="" onblur="checknum(this)">（请填写互斥组ID）</td>
    </tr>

    <tr>
        <td></td>
        <td>
            <input type="submit" class="gbutton" value="<{'提交'|t}>"/>
            <input type="reset"  class="gbutton" value="<{'重置'|t}>"/>
        </td>
    </tr>
</table>
</form>


<script type="text/javascript">
    var timepickerlang = {timeText: '<{'时间'|t}>', hourText: '<{'小时'|t}>', minuteText: '<{'分钟'|t}>', secondText: '<{'秒钟'|t}>', currentText: '<{'现在'|t}>', closeText: '<{'确定'|t}>'}
            $('.datetimepicker').datetimepicker(timepickerlang);

    $('#form_submit').ajaxForm({
        complete: function(xhr) {
            var result = xhr.responseText;
            $('#form_submit reset').trigger('click');
            if(result == 'success'){
                $tabs.tabs("load", 2);
            }else{
                $.dialog.alert(result);
            }
        }
    })

    function checknum(elem) {
        if (elem.value && elem.value != parseInt(elem.value))
            elem.value = ''
    }

    function del(id){
        if(confirm("确定要删除吗")){
            $.post("admin.php?ctrl=cdkey&act=submit&type=del_pi",{id:id},function(msg){
                if(msg == 'success'){
                    $tabs.tabs("load", 2);
                }
            })
        }

    }

    function delcard(id){
        if(confirm("确定要删除这批次的卡号吗")){
            $.post("admin.php?ctrl=cdkey&act=submit&type=del_card",{id:id},function(msg){
                if(msg == 'success'){
                    $tabs.tabs("load", 2);
                }
            })
        }

    }

</script>