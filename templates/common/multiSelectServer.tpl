<input type="checkbox" id="all" value="">全选
<{foreach from=$list item=item}>
    <input type="checkbox" class="serverids" name= "serverid[]" value="<{$item.server_id}>" <{if in_array($item.server_id,$selected)}>checked <{/if}>/><{$item.server_id}>-<{$item.name}>(<{$item.channel}>)&nbsp;&nbsp;
<{/foreach}>

<script type="text/javascript">
    function getServerId() {
        var serverid = '';
        $("input[type=checkbox]").each(function(){
            if( $(this).prop("checked") && $(this).val() ){
                if($(this).val() != ''){
                    serverid += $(this).val() + ",";
                }
            }
        })
        return serverid.substr(0,serverid.length-1);
    }

    $("#all").click(function(){
         if($(this).prop("checked")){
             //$(":checkbox").attr("checked","checked");
             $(".serverids").attr("checked","checked");
         }else{
             $(":checkbox").removeAttr("checked");
         }
    })
</script>