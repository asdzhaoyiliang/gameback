<form method="post" id="form_submit" action="admin.php?ctrl=cdkey&act=submit&type=cdkey_add">
<table class="itable itable-color">
    <tr>
        <td width="100px">批号：</td>
        <td>
            <select name="batch_id" onclick="checkPi(this)">
                <option value=""> 请选择 </option>

                <{foreach from=$batch item=item}>
                    <option value="<{$item.id}>"> <{$item.name}> </option>
                <{/foreach}>
            </select>
            <span style="color: red;">*</span>
            <input type="button" class="gbutton" value="<{'生成批号'|t}>" onclick="pi()"/>
    </tr>
    <tr>
        <td>生成数量：</td>
        <td><input type="text" name="num" value="" onblur="checknum(this)"><span style="color: red;">*</span></td>
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
    $('#form_submit').ajaxForm({
        complete: function(xhr) {
            var result = xhr.responseText;
            $('#form_submit reset').trigger('click');
            if(result == 'success'){
                $tabs.tabs("select", 1);
            }else{
                $.dialog.alert(result);
            }
        }
    })
    function checknum(elem) {
        if (elem.value && elem.value != parseInt(elem.value))
            elem.value = ''
    }
    function pi(){
        $tabs.tabs("select", 2);
    }
</script>