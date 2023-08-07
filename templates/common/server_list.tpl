<select id="server_id">
    <{foreach from=$list item=item}>
        <option value="<{$item.server_id}>" <{if $item.server_id==$currentServer}> selected<{/if}>><{$item.server_id}>-<{$item.name}>(<{$item.channel}>)</option>
    <{/foreach}>
</select>
<script type="text/javascript">
    function getServerId() {
        var server = $('#server_id').children("option:selected").val();
        return server ? server : ''
    }
</script>