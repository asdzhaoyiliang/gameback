<div id="agent_tabs" class="itabs ui-tabs ui-widget ui-widget-content ui-corner-all">
	<div style=" margin:5px; border:solid 1px #ABABAB; border-radius:5px; background:#FAFAFA; padding:4px; line-height:34px;">
         <{$scp}>
        <label>
            <input type="radio" name="type" value="1" checked/>
            日期：
            <input type="text" name="eTime" class="datepicker" style=" width:90px;" value="<{$time}>"/>
        </label>
        <label><input type="radio" name="type" value="0"/>最近24小时</label>
        <button class="gbutton" style="vertical-align:middle" onclick="seaOnline()">查询</button>
    </div>
    
    <div id="ol_level" style="margin:0 5px;"> </div>
</div>

<script language="javascript">
seaOnline();
function seaOnline(){
	var ol_rlt = $('#ol_level');
	var type = $('[name=type]:checked').val();
	var time = $('[name=eTime]').val();
    var server_id = $("#server_id").children("option:selected").val();
	ol_rlt.html("<img src='style/images/indicator.gif'>");
    $.post("admin.php?ctrl=level&act=levelData",{server_id:server_id,type:type, time:time}, function(html) {
        ol_rlt.html(html);
    })
}
$( ".datepicker" ).datepicker();

</script>