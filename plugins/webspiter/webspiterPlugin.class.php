<?php  
/**
* 
*/
class webspiterPlugin extends common_pluginMod
{
	public function __construct()
    {
        parent::__construct();
    }

    public function index2(){
    	$spiter=$this->model->table('plugin')->where('`file`="webspiter"')->select();
        if($spiter){
        	//当天时间
	        $time = strtotime(date('Y-m-d'));
	        $where = '`time`='.$time;
	        $info = $this->model->table("plugin_visitor")->where($where)->find();
	        if($info){
	        	$where ='`id`='.$info['id'];
                $data['count'] = ++$info['count'];
	            $this->model->table("plugin_visitor")->where($where)->data($data)->update();
	           
	        }else{
	           
	            $data['time'] = $time;
                $data['count'] = 1;
                $this->model->table("plugin_visitor")->data($data)->insert();
	        }
        }
    }

	public function index(){

		$spiter=$this->model->table('plugin')->where('`file`="webspiter"')->select();
        if($spiter){

            $agent = $_SERVER['HTTP_USER_AGENT'];
      
            if(strpos($tmp, 'Googlebot') !== false){
                $boot = 'google';
            }
            if(strpos($tmp, 'Baiduspider') !== false){
                $boot = 'baidu';
            }
            if(strpos($tmp, 'Sosospider') !== false){
                $boot = 'soso';
            }
            if(empty($boot)){
                return ;
            }
            //当天时间
            $time = strtotime(date('Y-m-d'));

            $where = '`time`='.$time;
            $info = $this->model->table("plugin-spiter")->where($where)->find();
            if($info){
                 $where ='`id`='.$info['id'];
                 $data[$boot] = ++$info[$boot];

                 $this->model->table("plugin-spiter")->where($where)->data($data)->update();
            }else{

                $data['time'] = $time;
                $data[$boot] = 1;
                $this->model->table("plugin-spiter")->data($data)->insert();
            }
        }
	}
}
?>