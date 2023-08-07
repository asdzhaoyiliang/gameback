<div class="flash1" id="flash1"><{$times_chart}></div>
<div class="flash2" id="flash2"><{$gold_chart}></div>


<table class="left px1 recharge_table" width="100%" border="0" cellspacing="0" cellpadding="0">
    <thead>
    <tr class="head"><td><{'充值等级'|t}></td><td><{'充值次数'|t}></td><td><{'充值金额'|t}></td></tr>
    </thead>
    <tbody>
    <{foreach from=$data item=item}>
    <tr>
    <td><{$item.level}></td>
    <td><{$item.times}></td>
    <td><{$item.money}></td>
    </tr>
    <{/foreach}>
    </tbody>
</table>


<script type="text/javascript">
$('.recharge_table tbody tr:even').addClass('even');
$('.recharge_table tbody tr:odd').addClass('odd');
</script>