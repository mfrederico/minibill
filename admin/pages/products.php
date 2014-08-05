<?php
/***********************************************/
/* All Code Copyright 2004 Matthew Frederico   */
/* Under the COPv1 License (Contribute or Pay) */
/***********************************************/
/* Author: matt@ultrize.com                    */
/* Url   : http://www.ultrize.com/minibill     */
/***********************************************/


$X->assign('title','PRODUCT LIST');

//...... Load all categories into an array
$c = 1;
$Q = "SELECT category_id,title FROM category";
$res = mysql_query($Q);
while($cat = mysql_fetch_assoc($res)) 
{
	$c = $cat[category_id];
	$cats[$c] = $cat;
}

$Q="SELECT * FROM products ORDER BY category_id";
$res = mysql_query($Q);

while($prods = mysql_fetch_assoc($res))
{
	$pcid = $prods['category_id'];
	$prods['category'] = $cats[$pcid];
	$prods['title'] = htmlentities(stripslashes($prods['title']));
	$prods['item_desc'] = htmlentities(stripslashes($prods['item_desc']));
	$products[] = $prods;
}

$submenu['categories']	= "CATEGORIES";
$submenu['addProduct']	= "NEW PRODUCT";
$submenu['importProducts']	= "IMPORT PROD CSV";

$X->assign('submenu',$submenu);
$X->assign('products',$products);


?>
