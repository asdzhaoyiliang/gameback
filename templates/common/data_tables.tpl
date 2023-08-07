<style>
.close{color:red; background:#fff; border:solid 1px #AAAAAA; border-radius:4px; padding: 2px 5px;}
.close:hover{ background:#F3F3F3;}
.search_float{float:left; padding:5px;height:auto;}
#server-list{display: none;}
#server-list label{ display: inline-block;width: 105px;height: 18px;}
</style>
<div class="ui-tabs ui-widget ui-widget-content ui-corner-all <{$otherData.tipsID}>" style="margin-bottom:8px; padding:10px; display:none;">
	<span style="float:right"><a class="close" href="#" onClick="$(this).parent().parent().slideUp();">X</a></span>
	<div id="TipsCont"></div>
</div>
<!-- 
使用方法：
1. 在$otherData中传入标识唯一的tipsID作为class
2. 需要tips数据时：
    $('.tipsID').slideDown();
    $('.tipsID').children("#TipsCont").html(html);
 -->

<div class="ui-tabs ui-widget ui-widget-content ui-corner-all" id="<{$otherData.id}>">

    <!----------------------- datatable_header ---------------------------------->
	<div id="datatable_header">
	    <{$otherData.header}>
	</div>

    <!----------------------- datatable_search ---------------------------------->
	<div class="datatable_search" style="padding:5px;">
        <div class="search_content">
            <{if $otherData.searchHeader}>
                <div class="search_float">
                    <{$otherData.searchHeader}>
                </div>
            <{/if}>

            <{foreach from=$searchFields key=key item=item}>
                <div class="search_float search_field field_<{$key}>" type="<{$item.type}>">

                    <{if $item.title}><{$item.title}>:&nbsp;&nbsp;<{/if}>

                    <{if $item.type == 'cp' || $item.type == 'scp' || $item.type == 'server'}>
                        <{$item.value}>

                    <{elseif $item.type == 'input'}>
                        <input value="<{$item.value|default:''}>" <{if $item.size}>size="<{$item.size}>"<{/if}> style="width:<{$item.input_width}>px;">

                    <{elseif $item.type == 'checkbox'}>
                        <label>
                            <input type="checkbox" value="<{$item.value|default:''}>"  style="margin-top: 4px" <{if $item.checked}>checked<{/if}>>
                            <span style="margin-top: -10px"><{$item.text}></span>
                        </label>

                    <{elseif $item.type == 'date'}>
                        <input value="<{$item.value|default:''}>" <{if $item.size}>size="<{$item.size}>"<{/if}> style="width:<{$item.input_width}>px;" class="datepicker">&nbsp;&nbsp;

                    <{elseif $item.type == 'range'}>
                        <input <{if $item.size}>size="<{$item.size}>"<{/if}> style="width:<{$item.input_width}>px;">&nbsp;~&nbsp;
                        <input <{if $item.size}>size="<{$item.size}>"<{/if}> style="width:<{$item.input_width}>px;">

                    <{elseif $item.type == 'range_date'}>
                        <input value='<{$item.value[0]}>' <{if $item.size}>size="<{$item.size}>"<{/if}> style="width:<{$item.input_width}>px;" class="datepicker">&nbsp;~&nbsp;
                        <input value='<{$item.value[1]}>' <{if $item.size}>size="<{$item.size}>"<{/if}> style="width:<{$item.input_width}>px;" class="datepicker">

                    <{elseif $item.type == 'range_time'}>
                        <input type="text" value='<{$item.value[0]}>' <{if $item.size}>size="<{$item.size}>"<{/if}> style="width:<{$item.input_width}>px;" class="datetimepicker">&nbsp;~&nbsp;
                        <input type="text" value='<{$item.value[1]}>' <{if $item.size}>size="<{$item.size}>"<{/if}> style="width:<{$item.input_width}>px;" class="datetimepicker">

                    <{elseif $item.type == 'select'}>
                        <select>
                        <{foreach from=$item.value key=key item=it}>
                            <{if isset($item.default)}>
                                <option value="<{$key}>" <{if $item.default==$key}>selected='selected'<{/if}>><{$it}></option>
                            <{else}>
                                <option value="<{$key}>"><{$it}></option>
                            <{/if}>
                        <{/foreach}>
                        </select>

                    <{elseif $item.type == 'checkboxlist'}>
                        <{$item.value}>

                    <{/if}>
                </div>
            <{/foreach}>

            <{if $searchFields}>
                <div style="float:left; padding:5px;">
                    <input type="button" class="datatable_search_button gbutton" value="搜索" />
                </div>
            <{/if}>

            <{if $otherData.searchFooter}>
                <div class="search_float">
                    <{$otherData.searchFooter}>
                </div>
            <{/if}>
	        <div style="clear:both;"></div>
	    </div>
	</div>


    <!-------------------------- tableHeader ------------------------------------->
    <{if $otherData.tableHeader}>
        <div style="margin: 10px 0 10px 10px">
            <{$otherData.tableHeader}>
        </div>
    <{/if}>

    <!---------------------------- showFields ----------------------------------->
	<table cellpadding="0" cellspacing="0" border="0" class="table_list">
	    <thead>
	        <tr height="44px">
	        <{foreach from=$showFields item=item}>
	            <th <{if $item.width}>width="<{$item.width}>"<{/if}>><{$item.title}></th>
	        <{/foreach}>
	        </tr>
	    </thead>
	    <tbody>
	        <tr>
	            <td colspan="<{$showFields|count}>" class="dataTables_empty"></td>
	        </tr>
	    </tbody>
	
	    <tfoot>
	        <tr>
	            <{foreach from=$showFields item=item}>
	            <th><{$item.title}></th>
	            <{/foreach}>
	        </tr>
	    </tfoot>
	</table>
</div>


<script type="text/javascript">
<{$otherData.js|default:''}>
$('.datepicker').datepicker();
var timepickerlang = {timeText: '<{'时间'|t}>', hourText: '<{'小时'|t}>', minuteText: '<{'分钟'|t}>', currentText: '<{'现在'|t}>', closeText: '<{'确定'|t}>'}
$('.datetimepicker').datetimepicker(timepickerlang);
$('#<{$otherData.id}> .datatable_search .title').toggle(function(){
    $('#<{$otherData.id}> .search_content').slideUp();
},function(){
    $('#<{$otherData.id}> .search_content').slideDown();
});

var $<{$otherData.id}> = $('#<{$otherData.id}> .table_list').dataTable({
    "bProcessing": true,
    "bServerSide": true,
    "iDisplayLength": <{$otherData.iDisplayLength}>, 
    "bLengthChange": true,
    "bStateSave": <{if $otherData.bStateSave == true}>true<{else}>false<{/if}>,
    "bFilter": true,
    "sPaginationType": "full_numbers", 
    "sAjaxSource": "<{$ajaxSource}>",
    "aaSorting": [[ <{$otherData.sortCol}>, "<{$otherData.sortDir}>" ]],
    'bSort' : <{$otherData.bSort}>,
    "oLanguage": {
    "sUrl": "style/js/dt_cn.txt"
    },
    "aoColumns": [
		<{$aoColumns}>
     ],
     "sDom": '<{if $otherData.sDom}><{$otherData.sDom}><{else}><"top"lp>rt<"bottom"ip><"clear"><{/if}>'
});

$('#<{$otherData.id}> .table_list tbody tr').live('mouseover', function () {
    $(this).addClass('row_selected');
}).live('mouseout', function () {
    $(this).removeClass('row_selected');
});


$('#<{$otherData.id}> .datatable_search input').keydown( function (event) {
    if(event.keyCode==13){
    	$('#<{$otherData.id}> .datatable_search_button').trigger("click");
    }
});
$('.select-server').click(function(event) {
	$('#server-list').toggle();
});
function getFilter() {
	var data = new Array();
	$("#<{$otherData.id}> .search_field").each(function(){
		var type = $(this).attr('type');
		var value = '';
		if(type == 'input' || type == 'select'){
			value = $(this).find(type).val();
		}else if(in_array(type, ['range', 'range_date', 'range_time'])){
			var range = new Array();
			$(this).find('input').each(function(){
				range.push($(this).val());
			});
			value = range.join('|');
		}else if(type == "date"){
			value = $(this).find("input").val();
		}
		else if (type == 'cp') {
			value = JSON.stringify(getCp())
			//console.log(value)
		}
		else if (type == 'scp')
			value = JSON.stringify(getScp())
		else if (type == 'checkbox' && $(this).find('input[type="checkbox"]')[0].checked)
			value = 1
		else if( type == 'checkboxlist')
		{
			console.log(11111);
			$('#server-list .server1').each(function(index, el) {
				if( $(this).prop('checked'))
					value += $(this).val() + ',';
			});
		}
        else if(type == 'server')
        {
            value = getServerId();
        }
		data.push(value);

	});
	return data
}
$('#<{$otherData.id}> .datatable_search_button').click(function(){
	$<{$otherData.id}>.fnMultiFilter(getFilter());
});
$<{$otherData.id}>.fnMultiFilter(getFilter());
</script>
