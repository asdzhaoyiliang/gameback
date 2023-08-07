<style type="text/css">
    table td,table th {border:0;text-align: center;}
</style>
<div class="ui-tabs ui-widget ui-widget-content ui-corner-all" style="width:100%;margin: 0 auto">
    <table  id="equip">
            <tr>
                <th>技能ID</th>
                <th>技能等级</th>
                <th>CD时间</th>
                <th>保留</th>
                <th>秘籍ID</th>
                <th>秘籍过期时间</th>
            </tr>

            <{foreach from=$content item=menu key=k}>
                <tr <{if $k%2 eq 0}>style="background-color:#ece9d8;"<{/if}>>
                    <td><{$menu.skillId}></td>
                    <td><{$menu.skillLevel}></td>
                    <td><{$menu.cdtime}></td>
                    <td><{$menu.reserve}></td>
                    <td><{$menu.miji}></td>
                    <td><{$menu.mjexpiretime}></td>
                </tr>
            <{/foreach}>

    </table>
</div>

<script type="text/javascript">
    $('#equip tr:not(".aa"):odd').addClass('odd');
    $('#equip tr:not(".aa"):even').addClass('even');
</script>
