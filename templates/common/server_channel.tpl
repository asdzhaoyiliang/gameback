<span>
    <span>
        服务器：
        <select id="select-server">
            <{foreach from=$scp key=key item=item}>
                <option value="<{$key}>" <{if $key==$selected_server}>selected<{/if}>><{$item.name}></option>
            <{/foreach}>
        </select>
        <span <{if !$showChannel}>style="display:none"<{/if}>> 渠道：<select id="select-channel"><option value='0'>全渠道</option></select></span>
        <span <{if !$showPackage}>style="display:none"<{/if}>> 包：<select id="select-package" ></select></span>
    </span>
</span>

<script type="text/javascript">
    var scp = <{$scp|@json_encode}>;

    $('#select-server').change(function() {
        $.cookie('selected_server', this.value, { expires: 7})

        var channelOptions = []
        channelOptions.push("<option value='999999999'>全渠道</option>")
        if (this.value != 0){
            var cp = scp[this.value]['channel']
            for (var x in cp) {
                var selected_channel = '<{$selected_channel}>';
                var select = x == selected_channel ? 'selected' : ''
                channelOptions.push("<option value='" + cp[x]['id'] + "' " + select + ">" + cp[x]['name'] + "</option>")
            }
        }
        $('#select-channel').html(channelOptions.join(''))
        $('#select-channel').change()
    })


    $('#select-channel').change(function() {
        $.cookie('selected_channel', this.value, { expires: 7 })
        var channel = $(this).val();
        $('#select-package').empty()
        if (this.value != 'all') {
            var packages ;
            var packageOptions = []
            $.each(scp, function(index, val) {
                if( val.channel[channel] ){
                    packages = val.channel[channel]['package'];
                    return false ;
                }
            });
            // var server = $('#select-server').val()
            for (x in packages)
                packageOptions.push("<option value='" + x + "'>" + packages[x] + "</option>")
            $('#select-package').html(packageOptions.join(''))
        }
    })
    $('#select-server').change()
    $('#select-channel').change()


    function getScp() {
        var server = $('#select-server').val()
        var channel = $('#select-channel').val()
        var package = $('#select-package').val()
        return {
            server: server ? server : '',
            channel: channel ? channel : '',
            package: package ? package : ''
        }
    }
</script>
