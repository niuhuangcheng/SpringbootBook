/**
 *
 * @param title 切换的tab的标题
 * @param url 切换的tab的地址
 * @param position 切换的tab的位置
 */
function changeToBookListTab(title,url,position){
    var parent$ = self.parent.$;      //找到父级DOM
    var tabs1 = parent$('#tabs');
    if (tabs1.tabs('exists', title)) {
        tabs1.tabs('select', title);
    } else {
        tabs1.tabs('add', {
            title : title,
            closable : true,
            content : '<iframe width="100%" height="100%" frameborder="0"  src='+url+' style="width:100%;height:100%;margin:0px 0px;"></iframe>'
        });
    }
    var node = parent$("#tree").tree("find",position);
    parent$("#tree").tree('select', node.target);//设置选中该节点

    if ("商品查看" == title){
        tabs1.tabs("close", "商品添加");
    }
}

