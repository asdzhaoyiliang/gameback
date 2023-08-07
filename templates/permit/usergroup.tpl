<div style="margin-bottom:20px;">
    <select id="group_select">
        <option value="">选择..</option>
        <{foreach from=$groupList item=item}>
            <option value="<{$item.groupid}>" <{if $item.groupid == $usergroup.groupid}>selected<{/if}>><{$item.name}></option>
        <{/foreach}>
    </select>
    &nbsp;&nbsp;&nbsp;&nbsp;
    <input id="update_all_group" type="button" value="更新所有用户组权限" class="gbutton"/>
</div>

<div id="permit_setting">
    <h3><a href="#"><{'中央后台权限'|t}></a></h3>
    <div>
        <{include file="permit/center_permit.tpl"}>
    </div>
</div>


<script type="text/javascript">
$('#permit_setting').accordion({
    active: 0,
    collapsible: true,
    animated: false,
    clearStyle: true,
});
$('#group_select').change(function(){
	$tabs.tabs( "url" , 2 , "admin.php?ctrl=permit&act=usergroup&groupid="+$(this).val() );
    $tabs.tabs( "load" , 2 );
});

$('.permit_setting_form').ajaxForm({
    complete: function(xhr) {
        var msg =xhr.responseText;
        $.dialog.alert(msg);
    }
});

$('.check_all').click(function(){
    var checked = $(this).attr('checked');
    var value;
    if(checked){
        value = true;
    }else{
        value = false;
    }
    $(this).parents('table').find('input[type="checkbox"]').attr('checked', value);
});

$('.check_row').click(function(){
    var checked = $(this).attr('checked');
    var value;
    if(checked){
        value = true;
    }else{
        value = false;
    }
    $(this).parents('tr').find('input[type="checkbox"]').attr('checked', value);
});

$('.check_cancle').click(function(){
    var checked = $(this).attr('checked');
    if(!checked){
        $(this).parents('table').find('input.check_all').attr('checked', false);
        $(this).parents('tr').find('th input[type="checkbox"]').attr('checked', false);
    }
});

$("#update_all_group").click(function(){
	$.ajax({
        type: "POST",
        url: "admin.php?ctrl=permit&act=update_all_group",
        timeout: 20000,
        error: function(){$.dialog.alert('<{'超时'|t}>');},
        success: function(result){
            $.dialog.tips(result);
        }
    });
});
</script>