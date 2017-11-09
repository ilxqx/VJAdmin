<?php
/* +----------------------------------------------------------------------
 * 作	者: Venus <venus-wxp@outlook.com>
 +----------------------------------------------------------------------
 * 创建日期: 2017/10/23 20:58
 +----------------------------------------------------------------------
 * 文件描述: 菜单生成控制器
 +----------------------------------------------------------------------
 * 升级记录: 
 +----------------------------------------------------------------------
 */

namespace app\admin\controller;

use think\db\Query;

class SysMenuGenerator extends Common {


    /**
     * @return \think\response\View
     */
    public function index () {
        return view();
    }

    /**
     * 找出以什么开头的字符串
     * @param $prefix string 前缀
     * @param $str string 目标字符串
     * @return bool 返回是否以前缀开头
     */
    private function startWith ($prefix, $str) {
        return strpos($str, $prefix) === 0;
    }

    /**
     * 处理表单传来的数据
     * @param $fields array 字段键值数组
     * @param $data array 表单数据
     * @param $field_map array 需要的字段键值数组
     * @return array
     */
    private function handleFields ($fields, $data, $field_map) {
        /*有多少组数据*/
        $base = count($fields) / count($field_map);
        $arr = [];
        /*处理数据*/
        for ($i = 0, $cur = 0; $cur < $base; $i++) {
            if (in_array($field_map[0] . $i, $fields)) {
                $arr[$cur] = [];
                foreach ($field_map as $val) {
                    $arr[$cur][$val] = $data[$val . $i];
                }
                $cur++;
            }
        }
        return $arr;
    }

    /**
     * 创建表结构语句
     * @param $tableName string 表名
     * @param $fields array 字段数组
     * @param $fks array 外键数组
     * @return string
     */
    private function createTableSql ($tableName, $fields, $fks) {
        $sql = "CREATE TABLE `{$tableName}` ( \r\n";
        /*创建字段语句*/
        foreach ($fields as $field) {
            $sub = "`{$field['field_name']}` {$field['field_type']}";
            $sub .= strtolower($field['field_type']) === 'varchar' ?
                "({$field['field_length']}) {$field['field_unsigned']} "
                : " {$field['field_unsigned']} ";
            $sub .= empty($field['field_null']) ? "" : "{$field['field_null']} ";
            $sub .= empty($field['field_default']) ? "" : "DEFAULT '{$field['field_default']}' ";
            $sub .= empty($field['field_auto']) ? "" : "{$field['field_auto']} ";
            $sub .= empty($field['field_pk']) ? "" : "{$field['field_pk']} ";
            $sub .= empty($field['field_comment']) ? ",\r\n" : "COMMENT '{$field['field_comment']}' ,\r\n";
            $sql .= $sub;
        }
        /*创建外键字段*/
        foreach ($fks as $fk) {
            $relationTable = $fk['relation_table'];
            if (false !== strpos($relationTable, '\\')) {
                $arr = explode('\\', $relationTable);
                $relationTable = array_pop($arr);
            }
            $table = getTableNameOfPrefixWithCStyle($relationTable);
            $idName = config('system.sys_table_pk');
            $sql .= "CONSTRAINT `fk_{$tableName}_{$fk['fk']}` FOREIGN KEY (`{$fk['fk']}`) REFERENCES `{$table}` (`{$idName}`) ,\r\n";
        }
        $sql = rtrim($sql, ",\r\n");
        /*设置表结构的引擎和编码*/
        $sql .= "\r\n) ENGINE=InnoDB DEFAULT CHARSET=utf8";
        return $sql;
    }

    /**
     * 解析关联表的外键字段映射
     * @param $str
     * @return array|false|string[]
     */
    private function resolveFkMap ($str) {
        /*按照|分*/
        $arr = preg_split('/\s*\|\s*/', $str);
        foreach ($arr as &$val) {
            /*按照->分*/
            $val = preg_split('/\s*->\s*/', $val);
        }
        return $arr;
    }

    /**
     * 获取页面显示的字段
     * @param $fields array 字段数组
     * @return array
     */
    private function getShowFields ($fields) {
        $arr = [];
        foreach ($fields as $field) {
            if ($field['field_show'] === 'a') {
                array_push($arr, $field);
            }
        }
        return $arr;
    }

    /**
     * 获取数组的一列的值
     * @param $arr array 数组
     * @param $col string 列名
     * @return array
     */
    private function getColumnFromArr ($arr, $col) {
        $column = [];
        foreach ($arr as $val) {
            if (array_key_exists($col, $val)) {
                array_push($column, $val[$col]);
            }
        }
        return $column;
    }

    /**
     * 根据字段信息获取验证规则
     * @param $fieldInfo array 字段信息
     * @param int $type 获取类型 1 表示前台 2表示后台
     * @param $fileKeys array 上传文件的key值数组
     * @return string
     */
    private function getValidateRules ($fieldInfo, $type = 1, $fileKeys = []) {
        $ruleForeEnd = '';
        $ruleBackEnd = '';
        /*是否为空*/
        if (array_key_exists('field_null', $fieldInfo)) {
            if ($fieldInfo['field_null'] === 'NOT NULL') {
                $ruleForeEnd .= 'required;';
                $ruleBackEnd .= 'require|';
            }
        }
        /*类型判断*/
        if (array_key_exists('field_type', $fieldInfo)) {
            switch ($fieldInfo['field_type']) {
                case 'INT':
                    if (!in_array($fieldInfo['field_name'], $fileKeys)) {
                        $ruleForeEnd .= 'integer';
                    } else {
                        $ruleForeEnd = rtrim($ruleForeEnd, ';');
                    }
                    $ruleBackEnd .= 'integer';
                    break;
                case 'FLOAT':
                    $ruleForeEnd .= 'float';
                    $ruleBackEnd .= 'float';
                    break;
                case 'VARCHAR':
                    $ruleForeEnd .= 'length(~';
                    $ruleBackEnd .= 'max:';
                    if (array_key_exists('field_length', $fieldInfo)) {
                        $ruleForeEnd .= $fieldInfo['field_length'] . ')';
                        $ruleBackEnd .= $fieldInfo['field_length'];
                    } else {
                        $ruleForeEnd .= '255)';
                        $ruleBackEnd .= '255';
                    }
                    break;
                case 'DATETIME':
                    $ruleForeEnd .= 'datetime';
                    $ruleBackEnd .= 'date';
                    break;
                case 'DATE':
                    $ruleForeEnd .= 'date';
                    $ruleBackEnd .= 'date';
            }
        }
        /*根据类型返回不同的验证类型字符串*/
        if ($type === 1) {
            return $ruleForeEnd;
        } else {
            return $ruleBackEnd;
        }
    }

    public function generator () {
        $data = $this->request->param();
        $table_name = getTableNameOfPrefixWithCStyle($data['model_file_name']);
        $keys = array_keys($data);
        $field_keys = [];
        $relation_keys = [];
        foreach ($keys as $key) {
            /*获取字段组*/
            if ($this->startWith('field_', $key)) {
                array_push($field_keys, $key);
            }
            /*获取关联表组*/
            if ($this->startWith('relation_table', $key)
            || $this->startWith('fk', $key)
            || $this->startWith('map_fields', $key)) {
                array_push($relation_keys, $key);
            }
        }
        /*处理字段数据*/
        $fields_arr = $this->handleFields($field_keys, $data, [
            'field_name',
            'field_type',
            'field_length',
            'field_unsigned',
            'field_null',
            'field_default',
            'field_auto',
            'field_pk',
            'field_comment',
            'field_show'
        ]);
        /*处理关联表数据*/
        $relation_arr = $this->handleFields($relation_keys, $data, [
            'relation_table',
            'fk',
            'map_fields'
        ]);
        /*获取所有的外键集合*/
        $fk_keys = [];
        foreach ($relation_arr as $val) {
            array_push($fk_keys, $val['fk']);
        }
        /*创建表结构的语句*/
        $sql = $this->createTableSql($table_name, $fields_arr, $relation_arr);
        $query = new Query();
        try {
            /*创建表*/
            $dropSql = "DROP TABLE IF EXISTS `{$table_name}`";
            $query->execute($dropSql);
            $query->execute($sql);
        } catch (\Exception $exception) {
            return $this->handleJson(0, '创建表结构出错：' . $exception->getMessage());
        }
        /*创建控制器*/
        $templatePath = config('system.template_path');
        $modulePath = $templatePath . '..' . DS . $data['module_name'] . DS;
        $controllerFile = file_get_contents($templatePath . 'Controller.vj');
        $controllerFile = str_replace('#datetime#', date('Y-m-d H:i'), $controllerFile);
        $controllerFile = str_replace('#module#', $data['module_name'], $controllerFile);
        $controllerFile = str_replace('#controller#', $data['controller_file_name'], $controllerFile);
        $controllerFile = str_replace('#pagination#', ($data['paginate'] === 'a') ? 'true' : 'false', $controllerFile);
        $searchFields = '';
        $search_arr = preg_split('/\s*,\s*/', $data['search_fields']);
        foreach ($search_arr as $val) {
            $searchFields .= "'{$val}',\r\n\t\t";
        }
        $searchFields = rtrim($searchFields, ",\r\n\t\t");
        $controllerFile = str_replace('#searchFields#', $searchFields, $controllerFile);
        file_put_contents($modulePath . 'controller' . DS . $data['controller_file_name'] . '.php', $controllerFile);
        /*创建模型*/
        $modelFile = file_get_contents($templatePath . 'Model.vj');
        $modelFile = str_replace('#datetime#', date('Y-m-d H:i'), $modelFile);
        $modelFile = str_replace('#module#', $data['module_name'], $modelFile);
        $modelFile = str_replace('#model#', $data['model_file_name'], $modelFile);
        $relationModels = $this->getColumnFromArr($relation_arr, 'relation_table');
        $arrWithNoNS = array_map(function ($item) {
            if (false !== strpos($item, '\\')) {
                $tempArr = explode('\\', $item);
                $item = array_pop($tempArr);
            }
            return "'" . lcfirst($item) . "'";
        }, $relationModels);
        $modelFile = str_replace('#relationModels#', join(', ', $arrWithNoNS), $modelFile);
        $modelFile = str_replace('#fieldDictNames#', "'{$data['dict_names']}'", $modelFile);
        /*处理上传文件*/
        $file_list = preg_split('/\s*,\s*/', $data['file_list']);
        $fileArr = [];
        foreach ($file_list as $item) {
            if (!empty($item)) {
                $item = preg_split('/\s*->\s*/', $item);
                $temp = preg_split('/\s*\|\s*/', $item[1]);
                if (count($temp) === 1) {
                    $fileArr[$item[0]] = [
                        'type' => $temp[0]
                    ];
                } else {
                    $fileArr[$item[0]] = [
                        'type' => $temp[0],
                        'ext' => $temp[1]
                    ];
                }
            }
        }
        $fileArrKeys = array_keys($fileArr);
        if (!empty($fileArr)) {
            $fileStr = '';
            foreach ($fileArr as $key => $file) {
                $fileStr .= "'{$key}' => [\r\n\t\t\t";
                if ($file['type'] === 'image') {
                    $fileStr .= "'type' => '{$file['type']}'\r\n\t\t";
                } else {
                    $fileStr .= "'type' => '{$file['type']}',\r\n\t\t\t";
                    $fileStr .= "'ext' => '{$file['ext']}'\r\n\t\t";
                }
                $fileStr .= "],\r\n\t\t";
            }
            $fileStr = rtrim($fileStr, ",\r\n\t\t");
            $modelFile = str_replace('#fileList#', $fileStr, $modelFile);
        } else {
            $modelFile = str_replace('#fileList#', '', $modelFile);
        }
        /*处理模型的relationFuncs*/
        $funcsStr = [];
        foreach ($relation_arr as $key => $relation) {
            $str = "public function " . trim($arrWithNoNS[$key], "'") . " () {\r\n";
            $map = $this->resolveFkMap($relation['map_fields']);
            $str .= "\t\treturn \$this->belongsTo('" . str_replace('\\', '\\\\', $relation['relation_table']) . "', '{$relation['fk']}')->bind([\r\n";
            foreach ($map as $val) {
                $str .= "\t\t\t'{$val[0]}' => '{$val[1]}',\r\n";
            }
            rtrim($str, ",\r\n");
            $str .= "\t\t]);\r\n\t}";
            array_push($funcsStr, $str);
        }
        $modelFile = str_replace('#relationFuncs#', join("\r\n\r\n\t", $funcsStr), $modelFile);
        file_put_contents($modulePath . 'model' . DS . $data['model_file_name'] . '.php', $modelFile);
        /*创建验证器*/
        $validateFile = file_get_contents($templatePath . 'Validate.vj');
        $validateFile = str_replace('#datetime#', date('Y-m-d H:i'), $validateFile);
        $validateFile = str_replace('#module#', $data['module_name'], $validateFile);
        $validateFile = str_replace('#validate#', $data['validate_file_name'], $validateFile);
        $fieldDictNames = preg_split('/\s*,\s*/', $data['dict_names']);
        $rules = '';
        $add_fields = '';
        $edit_fields = '';
        $idName = config('system.sys_table_pk');
        $ignore = [
            $idName,
            'manager_id',
            'at_datetime'
        ];
        foreach ($fields_arr as $val) {
            if (in_array($val['field_name'], $ignore)) {
                continue;
            }
            if (!in_array($val['field_name'], $fieldDictNames)) {
                $rules .= "'{$val['field_name']}' => '" . $this->getValidateRules($val, 2) . "',\r\n\t\t\t";
            } else {
                $rules .= "'{$val['field_name']}' => 'in:' . getFieldValuesStr('{$table_name}', '{$val['field_name']}'),\r\n\t\t\t";
            }
            $add_fields .= "'{$val['field_name']}',\r\n\t\t\t\t";
            if (!in_array($val['field_name'], $fileArrKeys)) {
                $edit_fields .= "'{$val['field_name']}',\r\n\t\t\t\t";
            }
        }
        $rules = rtrim($rules, ",\r\n\t\t\t");
        $add_fields = rtrim($add_fields, ",\r\n\t\t\t\t");
        $edit_fields = rtrim($edit_fields, ",\r\n\t\t\t\t");
        $validateFile = str_replace('#rules#', $rules, $validateFile);
        $validateFile = str_replace('#addFields#', $add_fields, $validateFile);
        $validateFile = str_replace('#editFields#', $edit_fields, $validateFile);
        file_put_contents($modulePath . 'validate' . DS . $data['validate_file_name'] . '.php', $validateFile);
        /*index页面创建*/
        $indexFile = file_get_contents($templatePath . 'index.vj');
        $indexFile = str_replace('#search#', ($data['search'] === 'a') ? 'true' : 'false', $indexFile);
        $indexFile = str_replace('#height#', $data['dialog_height'], $indexFile);
        $indexFile = str_replace('#width#', $data['dialog_width'], $indexFile);
        $indexFile = str_replace('#pagination#', ($data['paginate'] === 'a') ? "{include file=\"common:paginateFooter\" /}" : '', $indexFile);
        $showFields = '';
        $fieldList = '';
        $show_fields_arr = $this->getShowFields($fields_arr);
        foreach ($show_fields_arr as $val) {
            if ($val['field_name'] === $idName) {
                continue;
            }
            $showFields .= "<th" . (($val['field_type'] === 'DATE' || $val['field_type'] === 'DATETIME') ? ' width="200"' : '') . ">{$val['field_comment']}</th>\r\n\t\t\t\t";
            /*处理关联表显示，只能显示一个*/
            foreach ($relation_arr as $key => $value) {
                if ($val['field_name'] === $value['fk']) {
                    $map = $this->resolveFkMap($value['map_fields']);
                    /*处理一下图片的显示*/
                    if (trim($arrWithNoNS[$key], "'") === 'SysFile') {
                        $fieldList .= "<td data-toggle=\"popover\" data-trigger=\"hover\" data-html=\"true\" data-container=\"body\" data-placement=\"top\" data-content=\"<img src='{:getImgUrl(\$val.{$val['field_name']})}' height='100' width='auto'/>\">{\$val.{$map[0][0]}}</td>\r\n\t\t\t\t";
                    } else {
                        $fieldList .= "<td>{\$val.{$map[0][0]}}</td>\r\n\t\t\t\t";
                    }
                    continue 2;
                }
            }
            /*处理数据字典*/
            if (in_array($val['field_name'], $fieldDictNames)) {
                $fieldList .= "<td>\r\n\t\t\t\t\t{eq name=\"val.{$val['field_name']}\" value=\"a\"}\r\n\t\t\t\t\t";
                $fieldList .= "<div class=\"label label-success\">{\$val." . $val['field_name'] . "_name}</div>\r\n\t\t\t\t\t";
                $fieldList .= "{else/}\r\n\t\t\t\t\t";
                $fieldList .= "<div class=\"label label-danger\">{\$val." . $val['field_name'] . "_name}</div>\r\n\t\t\t\t\t";
                $fieldList .= "{/eq}\r\n\t\t\t\t</td>\r\n\t\t\t\t";
                continue;
            }
            $fieldList .= "<td>{\$val.{$val['field_name']}}</td>\r\n\t\t\t\t";
        }
        $showFields = rtrim($showFields, "\r\n\t\t\t\t");
        $fieldList = rtrim($fieldList, "\r\n\t\t\t\t");
        $indexFile = str_replace('#showFields#', $showFields, $indexFile);
        $indexFile = str_replace('#fields#', $fieldList, $indexFile);
        /*检测视图目录是否存在*/
        $viewPath = $modulePath . 'view' . DS . toCStyle($data['controller_file_name']);
        if (!is_dir($viewPath)) {
            mkdir($viewPath);
        }
        file_put_contents($viewPath . DS . 'index.html', $indexFile);
        /*处理update页面*/
        $updateFile = file_get_contents($templatePath . 'update.vj');
        $inputFields = '';
        foreach ($fields_arr as $val) {
            /*过滤不必要的字段*/
            if (in_array($val['field_name'], $ignore)) {
                continue;
            }
            if (in_array($val['field_name'], $fieldDictNames)) {
                $inputFields .= "<label";
            } else {
                $inputFields .= "<label for=\"{$val['field_name']}{:MCA}\"";
            }
            $inputFields .= " class=\"row-label\">{$val['field_comment']}：</label>\r\n\t\t\t";
            $inputFields .= "<div class=\"row-input" . ($val['field_null'] === 'NOT NULL' ? ' required' : '') . "\">\r\n\t\t\t\t";
            if (in_array($val['field_name'], $fieldDictNames)) {
                $inputFields .= "{volist name=\"{$val['field_name']}_values_meanings\" id=\"val\"}\r\n\t\t\t\t";
                $inputFields .= "{if condition=\"isset(\$data) && !empty(\$data.{$val['field_name']}) && \$data.{$val['field_name']} == \$val.value\"}\r\n\t\t\t\t";
                if ($val['field_null'] === 'NOT NULL') {
                    $inputFields .= "<input checked type=\"radio\" name=\"{$val['field_name']}\" data-toggle=\"icheck\" data-rule=\"checked\" value=\"{\$val.value}\" data-label=\"{\$val.meaning}\">\r\n\t\t\t\t";
                    $inputFields .= "{else/}\r\n\t\t\t\t";
                    $inputFields .= "<input type=\"radio\" name=\"{$val['field_name']}\" data-toggle=\"icheck\" data-rule=\"checked\" value=\"{\$val.value}\" data-label=\"{\$val.meaning}\">\r\n\t\t\t\t";
                } else {
                    $inputFields .= "<input checked type=\"radio\" name=\"{$val['field_name']}\" data-toggle=\"icheck\" value=\"{\$val.value}\" data-label=\"{\$val.meaning}\">\r\n\t\t\t\t";
                    $inputFields .= "{else/}\r\n\t\t\t\t";
                    $inputFields .= "<input type=\"radio\" name=\"{$val['field_name']}\" data-toggle=\"icheck\" value=\"{\$val.value}\" data-label=\"{\$val.meaning}\">\r\n\t\t\t\t";
                }
                $inputFields .= "{/if}\r\n\t\t\t\t";
                $inputFields .= "{/volist}\r\n\t\t\t";
            } else if (in_array($val['field_name'], $fileArrKeys)) {
                $inputFields .= "{if condition=\"isset(\$data) && !empty(\$data.{$val['field_name']})\"}\r\n\t\t\t\t";
                $inputFields .= "<input type=\"file\" data-toggle=\"fileinput\" " . ($fileArr[$val['field_name']]['type'] === 'file' ? ('data-ext="' . $fileArr[$val['field_name']]['ext'] . '"') : 'data-ext="bmp,png,gif,jpg,jpeg,jpe,svg"') . " name=\"{$val['field_name']}\" id=\"{$val['field_name']}{:MCA}\" data-preview=\"{:getImgUrl(\$data.{$val['field_name']})}\">\r\n\t\t\t\t";
                $inputFields .= "{else/}\r\n\t\t\t\t";
                $inputFields .= "<input type=\"file\" data-toggle=\"fileinput\" " . ($fileArr[$val['field_name']]['type'] === 'file' ? ('data-ext="' . $fileArr[$val['field_name']]['ext'] . '"') : 'data-ext="bmp,png,gif,jpg,jpeg,jpe,svg"') . " name=\"{$val['field_name']}\" id=\"{$val['field_name']}{:MCA}\" data-rule=\"" . $this->getValidateRules($val, 1, $fileArrKeys) . "\">\r\n\t\t\t\t";
                $inputFields .= "{/if}\r\n\t\t\t";
            } else if ($val['field_name'] === 'remark') {
                $inputFields .= "<textarea style=\"resize: none;\" name=\"{$val['field_name']}\" id=\"{$val['field_name']}{:MCA}\" data-toggle=\"autoheight\" data-rule=\"" . $this->getValidateRules($val, 1, $fileArrKeys) . "\" rows=\"5\">{\$data.{$val['field_name']}|default=''}</textarea>\r\n\t\t\t";
            } else {
                $inputFields .= "<input type=\"text\" " . (($val['field_type'] === 'DATETIME') ? 'data-toggle="datepicker" data-pattern="yyyy-MM-dd HH:mm:ss"' : ($val['field_type'] === 'DATE' ? 'data-toggle="datepicker"' : '')) . " name=\"{$val['field_name']}\" id=\"{$val['field_name']}{:MCA}\" value=\"{\$data.{$val['field_name']}|default=''}\" data-rule=\"" . $this->getValidateRules($val, 1, $fileArrKeys) . "\">\r\n\t\t\t";
            }
            $inputFields .= "</div>\r\n\t\t\t";
        }
        $inputFields = rtrim($inputFields, "\r\n\t\t\t");
        $updateFile = str_replace('#inputFields#', $inputFields, $updateFile);
        $updateFile = str_replace('#enctype#', (empty($fileArr) ? '' : ' enctype="multipart/form-data"'), $updateFile);
        file_put_contents($viewPath . DS . 'update.html', $updateFile);
        return $this->handleJson(1, '生成菜单成功！', true);
    }

}