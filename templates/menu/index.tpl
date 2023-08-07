<div id="menu_tabs_<{$type}>" class="itabs">
  <ul>
    <li><a href="admin.php?ctrl=menu&act=items&type=<{$type}>"><{'菜单列表'|t}></a></li>
    <li><a href="admin.php?ctrl=menu&act=edit&type=<{$type}>"><{'添加菜单'|t}></a></li>
  </ul>
  <div id="tabs-1"> </div>
</div>

<script type="text/javascript">
  var $menu_tabs_<{$type}> = $("#menu_tabs_<{$type}>").tabs({
    select: function(event, ui) {
      if(ui['index'] == 0){
        $(this).tabs( "url" , 1 , "admin.php?ctrl=menu&act=edit&type=<{$type}>");
      }
    }
  });
</script>