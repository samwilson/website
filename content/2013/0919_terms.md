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

### Defined terms

```
Define a term: {{#forminput: form=Defined term }}

{{#ask: [[Category:Defined terms]] [[Definition::+]] |?Definition |format=table |mainlabel=Term }}

[[Category:Defined terms]]
```

### Form:Defined term

```
<noinclude>
Define a term: {{#forminput:form=Defined term}}
</noinclude><includeonly>

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

</includeonly>
[[Category:Defined terms]]
```

### Template:Defined term

```
{| class="wikitable"
!Definition:
|{{{Definition}}}
|}
{{#set: Definition={{{Definition}}} }}
{{#formlink: form=Defined term |link text=Edit this definition |target={{PAGENAME}} }}

[[Defined terms|View all defined terms]]

[[Category:Defined terms]]
```

### Template:Defined term inline

```
<includeonly><span class="defined-term" title="{{#show: {{{1|Defined_term}}} |?Definition }}">{{#if: {{{2|}}} | [[{{{1}}}|{{{2}}}]] | [[{{{1}}}]] }}</span></includeonly><noinclude>
```

== Usage ==

<code><nowiki>{{defined term inline|term}}</nowiki></code>

<code><nowiki>{{defined term inline|term|displayed text}}</nowiki></code>
</noinclude>
[[Category:Defined terms]]
```

### Property:Definition

```
A definition is a [[Has type::text]]ual explanation of the meaning of something.
```

### MediaWiki:Common.js

```
// The enclosing span has a title, and the anchor's one overrides it.
$("span.defined-term a").removeAttr("title");
```


### MediaWiki:Common.css

```
.defined-term a { cursor:help; color:#060 }
.defined-term a.new { color:red }
```

### Data pages

_These will be created by the form above, and need never be edited directly._

Dog:

```
{{Defined term|Definition=Not a cat.}}
```

Defined term:

```
{{Defined term|Definition=A word or phrase that has a specific and agreed-upon meaning.}}
```

Cat:

```
{{Defined term|Definition=Not a dog.}}
```