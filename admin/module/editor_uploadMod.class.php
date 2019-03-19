<?php
class editor_uploadMod extends commonMod
{
    public function __construct()
    {
        parent::__construct();
    }

    //文件上传
    public function index() {
      $files=$_FILES;
      $ban_ext=array('php','asp','asp','html','htm','js','shtml','txt','aspx');

      //判断储存空间是否充足
       $totl =  $this->count=model('upload')->total_count();
       $stor = $this->config['STORAGE_SIZE'];
      if ($files['Filedata']['size'] /1024 / 1024 + $totl > $stor){
          $this->error_msg('您的储存空间不足！');
          return;
      }

      if(!empty($files)){
        foreach($files as $file) {
          $name=$file['name'];
          $ext=explode('.', $file['name']);
          $ext=end($ext);
          if(in_array($ext, $ban_ext)){
          $this->error_msg('非法文件上传！');
          return;
          }
        }
      }else{
        $this->error_msg('上传文件不能为空！');
        return;
      }
      //文件路径
      $file_path = __ROOTDIR__ . '/upload/';
      //文件URL路径
      $file_url = __ROOTURL__ . '/upload/';
      //文件目录时间
      $filetime=date('Y-m').'/'.date('d');

      //重命名
      function filename(){
        foreach($_FILES as $file) {
          $name=explode('.', $file['name']);
          $ext=end($name);
          $name=$name[0];
        }
        $pinyin = new Pinyin();
        $pattern = '/[^\x{4e00}-\x{9fa5}\d\w]+/u';
        $name = preg_replace($pattern, '', $name);
        $name = substr($pinyin->output($name, true),0,80);
        if(file_exists(__ROOTDIR__.'/upload/'.date('Y-m').'/'.date('d').'/'.$name.'.'.$ext)){
          $rand='-'.substr(cp_uniqid(),-5);
        }
        return $name.$rand;
      }
      //上传
    	$upload = new UploadFile();
    	$upload->maxSize = 1024 * 1024 * $this->config['ACCESSPRY_SIZE']; //大小
        $upload->allowExts = explode(',', $this->config['ACCESSPRY_TYPE']); //格式
        $upload->savePath = $file_path . $filetime . '/'; //保存路径
      $upload->saveRule = 'filename'; //重命名

		  if(!$upload->upload())
        {
            $this->error_msg($upload->getErrorMsg()); //输出错误消息
            return;
        }else{
           $info = $upload->getUploadFileInfo();
           $info = $info[0];
           //返回信息 Array ( [0] => Array ( [name] => 未命名.jpg [type] => image/pjpeg [size] => 53241 [key] => Filedata [extension] => jpg [savepath] => ../../../upload/2011-12-17/ [savename] => 1112170727041127335395.jpg ) )
           $ext=$info['extension'];

          if($_POST['wateradd']){
            $waterfile=__ROOTDIR__.'/public/watermark/'.$this->config['WATERMARK_IMAGE'];
            if(!isset($_POST['waterpor'])){
              $por=$this->config['WATERMARK_PLACE'];
            }else{
              $por=$_POST['waterpor'];
            }
            if($ext=='jpg'||$ext=='jpeg'||$ext=='png'||$ext=='gif'){
                Image::water($file_path.$filetime.'/'.$info['savename'],$waterfile,$por);
            }
          }

          if($_POST['thumb']){
              //设置高度和宽度
              $thumbwidth=intval($_POST['thumbwidth']);
              $thumbheight=intval($_POST['thumbheight']);
              if(empty($thumbwidth)||$_POST['thumbsys']==1){
                $thumbwidth=$this->config['THUMBNAIL_MAXWIDTH'];
              }
              if(empty($thumbheight)||$_POST['thumbsys']==1){
                $thumbheight=$this->config['THUMBNAIL_MAXHIGHT'];
              }
              if(isset($_POST['thumb_cutout'])){
                  $thumb_cutout=intval($_POST['thumb_cutout']);
              }else{
                  $thumb_cutout=$this->config['WATERMARK_CUTOUT'];
              }
              //过滤不支持格式进行缩图
              if($ext=='jpg'||$ext=='jpeg'||$ext=='png'||$ext=='gif'){
                $thumb=Image::thumb($file_path.$filetime.'/'.$info['savename'],$file_path.$filetime.'/thumb_'.$info['savename'],'',$thumbwidth,$thumbheight,'',$thumb_cutout);
              }
          }

           //根据缩图返回数据           
           if($thumb){
            $file=$file_url.$filetime.'/thumb_'.$info['savename'];
           }else{
            $file=$file_url . $filetime . '/'.$info['savename'];
           }
           $title=str_replace('.'.$info['extension'],'', $info['name']);
//           $json=array('error' => 0, 'url' =>$file, 'original'=>$file_url . $filetime . '/'.$info['savename'], 'file'=>$file,'title'=>$title,'ext'=>$ext,'msg'=>'成功');
//
//           /*hook*/
//           $json=$this->plus_hook_replace('upload','index',$json);
//           /*hook end*/

           //又拍云上传
           $upyun = $this->config['UPYUN_SWITCH'];
              $bucket_name = $this->config['UPYUN_BUCKET_NAME'];
              $upyun_key = $this->config['UPYUN_KEY'];
              $upyun_domain = $this->config['UPYUN_DOMAIN'];
           if($upyun){
               $ext_arr = array(
                   'image' => array('gif', 'jpg', 'jpeg', 'png', 'bmp'),
                   'flash' => array('swf', 'flv'),
                   'media' => array('swf', 'flv', 'mp3', 'wav', 'wma', 'wmv', 'mid', 'avi', 'mpg', 'asf', 'rm', 'rmvb'),
                   'file' => array('doc', 'docx', 'xls', 'xlsx', 'ppt', 'htm', 'html', 'txt', 'zip', 'rar', 'gz', 'bz2','gif', 'jpg', 'jpeg', 'png', 'bmp'),
               );
               //最大文件大小
               $max_size = 3072000;
               require_once (dirname(__FILE__) . '/Upform.php');
               @$upyun = new UpYun($bucket_name,$upyun_key);
               $domain = $_SERVER['SERVER_NAME'];
               $opts = array();
               $opts['save-key'] =  $domain . '/{year}{mon}{day}/{hour}{min}{sec}/upload_{filemd5}{.suffix}';
               $opts['allow-file-type'] = implode(',',$ext_arr['image']);
               $opts['content-length-range'] = '1,'.$max_size;
               $opts['notify-url'] = 'http://'.$_SERVER['HTTP_HOST'].'/public/index/uynotify/getnotify';
               $opts['ext-param'] = 'admin, 1 ,0';
               if($dir_name=='image'){
                   $opts['x-gmkerl-thumb'] = '/rotate/auto';
               }
               $policy = $upyun->policyCreate($opts);
               $sign = $upyun->signCreate($opts);
               $action = $upyun->action();
               $file_path = $info['savepath'].$info['savename'];

               //提交数据
               $data = array();
               if(@function_exists('curl_file_create')){
                   //php版本5.5以上
                   $cfile = curl_file_create($file_path,$files['imgFile']['type'],$files['imgFile']['name']);
                   $data['file'] = $cfile;
               }else{
                   $data['file'] = '@'.$file_path;
               }
               $data['policy'] = $policy;
               $data['signature'] = $sign;

               //curl构造
               $ch = curl_init();
               curl_setopt($ch,CURLOPT_URL,$action);
               curl_setopt($ch,CURLOPT_POST,true);
               curl_setopt($ch,CURLOPT_POSTFIELDS,$data);
               curl_setopt($ch,CURLOPT_HEADER,false);
               curl_setopt($ch,CURLOPT_RETURNTRANSFER,true);
               $res = curl_exec($ch);
               curl_close($ch);
               $jsdata = json_decode($res);
//               dump($jsdata);
               $return_url = $upyun_domain . $jsdata -> url;
               $json=array('error' => 0, 'url' =>'//'.$return_url, 'original'=>'//'.$return_url, 'file'=>'//'.$return_url,'title'=>$title,'ext'=>$ext,'msg'=>'成功');

//               dump($jsdata['url']);
//               require_once ('D:\upupw7\htdocs\quguocms\admin\module\Config.php');
//               require_once ('D:\upupw7\htdocs\quguocms\admin\module\Upyun.php');
//               $bucketConfig = new Config('syhung', 'admin', 'admin');
//               $client = new Upyun($bucketConfig);
////               dump($client);
           }else{
               $json=array('error' => 0, 'url' =>$file, 'original'=>$file_url . $filetime . '/'.$info['savename'], 'file'=>$file,'title'=>$title,'ext'=>$ext,'msg'=>'成功');
           }
              /*hook*/
              $json=$this->plus_hook_replace('upload','index',$json);
              /*hook end*/

           //录入数据库
           $data['file']=$json['file'];
           $data['title']=$json['title'];
           $data['folder']=date('Y-m-d');
           $data['ext']=$ext;
           $data['size']=$info['size'];
           $data['time']=time();
           $id=model('upload')->add($data);
           $json['id']=$id;

           @header("Content-type:text/html");
           echo json_encode($json);
		       return;
        }

      }

    //输出消息
    public function error_msg($msg) {
    @header("Content-type:text/html");
		echo json_encode(array('error' => 1, 'message' => $msg));
		return;
	}

}

?>