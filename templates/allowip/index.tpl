<table class="itable itable-color">
    <tr>
        <td width="80px">刷新项目</td>
        <td>
            <select name="item">
                <{foreach from=$item item=it key=key}>
                    <option value="<{$key}>"><{$it}></option>
                <{/foreach}>
            </select>
        </td>
    </tr>
    <tr>
        <td>服务器：</td>
        <td><{$server}></td>
    </tr>
    <tr>
        <td>参数：</td>
        <td><input type="text" name="param" id = "param"/></td>
    </tr>
    <tr>
        <td>参数2：</td>
        <td><input type="text" name="param2" id = "param2"/></td>
    </tr>
    <tr>
        <td></td>
        <td><button  class='datatable_search_button gbutton' id="item_submit">提交</button></td>
    </tr>
</table>


<script type="text/javascript">

    $("#item_submit").click(function(){
        var serverid = getServerId();
        if(serverid == ''){alert('请选择服务器');return;}

        if(confirm("确定提交？")){
			var param = $('input[name="param"]').val();
			var param2 = $('input[name="param2"]').val();
            var data={};
            data['serverid'] = serverid;
			data['param'] = param;
			data['param2'] = param2;
            data['item'] = $("select[name=item]").children("option:selected").val();
			if( (data['item'] == '10010' || data['item'] == '10038' ) && param == ""){
				alert('需要设置参数');
				return;
			}
			if(data['item'] == '18000' &&  (param == "" || param2 == "")){
				alert('角色名，数量必填');
				return;
			}else if(data['item'] == '18000' && param2 > 300000){
				alert('请联系管理员');
				return;
			}
            $.post('admin.php?ctrl=flush&act=submit',{data:data},function(msg){
                if(msg == 'success'){
                    //$tabs.tabs('select',0);
                    alert('刷新成功！')
                }else{
                    alert(msg);
                }
            })
        }
    })

    function checknum(elem) {
        if (elem.value && elem.value != parseInt(elem.value))
            elem.value = ''
    }
</script>