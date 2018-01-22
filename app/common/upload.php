<?php
/* +----------------------------------------------------------------------
 * 作	者: Venus <venus-wxp@outlook.com>
 +----------------------------------------------------------------------
 * 创建日期: 2017/11/9 21:19
 +----------------------------------------------------------------------
 * 文件描述: 上传文件函数
 +----------------------------------------------------------------------
 * 升级记录: 
 +----------------------------------------------------------------------
 */

/**
 * 上传图片
 * @param $imgName string 图片引用名字
 * @return int|string 成功返回int类型的图片记录id，失败返回错误信息字符串
 * @throws \think\exception\PDOException
 */
function uploadImage ($imgName) {
    // 获取img文件
    $img = request()->file($imgName);
    // 如果img文件存在的话就开始上传
    if ($img) {
        // 获取上传图片的配置
        $config = config('uploads.image');
        // 获取相对路径和绝对路径
        $relPath = config('uploads.relativePath') . 'images' . DS;
        $absPath = rtrim(config('uploads.absolutePath') . $relPath, DS);
        // 获取文件模型
        $model = model('app\\admin\\model\\SysFile');
        // 判断文件是否存在
        try {
            // 查询是否有满足的记录
            $res = $model->where([
                'sha1' => $img->hash('sha1'),
                'type' => 'a'
            ])->find();
        } catch (Exception $exception) {
            return $exception->getMessage();
        }
        // 如果不为空则直接引用
        if (!empty($res)) {
            try {
                // 引用计数加一
                $res->setInc('refs');
            } catch (Exception $exception) {
                // 出现错误直接返回
                return $exception->getMessage();
            }
            // 返回该图片记录的id
            return $res->getAttr(config('system.sys_table_pk'));
        }
        // 上传
        $info = $img->validate($config)->rule('getUUID')->move($absPath);
        if ($info) {
            // 获取文件名字
            $imgName = $info->getSaveName();
            // 获取原文件名字
            $name = $info->getInfo('name');
            // 获取文件的sha1值
            $sha1 = $info->hash('sha1');
            // 开启事务
            $model->startTrans();
            try {
                // 新增一条数据
                $model->isUpdate(false)->data([
                    'name' => $name,
                    'relative_url' => $relPath . $imgName,
                    'sha1' => $sha1,
                    'refs' => 1,
                    'type' => 'a'
                ])->save();
                // 新增成功，进行提交
                $model->commit();
                // 返回新增文件的数据库id
                return intval($model->getAttr('id'));
            } catch (Exception $exception) {
                // 上传失败，回滚
                $model->rollback();
                // 删除刚刚上传的文件
                if (is_file($absPath . DS . $imgName)) {
                    unlink($absPath . DS . $imgName);
                }
                // 返回错误
                return $exception->getMessage();
            }
        } else {
            // 如果上传出错，返回错误
            return $img->getError();
        }
    }
    // 文件不存在则返回错误
    return '没有上传图片！';
}

/**
 * 上传文件
 * @param $fileName string 文件引用名字
 * @param $ext string 文件允许的后缀
 * @return int|string 成功返回int类型的图片记录id，失败返回错误信息字符串
 * @throws \think\exception\PDOException
 */
function uploadFile ($fileName, $ext = '') {
    // 获取file文件
    $file = request()->file($fileName);
    // 如果file文件存在的话就开始上传
    if ($file) {
        // 获取上传文件的配置
        $config = config('uploads.file');
        // 获取相对路径和绝对路径
        $relPath = config('uploads.relativePath') . 'files' . DS;
        $absPath = rtrim(config('uploads.absolutePath') . $relPath, DS);
        // 获取文件模型
        $model = model('app\\admin\\model\\SysFile');
        // 获取主键名称
        $idName = config('system.sys_table_pk');
        // 判断文件是否存在
        try {
            // 查询是否有满足的记录
            $res = $model->where([
                'sha1' => $file->hash('sha1'),
                'type' => 'b'
            ])->find();
        } catch (Exception $exception) {
            return $exception->getMessage();
        }
        // 如果不为空则直接引用
        if (!empty($res)) {
            try {
                // 引用计数加一
                $res->setInc('refs');
            } catch (\Exception $exception) {
                // 出现错误直接返回
                return $exception->getMessage();
            }
            // 返回该文件记录的id
            return $res->getAttr($idName);
        }
        // 上传
        $info = $file->validate(array_merge($config, [
            'ext' => explode(',', $ext)
        ]))->rule('getUUID')->move($absPath);
        if ($info) {
            // 获取文件名字
            $fileName = $info->getSaveName();
            // 获取原文件名字
            $name = $info->getInfo('name');
            // 获取文件的sha1值
            $sha1 = $info->hash('sha1');
            // 开启事务
            $model->startTrans();
            try {
                // 新增一条数据
                $model->isUpdate(false)->data([
                    'name' => $name,
                    'relative_url' => $relPath . $fileName,
                    'sha1' => $sha1,
                    'refs' => 1,
                    'type' => 'b'
                ])->save();
                // 新增成功，进行提交
                $model->commit();
                // 返回新增文件的数据库id
                return intval($model->getAttr($idName));
            } catch (Exception $exception) {
                // 上传失败，回滚
                $model->rollback();
                // 删除刚刚上传的文件
                if (is_file($absPath . DS . $fileName)) {
                    unlink($absPath . DS . $fileName);
                }
                // 返回错误
                return $exception->getMessage();
            }
        } else {
            // 如果上传出错，返回错误
            return $file->getError();
        }
    }
    // 文件不存在则返回错误
    return '没有上传文件！';
}

/**
 * 文件引用计数加1
 * @param $id string|integer 文件信息对应的id
 * @return bool|string 成功返回true，错误返回错误信息
 */
function fileRefsInc ($id) {
    // 获取主键名称
    $idName = config('system.sys_table_pk');
    // 主键引用计数加1
    try {
        $file = model('app\\admin\\model\\SysFile')->where($idName, $id)->find();
        if (empty($file)) {
            return '文件并不存在！';
        }
        $file->setInc('refs');
        return true;
    } catch (Exception $exception) {
        return $exception->getMessage();
    }
}

/**
 * 文件引用计数减1
 * @param $id string|integer 文件信息对应的id
 * @return bool|string 成功返回true，错误返回错误信息
 */
function fileRefsDec ($id) {
    // 获取主键名称
    $idName = config('system.sys_table_pk');
    // 主键引用计数加1
    try {
        $file = model('app\\admin\\model\\SysFile')->where($idName, $id)->find();
        if (empty($file)) {
            return '文件并不存在！';
        }
        $file->setDec('refs');
        // 如果引用计数为0，则删除
        if ($file->getAttr('refs') == 0) {
            // 拼接文件绝对路径
            $filePath = config('uploads.absolutePath') . $file->getAttr('relative_url');
            // 删除文件记录
            $file->delete();
            // 删除真实文件
            if (is_file($filePath)) {
                unlink($filePath);
            }
        }
        return true;
    } catch (Exception $exception) {
        return $exception->getMessage();
    }
}