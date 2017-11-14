<?php
/* +----------------------------------------------------------------------
 * 作	者: venus <venus-wxp@outlook.com>
 +----------------------------------------------------------------------
 * 创建日期: 2017-11-09 14:44
 +----------------------------------------------------------------------
 * 文件描述: 这是Customer类
 +----------------------------------------------------------------------
 * 升级记录: 
 +----------------------------------------------------------------------
 */

namespace app\business\controller;

/**
 * Class Customer 类
 * @package app\business\controller
 */
class Customer extends Common {

    // 这里配置是否分页
    protected $paginate = true;

    // 定义搜索字段（必须是数组）
    // 注意：如果你的搜索字段是2个或者两个以上，那么数组必须在最后面赘上一个元素“|”或者“&”
    // 用来表示这些模糊匹配的字段是或者关系还是且的关系
    protected $likeFields = [
        'name'
    ];

    // 这里是定义要查询所需要的表的字段，默认为 *
    protected $fields = [

    ];

    // 这里是定义详情页展示数据需要的字段，如果没有提供，默认会和$fields保持一致
    protected $detailFields = [

    ];

    public function index () {
//        $mail = new SendEmail();
//        $mail->setServer("smtp.qq.com", "2929923469@qq.com", "juiylwmbodotdcfb");
//        $mail->setFrom("venus-wxp@qq.com");
//        $mail->setReceiver("2432125279");
//        $mail->setMailInfo("Hello World", "<h1>Hello, This is a email!</h1>");
        dump(sendMail([
            '1758722537@qq.com',
            '2432125279@qq.com',
            '1349112641@qq.com'
            ], '你好，世界', "<h1>这是一个强大的HelloWorld程序！</h1>", '', [
            'attachment' => [
                '美女啊哈哈.jpg' => getFileUrl(14, true)
            ]
        ]));
    }

}