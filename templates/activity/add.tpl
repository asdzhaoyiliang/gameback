<form method="post" id="form_submit" action="admin.php?ctrl=activity&act=submit&type=add">
    <table class="itable itable-color">
        <tr>
            <td width="80px">活动ID：</td>
            <td><input type="text" name="id" value="<{$info.id}>" onblur="checknum(this)"><span style="color: red;">*</span></td>
        </tr>
        <tr>
            <td>活动名称：</td>
            <td><input type="text" name="name" value="<{$info.name}>"><span style="color: red;">*</span></td>
        </tr>
        <tr>
            <td>活动配置表：</td>
            <td><textarea rows="30" cols="100" name="strcom"><{$info.strcom}></textarea><span style="color: red;">*</span></td>
        </tr>
		
        <tr>
            <td>开始时间：</td>
            <td><input type="text" name="stime" value="<{$info.stime}>" class="datepicker"></td>
        </tr>
        <tr>
            <td>结束时间：</td>
            <td><input type="text" name="etime" value="<{$info.etime}>" class="datepicker"></td>
        </tr>
        <tr>
            <td>是否重置：</td>
            <td>
                <select name="repeat">
                    <option value="0" <{if $info.repeat==0}>selected<{/if}> >否</option>
                    <option value="1" <{if $info.repeat==1}>selected<{/if}>>是</option>
                </select>
            </td>
        </tr>
        <tr>
            <td>服务器：</td>
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
    $('.datepicker').datetimepicker(timepickerlang);

    $('#form_submit').ajaxForm({
        complete: function(xhr) {
            var result = xhr.responseText;
            $('#form_submit reset').trigger('click');
            if(result == 'success'){
                $tabs.tabs("select", 0);
            }else{
                $.dialog.alert(result);
            }

        }
    });

    function checknum(elem) {
        if (elem.value && elem.value != parseInt(elem.value))
            elem.value = ''
    }
</script>