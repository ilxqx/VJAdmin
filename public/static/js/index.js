/**
 * 首页加载完后，取消加载中状态
 */
$(window).load(function () {
    $("#loading").fadeOut();
});

$(function () {
    $(".collapseMenu").on("click", function () {
        var p = $("#index_layout").iLayout("panel", "west")[0].clientWidth;
        if (p > 0) {
            $('#index_layout').iLayout('collapse', 'west');
            $(this).children('span').removeClass('fa-chevron-circle-left').addClass('fa-chevron-circle-right');
        } else {
            $('#index_layout').iLayout('expand', 'west');
            $(this).children('span').removeClass('fa-chevron-circle-right').addClass('fa-chevron-circle-left');
        }
    });

    // 首页tabs选项卡
    var index_tabs = $('#index_tabs').iTabs({
        fit: true,
        tools: [{
            iconCls: 'fa fa-home',
            handler: function () {
                $('#index_tabs').iTabs('select', 0);
            }
        }, {
            iconCls: 'fa fa-refresh',
            handler: function () {
                var refresh_tab = $('#index_tabs').iTabs('getSelected');
                var refresh_iframe = refresh_tab.find('iframe')[0];
                refresh_iframe.contentWindow.location.href = refresh_iframe.src;
                //$('#index_tabs').trigger(TOPJUI.eventType.initUI.base);

                //var index = $('#index_tabs').iTabs('getTabIndex', $('#index_tabs').iTabs('getSelected'));
                //console.log(index);
                //$('#index_tabs').iTabs('getTab', index).iPanel('refresh');
            }
        }, {
            iconCls: 'fa fa-close',
            handler: function () {
                var $el = $('#index_tabs');
                var index = $el.iTabs('getTabIndex', $el.iTabs('getSelected'));
                var tab = $el.iTabs('getTab', index);
                if (tab.iPanel('options').closable) {
                    $el.iTabs('close', index);
                }
            }
        }],
        //监听右键事件，创建右键菜单
        onContextMenu: function (e, title, index) {
            e.preventDefault();
            if (index >= 0) {
                $('#mm').iMenu('show', {
                    left: e.pageX,
                    top: e.pageY
                }).data("tabTitle", title);
            }
        }
    });

    //tab右键菜单
    $("#mm").iMenu({
        onClick: function (item) {
            tabMenuOprate(this, item.name);
        }
    });

    // 初始化accordion
    $("#RightAccordion").iAccordion({
        fit: true,
        border: false
    });

    // 绑定横向导航菜单点击事件
    // 主页打开初始化时显示第一个系统的菜单
    $(".systemName").on("click", function (e) {
        //generateMenu(e.currentTarget.dataset.menuid, e.target.textContent); //IE9及以下不兼容data-menuid属性
        //generateMenu(e.target.getAttribute('data-menuid'), e.target.textContent);
        generateMenu($(this).attr("id"), $(this).attr("title"));
        $(".systemName").removeClass("selected");
        $(this).addClass("selected");
    }).eq('0').trigger('click');

    //generateMenu(1325, "系统配置");

    // 显示系统首页
    /*setTimeout(function () {
     var indexTab = [];
     indexTab.iconCls = "icon-house";
     indexTab.text = "系统门户";
     var portal = $.getUrlParam("portal");
     if (portal == "system" || portal == null) portal = "system";
     indexTab.url = "html/portal/index.html";
     indexTab.closable = false;
     indexTab.border = false;
     addTab(indexTab);
     }, 1);*/

    $("#themeStyle").iDialog({
        title: '设置主题风格'
    });

    $("#setThemes").on('click', function () {
        $("#themeStyle").iDialog('open');
    });

    // 保存主题
    $(".topjuiTheme").on("click", function () {
        var theme = $('input[name="themes"]:checked').val();
        var menu = $('input[name="menustyle"]:checked').val();
        var topmenu = $('input[name="topmenu"]').is(':checked');
        $.post("/json/response/success.json", {
            theme: theme,
            menu: menu,
            topmenu: topmenu
        }, function (data) {
            changeTheme(theme);
            //window.location.reload();
        }, "json");
    });

    // 修改密码窗口
    $('#pwdDialog').iDialog({
        buttons: [{
            text: '确定',
            iconCls: 'fa fa-save',
            btnCls: 'topjui-btn',
            handler: function () {
                if ($("#password").val().length < 6) {
                    $.iMessager.alert('警告', '密码长度不能小于6位', 'messager-warning');
                } else {
                    var formData = $("#pwdDialog").serialize();
                    $.ajax({
                        url: './json/response/success.json',
                        type: 'post',
                        cache: false,
                        data: formData,
                        beforeSend: function () {
                            $.iMessager.progress({
                                text: '正在操作...'
                            });
                        },
                        success: function (data, response, status) {
                            $.iMessager.progress('close');
                            if (data.statusCode == 200) {
                                $.iMessager.show({
                                    title: '提示',
                                    msg: '操作成功'
                                });
                                $("#pwdDialog").iDialog('close').form('reset');

                            } else {
                                $.iMessager.alert('操作失败！', '未知错误或没有任何修改，请重试！', 'messager-error');
                            }
                        }
                    });
                }
                //if($('#userPass').validatebox('isValid')){

                //}
            }
        }]
    });

    $('#ulMenu>li').hover(
        function () {
            var m = $(this).data('menu');
            if (!m) {
                m = $(this).find('ul').clone();
                m.appendTo(document.body);
                $(this).data('menu', m);
                var of = $(this).offset();
                m.css({left: of.left, top: of.top + this.offsetHeight});
                m.hover(function () {
                    clearTimeout(m.timer);
                }, function () {
                    m.hide()
                });
            }
            m.show();
        }, function () {
            var m = $(this).data('menu');
            if (m) {
                m.timer = setTimeout(function () {
                    m.hide();
                }, 100);//延时隐藏，时间自定义，100ms
            }
        }
    );
});

// Tab菜单操作
function tabMenuOprate(menu, type) {
    var $el = $('#index_tabs');
    var allTabs = $el.iTabs('tabs');
    var allTabtitle = [];
    $.each(allTabs, function (i, n) {
        var opt = $(n).iPanel('options');
        if (opt.closable)
            allTabtitle.push(opt.title);
    });
    var curTabTitle = $(menu).data("tabTitle");
    var curTabIndex = $el.iTabs("getTabIndex", $el.iTabs("getTab", curTabTitle));
    switch (type) {
        case "1"://关闭当前
            if (curTabIndex > 0) {
                $el.iTabs("close", curTabTitle);
                return false;
            } else {
                $.iMessager.show({
                    title: '操作提示',
                    msg: '首页不允许关闭！'
                });
                break;
            }
        case "2"://全部关闭
            for (var i = 0; i < allTabtitle.length; i++) {
                $el.iTabs('close', allTabtitle[i]);
            }
            break;
        case "3"://除此之外全部关闭
            for (var i = 0; i < allTabtitle.length; i++) {
                if (curTabTitle != allTabtitle[i])
                    $el.iTabs('close', allTabtitle[i]);
            }
            $el.iTabs('select', curTabTitle);
            break;
        case "4"://当前侧面右边
            for (var i = curTabIndex; i < allTabtitle.length; i++) {
                $el.iTabs('close', allTabtitle[i]);
            }
            $el.iTabs('select', curTabTitle);
            break;
        case "5": //当前侧面左边
            for (var i = 0; i < curTabIndex - 1; i++) {
                $el.iTabs('close', allTabtitle[i]);
            }
            $el.iTabs('select', curTabTitle);
            break;
        case "6": //刷新
            var refresh_tab = $el.iTabs('getSelected');
            var refresh_iframe = refresh_tab.find('iframe')[0];
            refresh_iframe.contentWindow.location.href = refresh_iframe.src;
            //$('#index_tabs').trigger(TOPJUI.eventType.initUI.base);
            break;
    }

}

/**
 * 更换页面风格
 * @param topjuiThemeName
 */
function changeTheme(themeName) {/* 更换主题 */
    var $dynamicTheme = $('#dynamicTheme');
    var themeHref = $dynamicTheme.attr('href');
    var themeHrefNew = themeHref.substring(0, themeHref.indexOf('themes')) + 'themes/default/topjui.' + themeName + '.css';
    // 更换主页面风格
    $dynamicTheme.attr('href', themeHrefNew);

    // 更换iframe页面风格
    var $iframe = $('iframe');
    if ($iframe.length > 0) {
        for (var i = 1; i < $iframe.length; i++) {
            var ifr = $iframe[i];
            var $iframeDynamicTheme = $(ifr).contents().find('#dynamicTheme');
            var iframeThemeHref = $iframeDynamicTheme.attr('href');
            var iframeThemeHrefNew = iframeThemeHref.substring(0, iframeThemeHref.indexOf('themes')) + 'themes/default/topjui.' + themeName + '.css';
            $iframeDynamicTheme.attr('href', iframeThemeHrefNew);
        }
    }

    $.cookie('topjuiThemeName', themeName, {
        expires: 7,
        path: '/'
    });
}
if ($.cookie('topjuiThemeName')) {
    changeTheme($.cookie('topjuiThemeName'));
}

// 退出系统
function logout() {
    $.iMessager.confirm('提示', '确定要退出吗?', function (r) {
        if (r) {
            $.iMessager.progress({
                text: '正在退出中...'
            });
            window.location.href = './login.html' + location.search;
        }
    });
}

// 生成左侧导航菜单
function generateMenu(menuId, systemName) {
    if (menuId == "") {
        $.iMessager.show({title: '操作提示', msg: '还未设置该系统对应的菜单ID！'});
    } else {
        var $el = $("#RightAccordion");
        $(".panel-header .panel-title:first").html(systemName);
        var allPanel = $el.iAccordion('panels');
        var size = allPanel.length;
        if (size > 0) {
            for (i = 0; i < size; i++) {
                var index = $el.iAccordion('getPanelIndex', allPanel[i]);
                $el.iAccordion('remove', 0);
            }
        }

        var url = vjFramework.getMenuUrl;
        $.get(
            url,
            {
                "pid": menuId
            },
            function (data) {
                $.each(data, function (i, e) {// 循环创建手风琴的项
                    var pid = e.pid;
                    var isSelected = i == 0 ? true : false;
                    $('#RightAccordion').iAccordion('add', {
                        fit: false,
                        title: e.text,
                        content: "<ul id='tree" + e.id + "' ></ul>",
                        border: false,
                        selected: isSelected,
                        iconCls: e.iconCls
                    });
                    $.parser.parse();
                    $.get(
                        url,
                        {
                            'pid': e.id
                        },
                        function (data) {// 循环创建树的项
                            $("#tree" + e.id).tree({
                                data: data,
                                lines: false,
                                animate: true,
                                onBeforeExpand: function (node, param) {
                                    $("#tree" + e.id).tree('options').url = url + '?pid=' + node.id;
                                },
                                onClick: function (node) {
                                    if (node.url) {
                                        /*if(typeof node.attributes != "object") {
                                         node.attributes = $.parseJSON(node.attributes);
                                         }*/
                                        addTab(node);
                                    } else {
                                        if (node.state === "closed") {
                                            $("#tree" + e.id).tree('expand', node.target);
                                        } else if (node.state === 'open') {
                                            $("#tree" + e.id).tree('collapse', node.target);
                                        }
                                    }
                                }
                            });
                    }, 'json');
                });
            }, "json"
        );
    }
}

//打开Tab窗口
function addTab(params) {
    var iframe = '<iframe src="' + params.url + '" scrolling="auto" frameborder="0" style="width:100%;height:100%;"></iframe>';
    var t = $('#index_tabs');
    var $selectedTab = t.iTabs('getSelected');
    var selectedTabOpts = $selectedTab.iPanel('options');
    var opts = {
        id: getRandomNumByDef(),
        refererTab: {},
        title: params.text,
        closable: typeof(params.closable) != "undefined" ? params.closable : true,
        iconCls: params.iconCls ? params.iconCls : 'fa fa-file-text-o',
        content: iframe,
        //href: params.url,
        border: params.border || true,
        fit: true
        //cls: 'leftBottomBorder'
    };
    if (t.iTabs('exists', opts.title)) {
        t.iTabs('select', opts.title);
    } else {
        var lastMenuClickTime = $.cookie("menuClickTime");
        var nowTime = new Date().getTime();
        if ((nowTime - lastMenuClickTime) >= 500) {
            $.cookie("menuClickTime", new Date().getTime());
            t.iTabs('add', opts);
        } else {
            $.iMessager.show({
                title: '温馨提示',
                msg: '操作过快，请稍后重试！'
            });
        }
    }
}

function addParentTab(options) {
    var src, title;
    src = options.href;
    title = options.title;

    var iframe = '<iframe src="' + src + '" frameborder="0" style="border:0;width:100%;height:100%;"></iframe>';
    parent.$('#index_tabs').iTabs("add", {
        title: title,
        content: iframe,
        closable: true,
        iconCls: 'fa fa-th',
        border: true
    });
}

function modifyPwd() {
    $("#pwdDialog").iDialog('open');
}
