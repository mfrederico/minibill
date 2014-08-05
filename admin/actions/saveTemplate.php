<?php
/***********************************************/
/* All Code Copyright 2004 Matthew Frederico   */
/* Under the COPv1 License (Contribute or Pay) */
/***********************************************/
/* Author: matt@ultrize.com                    */
/* Url   : http://www.ultrize.com/minibill     */
/***********************************************/

//...... fixes php vulnerability in demo mode
if ($DEMO_MODE)
{
	$_POST['cat']['content'] = preg_replace("/{PHP}(.*){\/PHP}/sim",'<!-- PHP CODE STRIPPED FOR YOUR SAFETY, HAVE A NICE DAY -->',$_POST['cat']['content']);
}

$Q="REPLACE INTO templates SET 
	name='".addslashes($_POST['cat']['name'])."',
	stamp=UNIX_TIMESTAMP(),
	content='".addslashes($_POST['cat']['content'])."'";

mysql_query($Q);
$msg = base64_encode("#00A000|#FFFFFF|Template Saved");
header("Location: index.php?msg=$msg&page=templates");

?>
