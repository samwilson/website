---
id: 450
title: Extracting coordinates from single 60 bit hex numbers
date: 2010-07-01T16:24:21+00:00
author: Sam Wilson
layout: post
guid: http://samwilson.id.au/?p=450
permalink: /2010/07/01/db2-coordinate-scraping/
views:
  - "262"
categories:
  - Programming
tags:
  - bc_base_convert
  - GIS
  - MGA
  - Morton codes
  - PHP
  - UTM
  - Work
  - Z-order (curve)
---
Thanks to the [wonderful people on Stackoverflow](http://stackoverflow.com/questions/3130445/can-anyone-convert-this-60-bit-value-to-geographic-coordinates), I&#8217;m making some progress with figuring out how some geographic information is saved in a DB2 database that I&#8217;m working with.

it turns out that, rather than using the spatial functionality of DB2 (which would make sense, but considering the source of this database, I wouldn&#8217;t ask for too much), coordinate pairs are being stored as [Morton codes](http://en.wikipedia.org/wiki/Z-order_%28curve%29) in a 16-byte Character column.

So far, I&#8217;ve sorted out decoding the coordinate values, and can shuffle points predictably on my test map; now I&#8217;m just trying to figure out what _grid_ that these coordinates are on. I&#8217;m fairly certain (not that I know anything about these things) that it&#8217;s somehow related to the MGA grid, because 0 east is at almost exactly 114&deg;, which is where MGA zone 50 starts (the &#8216;almost&#8217; comes from my point-and-click measurement technique).

But I don&#8217;t know where I&#8217;m going next; I&#8217;ll leave it till the morning.

<p style="text-align:center">
  * * *
</p>

My test code for this has been in PHP, and I needed something to convert big numbers between bases; hadn&#8217;t realised that the BC math library didn&#8217;t include `base_convert()`, so I found the one below.

<pre lang="php">/**
 * Convert an arbitrary-length number between arbitrary bases.
 * Copied, and very slightly translated, from
 * http://www.technischedaten.de/pmwiki2/pmwiki.php?n=Php.BaseConvert
 *
 * @param $value
 * @param $from_base
 * @param $to_base
 * @return string
 */
function bc_base_convert($value, $from_base, $to_base)
{
	$valid_digits = '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';
	if (min($from_base, $to_base) &lt; 2)
	{
		trigger_error('Bad Format min: 2', E_USER_ERROR);
	}
	if (max($from_base, $to_base) > strlen($valid_digits))
	{
		trigger_error('Bad Format max: ' . strlen($valid_digits), E_USER_ERROR);
	}
	$dezi = '0';
	$level = 0;
	$result = '';
	$value = trim(strval($value), "\r\n\t +");
	$sign = ('-' === $value{0}) ? '-' : '';
	$value = ltrim($value, "-0");
	$len = strlen($value);
	for ($i = 0; $i &lt; $len; $i++)
	{
		$wert = strpos($valid_digits, $value{$len - 1 - $i});
		if (FALSE === $wert)
		{
			trigger_error('Bad Char in input 1', E_USER_ERROR);
		}
		if ($wert >= $from_base)
		{
			trigger_error('Bad character in input 2', E_USER_ERROR);
		}
		$dezi = bcadd($dezi, bcmul(bcpow($from_base, $i), $wert));
	}
	if ($to_base == 10)
	{
		return $sign . $dezi; // Shortcut for base 10
	}
	while (1 !== bccomp(bcpow($to_base, $level++), $dezi));
	for ($i = $level - 2; $i >= 0; $i--)
	{
		$factor = bcpow($to_base, $i);
		$zahl = bcdiv($dezi, $factor, 0);
		$dezi = bcmod($dezi, $factor);
		$result .= $valid_digits{$zahl};
	}
	$result = empty($result) ? '0' : $result;
	return $sign . $result;
}
</pre>