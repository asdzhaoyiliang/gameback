<div id="agent_tabs" class="itabs ui-tabs ui-widget ui-widget-content ui-corner-all">
	<div style=" margin:5px; border:solid 1px #ABABAB; border-radius:5px; background:#FAFAFA; padding:4px; line-height:34px;">
    <span class="right"></span>
    <{$scp}>
    <label><input type="radio" name="type" value="2" checked="checked"/>
    从：<input type="text" name="sTime" class="datepicker" style=" width:90px;" value="<{$sTime}>" />
    到：<input type="text" name="eTime" class="datepicker" style=" width:90px;" value="<{$eTime}>" />
    </label>
    <label><input type="radio" name="type" value="4" />最近60天</label>
    <label><input type="radio" name="type" value="5" />最近90天</label>
    <button class="gbutton" style="vertical-align:middle" onclick="seaOnline()">查询</button>
    </div>

    <div id="ol_complex" style="margin:0 5px;"> </div>
</div>
<script language="javascript">
/**
 * 查询在线信息
 */
function seaOnline(){
	var type = $('[name=type]:checked').val();
	var sTime = $('[name=sTime]').val();
	var eTime = $('[name=eTime]').val();
    var server_id = $("#server_id").children("option:selected").val();
	$('#ol_complex').html("<img src='style/images/indicator.gif'>");
    $.post("admin.php?ctrl=online&act=olcomplexData", {server_id:server_id,type:type, sTime:sTime, eTime:eTime}, function(html) {
        $('#ol_complex').html(html);
    })
}
$( ".datepicker" ).datepicker();
seaOnline();
</script>