<div id="<{$id}>">
    <ul>
        <{foreach from=$tabs item=item}>
            <li><a href="<{$item.url}>"><{$item.title}></a></li>
        <{/foreach}>
    </ul>
    <div id="tabs-1"></div>
</div>

<script type="text/javascript">
var $tabs = $("#<{$id}>").tabs();
$('.ui-state-default a').click(function(){ // 每次点击清除jqueryui的缓存，防止hide里面的id重复产生bug
    $('.ui-tabs-panel:hidden').empty();
});
</script>