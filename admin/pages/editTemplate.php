<?php
/***********************************************/
/* All Code Copyright 2004 Matthew Frederico   */
/* Under the COPv1 License (Contribute or Pay) */
/***********************************************/
/* Author: matt@ultrize.com                    */
/* Url   : http://www.ultrize.com/minibill     */
/***********************************************/

$X->assign('title','EDIT TEMPLATE');


$Q="SELECT * FROM templates WHERE name='$_GET[name]' LIMIT 1";
$res = mysql_query($Q);
$cat = mysql_fetch_assoc($res);
$cat['content'] = stripslashes($cat['content']);
$cat['name'] = stripslashes($cat['name']);
$X->assign('cat',$cat);

?>
