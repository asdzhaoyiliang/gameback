<script type="text/javascript">
    $('#log_view tbody td img').die().live( 'click', function () {
        var log_id = $(this).parent().find(".log_id").html();
        var nTr = this.parentNode.parentNode;

        if ( this.src.match('details_close') ){
            /* This row is already open - close it */
            this.src = "./style/images/details_open.png";
            $log_view.fnClose( nTr );
        }else{
            /* Open this row */
            this.src = "./style/images/details_close.png";
            $.ajax({
                type: "POST",
                url: "admin.php?ctrl=log&act=log_detail",
                data: "log_id="+log_id,
                timeout: 20000,
                error: function(){$.dialog.alert('<{'超时'|t}>');},
                success: function(html){
                    $log_view.fnOpen( nTr, html, 'details' );
                }
            });
        }
    });
</script>
<{$dataTable}>