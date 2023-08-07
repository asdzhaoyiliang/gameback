<form method="post" id="form_submit" action="admin.php?ctrl=notice&act=submit&type=add">
    <table class="itable itable-color">
        <tr>
            <td>公告内容</td>
            <td>
                <textarea class="notice_content" style="width: 800px;height:100px" name="content" value=""></textarea>
            </td>
        </tr>
        <tr>
            <td>类型</td>
            <td>
                <select name="notice_type">
                    <{foreach  from=$noticeType  item=item key=key}>
                    <option value="<{$key}>"><{$item}></option>
                    <{/foreach}>
                </select>
            </td>
        </tr>

        <tr>
            <td>开始时间</td>
            <td><input type="text" name="stime" value="" class="datetimepicker" ></td>
        </tr>

        <tr>
            <td>结束时间</td>
            <td><input type="text" name="etime" value="" class="datetimepicker" ></td>
        </tr>

        <tr>
            <td>时间间隔</td>
            <td><input type="text" name="time_interval" value="" >(以秒为单位)</td>
        </tr>

        <tr>
            <td>服务器</td>
            <td><{$server}></td>
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
                $tabs.tabs("select", 1);
                $tabs.tabs("load", 1);
            }else{
                $.dialog.alert(result);
            }

        }
    });


</script>