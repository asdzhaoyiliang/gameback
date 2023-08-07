<style type="text/css">
    table td { text-align: center;}
</style>
<div class="ui-tabs ui-widget ui-widget-content ui-corner-all" style="width: 800px;margin: 0 auto">
    <table border="0" id="baseinfo" >
        <tr>
            <td width="10%">角色ID</td>
            <td width="20%" id="role_id"><{$content.actorid}></td>
            <td width="10%">账号</td>
            <td width="20%" id="account"><{$content.accountname}></td>
        </tr>
        <tr>
            <td width="10%">角色名</td>
            <td width="20%"><{$content.actorname}></td>
            <td width="10%">等级</td>
            <td width="20%"><{$content.level}></td>
        </tr>
        <tr>
            <td width="10%">创号时间</td>
            <td width="20%"><{$content.createtime}></td>
            <td width="10%">性别</td>
            <td width="20%"><{if $content.sex == 1}>男<{else}>女<{/if}></td>
        </tr>
        <tr>
            <td width="10%">战斗力</td>
            <td width="20%"><{$content.fightvalue}></td>
            <td width="10%">帮派</td>
            <td width="20%"><{$content.guildid}></td>
        </tr>
        <tr>

            <td width="10%">经验值</td>
            <td width="20%"><{$content.exp}></td>

            <td width="10%">充值元宝</td>
            <td width="20%"><{$content.recharge}></td>

        </tr>
        <tr>
            <td width="10%">绑定金钱</td>
            <td width="20%"><{$content.bindcoin}></td>
            <td width="10%">非绑定金钱</td>
            <td width="20%"><{$content.nonbindcoin}></td>
        </tr>
        <tr>
            <td width="10%">绑定元宝</td>
            <td width="20%"><{$content.bindyuanbao}></td>
            <td width="10%">非绑定元宝</td>
            <td width="20%"><{$content.nonbindyuanbao}></td>
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