<?php

class webspiterAdminPlugin extends common_pluginMod
{
    public function __construct()
    {
        $_GET['_module']='webspiter';
        parent::__construct();
    }


    //首页    
    public function index()
    {

        $json = $this->getJson(7,'day','m-d');
       // echo $json;
        $this->data = $json;
        //蜘蛛
        $spiter = $this->getSpiterJson(7,'day','m-d');
        $this->spiter = $spiter;
        $this->show('admin_index.html');
    }

    public function getJson($num , $type = 'day', $date = 'Y-m-d'){
        $jsonArray = array();
        $jsonArray['labels'] = array();
        $datasets = $this->getChart();
        $datasets['label'] = '近期访问量';
        $timeArray = array();
        for ($i=0; $i < $num; $i++) {
            $timeNow = strtotime("-".$i." ".$type,strtotime(date('Y-m-d 0:0:0')));
            $jsonArray['labels'][] = date($date,$timeNow);

            $where = "time >= {$timeNow} AND time < ".strtotime('+ 1 '.$type, $timeNow);
            $sum = $this->model->table("plugin_visitor")->where($where)->select();
            if($sum[0]['count']){
                $datasets['data'][] = $sum[0]['count'];
            }else{
                $datasets['data'][] = 0;
            }
        }
        $jsonArray['labels'] = array_reverse($jsonArray['labels']);
        $datasets['data'] = array_reverse($datasets['data']);
        $jsonArray['datasets'][] = $datasets;
        return json_encode($jsonArray);
        
    }

    /**
     * 图表样式
     * @param int $fragmentId ID
     * @return array 信息
     */
    public function getChart($type = 'blue')
    {
        $style = array();
        switch ($type) {

            case 'grey':
                $style['fillColor'] = "rgba(220,220,220,0.2)";
                $style['strokeColor'] = "rgba(220,220,220,1)";
                $style['pointColor'] = "rgba(220,220,220,1)";
                $style['pointStrokeColor'] = "#fff";
                $style['pointHighlightFill'] = "#fff";
                $style['pointHighlightStroke'] = "rgba(220,220,220,1)";
                break;
            case 'green':
                $style['fillColor'] = "rgba(102,205,170,0.2)";
                $style['strokeColor'] = "rgba(102,205,170,1)";
                $style['pointColor'] = "rgba(102,205,170,1)";
                $style['pointStrokeColor'] = "#fff";
                $style['pointHighlightFill'] = "#fff";
                $style['pointHighlightStroke'] = "rgba(102,205,170,1)";
                break;
            case 'orange':
                $style['fillColor'] = "rgba(233,150,122,0.2)";
                $style['strokeColor'] = "rgba(233,150,122,1)";
                $style['pointColor'] = "rgba(233,150,122,1)";
                $style['pointStrokeColor'] = "#fff";
                $style['pointHighlightFill'] = "#fff";
                $style['pointHighlightStroke'] = "rgba(233,150,122,1)";
                break;
            case 'blue':            
            default:
                $style['fillColor'] = "rgba(151,187,205,0.2)";
                $style['strokeColor'] = "rgba(151,187,205,1)";
                $style['pointColor'] = "rgba(151,187,205,1)";
                $style['pointStrokeColor'] = "#fff";
                $style['pointHighlightFill'] = "#fff";
                $style['pointHighlightStroke'] = "rgba(151,187,205,1)";
                break;
        }
        return $style;
    }


    /**
     * 生成蜘蛛时间数据
     * @param int $num 数量
     * @param int $type 类型
     * @return array 信息
     */
    public function getSpiterJson($num , $type = 'day', $date = 'Y-m-d'){
        $jsonArray = array();
        $jsonArray['labels'] = array();
        $datasets[1] = $this->getChart('blue');
        $datasets[1]['label'] = '百度';
        $datasets[2] = $this->getChart('green');
        $datasets[2]['label'] = '谷歌';
        $datasets[3] = $this->getChart('orange');
        $datasets[3]['label'] = '搜搜';
        $timeArray = array();
        for ($i=0; $i < $num; $i++) {
             $timeNow = strtotime("-".$i." ".$type,strtotime(date('Y-m-d 0:0:0')));
            $jsonArray['labels'][] = date($date,$timeNow);

            $where = "time >= {$timeNow} AND time < ".strtotime('+ 1 '.$type, $timeNow);
            $count = $this->model->table("plugin_spiter")->where($where)->select();
            
            if($count[0]['baidu']){
                $datasets[1]['data'][] = $count[0]['baidu'];
            }else{
                $datasets[1]['data'][] = 0;
            }
            if($count[0]['baidu']){
                $datasets[2]['data'][] = $count[0]['google'];
            }else{
                $datasets[2]['data'][] = 0;
            }
            if($count[0]['baidu']){
                $datasets[3]['data'][] = $count[0]['soso'];
            }else{
                $datasets[3]['data'][] = 0;
            }
            

        }
        $jsonArray['labels'] = array_reverse($jsonArray['labels']);
        $datasets[1]['data'] = array_reverse($datasets[1]['data']);
        $datasets[2]['data'] = array_reverse($datasets[2]['data']);
        $datasets[3]['data'] = array_reverse($datasets[3]['data']);
        $jsonArray['datasets'] = $datasets;
        return json_encode($jsonArray);
        
    }

    //插件附加表信息
    public function plugin_ini_data()
    {
        return array(
            'plugin_spiter',
            'plugin_visitor'
        );
    }
   

}

?>