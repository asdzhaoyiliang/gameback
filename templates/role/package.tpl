<style type="text/css">
    table td,table th {border:0;text-align: center;}
</style>
<div class="ui-tabs ui-widget ui-widget-content ui-corner-all">
    <table id="equip">
        <tr>
            <th>物品ID</th>
            <th>物品名称</th>
            <th>品质等级</th>
            <th>物品数量</th>
            <th>物品耐久</th>
            <th>强化等级</th>
            <th>过期时间</th>
            <th>物品Guid</th>
        </tr>
        <{foreach from=$content item=menu key=k}>
            <tr <{if $k%2 eq 0}>style="background-color:#ece9d8;"<{/if}>>

                <td><{$menu.itemId}></td>
                <td><{$menu.itemName}></td>
                <td><{$menu.qualityLevel}></td>
                <td><{$menu.itemCount}></td>
                <td><{$menu.itemduration}></td>
                <td><{$menu.strongLevel}></td>
                <td><{$menu.itemtime}></td>
                <td><{$menu.itemguid}></td>
            </tr>
        <{/foreach}>
    </table>
</div>
<script type="text/javascript">
    $('#equip tr:not(".aa"):odd').addClass('odd');
    $('#equip tr:not(".aa"):even').addClass('even');
</script>

