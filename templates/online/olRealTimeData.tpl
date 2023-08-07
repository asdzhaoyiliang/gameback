<div id="olrealtime" style="min-width: 400px; height: 320px; margin: 0 auto;padding:0 12px; padding-bottom:10px; margin:6px 0; border: solid 1px #ABABAB;border-radius: 5px;background: #FAFAFA;"></div>

<div style="padding:0 12px; padding-bottom:10px; margin:6px 0; border: solid 1px #ABABAB;border-radius: 5px;background: #FAFAFA;">
    <table cellpadding="0" cellspacing="0" border="0" class="oddeven px1">
        <thead>
        <tr height="44px">
            <th ><{'时间'|t}></th>
            <th><{'在线人数'|t}></th>
        </tr>
        </thead>
        <tbody>
        <{foreach from=$role item=i key=k}>
            <{if ($k|strtotime mod 3600) eq 0}>
                <tr>
                    <td><{$k}></td>
                    <td><{$i}></td>
                </tr>
            <{/if}>
            <{/foreach}>
        </tbody>

        <tfoot>
        <tr>
            <th ><{'时间'|t}></th>
            <th><{'在线人数'|t}></th>
        </tr>
        </tfoot>
    </table>
</div>


<script>
$(document).ready(function(){
	$('.oddeven tbody tr:odd').addClass('odd');
	$('.oddeven tbody tr:even').addClass('even');
});
$(document).ready(function() {
	<{$chart}>
});
</script>