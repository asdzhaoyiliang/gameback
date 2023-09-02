<style type="text/css">
    table td { text-align: center;}
</style>
<div class="ui-tabs ui-widget ui-widget-content ui-corner-all" style="width: 800px;margin: 0 auto">
    <table border="0" id="baseinfo" >
        <tr>
            <td width="10%">角色ID</td>
            <td width="20%" id="role_id"><{$content.RoleGuid}></td>
            <td width="10%">账号</td>
            <td width="20%" id="account"><{$content.UserId}></td>
        </tr>
        <tr>
            <td width="10%">角色名</td>
            <td width="20%"><{$content.Name}></td>
            <td width="10%">等级</td>
            <td width="20%"><{$content.Level}></td>
        </tr>
        <tr>
            <td width="10%">创号时间</td>
            <td width="20%"><{$content.Register}></td>
            <td width="10%">性别</td>
            <td width="20%"><{if $content.Sex == 1}>男<{else}>女<{/if}></td>
        </tr>
        <tr>
            <td width="10%">战斗力</td>
            <td width="20%"><{$content.CombatEffectiveness}></td>
            <td width="10%">军衔</td>
            <td width="20%"><{$content.MilitaryRank}></td>
        </tr>
        <tr>

            <td width="10%">魔法币</td>
            <td width="20%"><{$content.MagicCoin}></td>

            <td width="10%">钻石加绑钻</td>
            <td width="20%"><{$content.Diamond}></td>

        </tr>
        <tr>

            <td width="10%">创号时间</td>
            <td width="20%"><{$content.LastLogin}></td>

        </tr>

    </table>
</div>

<script type="text/javascript">
function setPrivilege(id) {
    var privilege = $('input[name="privilege"]:checked').val()
    if (confirm("确定修改?")) {
        $.get("admin.php?ctrl=role&act=changeprivilege&role_id=" + id + "&privilege=" + privilege, function(data) {
            alert(data)
        })
    }
}
$(function() {
    $('#baseinfo td').css('padding', '5px');
    $('#baseinfo tr:odd').addClass('odd');
    $('#baseinfo tr:even').addClass('even');
})
</script>