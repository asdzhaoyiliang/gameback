<table class="itable itable-color">
    <tr>
        <td width="100px">批号：</td>
        <td>
            <select name="batch_id" id = 'batch' onclick="checkPi(this)">
                <option value=""> 请选择 </option>

                <{foreach from=$batch item=item}>
                    <option value="<{$item.id}>"> <{$item.name}> </option>
                <{/foreach}>
            </select>
            <span style="color: red;">*</span>
    </tr>

<{*    <tr>
        <td width="100px">道具ID：</td>
        <td><input type="text" name="item_id" value=""></td>
    </tr>

    <tr>
        <td>有效时间：</td>
        <td>
            开始时间：<input type="text" name="stime" class="datetimepicker" value="<{$expiration}>"/><br/>
            结束时间：<input type="text" name="etime" class="datetimepicker" value="<{$expiration}>"/>
        </td>
    </tr>

    <tr>
        <td>生成时间：</td>
        <td>
            开始时间：<input type="text" name="m_stime" class="datetimepicker" value="<{$expiration}>"/><br/>
            结束时间：<input type="text" name="m_etime" class="datetimepicker" value="<{$expiration}>"/>
        </td>
    </tr>

    <tr>
        <td>选择服务器</td>
        <td><{$server}></td>
    </tr>*}>

    <tr>
        <td></td>
        <td><button  class='datatable_search_button gbutton' id="item_submit">提交</button></td>
    </tr>
</table>


<script type="text/javascript">
var timepickerlang = {timeText: '<{'时间'|t}>', hourText: '<{'小时'|t}>', minuteText: '<{'分钟'|t}>', secondText: '<{'秒钟'|t}>', currentText: '<{'现在'|t}>', closeText: '<{'确定'|t}>'}
$('.datetimepicker').datetimepicker(timepickerlang);

    $("#item_submit").click(function(){
        var batch_id=$("#batch").val();
//        var item_id=$("input[name=item_id]").val();
//        var stime=$("input[name=stime]").val();
//        var etime=$("input[name=etime]").val();
//        var serverid = getServerId();
//        window.open('admin.php?ctrl=cdkey&act=export_submit&batch_num='+batch_num+"&item_id="+item_id+"&stime="+stime+"&etime="+etime+"&serverid="+serverid)
        window.open('admin.php?ctrl=cdkey&act=submit&type=export&batch_id='+batch_id)


    })

    function checknum(elem) {
        if (elem.value && elem.value != parseInt(elem.value))
            elem.value = ''
    }
</script>