// 百度统计代码开始
var _hmt = _hmt || [];
(function () {
    var hm = document.createElement("script");
    hm.src = "https://hm.baidu.com/hm.js?9bbb7536a0474a4ad060a6fdc8a678b5";
    var s = document.getElementsByTagName("script")[0];
    s.parentNode.insertBefore(hm, s);
})();
// 百度统计代码结束

// 框架配置
var topJUI = {
    config: {
        pkName: 'id',
        // 是否对批量提交表格选中记录的参数值使用单引号，默认为false，true:'123','456'，false:123,456
        singleQuotesParam: true,
        aloneUse: false
    },
    language: {
        message: {
            title: {
                operationTips: "操作提示",
                confirmTips: "确认提示"
            },
            msg: {
                success: "操作成功！",
                failed: "操作失败！",
                error: "未知错误！",
                checkSelfGrid: "请先勾选中要操作的数据前的复选框！",
                selectSelfGrid: "请先选中要操作的数据！",
                selectParentGrid: "请先选中主表中要操作的一条数据！",
                permissionDenied: "对不起，你没有操作权限！",
                confirmDelete: "你确定要删除所选的数据吗？",
                confirmMsg: "确定要执行该操作吗？"
            }
        }
    }
};

// 本框架配置
var vjFramework = {
    getMenuUrl: '/index.php/admin/index/getMenu'
};

// 表单验证规则拓展
$(function () {
    $.extend($.fn.validatebox.defaults.rules, {
        // 菜单url验证
        menuUrl: {
            validator: function(value){
                return /^[a-z]\w*\/[a-z]\w*\/[a-z]\w*$/i.test(value);
            },
            message: '请输入正确的菜单url'
        },
        // 最大长度
        maxLength: {
            validator: function(value, param){
                return value.length < param[0];
            },
            message: '输入内容长度必须小于{0}'
        },
        // 最小长度
        minLength: {
            validator: function(value, param){
                return value.length > param[0];
            },
            message: '输入内容长度必须大于{0}'
        },
        // 身份证
        idCard: {
            validator: function(value){
                return /^(^[1-9]\d{7}((0\d)|(1[0-2]))(([0|1|2]\d)|3[0-1])\d{3}$)|(^[1-9]\d{5}[1-9]\d{3}((0\d)|(1[0-2]))(([0|1|2]\d)|3[0-1])((\d{4})|\d{3}[Xx])$)$/.test(value);
            },
            message: '请输入正确的身份证号'
        },
        // 邮政编码
        postcode: {
            validator: function(value){
                return /^[1-9]\d{5}(?!\d)$/.test(value);
            },
            message: '请输入正确的邮政编码'
        },
        // 日期（不包括时间）
        date: {
            validator: function(value){
                return /^[1-2][0-9][0-9][0-9]-[0-1]{0,1}[0-9]-[0-3]{0,1}[0-9]$/.test(value);
            },
            message: '请输入正确的日期'
        },
        // 包含字母，数字，下划线和横线
        alphaDash: {
            validator: function(value){
                return /^[\w-]+$/.test(value);
            },
            message: '输入内容只能是数字、字母、下划线或横线'
        },
        // 包含字母，数字
        alphaNum: {
            validator: function(value){
                return /^[a-z0-9]+$/i.test(value);
            },
            message: '输入内容只能是数字和字母'
        },
        // 只能是数字
        number: {
            validator: function(value){
                return /^\d+$/.test(value);
            },
            message: '输入内容只能是数字'
        },
        // 必须含有数字和字母
        requireAlphaNum: {
            validator: function(value){
                return /(?=[a-z0-9]*[a-z])(?=[a-z0-9]*[0-9])[a-z0-9]/i.test(value);
            },
            message: '输入内容必须含有数字和字母'
        },
        // 中文
        chinese: {
            validator: function(value){
                return /[\u4e00-\u9fa5]/gm.test(value);
            },
            message: '输入内容必须是中文'
        }
    });
});