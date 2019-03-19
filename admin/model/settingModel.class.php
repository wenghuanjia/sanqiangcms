<?php
class settingModel extends commonModel
{
    public function __construct()
    {
        parent::__construct();
    }

    //保存配置
    public function save($array,$config_file) {
        if (empty($array) || !is_array($array)) {
            return false;
        }
        $config = @file_get_contents($config_file); //读取配置
        foreach ($array as $name => $value) {
            $name = str_replace(array("'", '"', '[','*'), array("\\'", '\"', '\[','\*'), $name); //转义特殊字符，再传给正则替换
            if (is_string($value) && !in_array($value, array('true', 'false', '3306'))) {
                if(!is_numeric($value)){
                    $value = "'" . $value . "'"; //如果是字符串，加上单引号
                }
            }
            $config = preg_replace("/(\\$" . $name . ")\s*=\s*(.*?);/i", "$1={$value};", $config); //查找替换
        }
        // 写入配置
        if (@file_put_contents($config_file, $config)){
            return true;
        }else{
           return false;
        }
    }

    public function saveConfigToDatabase($webConfig)
    {
        $nowLang = __LANG__;
        $langId=$this->model->field('id')->table('lang')->where(['lang'=>$nowLang])->find()['id']; 
        $webConfig['lang'] = $langId;
        $sql = "delete from dc_web_config where lang = $langId";
        if(false !== $this->model->query($sql)){
            if($this->model->table('web_config')->data($webConfig)->insert()){
                return true;
            }else{
                return false;
            }
        } 
    }
    //获取模板路径
    public function themes_list()
    {
        $tpl_dir=__ROOTDIR__.'/themes/';
        $list_file=@scandir($tpl_dir);

        if(is_array($list_file)){
        $list=array();
        foreach ($list_file as $value) {
            if ($value != "." && $value != ".."&&!strpos($value,".")) {
                $list[]=$value;
            }
        }
        }
        return $list;
    }

    public function getWebConfig()
    {

        $nowLang = __LANG__;
        $langId=$this->model->field('id')->table('lang')->where(['lang'=>$nowLang])->find()['id']; 
        $webConfig = $this->model->table('web_config')->where(['lang'=>$langId])->find(); 
        return $webConfig;
    }

}

?>