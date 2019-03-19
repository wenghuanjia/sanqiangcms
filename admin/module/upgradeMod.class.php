<?php
//后台首页
class upgradeMod extends commonMod {

    public function __construct()
    {
        parent::__construct();
    }

    public function index() {
        $this->show();  
    }

    //获取最新版本
    public function get_ver(){
        $data=array(
            'time'=>$this->config['ver_date'],
            'domain'=>$_SERVER['SERVER_NAME'],
            'key'=>$this->config['AUTHO_KEY'],
            );

        $url='http://quguonet.com/index.php/cmsapi?time='.$data['time'].'&domain='.$data['domain'].'&key='.$data['key'];
        
        $json=Http::doGet($url,10);

        if(empty($json)){
            $this->msg('获取更新文件失败，请稍后再试！',0);
        }
        echo $json;

    }

    //下载更新文件
    public function get_file(){
        $api = "http://www.quguonet.com/update/".$_POST['file'].".zip";
       
        $url=in($api);
        $file = empty($file) ? pathinfo($url,PATHINFO_BASENAME) : $file;

        $cache_dir=__ROOTDIR__.'/data/cache/';

        if(!is_dir($cache_dir)){
            @mkdir($cache_dir,0777,true);
        }
        //$file = $cache_dir.$file;
        $file = $cache_dir.$this->config['ver_date'].'.zip';
        $url = str_replace(" ","%20",$url);
        if(function_exists('curl_init')) {
            $ch = curl_init();
            curl_setopt($ch, CURLOPT_URL, $url);
            curl_setopt($ch, CURLOPT_TIMEOUT, $timeout);
            curl_setopt($ch, CURLOPT_RETURNTRANSFER, TRUE);
            $temp = curl_exec($ch);
            if(@file_put_contents($file, $temp) && !curl_error($ch)) {

                 $this->msg('/data/cache/'.$this->config['ver_date'].'.zip',1);
            
            } else {
                
                 $this->msg('/data/cache/"目录下文件保存失败，请确认此目录存在或有读写权限！');

            }
        } else {
            $opts = array(
                "http"=>array(
                "method"=>"GET",
                "header"=>"",
                "timeout"=>$timeout)
            );
            $context = stream_context_create($opts);
            if(@copy($url, $file, $context)) {
                //$http_response_header
                return $file;
            } else {
                return false;
            }
        }

        // if (!@file_put_contents($cache_dir.$this->config['ver_date'].'.'.$ext,$file)) {
           
        // }
        // $this->msg('/data/cache/'.$this->config['ver_date'].'.'.$ext,1);

    }

    //解压文件
    public function decompression(){
        $file=__ROOTDIR__.$_POST['file'];
        if(!file_exists($file)){
            $this->msg('下载到的文件不存在，请确认存在/data/cache/目录或有读写权限！',0);
        }
        $dir=__ROOTDIR__.'/data/update/';
        $archive =  new PclZip($file);
        //$archive->create(__ROOTDIR__,PCLZIP_OPT_REMOVE_PATH, __ROOTDIR__);
        if(!@$archive->extract(PCLZIP_OPT_PATH, $dir)) {
            $this->msg('解压错误 : ['.$file.']请手动对文件解压',0);
            return;
        }
        $this->msg('解压更新文件成功！');
        
    }

    public function upgrade(){
        $dir=__ROOTDIR__.'/data/update/';
        if(!file_exists($dir.'/ver.xml')){
            $this->msg('升级信息文件不存在！',0);
            return;
        }
        $xml=file_get_contents($dir.'/ver.xml');
        $info=Xml::decode($xml);

        $time=$info['ver']['vertime'];

        // if($time<>$this->config['ver_date']){
        //   $this->msg('该更新包不适合当前版本！',0);
        //   return;
        // }
        if(!copy_dir($dir.'/update',__ROOTDIR__,true)){
          $this->msg('移动文件失败！',0);
          return;
        }
        if($info['ver']['sql']=='1'){
            model('update')->index();
        }
        del_dir($dir);
        $this->msg('升级成功！清空手动清空所有缓存！');
    }

    //授权查询
    public function authorize(){
        $url='http://service.duxcms.com/authorize/search?keyword='.urlencode($_SERVER['SERVER_NAME']).'&ajax=1';
        $content=@Http::doGet($url,10);
        if(empty($content)){
            $this->msg('暂时无法获取到您站点的授权信息，请稍后再试！');
        }else{
            $this->msg($content);
        }
    }
    

}