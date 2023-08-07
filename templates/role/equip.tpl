<style type="text/css">
    table td,table th {border:0;text-align: center;}
</style>
<div class="ui-tabs ui-widget ui-widget-content ui-corner-all">
    <table id="equip">
        <tr>
            <th>物品Guid</th>
            <th>物品ID</th>
            <th>物品名称</th>
            <th>品质等级</th>
            <th>强化等级</th>
            <th>物品耐久</th>
            <th>物品数量</th>
            <th>打孔信息</th>
            <th>过期时间</th>
        </tr>
        <{foreach from=$content item=item}>
            <tr>
                <td><{$item.itemguid}></td>
                <td><{$item.itemId}></td>
                <td><{$item.itemName}></td>
                <td><{$item.qualityLevel}></td>
                <td><{$item.strongLevel}></td>
                <td><{$item.itemduration}></td>
                <td><{$item.itemCount}></td>
                <td><{$item.iteminlayhole}></td>
                <td><{$item.itemtime}></td>
            </tr>

        <{/foreach}>
    </table>
</div>
<script type="text/javascript">
    $('#equip tr:not(".aa"):odd').addClass('odd');
    $('#equip tr:not(".aa"):even').addClass('even');
</script>