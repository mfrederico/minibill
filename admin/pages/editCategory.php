<?php
/***********************************************/
/* All Code Copyright 2004 Matthew Frederico   */
/* Under the COPv1 License (Contribute or Pay) */
/***********************************************/
/* Author: matt@ultrize.com                    */
/* Url   : http://www.ultrize.com/minibill     */
/***********************************************/


$X->assign('title',"EDIT CATEGORY");

$Q="SELECT name FROM templates";
$tres = mysql_query($Q);
while($tdata = mysql_fetch_assoc($tres))
	$tpls[] = $tdata;

$Q="SELECT * FROM category WHERE category_id='$_GET[category_id]' LIMIT 1";
$cat = mysql_fetch_assoc(mysql_query($Q));
$title = $cat[title];
unset($cat[title]);
unset($cat[category_id]);

foreach($cat as $key=>$val)
{
	if (preg_match("/_template/",$key))
	{
		$Q="SELECT content FROM templates WHERE name='$val' LIMIT 1";
		$res = mysql_query($Q);
		list($content) = mysql_fetch_row($res);

		$outcat[$key]['name'] = $val;
		$outcat[$key]['content'] = $content;
	}
}

$X->assign('tpls',$tpls);
$X->assign('cat',$outcat);
$X->assign('category_id',$_GET[category_id]);
$X->assign('title',$title);

?>
