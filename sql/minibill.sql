CREATE TABLE `category` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `title` varchar(255) NOT NULL default '',
  `welcome_template` varchar(255) NOT NULL default '',
  `suspend_template` varchar(255) NOT NULL default '',
  `invoice_template` varchar(255) NOT NULL default '',
  `error_template` varchar(255) NOT NULL default '',
  `success_template` varchar(255) NOT NULL default '',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

CREATE TABLE `config` (
  `id` char(16) NOT NULL default '',
  `variable` char(255) NOT NULL default '',
  `value` char(255) NOT NULL default '',
  UNIQUE KEY `id_2` (`id`,`variable`),
  KEY `id` (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

CREATE TABLE `control_perms` (
  `control_name` char(255) NOT NULL,
  `control_type` char(255) NOT NULL,
  `control_desc` char(255) NOT NULL,
  `control_authLevel` int(10) unsigned NOT NULL,
  PRIMARY KEY  (`control_name`,`control_type`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

CREATE TABLE `mod_affiliate` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `name` char(64) NOT NULL,
  `email` char(64) NOT NULL,
  `password` char(64) NOT NULL,
  `rip` char(5) NOT NULL,
  `remote_key` char(32) NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `email` (`email`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

CREATE TABLE `mod_affiliate_data` (
  `afid` int(10) unsigned NOT NULL,
  `uniq_id` char(64) NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `grand_total` float(6,2) default NULL,
  `date` datetime NOT NULL,
  KEY `afid` (`afid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

CREATE TABLE `mod_affiliate_payouts` (
  `afid` int(10) unsigned NOT NULL,
  `amount` float(10,2) NOT NULL,
  `date` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

CREATE TABLE `mod_download` (
  `file_id` int(10) unsigned NOT NULL auto_increment,
  `item_id` int(10) unsigned NOT NULL default '0',
  `name` char(255) NOT NULL default '',
  `size` int(10) unsigned NOT NULL default '0',
  `fdate` datetime NOT NULL default '0000-00-00 00:00:00',
  `description` char(255) NOT NULL default '',
  `hidden` tinyint(4) NOT NULL default '0',
  `last_downloaded` datetime NOT NULL default '0000-00-00 00:00:00',
  `times_downloaded` int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`file_id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

CREATE TABLE `mod_download_data` (
  `file_id` int(10) unsigned NOT NULL default '0',
  `user_id` int(10) unsigned NOT NULL default '0',
  `is_downloaded` tinyint(4) NOT NULL default '0',
  `last_downloaded` datetime NOT NULL default '0000-00-00 00:00:00',
  `activated` date NOT NULL default '0000-00-00',
  `hidden` tinyint(4) NOT NULL default '0',
  UNIQUE KEY `user_id` (`user_id`,`file_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

CREATE TABLE `mod_forms` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `name` varchar(64) NOT NULL default '',
  `date` datetime NOT NULL default '0000-00-00 00:00:00',
  `item_id` int(10) unsigned NOT NULL default '0',
  `q_per_page` tinyint(3) unsigned NOT NULL default '0',
  `redirect` varchar(255) NOT NULL default '',
  `ask` enum('before','after') default 'after',
  `askfreq` enum('each product','once') NOT NULL default 'each product',
  PRIMARY KEY  (`id`),
  KEY `item_id` (`item_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

CREATE TABLE `mod_forms_answer` (
  `question_id` int(10) unsigned NOT NULL default '0',
  `form_id` int(10) unsigned NOT NULL default '0',
  `session_id` varchar(255) NOT NULL default '',
  `user_id` int(10) unsigned NOT NULL default '0',
  `uniq_id` varchar(255) NOT NULL default '',
  `answer` text NOT NULL,
  `answer_date` datetime NOT NULL default '0000-00-00 00:00:00',
  `price` float(5,2) NOT NULL default '0.00',
  KEY `form_id` (`form_id`,`question_id`,`session_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

CREATE TABLE `mod_forms_question` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `q_caption` text NOT NULL,
  `q_values` mediumtext NOT NULL,
  `q_type` enum('radio','text','checkbox','textarea','dropdown','multi-select') default NULL,
  `q_isRequired` enum('no','yes') default 'no',
  `form_id` int(10) unsigned NOT NULL default '0',
  `q_order` int(10) unsigned NOT NULL default '0',
  `q_width` varchar(5) NOT NULL default '',
  `q_height` varchar(6) NOT NULL default '',
  `q_style` varchar(255) NOT NULL default '',
  `q_preg` mediumtext NOT NULL,
  `q_errortext` varchar(255) NOT NULL default '',
  PRIMARY KEY  (`id`),
  KEY `form_id` (`form_id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

CREATE TABLE `mod_interface` (
  `remote_key` char(32) NOT NULL default '',
  `company` char(255) NOT NULL default '',
  `id` int(10) unsigned NOT NULL auto_increment,
  `address` char(128) NOT NULL default '',
  `city` char(128) NOT NULL default '',
  `state` char(128) NOT NULL default '',
  `zipcode` char(128) NOT NULL default '',
  `country` char(128) NOT NULL default '',
  `phone` char(128) NOT NULL default '',
  `email` char(128) NOT NULL default '',
  `hits` int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

CREATE TABLE `mod_interface_data` (
  `uniq_id` char(255) NOT NULL default '',
  `remote_order_id` char(255) NOT NULL default '',
  `remote_key` char(32) NOT NULL default '',
  KEY `remote_key` (`remote_key`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

CREATE TABLE `mod_interface_prodLookup` (
  `id` int(10) unsigned NOT NULL default '0',
  `remote_prod_id` char(255) default NULL,
  `remote_key` char(32) NOT NULL default '',
  PRIMARY KEY  (`id`),
  KEY `remote_key` (`remote_key`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

CREATE TABLE `mod_pdfreceipt` (
  `user_id` int(10) unsigned NOT NULL default '0',
  `uniq_id` int(10) unsigned NOT NULL default '0',
  `receipt_date` datetime NOT NULL default '0000-00-00 00:00:00',
  `receipt` blob,
  PRIMARY KEY  (`uniq_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

CREATE TABLE `mod_promocast` (
  `prod_id` int(10) unsigned NOT NULL,
  `credits` int(10) unsigned NOT NULL,
  `promoCredits` int(10) unsigned NOT NULL,
  PRIMARY KEY  (`prod_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

CREATE TABLE `mod_shipping` (
  `uniq_id` char(64) NOT NULL default '',
  `user_id` int(10) unsigned NOT NULL default '0',
  `firstname` char(255) NOT NULL default '',
  `lastname` char(255) NOT NULL default '',
  `address1` char(255) NOT NULL default '',
  `address2` char(255) NOT NULL default '',
  `city` char(255) NOT NULL default '',
  `state` char(255) NOT NULL default '',
  `zipcode` char(255) NOT NULL default '',
  `country` char(255) NOT NULL default '',
  `phone` char(255) NOT NULL default '',
  `fax` char(255) NOT NULL default '',
  `cell` char(255) NOT NULL default '',
  PRIMARY KEY  (`uniq_id`),
  KEY `uniq_id` (`uniq_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

CREATE TABLE `mod_shipping_data` (
  `ship_id` int(10) unsigned NOT NULL auto_increment,
  `uniq_id` char(20) NOT NULL default '',
  `user_id` int(10) unsigned NOT NULL default '0',
  `shipper` char(255) NOT NULL default '',
  `tracking_no` char(255) NOT NULL default '',
  `packaged` datetime NOT NULL default '0000-00-00 00:00:00',
  `shipped` datetime NOT NULL default '0000-00-00 00:00:00',
  PRIMARY KEY  (`ship_id`),
  KEY `uniq_id` (`uniq_id`),
  KEY `tracking_no` (`tracking_no`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

CREATE TABLE `orders` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `product_id` int(10) unsigned NOT NULL,
  `uniq_id` char(20) NOT NULL default '',
  `amount` float(8,2) default NULL,
  `quantity` int(10) unsigned NOT NULL default '0',
  `date_purchased` datetime NOT NULL default '0000-00-00 00:00:00',
  `user_id` int(10) unsigned NOT NULL default '0',
  `last_billed` date NOT NULL default '0000-00-00',
  `payment_due` date NOT NULL default '0000-00-00',
  `gateway` char(255) NOT NULL default '',
  `recurring` int(5) unsigned NOT NULL default '0',
  `status` enum('paid','due','cancel','suspend') default 'paid',
  `mailer` char(64) NOT NULL default '',
  `payfail` tinyint(3) unsigned NOT NULL default '0',
  `contract` int(10) unsigned NOT NULL default '0',
  `ip` char(24) NOT NULL default '',
  PRIMARY KEY  (`id`),
  KEY `uniq_id` (`uniq_id`),
  KEY `item_id` (`product_id`)
) ENGINE=MyISAM AUTO_INCREMENT=70 DEFAULT CHARSET=latin1;

CREATE TABLE `products` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `title` varchar(255) NOT NULL default '',
  `item_desc` text NOT NULL,
  `category_id` int(10) unsigned NOT NULL default '0',
  `price` float(7,2) NOT NULL default '0.00',
  `weight` float(4,1) default NULL,
  `stock` int(11) NOT NULL default '0',
  `is_recurring` enum('no','Daily','Weekly','Monthly','Quarterly','Semi','Yearly') default NULL,
  `contract` int(10) unsigned NOT NULL default '0',
  `item_code` varchar(255) NOT NULL default '',
  PRIMARY KEY  (`id`),
  KEY `category_id` (`category_id`)
) ENGINE=MyISAM AUTO_INCREMENT=138 DEFAULT CHARSET=latin1;

CREATE TABLE `sessions` (
  `id` char(64) NOT NULL,
  `lastmodified` datetime NOT NULL,
  `content` text,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

CREATE TABLE `system_config` (
  `conf_id` char(64) NOT NULL,
  `conf_var` char(255) NOT NULL default '',
  `conf_value` char(255) default NULL,
  PRIMARY KEY  (`conf_id`,`conf_var`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

CREATE TABLE `templates` (
  `title` varchar(255) NOT NULL,
  `stamp` int(10) unsigned NOT NULL default '0',
  `content` mediumtext NOT NULL,
  `id` int(10) unsigned NOT NULL auto_increment,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

CREATE TABLE `users` (
  `id` int(10) unsigned zerofill NOT NULL auto_increment,
  `email` varchar(255) NOT NULL default '',
  `password` varchar(64) NOT NULL default '',
  `firstname` varchar(255) NOT NULL default '',
  `lastname` varchar(255) NOT NULL default '',
  `company` char(255) NOT NULL,
  `address` varchar(255) NOT NULL default '',
  `city` varchar(255) NOT NULL default '',
  `state` varchar(255) NOT NULL default '',
  `country` varchar(255) NOT NULL default '',
  `zipcode` varchar(255) NOT NULL default '',
  `phone` varchar(255) NOT NULL default '',
  `comments` text,
  `orderFrom` varchar(64) NOT NULL default '',
  `cardnum` varchar(255) NOT NULL default '',
  `cc_exp_yr` int(4) NOT NULL default '0',
  `cc_exp_mo` int(2) NOT NULL default '0',
  `user_stamp` datetime NOT NULL default '0000-00-00 00:00:00',
  `last_purchase_stamp` datetime NOT NULL default '0000-00-00 00:00:00',
  PRIMARY KEY  (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=MyISAM AUTO_INCREMENT=53 DEFAULT CHARSET=latin1;

INSERT INTO config SET id='company',variable='logo',value='img/minibill_logo.png';
INSERT INTO config SET id='company',variable='domain',value='ultrize.com';
INSERT INTO config SET id='company',variable='contact_email',value='matt@ultrize.com';
INSERT INTO config SET id='company',variable='office_hours',value='9am-6pm CST';
INSERT INTO config SET id='company',variable='phone',value='(000)000-0000';
INSERT INTO config SET id='company',variable='zipcode',value='78412';
INSERT INTO config SET id='company',variable='state',value='TX';
INSERT INTO config SET id='company',variable='city',value='Corpus Christi';
INSERT INTO config SET id='company',variable='address',value='1234 Test Street';
INSERT INTO config SET id='company',variable='name',value='MiniBill';
INSERT INTO config SET id='company',variable='country',value='US';
INSERT INTO config SET id='currency',variable='char',value='$';
INSERT INTO config SET id='currency',variable='code',value='USD';
INSERT INTO config SET id='demo',variable='mode';
INSERT INTO config SET id='desc',variable='merchant',value='Merchant Account Settings';
INSERT INTO config SET id='desc',variable='mbadmin',value='Minibill Administrator Settings (login/password security etc.)';
INSERT INTO config SET id='desc',variable='demo',value='Demo Mode Parameters';
INSERT INTO config SET id='desc',variable='company',value='Company parameters and information';
INSERT INTO config SET id='desc',variable='desc',value='Variable category descriptions / HTML';
INSERT INTO config SET id='desc',variable='plugins',value='Turn plugins on and off';
INSERT INTO config SET id='desc',variable='invoice',value='Invoicing variables, invoice from email address, etc';
INSERT INTO config SET id='desc',variable='help',value='Company support information';
INSERT INTO config SET id='desc',variable='secure',value='HTTPS Information / SSL Paths';
INSERT INTO config SET id='desc',variable='currency',value='Currency information';
INSERT INTO config SET id='desc',variable='mod_download',value='off';
INSERT INTO config SET id='global',variable='upload_dir',value='/tmp';
INSERT INTO config SET id='help',variable='support_url',value='http://www.ultrize.com/forums/';
INSERT INTO config SET id='help',variable='support_email',value='minibill01@ultrize.com';
INSERT INTO config SET id='invoice',variable='suspend_template',value='billing_suspend.html';
INSERT INTO config SET id='invoice',variable='cancel_template',value='cancellation.html';
INSERT INTO config SET id='invoice',variable='template',value='invoice.html';
INSERT INTO config SET id='invoice',variable='pay_fail',value='3';
INSERT INTO config SET id='invoice',variable='email',value='minibill01@ultrize.com';
INSERT INTO config SET id='invoice',variable='send_advance';
INSERT INTO config SET id='invoice',variable='friendly',value='Ultrize LLC Invoice';
INSERT INTO config SET id='mbadmin',variable='login',value='admin';
INSERT INTO config SET id='mbadmin',variable='pass',value='admin';
INSERT INTO config SET id='merchant',variable='authnet_pass',value='yourpass';
INSERT INTO config SET id='merchant',variable='authnet_id',value='yourid';
INSERT INTO config SET id='merchant',variable='paypal_auto_recur',value='1';
INSERT INTO config SET id='merchant',variable='authnet_test';
INSERT INTO config SET id='merchant',variable='use_authnet';
INSERT INTO config SET id='merchant',variable='use_paypal',value='1';
INSERT INTO config SET id='merchant',variable='paypal_id',value='matt@ultrize.com';
INSERT INTO config SET id='merchant',variable='paypal_url',value='https://www.sandbox.paypal.com/us/cgi-bin/webscr';
INSERT INTO config SET id='merchant',variable='test',value='1';
INSERT INTO config SET id='merchant',variable='paypal_ipn_log',value='/tmp/ipn_log.txt';
INSERT INTO config SET id='mod_cart',variable='image_dir',value='/var/www/html/dev/cartimg/';
INSERT INTO config SET id='mod_cart',variable='featured_products',value='1,2';
INSERT INTO config SET id='mod_cart',variable='image_url',value='cartimg/';
INSERT INTO config SET id='mod_download',variable='download_dir',value='/tmp/';
INSERT INTO config SET id='mod_promocast',variable='message_ctr',value='http://localhost/promocast/';
INSERT INTO config SET id='paypal',variable='no_shipping',value='1';
INSERT INTO config SET id='paypal',variable='no_note',value='1';
INSERT INTO config SET id='paypal',variable='return',value='http://localhost/minibill/';
INSERT INTO config SET id='paypal',variable='image_url',value='http://localhost/minibill/img/minibill_logo.png';
INSERT INTO config SET id='paypal',variable='cancel_return',value='http://localhost/cancel.php';
INSERT INTO config SET id='paypal',variable='currency_code',value='USD';
INSERT INTO config SET id='paypal',variable='src',value='1';
INSERT INTO config SET id='paypal',variable='cbt',value='Finished';
INSERT INTO config SET id='paypal',variable='notify_url',value='http://localhost/minibill/index.php?action=ipn';
INSERT INTO config SET id='paypal',variable='rm',value='2';
INSERT INTO config SET id='plugins',variable='mod_stats',value='on';
INSERT INTO config SET id='plugins',variable='mod_forms',value='off';
INSERT INTO config SET id='plugins',variable='mod_cart',value='on';
INSERT INTO config SET id='plugins',variable='mod_interface',value='on';
INSERT INTO config SET id='plugins',variable='mod_multiface',value='off';
INSERT INTO config SET id='plugins',variable='mod_pdfreceipt',value='on';
INSERT INTO config SET id='plugins',variable='mod_download',value='off';
INSERT INTO config SET id='plugins',variable='mod_timesheet',value='off';
INSERT INTO config SET id='plugins',variable='mod_affiliate',value='on';
INSERT INTO config SET id='plugins',variable='mod_shipping',value='on';
INSERT INTO config SET id='plugins',variable='mod_null',value='off';
INSERT INTO config SET id='plugins',variable='mod_promocast',value='on';
INSERT INTO config SET id='secure',variable='url',value='http://localhost/minibill/';
INSERT INTO config SET id='secure',variable='cart',value='index.php?page=cart';
-- MySQL dump 10.9
--
-- Host: localhost    Database: minibill_dev
-- ------------------------------------------------------
-- Server version	4.1.20

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Dumping data for table `config`
--

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

