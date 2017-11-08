<?php
/* +----------------------------------------------------------------------
 * 作	者: venus <venus-wxp@outlook.com>
 +----------------------------------------------------------------------
 * 创建日期: 2017/9/20 11:50
 +----------------------------------------------------------------------
 * 文件描述: 菜单控制器
 +----------------------------------------------------------------------
 * 升级记录: 
 +----------------------------------------------------------------------
 */

namespace app\admin\controller;

class SysMenu extends Common {

    protected $likeFields = [
        'name'
    ];

    /**
     * 对菜单数组进行排序
     * @param $arr array 待排序数组
     */
    private function sort (&$arr) {
        /*先根据seq排序，在根据id进行排序*/
        usort($arr, function ($a, $b) {
            if ($a['seq'] > $b['seq']) {
                return 1;
            } else if ($a['seq'] < $b['seq']) {
                return -1;
            } else if ($a['id'] > $b['id']) {
                return 1;
            } else if ($a['id'] < $b['id']) {
                return -1;
            } else {
                return 0;
            }
        });
    }

    /**
     * 处理菜单与子菜单的排序
     * @param $menus array 菜单数组
     * @param $data array 原菜单数据
     * @param $pid integer 父级菜单id
     * @param $mark array 菜单层级符号
     */
    private function handleMenus (&$menus, &$data, $pid, &$mark) {
        array_push($mark, '—');
        $sub = [];
        foreach ($data as $val) {
            if ($val['pid'] == $pid) {
                array_push($sub, $val);
                array_splice($data, array_search($val, $data), 1);
            }
        }
        /*如果没有子菜单，就直接返回*/
        if (empty($sub)) {
            array_pop($mark);
            return;
        }
        /*在处理子菜单之前对其排序*/
        $this->sort($sub);
        foreach ($sub as $val) {
            $val['name'] = join('', $mark) . ' ' . $val['name'];
            array_push($menus, $val);
            $this->handleMenus($menus, $data, $val['id'], $mark);
        }
        array_pop($mark);
    }

    /**
     * 对菜单显示顺序进行排列
     * @param $data array 菜单数组
     */
    private function sortMenus (&$data) {
        /*查询所有的顶级菜单*/
        $top = [];
        foreach ($data as $val) {
            if ($val['pid'] == 0) {
                array_push($top, $val);
                array_splice($data, array_search($val, $data), 1);
            }
        }
        /*如果没有顶级菜单就直接返回*/
        if (empty($top)) {
            return;
        }
        /*用来存放最终的菜单数据*/
        $menus = [];
        /*定义一个菜单层级符号数组*/
        $mark = ['+'];
        /*对顶级菜单进行排序*/
        $this->sort($top);
        foreach ($top as $val) {
            $val['name'] = join('', $mark) . ' ' . $val['name'];
            array_push($menus, $val);
            $this->handleMenus($menus, $data, $val['id'], $mark);
        }
        $data = $menus;
    }

    protected function afterData (&$data) {
        $this->sortMenus($data);
    }

    protected function beforeUpdate () {
        /*查询所有的菜单*/
        $menus = model($this->table)
            ->field([
                'id',
                'seq',
                'pid',
                'name'
            ])
            ->select();
        castToArray($menus);
        $this->sortMenus($menus);
        $this->assign('menus', $menus);
    }

    protected function beforeAlter (&$data) {
        if (!empty($data['url'])) {
            $arr = preg_split('/\//', $data['url']);
            $data['type_id'] = toCStyle($arr[0]) . toCStyle($arr[1]) . strtolower($arr[2]);
        }
    }

}