<?php
/* +----------------------------------------------------------------------
 * 作	者: venus <venus-wxp@outlook.com>
 +----------------------------------------------------------------------
 * 创建日期: 2017/10/11 21:17
 +----------------------------------------------------------------------
 * 文件描述: Backup 数据库备份类（用于数据库的备份）
 +----------------------------------------------------------------------
 * 升级记录:
 +----------------------------------------------------------------------
 */

namespace cn\ixiaopeng\backup;

/**
 * 数据库备份类
 * Class Backup
 * @package ixiaopeng
 */
final class Backup {
    // 数据库配置
    private $config=[];
    /**
     * 数据库连接句柄
     * @var \PDO
     */
    private $handler;
    //需要备份的表
    private $tables = [];
    //开始时间
    private $begin;
    //错误信息
    private $error;

    /**
     * 构造函数
     * Backup constructor.
     * @param $config array 数据库配置
     */
    public function __construct ($config = []) {
        if (empty($config)) {
            $config = config('database');
        }
        //默认目录
        if (!array_key_exists('path', $config)) {
            $config['path'] = ROOT_PATH . "backup" . DS;
        }
        //默认保存文件
        if (!array_key_exists('filename', $config)) {
            $config["filename"] = date("Y-m-d-H-i-s") . ".sql";
        }
        $this->config = $config;
        // 设置开始时间
        $this->begin = microtime(true);
        // 开始连接
        $this->connect();
    }

    /**
     * 信息输出
     * @param $code integer 状态码
     * @param $msg string 提示信息
     */
    private function message ($code, $msg) {
        die(json_encode([
            'status' => $code,
            'message' => $msg
        ]));
    }

    /**
     * 获取PDO连接
     */
    private function connect () {
        try {
           $this->handler =new \PDO("{$this->config['type']}:host={$this->config['hostname']};port={$this->config['hostport']};dbname={$this->config['database']};",
                $this->config['username'],
                $this->config['password'], 
                [
                    \PDO::MYSQL_ATTR_INIT_COMMAND => "SET NAMES {$this->config['charset']};",
                    \PDO::ATTR_ERRMODE =>  \PDO::ERRMODE_EXCEPTION, 
                    \PDO::ATTR_DEFAULT_FETCH_MODE => \PDO::FETCH_ASSOC
                ]);
        } catch (\PDOException $e) {
            $this->message(0, $e->getMessage());
        }
    }
     /**
     * 执行SQL
     * @param string $sql sql语句
     * @return mixed
     */
    private function query ($sql = '') {
        $stmt = $this->handler->query($sql);
        $stmt->setFetchMode(\PDO::FETCH_NUM);
        return $stmt->fetchAll();
    }

     /**
     * 获取全部表
     * @return array
     */
    private function getTables () {
        $sql = 'SHOW TABLES';
        $list = $this->query($sql);
        $tables = [];
        foreach ($list as $value) {
            array_push($tables, $value[0]);
        }
        return $tables;
    }

    /**
     * 获取表定义语句
     * @param string $table 表名
     * @return mixed 建表语句
     */
    private function getTableDefinitionSql ($table = '') {
        $sql = "SHOW CREATE TABLE `{$table}`";
        $res = $this->query($sql);
        return $res[0][1] . ';';
    }

    /**
     * 获取表数据
     * @param string $table 表名
     * @return mixed
     */
    private function getTableData ($table = '') {
        $sql = "SHOW COLUMNS FROM `{$table}`";
        $list = $this->query($sql);
        //字段
        $columns = '';
        //需要返回的SQL
        $insertSql = '';
        foreach ($list as $value) {
            $columns .= "`{$value[0]}`, ";
        }
        $columns = substr($columns, 0, -2);
        // 查询数据
        $data = $this->query("SELECT * FROM `{$table}`");
        foreach ($data as $value) {
            $dataSql = '';
            foreach ($value as $val) {
                $dataSql .= "'" . addslashes($val) . "', ";
            }
            $dataSql = substr($dataSql, 0, -2);
            $insertSql .= "INSERT INTO `{$table}` ({$columns}) VALUES ({$dataSql});\r\n";
        }
        return $insertSql;
    }

    /**
     * 将备份SQL写入文件
     * @param array $tables 数据库所有表数组
     * @param array $ddls 所有表的定义
     * @param array $data 所有表的数据数组
     * @return string 返回成功或失败信息
     */
    private function writeToFile ($tables = [], $ddls = [], $data = []) {
        // 文件头部信息
        $str = "/*\r\nMySQL Database Backup Tools(Venus dump)\r\n";
        $str .= "Server:{$this->config['hostname']}:{$this->config['hostport']}\r\n";
        $str .= "Database:{$this->config['database']}\r\n";
        $str .= "Date:" . date('Y-m-d H:i:s') . "\r\n*/\r\n";
        $str .= "SET FOREIGN_KEY_CHECKS=0;\r\n";
        // 写入每张表的信息和数据
        foreach ($tables as $key => $table) {
            $str .= "-------------------------------\r\n";
            $str .= "-- Table structure for {$table}\r\n";
            $str .= "-------------------------------\r\n";
            $str .= "DROP TABLE IF EXISTS `{$table}`;\r\n";
            $str .= $ddls[$key] . "\r\n";
            $str .= "-------------------------------\r\n";
            $str .= "-- Records of {$table}\r\n";
            $str .= "-------------------------------\r\n";
            $str .= $data[$key] . "\r\n";
        }
        // 目录不存在就创建
        if(!file_exists($this->config['path'])){
            mkdir($this->config['path']);
        }
        if (file_put_contents($this->config['path'].$this->config['filename'], $str)) {
            return '备份成功！耗时：' . round(microtime(true) - $this->begin,2) . 'ms';
        } else {
            $this->error = '备份失败！';
            return false;
        }
    }
    /**
     * 设置要备份的表
     * @param array $tables 表数组
     */
    private function setTables ($tables = []) {
        if (!empty($tables) && is_array($tables)) {
            //备份指定表
            $this->tables = $tables;
        } else {
            //备份全部表
            $this->tables = $this->getTables();
        }
    }

    /**
     * 备份
     * @param array $tables 表数组
     * @return bool 是否备份成功
     */
    public function backup ($tables = []) {
        //存储表定义语句的数组
        $ddls = [];
        //存储数据的数组
        $data = [];
        $this->setTables($tables);
        if (!empty($this->tables)) {
            foreach ($this->tables as $table) {
                array_push($ddls, $this->getTableDefinitionSql($table));
                array_push($data, $this->getTableData($table));
            }
            //开始写入文件
            return $this->writeToFile($this->tables, $ddls, $data);
        } else {
            $this->error = $this->config['database'] . ' 数据库中没有表！';
            return false;
        }
    }

    /**
     * 获取错误信息
     * @return mixed
     */
    public function getError () {
        return $this->error;
    }

    /**
     * 还原数据
     * @param string $filename 文件名
     * @return bool
     */
    public function restore ($filename = '') {
        $path = $this->config['path'].$filename;
        if (!file_exists($path)) {
            $this->error = $filename . ' SQL文件不存在！';
            return false;
        } else {
            // 解析sql文件
            $sql = $this->parseSql($path);
            try {
                $this->handler->exec($sql);
                return '还原成功！耗时：' . round(microtime(true) - $this->begin,2) . 'ms';
            } catch (\PDOException $e) {
                $this->error = $e->getMessage();
                return false;
            }
        }
    }
 
    /**
     * 解析SQL文件为SQL语句数组
     * @param string $path
     * @return array|mixed|string
     */
    private function parseSql ($path = '') {
        $sql = file_get_contents($path);
        $sql = explode("\n", $sql);
        //先消除--注释
        $sql = array_filter($sql, function ($data) {
            if (empty($data) || preg_match('/^--.*/', $data)) {
                return false;
            } else {
                return true;
            }
        });
        $sql = implode('', $sql);
        //删除/**/注释
        $sql = preg_replace('/\/\*.*\*\//', '', $sql);
        return $sql;
    }

    /**
     * 下载备份
     * @param string $filename 文件名
     */
    public function downloadSqlFile ($filename) {
        $filename = $this->config['path'] . $filename;
        if (file_exists($filename)){
            // 清除并关闭关闭ob缓冲
            ob_end_clean();
            header("Cache-Control: must-revalidate, post-check=0, pre-check=0");
            header('Content-Description: File Transfer');
            header('Content-Type: application/octet-stream');
            header('Content-Length: ' . filesize($filename));
            header('Content-Disposition: attachment; filename=' . basename($filename));
            readfile($filename);
        }
    }

    /**
     * 获取文件的时间
     * @param string $filename 文件名
     * @return string
     */
    private function getFileDatetime ($filename) {
        $filename = $this->config['path'] . $filename;
        $datetime = filemtime($filename);
        return date("Y-m-d H:i:s", $datetime);
    }

    /**
     * 获取文件是大小
     * @param string $filename
     * @return string
     */
    private function getFileSize ($filename) {
        $info = stat($this->config['path'] . $filename);
        // 获取文件大小
        $size = $info['size'];
        // 文件大小单位
        $sizeTypes = ['B', 'KB', 'MB', 'GB', 'TB'];
        $pos = 0;
        while ($size >= 1024) {
            $size /= 1024;
            $pos ++;
        }
        return round($size, 2). $sizeTypes[$pos];
    }
    
    /**
     * 获取文件列表
     * @param boolean $isAsc 是否升序
     * @return array
     */
    public function getSqlFileList ($isAsc = true) {
        $resource = opendir($this->config['path']);
        $files = [];
        $i = 0;
        // 读取sql文件目录
        while (false !== ($filename = readdir($resource))) {
            if ($filename != "." && $filename != ".."){
                $files[$i]['name'] = $filename;
                $files[$i]['datetime'] = $this->getFileDatetime($filename);
                $files[$i]['size'] = $this->getFileSize($filename);
                $i ++;
            }
        }
        // 排序
        $isAsc ? sort($files) : rsort($files);
        return $files;
    }

    /**
     * 删除sql文件
     * @param $filename string 文件名
     * @return bool
     */
    public function delSqlFile ($filename) {
        $path = $this->config['path'] . $filename;
        if (!file_exists($path)) {
            $this->error = $filename . ' 文件不存在！';
            return false;
        }
        if (@unlink($path)) {
            return true;
        }
        $this->error = '删除失败！';
        return false;
    }
}