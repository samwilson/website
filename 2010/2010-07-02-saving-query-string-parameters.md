---
id: 463
title: Saving query string parameters between requests
date: 2010-07-02T16:39:31+00:00
author: Sam Wilson
layout: post
guid: http://samwilson.id.au/?p=463
permalink: /2010/07/02/saving-query-string-parameters/
views:
  - "3692"
categories:
  - Programming
tags:
  - columns
  - Kohana
  - redirecting
  - sessions
  - sorting
  - URI
  - WebDB
  - Zend
---
> _In which I try to implement column sorting in WebDB, but end up building a general system for persisting query string variables between HTTP requests. Sort of._

In the old, Zend-based, WebDB, column sort order was passed as a `$_GET` parameter and then stored in per-table variables in `$_SESSION`. In the index controller, both were checked when a table was loaded:

<pre lang="php">/* application/controllers/IndexController.php */
$orderby = ($this->_hasParam('orderby')) ? $this->_getParam('orderby') : $_SESSION['ordering'][$this->tableName]['orderby'];
$orderdir = ($this->_hasParam('orderdir')) ? $this->_getParam('orderdir') : $_SESSION['ordering'][$this->tableName]['orderdir'];
</pre>

The advantage, of course, being that a user could sort by a column, go off somewhere else (into a record to edit it, say), and come back to the table view and have the previous sort order be remembered. Good. But annoying, too, because a table could be sorted _without a sort directive being present in the URI_. Not good, because the URI doesn&#8217;t reflect exactly the resource that one is looking at; one can&#8217;t bookmark that page, for instance.

We need the best of both:

  1. remembering the users&#8217; sort preferences between requests; and
  2. ensuring that the current URI is an accurate identifier for the current resource.

The obvious answer seems to be to store sort directives in the session, and _redirect_ requests to a proper, complete, URI if the current one doesn&#8217;t already contain those directives. Sounds good.

However, before jumping in and coding that: the same ideas apply to the filter variables, which are currently passed as `$_GET` parameters. So could we generalize this idea of **storing parameters in $\_SESSION but only ever using them from $\_GET**? (Oh, and I should point out that the validation of these parameters happens after this, and we&#8217;re not worried about that right now.) Can this be done in a way so that the rest of the application doesn&#8217;t need to know anything about the session stuff, and can just use `$_GET['foo']` and `href="?foo=bar"` in whatever way it wants?

A first draft:

<pre lang="php">// To be called from Controller_WeBDB::before()
if (count($_GET)>0)
{
	$_SESSION['qs'] = $_GET;
}
elseif (isset($_SESSION['qs']) && count($_SESSION['qs'])>0)
{
	$query = URL::query($_SESSION['qs']);
	$_SESSION['qs'] = array();
	$uri = URL::base(FALSE, TRUE).$this->request->uri.$query;
	$this->request->redirect($uri);
}
</pre>

Which sort of works, except that it&#8217;s not possible to specify only _some_ of the parameters (i.e. either load them all from `$_GET` or all from `$_SESSION`, which isn&#8217;t what we want).

A final draft (a new method in [`Controller_WebDB`](http://samwilson.id.au/kohana/guide/api/Controller_WebDB#_query_string_session "View the current API documentation, which may be different to how it was when this post was written."), called from `Controller_WebDB::before()`):

<pre lang="php">/**
 * Save and load query string (i.e. `$_GET`) variables from the `$_SESSION`.
 * The idea is to carry query string variables between requests, even
 * when those variables have been omitted in the URI.
 *
 * 1. If a request has query string parameters, they are saved to
 *    `$_SESSION['qs']`, merging with whatever is already there.
 * 2. If there are parameters saved in `$_SESSION['qs']`, and if they're
 *    not already in the query string, add them and redirect the request to
 *    the resulting URI.
 *
 * @return void
 */
private function _query_string_session()
{
	// Save the query string, adding to what's already saved.
	if (count($_GET)>0)
	{
		$existing_saved = (isset($_SESSION['qs'])) ? $_SESSION['qs'] : array();
		$_SESSION['qs'] = array_merge($existing_saved, $_GET);
	}

	// Load query string variables, unless they're already present.
	if (isset($_SESSION['qs']) && count($_SESSION['qs'])>0)
	{
		$has_new = FALSE; // Whether there's anything in SESSION that's not in GET
		foreach ($_SESSION['qs'] as $key=>$val)
		{
			if (!isset($_GET[$key]))
			{
				$_GET[$key] = $val;
				$has_new = TRUE;
			}
		}
		if ($has_new)
		{
			$query = URL::query($_SESSION['qs']);
			$_SESSION['qs'] = array();
			$uri = URL::base(FALSE, TRUE).$this->request->uri.$query;
			$this->request->redirect($uri);
		}
	}
}
</pre>

To clear a parameter, it obviously has to actually be _set_, and not just omitted from the URI. Is this going to be a problem?

The other glaring issue with the above code seems to be the insecurity in storing unvalidated content in `$_SESSION`, but as this content is only ever being fed back into the URI, I don&#8217;t think there&#8217;s too much of a problem there. Nowhere else in WebDB will use `$_SESSION['qs']` — everything will only use `$_GET`, and be responsible for validation.

Well, I seem to have got somewhere with the issue of saving `$_GET` parameters between requests, but nowhere yet with what I started out with: sorting the columns! However, this is now going to be a pretty straight-forward matter of adding links to column headers that toggle `?orderby=asc` etc. I&#8217;ll get to it next first thing next week.