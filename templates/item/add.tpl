<div style="color: #ff0000;">
    <p>备注</p>
    <p>1、道具ID是唯一的。如果在增加时检测到道具ID已存在，前面的将被后面的替换掉</p>
    <p>2、一行一个道具，格式为：道具id,道具名称。如：16003,重弩手</p>
</div>
<br/>
<textarea style="width: 600px;height: 400px;" name="content"><{if $itemInfo.item_id != ''}><{$itemInfo.item_id}>,<{$itemInfo.item_name}><{/if}></textarea>
<br/><br/>
<button  class='datatable_search_button gbutton' id="item_submit">提交</button>

<script type="text/javascript">
    $("#item_submit").click(function(){
        var con = $("textarea").val();

        if(con == ''){
            alert("内容不能为空");
            return;
        }

        $.post("admin.php?ctrl=item&act=submit&type=add",{con:con},function(msg){
            if(msg == 1){
                $tabs.tabs("select",0);
            }else{
                alert(msg)
            }
        })
    })
</script>