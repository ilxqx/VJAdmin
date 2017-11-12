<?php
/* +----------------------------------------------------------------------
 * 作	者: Venus <venus-wxp@outlook.com>
 +----------------------------------------------------------------------
 * 创建日期: 2017/11/10 21:38
 +----------------------------------------------------------------------
 * 文件描述: 
 +----------------------------------------------------------------------
 * 升级记录: 
 +----------------------------------------------------------------------
 */

namespace cn\ixiaopeng\verify;

class VerifyCode
{
    private $width;                                //图片宽度
    private $height;                               //图片高度
    public  $bgcolor         = array(255, 255, 255); //背景颜色
    private $totalChars;                           //总计字符数
    private $numbers;                              //数字形式字符数量
    private $securityCode;                         //验证码内容
    private $codeColor;                            //验证码颜色
    private  $fontSize       = 20;                  //验证码字符大小
    private  $fontFamily      = null;               //字体文件路径
    private  $noise           = true;               //绘制干扰
    private  $sessionName     = 'vjCode';           //验证码在Session中储存的名称
    private $img             = null;               //绘图资源

    public function __construct($width = 88, $height = 30, $totalChars = 4, $numbers = 1, $fontFamily = '') {
        header('Content-Type:text/html;charset=utf-8');
        $this->fontFamily    = $fontFamily;
        $this->width         = $width;
        $this->height        = $height;
        $this->totalChars    = $totalChars;
        $this->numbers       = $numbers;
        if (empty($this->fontFamily)) {
            $this->fontFamily = dirname(__FILE__) . DS . 'font' . DS . '1.ttf';
        }
        if($this->fontFamily == null){
            exit('请设置字体');
        }
        if(!is_file($this->fontFamily)){
            exit('验证码字体文件不存在');
        }
        $this->codeColor = array(mt_rand(1,100), mt_rand(1,100), mt_rand(1,100));
    }

    private function setChars() {
        $strall = 'abcdefghjkmnpqrstwxyz';
        for($i=0;$i<($this->totalChars-$this->numbers);$i++){$text[] = $strall[mt_rand(0,20)];}
        for($i=0;$i<$this->numbers;$i++){$text[] = mt_rand(2,9);}
        shuffle($text);
        $this->securityCode = implode('',$text);
    }

    public function draw() {
        header('Content-Type:image/png');
        $this->img = imagecreatetruecolor($this->width,$this->height);
        $this->setChars();
        $_SESSION[$this->sessionName] = $this->securityCode;
        $bgColor = imagecolorallocate($this->img,$this->bgcolor[0],$this->bgcolor[1],$this->bgcolor[2]);
        imagefill($this->img,0,0,$bgColor);
        if($this->noise){$this->writeNoise();}
        $textColor = imagecolorallocate($this->img,$this->codeColor[0],$this->codeColor[1],$this->codeColor[2]);
        $textFffset = imagettfbbox($this->fontSize,0,$this->fontFamily,$this->securityCode);
        $fx = intval(($this->width - ($textFffset[2] - $textFffset[0]))/2);
        $fy = $this->height - ($this->height - $this->fontSize)/2;
        imagefttext($this->img,$this->fontSize,0,$fx,$fy,$textColor,$this->fontFamily,$this->securityCode);
        imagepng($this->img);
        imagedestroy($this->img);
    }

    private function writeNoise() {
        $code  = '012345678abcdefhijkmnopqrstuvwxyz';
        for($i = 0; $i < 15; $i++){
            $noiseColor = imagecolorallocate($this->img, mt_rand(150,225), mt_rand(150,225), mt_rand(150,225));
            for($j = 0; $j < 2; $j++){
                imagestring($this->img, 5, mt_rand(-10, $this->width),  mt_rand(-10, $this->height), $code[mt_rand(0, 29)], $noiseColor);
            }
        }
    }
}