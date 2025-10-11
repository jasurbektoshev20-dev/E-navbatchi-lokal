<?php
/**
 * Smarty plugin
 * @package Smarty
 * @subpackage plugins
 */


/**
 * Smarty strip_tags modifier plugin
 *
 * Type:     modifier<br>
 * Name:     strip_tags<br>
 * Purpose:  strip html tags from text
 * @link http://smarty.php.net/manual/en/language.modifier.strip.tags.php
 *          strip_tags (Smarty online manual)
 * @param string
 * @param boolean
 * @return string
 */
function smarty_modifier_strpos($string, $regex)
{
	return strpos($string,$regex);
}

/* vim: set expandtab: */

?>
