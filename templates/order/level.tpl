<style type="text/css">
    #server-list{display: none;}
#server-list label{ display: inline-block;width: 105px;height: 18px;}
</style>
<div id="agent_tabs" class="itabs ui-tabs ui-widget ui-widget-content ui-corner-all" style="overflow:auto; zoom:1; padding-bottom:6px;">
    <div style=" margin:5px; border:solid 1px #ABABAB; border-radius:5px; background:#FAFAFA; padding:4px; line-height:34px;">
                服务器：<{$server}>
            <input type="button" class="gbutton" id="search_recharge" value="<{'查询'|t}>" />
    </div>
    <div id="recharge_content" style="margin:12px 6px;"></div>
</div>
<script>
    $("#search_recharge").click(function(){
        var server = $("#server_id").children("option:selected").val();
        $("#recharge_content").load("admin.php?ctrl=order&act=charge_level_data&serverid="+server);
    });

    $("#search_recharge").click()
    $('.select-server').click(function(event) {
    $('#server-list').toggle();
});
</script>