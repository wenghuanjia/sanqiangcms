<?php
header("content-type:text/html; charset=utf-8");
@date_default_timezone_set('PRC');

if(!empty($_SERVER['HTTP_X_REWRITE_URL']) ){
	$_SERVER['REQUEST_URI'] = $_SERVER['HTTP_X_REWRITE_URL'];
} else if (!isset($_SERVER['REQUEST_URI'])) {
	if (isset($_SERVER['argv']))
	{
		$_SERVER['REQUEST_URI'] = $_SERVER['PHP_SELF'] .'?'. $_SERVER['argv'][0]; 
	}else{
		$_SERVER['REQUEST_URI'] = $_SERVER['PHP_SELF'] .'?'. $_SERVER['QUERY_STRING']; 
	} 
}

//定义框架目录
define('CP_PATH', dirname(__file__) . '/system/'); //指定内核目录
require (dirname(__file__) . '/inc/config.php');
require (CP_PATH . 'core/cpApp.class.php');

//处理多语言
$lang=$config['LANG_DEFAULT'];
if($config['LANG_OPEN']){
	$lang_file=scandir($config['LANG_PACK_PATH']);
	$url=$_SERVER['REQUEST_URI'];
	foreach ($lang_file as $value) {
		$url=strtolower($url);
		if(strstr($url,'/'.$value)){
			$lang=$value;
			$url = preg_replace('`/'.$value.'`', '', $url,1);
			break;
		}
	}
	$_SERVER['REQUEST_URI']=$url;
}
define('__LANG__', $lang);

//处理手机版
if($config['MOBILE_OPEN']&&$config['MOBILE_DOMAIN']){
	 $user_agent = $_SERVER['HTTP_USER_AGENT'];       
    $mobile_agents = Array("240x320", "acer", "acoon",   
        "acs-", "abacho", "ahong", "airness", "alcatel",   
        "amoi", "android", "anywhereyougo.com",   
        "applewebkit/525", "applewebkit/532", "asus",   
        "audio", "au-mic", "avantogo", "becker", "benq",   
        "bilbo", "bird", "blackberry", "blazer", "bleu",   
        "cdm-", "compal", "coolpad", "danger", "dbtel",   
        "dopod", "elaine", "eric", "etouch", "fly ",   
        "fly_", "fly-", "go.web", "goodaccess",   
        "gradiente", "grundig", "haier", "hedy",   
        "hitachi", "htc", "huawei", "hutchison",   
        "inno", "ipad", "ipaq", "ipod", "jbrowser",   
        "kddi", "kgt", "kwc", "lenovo", "lg ", "lg2",   
        "lg3", "lg4", "lg5", "lg7", "lg8", "lg9", "lg-",   
        "lge-", "lge9", "longcos", "maemo", "mercator",   
        "meridian", "micromax", "midp", "mini", "mitsu",   
        "mmm", "mmp", "mobi", "mot-", "moto", "nec-",   
        "netfront", "newgen", "nexian", "nf-browser",   
        "nintendo", "nitro", "nokia", "nook", "novarra",   
        "obigo", "palm", "panasonic", "pantech", "philips",   
        "phone", "pg-", "playstation", "pocket", "pt-",   
        "qc-", "qtek", "rover", "sagem", "sama", "samu",   
        "sanyo", "samsung", "sch-", "scooter", "sec-",   
        "sendo", "sgh-", "sharp", "siemens", "sie-",   
        "softbank", "sony", "spice", "sprint", "spv",   
        "symbian", "tablet", "talkabout", "tcl-",   
        "teleca", "telit", "tianyu", "tim-", "toshiba",   
        "tsm", "up.browser", "utec", "utstar", "verykool",   
        "virgin", "vk-", "voda", "voxtel", "vx", "wap",   
        "wellco", "wig browser", "wii", "windows ce",   
        "wireless", "xda", "xde", "zte");       
    $is_mobile = false;       
    foreach ($mobile_agents as $device) {         
        if (stristr($user_agent,  $device)) {           
            $is_mobile = true;           
            break;         
        }       
    }       
   

	if($is_mobile){
		define('MOBILE', true);
	}else{
		define('MOBILE', false);
	}
}else{
	define('MOBILE', false);
}

//定义自定义目录
$root = $config['URL_HTTP_HOST'] . str_replace(basename($_SERVER["SCRIPT_NAME"]), '', $_SERVER["SCRIPT_NAME"]);
define('__ROOT__', substr($root, 0, -1));
define('__ROOTDIR__', strtr(dirname(__FILE__),'\\','/'));
define('__UPDIR__', strtr(dirname(__FILE__),'\\','/upload/'));
define('__TPL__', __ROOT__.'/'.$config['TPL_TEMPLATE_PATH']);
define('__UPL__', __ROOT__.'/upload/');

//实例化入口
$app = new cpApp($config);
Lang::init($config);
$app->run();

?>