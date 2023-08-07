<style type="text/css">
    table td,table th {border:0;text-align: center;}
</style>
<div class="ui-tabs ui-widget ui-widget-content ui-corner-all" style="width: 400px;">
    <table id="equip">
       <tr><th colspan="3">备注："+"表示获得，"-"表示花费</th></tr>
        <tr>
            <th>时间</th>
            <th>经济类型</th>
            <th>金额</th>
        </tr>
        <{foreach from=$content item=item}>
            <tr>
                <td><{$item.logdate}></td>
                <td><{$item.currency}></td>
                <td><{$item.kingdom}><{$item.amount}></td>
            </tr>

        <{/foreach}>
    </table>
</div>
<script type="text/javascript">
    $('#equip tr:not(".aa"):odd').addClass('odd');
    $('#equip tr:not(".aa"):even').addClass('even');
</script>