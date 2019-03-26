$(function () {
    //动态树形菜单数据
    var treeData = [{
        text : "菜单管理",
        children : [{
            text : "商品管理",
            children : [{
                id:"1",
                text : "商品查看",
                attributes : {
                    url : '<iframe width="100%" height="100%" frameborder="0"  src="book/list" style="width:100%;height:100%;margin:0px 0px;" ></iframe>'
                }
            }, {
                id:"2",
                text : "商品添加",
                attributes : {
                    url : '<iframe width="100%" height="100%" frameborder="0"  src="book/add" style="width:100%;height:100%;margin:0px 0px;"></iframe>'
                }
            }
            ]
        },{
            text : "用户管理",
            children : [{
                id:3,
                text : "用户列表",
                attributes : {
                    url : '<iframe width="100%" height="100%" frameborder="0"  src="" style="width:100%;height:100%;margin:0px 0px;"></iframe>'
                }
            }, {
                id:4,
                text : "用户添加",
                attributes : {
                    url : ''
                }
            }
            ]
        },{
            text : "订单管理",
            children : [{
                id:5,
                text : "订单列表",
                attributes : {
                    url : '<iframe width="100%" height="100%" frameborder="0"  src="" style="width:100%;height:100%;margin:0px 0px;"></iframe>'
                }
            }
            ]
        }
        ]
    }
    ];

    //实例化树形菜单
    $("#tree").tree({
        data : treeData,
        lines : true,
        onClick : function (node) {
            if (node.attributes) {
                Open(node.text, node.attributes.url);
            }
        }
    });
    //在右边center区域打开菜单，新增tab
    function Open(text, url) {
        if ($("#tabs").tabs('exists', text)) {
            $('#tabs').tabs('select', text);
        } else {
            $('#tabs').tabs('add', {
                title : text,
                closable : true,
                content : url
            });
        }
    }

    //绑定tabs的右键菜单
    $("#tabs").tabs({
        onContextMenu : function (e, title) {
            e.preventDefault();
            $('#tabsMenu').menu('show', {
                left : e.pageX,
                top : e.pageY
            }).data("tabTitle", title);
        }
    });

    //实例化menu的onClick事件
    $("#tabsMenu").menu({
        onClick : function (item) {
            CloseTab(this, item.name);
        }
    });

    //几个关闭事件的实现
    function CloseTab(menu, type) {
        var curTabTitle = $(menu).data("tabTitle");
        var tabs = $("#tabs");

        if (type === "close") {
            tabs.tabs("close", curTabTitle);
            return;
        }

        var allTabs = tabs.tabs("tabs");
        var closeTabsTitle = [];

        $.each(allTabs, function () {
            var opt = $(this).panel("options");
            if (opt.closable && opt.title != curTabTitle && type === "Other") {
                closeTabsTitle.push(opt.title);
            } else if (opt.closable && type === "All") {
                closeTabsTitle.push(opt.title);
            }
        });

        for (var i = 0; i < closeTabsTitle.length; i++) {
            tabs.tabs("close", closeTabsTitle[i]);
        }
    }
});