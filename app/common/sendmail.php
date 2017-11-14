<?php
/* +----------------------------------------------------------------------
 * 作	者: venus <venus-wxp@outlook.com>
 +----------------------------------------------------------------------
 * 创建日期: 2017/11/14 12:15
 +----------------------------------------------------------------------
 * 文件描述: 发送邮件封装类
 +----------------------------------------------------------------------
 * 升级记录:
 +----------------------------------------------------------------------
 */

use PHPMailer\PHPMailer\PHPMailer;

/**
 * 邮件发送方法封装
 * @param $to string|array 目的邮件地址
 * @param $subject string 邮件主题
 * @param $content string 邮件内容
 * @param string $plainContent 当对方邮件系统不支持html显示时显示的内容，可选
 * @param array $options 这是可选的抄送或密送选项，还有附件
 * array('cc' => [], 'bcc' => [], 'attachment => [name => url])
 * @return bool|string 成功返回true，失败返回失败原因字符串
 */
function sendMail ($to, $subject, $content, $plainContent = '', array $options = []) {
    /*获取配置*/
    $config = config('send_mail_config');
    $mail = new PHPMailer(true);
    try {
        /*邮件配置*/
        $mail->isSMTP();
        //$mail->SMTPDebug = 2;
        $mail->Host = $config['host'];
        $mail->SMTPAuth = true;
        $mail->Username = $config['username'];
        $mail->Password = $config['password'];
        $mail->SMTPSecure = $config['secure'];
        $mail->Port = $config['port'];
        $mail->setFrom($config['from'], $config['name']);
        $mail->isHTML($config['is_html']);

        /*邮件内容*/
        /*设置收件人*/
        if (is_array($to) && !empty($to)) {
            foreach ($to as $item) {
                $mail->addAddress($item);
            }
        } else {
            $mail->addAddress($to);
        }
        /*设置抄送*/
        if (isset($options['cc']) && is_array($options['cc']) && !empty($options['cc'])) {
            foreach ($options['cc'] as $cc) {
                $mail->addCC($cc);
            }
        }
        /*设置密送*/
        if (isset($options['bcc']) && is_array($options['bcc']) && !empty($options['bcc'])) {
            foreach ($options['bcc'] as $bcc) {
                $mail->addBCC($bcc);
            }
        }
        /*设置附件*/
        if (isset($options['attachment']) && is_array($options['attachment']) && !empty($options['attachment'])) {
            foreach ($options['attachment'] as $key => $attachment) {
                $mail->addAttachment($attachment, $key);
            }
        }
        $mail->Subject = $subject;
        $mail->Body    = $content;
        $mail->AltBody = $plainContent;

        /*邮件发送*/
        return $mail->send();
    } catch (\Exception $exception) {
        return $mail->ErrorInfo;
    }
}
