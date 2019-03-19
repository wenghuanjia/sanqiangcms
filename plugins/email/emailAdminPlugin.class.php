<?php

class emailAdminPlugin extends common_pluginMod
{
    public function __construct()
    {
        $_GET['_module']='email';
        parent::__construct();
    }
    //首页    
    public function index()
    {
        $info = $this->model->table("plugin_email")->find(1);
        if($info){
           $this->config_array = $info;
        }
        $this->show('admin_index.html');
    }
    // 修改系统设置
    public function save()
    {

        $config = $_POST; //接收表单数据
        
        foreach($config as $key=>$v){
            $data[$key] = $v;
        }
        $check = $this->model->table("plugin_email")->where("id=1")->find();
        if (!$check) {
           $save = $this->model->table("plugin_email")->data($data)->insert(); 
        }else{
            $save = $this->model->table("plugin_email")->where("id=1")->data($data)->update();
        }

        if($save){
            $this->msg('网站配置成功！',1);
        }else{
            $this->msg('网站配置失败，请建站多语言文件夹与inc目录文件是否有写入权限！',0);
        }
    }

    //插件附加表信息
    public function plugin_ini_data()
    {
        return array(
            'plugin_email'
        );
    }	
	
}
?>