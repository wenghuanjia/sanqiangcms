<?php
class formMod extends commonMod
{
    public function __construct()
    {
        parent::__construct();
    }

    public function index()
    {
    	$form=substr(in(urldecode($_GET['f'])),0,15);
    	if(empty($form)){
    		$this->error404();
    	}
    	//获取表单信息
    	$info=model('form')->info($form);
    	if(empty($info)||$info['display']==0){
    		$this->error404();
    	}
        /*hook*/
        $this->plus_hook('form','index',$info);
        /*hook end*/
        $this->field_list=model('form')->field_list($info['id']);
    	//分页处理
        $url=__INDEX__.'/'.$form.'/pages-{page}.html';

        $listrows = $info['page'];
        $limit=$this->pagelimit($url,$listrows);
        //导航
        $this->nav=array(
            0=>array('name'=>$info['name'],'url'=>$url),
        );
        //内容列表
        $this->loop=model('form')->form_list($info['table'],$limit,$info['order'],$info['where']);
        //统计总内容数量
        $count=model('form')->form_count($info['table'],$info['where']);
        //分页处理
        $this->page=$this->page($url, $count, $listrows);

        $this->info=$info;
        $this->listrows=$info['page'];
        $this->cur_page=$cur_page;
        //MEDIA信息
        $this->common=model('pageinfo')->media($info['name']);
        //判断使用模板
        if($info['alone_tpl']==0){
        $this->show($info['tpl']);
        }else{
        $this->display($info['tpl']);
        }
    }

    //提交表单
    public function post()
    {
    	$form=in($_POST['form']);
    	if(empty($form)){
    		$this->error404();
    	}
    	$info=model('form')->info($form);
    	if(empty($info)||$info['display']==0){
    		$this->error404();
    	}
    	//获取所有字段
    	$field_list=model('form')->field_list($info['id']);
    	if(empty($field_list)){
            if($info['return_type']){
                $this->msg('未发现表单信息！',0);
            }else{
                $this->alert('未发现表单信息！');
            }
        }

        //过滤机器信息
        if(!empty($_POST['test_value'])){
        	return;
        }

        $data=array();
        foreach ($field_list as $value) {
            if($value['must']==1){
                if(empty($_POST[$value['field']])){
                    if($info['return_type']){
                        $this->msg($value['name'].'不能为空！',0);
                    }else{
                        $this->alert($value['name'].'不能为空！');
                    }
                }
            }
            $data[$value['field']]=model('form')->field_in($_POST[$value['field']],$value['type'],$value['field']);
            if(!isset($_POST[$value['field']])){
                $data[$value['field']]=$value['default'];
            }
        }

        if ($_POST['checkcode'] != $_SESSION['verify']) {
            if($info['return_type']){
                $this->msg('验证码错误!',0);
            }else{
                $this->alert('验证码错误!');
            }
            return;
        }

        //过滤完后提交表单
        model('form')->add($data,$form);
      
        //发邮件
        if($form=="message"){
            $text="Name:".$_POST['name']." Mailbox:".$_POST['email']." Question:".$_POST['message'];
            include('./system/ext/Email.class.php');//加载邮件发送类 
            $config['SMTP_HOST']='smtp.163.com';//smtp服务器地址 
            $config['SMTP_PORT']=25;//smtp服务器端口 
            $config['SMTP_SSL']=false;//是否启用SSL安全连接，gmail需要启用sll安全连接 
            $config['SMTP_USERNAME']='1thjob@163.com';//smtp服务器帐号，如：你的qq邮箱 
            $config['SMTP_PASSWORD']='skyliyongfzhy';//smtp服务器帐号密码，如你的qq邮箱密码
            $config['SMTP_FROM_TO']='1thjob@163.com';//发件人邮件地址 
            $config['SMTP_FROM_NAME']='睿拓';//发件人姓名 
            $config['SMTP_CHARSET']='utf-8';//发送的邮件内容编码     
            Email::init($config);//初始化配置 //参数1：接收人的邮箱地址；参数2：邮件标题；参数3：邮件内容 
            $a=Email::send('sales02@china-vito.cn',"Message",$text);//发送邮件
        }
        //发邮件
      
        model('cache')->clear_html('/'.$form);
        if($info['return_url']){
            $url=$this->display($info['return_url'],true,false);
        }else{
            $url=__INDEX__.'/'.$form;
        }
        if($info['return_type']){
            $this->msg($info['return_msg']);
        }else{
            $this->alert($info['return_msg'],$url);
        }
        
    }

    //验证码
    public function verify(){
        Image::buildImageVerify();
    }


}

?>