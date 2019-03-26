var booklist = {};
$(function () {
    var wHeight = $(window).height();
    var wWidth = $(window).width();
    size = {
        width: wWidth,
        height: wHeight
    };
    booklist.getDataGrid();
})

//列表列宽比列计算
function fixWidth(percent) {
    return Math.round((Number(size.width)) * percent);
}

var IsCheckFlag = true; //标示是否是勾选复选框选中行的，true - 是 , false - 否
booklist.getDataGrid = function () {
    $("#requestGrid").datagrid({
        url: "listData ",
        striped: true,//奇偶行使用不同背景色
        idField: "id",
        loadMsg: "加载中...",
        pagination: true,//开启分页
        pageNumber: 1,//第几页显示（默认第一页，可以省略）
        pageSize: 5,//分页大小
        pageList: [5, 10, 15],//设置每页记录条数的列表
        sortName: 'id',
        sortOrder: 'asc',
        fitColumns: true,//自动使列适应表格宽度以防止出现水平滚动。
        columns: [[
            {field: "ckAll", title: "全选", align: "center", width: fixWidth(0.1), checkbox: true},
            {field: "id", title: "商品编号", align: "center", sortable: true, width: fixWidth(0.1)},
            {field: "name", title: "商品名称", align: "center", width: fixWidth(0.1)},
            {
                field: "imgurl",
                title: "商品图标",
                align: "center",
                width: fixWidth(0.2),
                formatter: function (value, row, index) {
                    return "<img src='" + value + "'" + "width='70px' height='100px' border='1'" + ">";
                }
            },
            {field: "price", title: "商品价格", align: "center", width: fixWidth(0.1)},
            {field: "pnum", title: "商品数量", align: "center", width: fixWidth(0.1)},
            {field: "category", title: "商品类别", align: "center", width: fixWidth(0.1)},
            {
                field: "edit",
                title: "编辑",
                align: "center",
                width: fixWidth(0.1),
                formatter: function (value, row, index) {
                    return "<a href='javascript:void(0);' onclick='toEditPage(" + row.id + ")'>" +
                        "<img src='../images/i_edit.gif'" + "></a>";
                }
            },
            {
                field: "del", title: "删除", align: "center", width: fixWidth(0.1), formatter: function (value, row, index) {
                    return "<a href='javascript:void(0);' target='list'  onclick='toDeleteItem(" + row.id + ")'>" +
                        "<img src='../images/i_del.gif'" + "></a>";
                }
            }
        ]],
        onClickCell: function (rowIndex, field, value) {
            IsCheckFlag = false;
        },
        onSelect: function (rowIndex, rowData) {
            if (!IsCheckFlag) {
                IsCheckFlag = true;
                $("#requestGrid").datagrid("unselectRow", rowIndex);
            }
        },
        onUnselect: function (rowIndex, rowData) {
            if (!IsCheckFlag) {
                IsCheckFlag = true;
                $("#requestGrid").datagrid("selectRow", rowIndex);
            }
        }
    });
}

function toEditPage(id) {
    $(location).attr('href', 'edit?id=' + id);
}

function toDeleteItem(id) {
    $(location).attr('href', 'deleteItem?id=' + id);
}