<?php
/*
    [5] => Array
        (
            [id] => 0000000001
            [user_id] => 1
            [uniq_id] => 799959648502
            [email] => matt@ultrize.com
            [firstname] => Matthew
            [lastname] => Frederico
            [amount] => 25.00
            [date_purchased] => 2006-09-11 12:33:16
            [last_billed] => 2006-09-11
            [quantity] => 1
        )
*/

for ($i = 0;$i < count($X->_tpl_vars['orders']);$i++)
{
	$order = $X->_tpl_vars['orders'][$i];

	$Q="SELECT tracking_no FROM mod_shipping_data WHERE uniq_id='{$order['uniq_id']}' LIMIT 1";
	list($is_shipped) = mysql_fetch_row(mysql_query($Q));
	$X->_tpl_vars['orders'][$i]['is_shipped'] = ($is_shipped) ? $is_shipped : 0;
}
	
$X->assign('orders',$X->_tpl_vars['orders']);

?>
