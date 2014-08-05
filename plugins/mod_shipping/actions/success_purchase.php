<?php
/***********************************************/
/* All Code Copyright 2004 Matthew Frederico   */
/* Under the COPv1 License (Contribute or Pay) */
/***********************************************/
/* Author: matt@ultrize.com                    */
/* Url   : http://www.ultrize.com/minibill     */
/***********************************************/

if (isset($_REQUEST['shipping']))
{
	$shipping				= $_REQUEST['shipping'];
	$shipping['uniq_id']	= $_SESSION['order_id'];

	if (count($shipping))
	{
		$Q = buildSet($shipping,'','mod_shipping');
		mysql_query($Q);
	}
	$sdata['uniq_id'] = $_SESSION['order_id'];
	$sdata['user_id'] = $_SESSION['id'];
	$Q=buildSet($sdata,'','mod_shipping_data');
	mysql_query($Q);
}

?>
