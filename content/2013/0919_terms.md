---
id: 1789
title: Glossaries in Semantic MediaWiki
date: 2013-09-19T13:31:21+00:00
author: Sam Wilson
layout: post
guid: http://samwilson.id.au/?p=1789
permalink: /2013/09/19/terms/
views:
  - "8203"
dsq_thread_id:
  - "3857936000"
categories:
  - Open content
tags:
  - definitions
  - documentation
  - MediaWiki
  - Semantic MediaWiki
  - SemanticForms
  - Writing
---
A simple glossary system for Semantic MediaWiki that lets you define key terms for use in technical documentation etc.

A term can be referenced from anywhere in the wiki with `{{defined term inline|term}}`. This results in the term being displayed in a distinct style (green for instance) and linked to the term’s wikipage. When a user hovers over the link, a tooltip is displayed that contains the term’s definition.

**Software required:** [MediaWiki](http://www.mediawiki.org/), [ParserFunctions](http://www.mediawiki.org/wiki/Extension:ParserFunctions), [SemanticMediaWiki](http://www.mediawiki.org/wiki/Extension:SemanticMediaWiki), [SemanticForms](http://www.mediawiki.org/wiki/Extension:SemanticForms).

**Pages required:**

  1. Defined terms
  2. Template:Defined term
  3. Template:Defined term inline
  4. Form:Defined term
  5. Property:Definition
  6. MediaWiki:Common.css (to change the style of the inline terms)
  7. MediaWiki:Common.js (to fix the tooltip display)
  8. Category:Defined terms (no content actually required, but probably should at least be categorized)
  9. _Data pages_

<!--more-->

### Defined terms

<pre lang="text">Define a term: {{#forminput: form=Defined term }}

{{#ask: [[Category:Defined terms]] [[Definition::+]] |?Definition |format=table |mainlabel=Term }}

[[Category:Defined terms]]
</pre>

### Form:Defined term

<pre lang="text">&lt;noinclude>
Define a term: {{#forminput:form=Defined term}}
&lt;/noinclude>&lt;includeonly>

{{{for template|Defined term}}}
{| class="wikitable"
! Definition:
| {{{field|Definition|input type=textarea|mandatory|rows=6|autogrow}}}
|class="notes"|
* Be detailed.
* Do not start with the term itself; e.g. "A Widget is a..."
* End with a full stop.
|}
{{{end template}}}

&lt;/includeonly>
[[Category:Defined terms]]
</pre>

### Template:Defined term

<pre lang="text">{| class="wikitable"
!Definition:
|{{{Definition}}}
|}
{{#set: Definition={{{Definition}}} }}
{{#formlink: form=Defined term |link text=Edit this definition |target={{PAGENAME}} }}

[[Defined terms|View all defined terms]]

[[Category:Defined terms]]
</pre>

### Template:Defined term inline

<pre lang="text">&lt;includeonly><span class="defined-term" title="{{#show: {{{1|Defined_term}}} |?Definition }}">{{#if: {{{2|}}} | [[{{{1}}}|{{{2}}}]] | [[{{{1}}}]] }}</span>&lt;/includeonly>&lt;noinclude>

== Usage ==

<code>&lt;nowiki>{{defined term inline|term}}&lt;/nowiki></code>

<code>&lt;nowiki>{{defined term inline|term|displayed text}}&lt;/nowiki></code>
&lt;/noinclude>
[[Category:Defined terms]]
</pre>

### Property:Definition

<pre lang="text">A definition is a [[Has type::text]]ual explanation of the meaning of something.
</pre>

### MediaWiki:Common.js

<pre lang="text">// The enclosing span has a title, and the anchor's one overrides it.
$("span.defined-term a").removeAttr("title");
</pre>

### MediaWiki:Common.css

<pre lang="text">.defined-term a { cursor:help; color:#060 }
.defined-term a.new { color:red }
</pre>

### Data pages

_These will be created by the form above, and need never be edited directly._

Dog:

<pre lang="text">{{Defined term|Definition=Not a cat.}}
</pre>

Defined term:

<pre lang="text">{{Defined term|Definition=A word or phrase that has a specific and agreed-upon meaning.}}
</pre>

Cat:

<pre lang="text">{{Defined term|Definition=Not a dog.}}
</pre>