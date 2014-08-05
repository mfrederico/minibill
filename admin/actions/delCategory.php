<?php
/***********************************************/
/* All Code Copyright 2004 Matthew Frederico   */
/* Under the COPv1 License (Contribute or Pay) */
/***********************************************/
/* Author: matt@ultrize.com                    */
/* Url   : http://www.ultrize.com/minibill     */
/***********************************************/


if (!$DEMO_MODE)
{
	$Q="DELETE FROM category WHERE category_id='$_GET[category_id]'";
	print $Q;
	mysql_query($Q);
}

$msg = base64_encode("#00A000|#FFFFFF|Category Deleted");

header("Location: $_SERVER[HTTP_REFERER]&$msg");

?>
