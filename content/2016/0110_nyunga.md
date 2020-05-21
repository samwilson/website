---
id: 2462
title: Nyunga words on Wiktionary
date: 2016-01-10T17:11:24+00:00
author: Sam Wilson
layout: post
guid: http://samwilson.id.au/?p=2462
permalink: /2016/01/10/nyunga/
categories:
  - Open content
tags:
  - definitions
  - dictionaries
  - Noongarpedia
  - Nyunga
  - wikimedia
  - Wiktionary
  - words
---
I’ve pretty much finished moving a set of ‘template’<dfn title="More commonly spelled 'Noongar', but the ISO and therefore Wiktionary uses this spelling">Nyunga-language Wiktionary</a> entries into my userspace on Wiktionary, from where they can be copied into mainspace. There are a few dramas with differing character-sets between definitions in some of the word lists I’ve got, so a couple of letters are missing. There’s plenty that are there though, and mainly I’m interested now to see if this idea of copying, pasting, and then copy-editing these entries is going to be a sensible workflow.</p> 

<p>
  I thought about bulk importing these directly into place, but the problem with that is (quite apart from the first fact that none of these wordlists have machine-readable part-of-speech data) that almost all of them are going to need cleaning up and improving. For example, “<a href="https://en.wiktionary.org/wiki/User:Samwilson/Noongarpedia/K_entries#kabain_nin_nana_kulert">kabain nin nana kulert</a>” is in there as an entry. It means “perhaps someone ate it and went away”, and (I’m guessing) isn’t an idiom and so really oughtn’t have it’s own entry. It <em>can</em> however be used as a citation in every single one of its constituent words. That’s something that I think is best left up to a human, rather that forcing a human to clean up a bot’s mistakes. Or take “<a href="https://en.wiktionary.org/wiki/User:Samwilson/Noongarpedia/T_entries#tandaban">tandaban</a>” which has a definition of “jump, to [9]” (and the square bracket references are throughout this dataset and are not explained anywhere that I’ve been able to find). This should just be translated as “jump” with a link to the English verb; again, a script could handle that, but the myriad of incoming formats would take too much time to code.
</p>

<p>
  Maybe I’m just not being clever enough about preparing the data, and an import script, in a rich enough way. But that could take ages before ever this data sees the light of day on Wiktionary; the approach I’ve used means that it’s there now for anyone who wants to work with it. There are also so very many improvements that a human editor can make along the way, that it seems we’ll have <em>better</em> data for fewer words… and that seems to be the correct trade-off. Wiktionary is a ‘forever’ project, after all!
</p>

<p>
  Of course, the plan is to be able to <em>extract</em> the data after it’s been put in its proper place, and I’ve started work on a PHP library for doing just that. I’d rather do the code-work on that end of it, and put in the time for a human-mediated import at the beginning end.
</p>

<p>
  All of this is a long-winded way of putting out there on the web, in this tiny way, an invitation for anyone to come and help see if this import is going to work at all! <a href="https://en.wiktionary.org/wiki/Wiktionary:About_Nyunga#Entries">Will you help?</a>
</p>