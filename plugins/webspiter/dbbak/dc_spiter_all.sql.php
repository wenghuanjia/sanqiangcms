<?php exit;?>
CREATE TABLE  `dc_plugin_visitor` (`id` INT NOT NULL AUTO_INCREMENT ,`time` VARCHAR( 11 ) NOT NULL ,`count` INT NOT NULL ,PRIMARY KEY (  `id` )) ENGINE = MYISAM ;
CREATE TABLE  `dc_plugin_spiter` (`id` INT NOT NULL AUTO_INCREMENT ,`time` INT NOT NULL ,`baidu` INT NOT NULL ,`google` INT NOT NULL ,`soso` INT NOT NULL ,PRIMARY KEY (  `id` )) ENGINE = MYISAM ;
