<div id="rolelist">
    <table cellpadding="0" cellspacing="0" border="0" class="table_list">
        <thead>
        <tr height="44px">
            <th width="110">日期</th>
            <th>产生<{$type_name}></th>
            <th>参与产生数</th>
            <th>人均产生</th>
            <th>消耗<{$type_name}></th>
            <th>参与消耗数</th>
            <th>人均消耗</th>
            <th>滞留率</th>
        </tr>
        </thead>
        <tbody>
        <tr>
            <td colspan="8" class="dataTables_empty"></td>
        </tr>
        </tbody>

        <tfoot>
        <tr>
            <th>日期</th>
            <th>产生<{$type_name}></th>
            <th>参与产生数</th>
            <th>人均产生</th>
            <th>消耗<{$type_name}></th>
            <th>参与消耗数</th>
            <th>人均消耗</th>
            <th>滞留率</th>
        </tr>
        </tfoot>
    </table>
</div>
<script>
$('rolelist').dataTable({
        "bProcessing": true,
        "bAutoWidth":true,
        "bServerSide": true,
        "iDisplayLength": 10,
        "bLengthChange": true,
        "bSort": false,
        "bFilter": true,
        "sPaginationType": "full_numbers",
        "sAjaxSource": "admin.php?ctrl=depletion&act=content_data&type=<{$type}>",
        "oLanguage": {
            "sUrl": "style/js/dt_cn.txt"
        },
        "aaSorting": [
            [ 0, "desc" ]
        ],
        "sDom": '<"top"lp>rt<"bottom"ip><"clear">'
    });
</script>