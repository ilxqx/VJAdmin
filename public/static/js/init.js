$(function() {
    BJUI.init({
        /*JSPATH       : 'B-JUI/',         //[可选]框架路径
        PLUGINPATH   : 'B-JUI/plugins/', //[可选]插件路径*/
        loginInfo    : {url:'login_timeout.html', title:'登录', width:440, height:240}, // 会话超时后弹出登录对话框
        ajaxTimeout  : 300000, //[可选]全局Ajax请求超时时间(毫秒)
        alertTimeout : 3000,  //[可选]信息提示[info/correct]自动关闭延时(毫秒)
        pageInfo     : {total:'totalRow', pageCurrent:'pageCurrent', pageSize:'pageSize', orderField:'orderField', orderDirection:'orderDirection'}, //[可选]分页参数
        keys         : {statusCode:'status', message:'message'}, //[可选]
        debug        : true,    // [可选]调试模式 [true|false，默认false]
        theme        : 'blue' // 若有Cookie['bjui_theme'],优先选择Cookie['bjui_theme']。皮肤[五种皮肤:default, orange, purple, blue, red, green]
    });
});

window.onbeforeunload = function(){
    alert("确定要关闭本系统 ?");
};

//菜单-事件-zTree
function MainMenuClick(event, treeId, treeNode) {
    if (treeNode.target && treeNode.target == 'dialog' || treeNode.target == 'navtab')
        event.preventDefault()

    if (treeNode.isParent) {
        var zTree = $.fn.zTree.getZTreeObj(treeId)

        zTree.expandNode(treeNode)
        return
    }

    if (treeNode.target && treeNode.target == 'dialog')
        $(event.target).dialog({id:treeNode.targetid, url:treeNode.url, title:treeNode.name})
    else if (treeNode.target && treeNode.target == 'navtab')
        $(event.target).navtab({id:treeNode.targetid, url:treeNode.url, title:treeNode.name, fresh:treeNode.fresh, external:treeNode.external})
}