<?php
/* +----------------------------------------------------------------------
 * 作	者: venus <venus-wxp@outlook.com>
 +----------------------------------------------------------------------
 * 创建日期: 2017/11/14 23:58
 +----------------------------------------------------------------------
 * 文件描述: excel使用封装函数
 +----------------------------------------------------------------------
 * 升级记录:
 +----------------------------------------------------------------------
 */

/**
 * 生成Excel表格
 * @param $data array 表格数据
 * @param string $filename 文件名
 * @param string $type excel文件类型（xls，xlsx或csv）
 * @param int $fontSize 表格字体大小
 * @param bool $wrap 是否解析换行
 */
function createExcel (array $data, $filename = 'data', $type = 'xlsx', $fontSize = 12, $wrap = false) {
    /*设置php的最大执行时间*/
    ini_set('max_execution_time', '0');
    /*导入phpexcel类库*/
    import('phpexcel.PHPExcel');
    /*文件类型数组*/
    $typeArr = [
        'xlsx' => 'Excel2007',
        'xls' => 'Excel5',
        'csv' => 'csv'
    ];
    /*设置excel文件名*/
    if (!in_array($type, array_keys($typeArr))) {
        $type = 'xlsx';
    }
    $filename = str_replace('.' . $type, '', $filename) . '.' . $type;
    $phpexcel = new PHPExcel();
    /*excel属性配置*/
    $phpexcel->getProperties()
        ->setCreator("VJAdmin")
        ->setLastModifiedBy("VJAdmin")
        ->setTitle("Office XLS Document")
        ->setSubject("Office XLS Document")
        ->setDescription("Document for Office 2007 XLS, generated using PHP classes.")
        ->setKeywords("office 2007 openxml php")
        ->setCategory("xls file");

    /*excel默认配置*/
    $phpexcel->getDefaultStyle()->getAlignment()->setWrapText($wrap);
    $phpexcel->getDefaultStyle()->getAlignment()->setHorizontal(PHPExcel_Style_Alignment::HORIZONTAL_CENTER);
    $phpexcel->getDefaultStyle()->getAlignment()->setVertical(PHPExcel_Style_Alignment::VERTICAL_CENTER);
    $phpexcel->getDefaultStyle()->getFont()->setName("宋体")->setSize($fontSize);
    $phpexcel->getDefaultStyle()->getBorders()->getTop()->setBorderStyle(PHPExcel_Style_Border::BORDER_THIN);
    $phpexcel->getDefaultStyle()->getBorders()->getRight()->setBorderStyle(PHPExcel_Style_Border::BORDER_THIN);
    $phpexcel->getDefaultStyle()->getBorders()->getLeft()->setBorderStyle(PHPExcel_Style_Border::BORDER_THIN);
    $phpexcel->getDefaultStyle()->getBorders()->getBottom()->setBorderStyle(PHPExcel_Style_Border::BORDER_THIN);

    /*设置当前页属性和数据*/
    $phpexcel->setActiveSheetIndex(0);
    $phpexcel->getActiveSheet()->setTitle('Data');
    $phpexcel->getActiveSheet()->getPageSetup()->setPaperSize(PHPExcel_Worksheet_PageSetup::PAPERSIZE_A4);
    $phpexcel->getActiveSheet()->getPageSetup()->setHorizontalCentered(true);
    $phpexcel->getActiveSheet()->getDefaultColumnDimension()->setAutoSize(true);
    $phpexcel->getActiveSheet()->fromArray($data);

    /*输出配置*/
    header('Content-Type: application/vnd.ms-excel');
    header("Content-Disposition: attachment;filename=$filename");
    header('Cache-Control: max-age=0');
    header('Cache-Control: max-age=1');
    header ('Expires: Mon, 26 Jul 1997 05:00:00 GMT');
    header ('Last-Modified: ' . gmdate('D, d M Y H:i:s') . ' GMT');
    header ('Cache-Control: cache, must-revalidate');
    header ('Pragma: public');
    $objwriter = PHPExcel_IOFactory::createWriter($phpexcel, $typeArr[$type]);
    $objwriter->save('php://output');
    exit;
}

/**
 * 解析excel文件
 * @param $file string 文件全路径（绝对路径）
 * @return array 返回解析后的数据
 */
function parseExcel ($file) {
    ini_set('max_execution_time', '0');
    /*文件不存在时返回空数组*/
    if (!file_exists($file)) {
        return [];
    }
    import('phpexcel.PHPExcel');
    /*文件类型数组*/
    $typeArr = [
        'xlsx' => 'Excel2007',
        'xls' => 'Excel5',
        'csv' => 'csv'
    ];
    /*判断文件是什么格式*/
    $type = pathinfo($file);
    $type = strtolower($type["extension"]);
    /*文件类型不支持，直接返回空数组*/
    if (!in_array($type, array_keys($typeArr))) {
        return [];
    }
    /*加载文件数据*/
    $objReader = PHPExcel_IOFactory::createReader($typeArr[$type]);
    $objPHPExcel = $objReader->load($file);
    $count = $objPHPExcel->getSheetCount();
    $data = [];
    $sheetNames = $objPHPExcel->getSheetNames();
    foreach ($sheetNames as $sheetName) {
        $data[$sheetName] = [];
        $sheet = $objPHPExcel->getSheetByName($sheetName);
        // 取得总行数
        $highestRow = $sheet->getHighestRow();
        // 取得总列数
        $highestColumn = $sheet->getHighestColumn();
        $len = strlen($highestColumn);
        if ($len === 1) {
            $colCount = ord($highestColumn) - 65 + 1;
        } else if ($len === 2) {
            $colCount = (ord($highestColumn[0]) - 65 + 1) * 26 + (ord($highestColumn[1]) - 65 + 1);
        } else {
            return [];
        }
        //循环读取excel文件,读取一条,插入一条
        //从第一行开始读取数据
        for($i = 1; $i <= $highestRow; $i++){
            //从第一列读取数据
            for($j = 0; $j < $colCount; $j++){
                // 读取单元格
                $val = $sheet->getCellByColumnAndRow($j, $i)->getValue();
                /*解决解析到的值是对象的bug*/
                if (is_object($val)) {
                    $val = $val->__toString();
                }
                /*去掉解析到的值两边的空格*/
                $data[$sheetName][$i - 1][$j] = trim($val);
            }
        }
    }
    if ($count <= 1) {
        $data = array_values($data)[0];
    }
    return $data;
}