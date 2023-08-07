<form id="permit_add_<{$type}>" method="post" action="admin.php?ctrl=permit&act=permit_add_submit">
    <table class="itable" style="width:80%">
        <tr>
            <td><{'分　　组'|t}>：<input type="text" name="group"/></td>
        </tr>
        <tr>
            <td><{'名　　称'|t}>：<input type="text" name="name"/></td>
        </tr>
        <tr>
            <td ><{'模块列表'|t}>:
                <textarea type="text" name="modules" style="width:300px;height:60px; vertical-align: top;"></textarea>
            </td>
        </tr>
        <tr>
            <td >
                <input type="submit" class="gbutton" name="submit" value="<{'添加'|t}>"/>
            </td>
        </tr>
    </table>
    <input type="hidden" name="type" value="<{$type}>" />
</form>

<script type="text/javascript">
$('#permit_add_<{$type}> input[name="group"]').focus();
$('#permit_add_<{$type}>').ajaxForm({
    complete: function(xhr) {
        var msg = xhr.responseText;
        $.dialog.alert(msg);
        if(msg == '<{'添加成功'|t}>'){
        	<{if $type == "center"}>
        	$tabs.tabs("load", 0);
        	<{else}>
        	$tabs.tabs("load", 1);
        	<{/if}>
       	} 
    }
});
</script>