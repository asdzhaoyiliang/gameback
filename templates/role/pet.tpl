<style type="text/css">
    table td,table th {border:0;text-align: center;}
</style>
<div class="ui-tabs ui-widget ui-widget-content ui-corner-all" style="width:100%;margin: 0 auto">
    <table id="equip">
        <tr>
            <th>宠物名</th>
            <th>宠物类型</th>
            <th>等级</th>
            <th>经验</th>
            <th>战斗力</th>

            <th>生命</th>
            <th>寿命</th>
            <th>快乐</th>
            <th>悟性</th>
            <th>成长</th>
            <th>血包</th>

            <th>战斗类型</th>
            <th>攻击类型</th>
            <th>等级称号</th>
            <th>兽阶称号</th>

            <th>攻击资质</th>
            <th>防御资质</th>
            <th>灵巧资质</th>
            <th>身法资质</th>
        </tr>

        <{foreach from=$content item=menu key=k}>
            <tr <{if $k%2 eq 0}>style="background-color:#ece9d8;"<{/if}>>
                <td><{$menu.name}></td>
                <td><{$menu.pettype}></td>
                <td><{$menu.level}></td>
                <td><{$menu.exp}></td>
                <td><{$menu.fight_value}></td>

                <td><{$menu.hp}></td>
                <td><{$menu.live}></td>
                <td><{$menu.funny}></td>
                <td><{$menu.wx}></td>
                <td><{$menu.grow}></td>
                <td><{$menu.hp_store}></td>

                 <td><{$menu.fight_type}></td>
                <td><{$menu.attack_type}></td>
                <td><{$menu.title_wx}></td>
                <td><{$menu.title_grow}></td>

                <td><{$menu.attack_base}></td>
                <td><{$menu.def_base}></td>
                <td><{$menu.lq_base}></td>
                <td><{$menu.sf_base}></td>
            </tr>
        <{/foreach}>
    </table>
</div>
<script type="text/javascript">
    $('#equip tr:not(".aa"):odd').addClass('odd');
    $('#equip tr:not(".aa"):even').addClass('even');
</script>
