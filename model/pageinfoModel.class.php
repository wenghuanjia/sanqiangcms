<?php
class  pageinfoModel extends commonMod {

	public function __construct()
    {
        parent::__construct();
    }

    public function media($title='',$keywords='',$description='') {
       $webConfig = $this->getWebConfig();
        if(empty($title)){
            $title=$webConfig['sitename'];
        }else{
            $title=$title.' - '.$webConfig['sitename'];
        }
        if(empty($keywords)){
            $keywords=$webConfig['keywords'];
        }
        if(empty($description)){
            $description=$webConfig['description'];
        }
        return array(
            'title'=>$title,
            'keywords'=>$keywords,
            'description'=>$description,
            );
    }
    public function getWebConfig()
    {

        $nowLang = __LANG__;
        $langId=$this->model->field('id')->table('lang')->where(['lang'=>$nowLang])->find()['id']; 
        $webConfig = $this->model->table('web_config')->where(['lang'=>$langId])->find(); 
        return $webConfig;
    }


}