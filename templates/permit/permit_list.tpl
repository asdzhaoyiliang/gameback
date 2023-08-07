<style type="text/css">
    #permit_list_table td, th{text-align:left;}
</style>

<table id="permit_list_table_<{$type}>" class="itable">
    <tr>
        <th><h2><{'组'|t}></h2></th>
        <th><h2><{'名称'|t}></h2></th>
        <th><h2><{'模块'|t}></h2></th>
        <th><h2><{'操作'|t}></h2></th>
    </tr>

    <{foreach from=$list key=group item=item}>
        <tr ><td colspan="4"><h3><{$group}></h3></td></tr>
            <{foreach from=$item key=name item=row}>
                <tr id="permit_line_<{$row.pid}>">
                    <td></td>
                    <td class="edit" id="<{$row.pid}>" field="name"><{$row.name}></td>
                    <td class="edit_textarea" id="<{$row.pid}>" field="modules"><{$row.modules_show}></td>
                    <td><a href="javascript:void(0)" onclick="permit_delete(<{$row.pid}>)"><{'删除'|t}></a></td>
                </tr>
            <{/foreach}>
        <tr><td colspan="4"><hr /></td></tr>
    <{/foreach}>
</table>


<script type="text/javascript">
    $('#permit_list_table_<{$type}> tr:even').addClass('even');
    $('#permit_list_table_<{$type}> tr:odd').addClass('odd');
    $("#permit_list_table_<{$type}> tr").hover(
            function () {
                $(this).addClass("hover");
            },
            function () {
                $(this).removeClass("hover");
            }
    );

    $('#permit_list_table_<{$type}> .edit').editable("admin.php?ctrl=permit&act=save_field", {
        indicator : "<img src='style/images/indicator.gif'>",
        height    : "15px",
        submit    : "<{'修改'|t}>",
        cancel    : "<{'取消'|t}>",
        tooltip   : "<{'点击修改'|t}>...",
        style  : "inherit"
    });

    $('#permit_list_table_<{$type}> .edit_textarea').editable("admin.php?ctrl=permit&act=save_field", {
        indicator : "<img src='style/images/indicator.gif'>",
        height    : "55px",
        submit    : "<{'修改'|t}>",
        cancel    : "<{'取消'|t}>",
        tooltip   : "<{'点击修改'|t}>...",
        type: "textarea",
        loadurl   : "admin.php?ctrl=permit&act=get_module_textarea",
        style  : "inherit"
    });

    function permit_delete(pid){
        $.dialog.confirm('<{'你确定要删除这个吗？'|t}>', function(){
            $.ajax({
                type: "POST",
                url: "admin.php?ctrl=permit&act=permit_delete",
                data: 'pid='+pid,
                timeout: 20000,
                error: function(){$.dialog.alert('<{'超时'|t}>');},
                success: function(result){
                    if(result == 'success'){
                        $.dialog.tips('<{'删除成功'|t}>');
                        $('#permit_line_'+pid).remove();
                    }else{
                        $.dialog.alert('<{'删除失败'|t}>');
                    }

                }
            });
        }, function(){
            $.dialog.tips('<{'取消操作'|t}>');
        });
    }
</script>
