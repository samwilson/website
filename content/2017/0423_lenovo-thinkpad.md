---
id: 2815
title: Lenovo ThinkPad Carbon X1 (gen. 5)
date: 2017-04-23T11:37:16+00:00
author: Sam Wilson
layout: post
guid: https://samwilson.id.au/?p=2815
permalink: /2017/04/23/lenovo-thinkpad-carbon-x1-gen-5/
categories:
  - Open content
  - Programming
tags:
  - Carbon X1
  - KDE
  - Kubuntu
  - laptops
  - Lenovo
  - Linux
  - ThinkPad
---
Five years, two months, and 22 days after [the last time](https://samwilson.id.au/2012/01/28/goodbye-apple/), I’m retiring my laptop and moving to a new one. This time it’s a Lenovo ThinkPad Carbon X1, fifth generation (manufactured in March this year, if the packaging is to be believed). This time, I’m not switching operating systems (although I am switching desktop’s, to KDE, because I hear Ubuntu is going all-out normal Gnome sometime soon).

So I kicked off the download of `<a href="http://kubuntu.org/">kubuntu</a>-16.04.2-desktop-amd64.iso` and while it was going started up the new machine. I jumped straight into bios to set the boot order (putting ‘Windows boot manager’ right at the bottom because it sounds like something predictably annoying), and hit ‘save’. Then I forgot what I was doing and wondered back to my other machine, leaving the new laptop to reboot and send itself into the Windows installation process. Oops.

There’s no way out! You select the language you want to use, and then are presented with the EULA—with a but ‘accept’ button, but _no way to decline_ the bloody thing, and no way to restart the computer! Even worse, a long-press on the power button just suspended the machine, rather than force-booting it. In the end some combination of pressing on the power button while waking from suspend tricked it into dying. Then it was a simple matter of booting from a thumb drive and getting Kubuntu installed.

I got slightly confused at two points: at having to turn off UEFI (which I think is the ‘Windows boot manager’ from above?) in order to install 3rd party proprietary drivers (usually Lenovo are good at providing Linux drivers, but more on that later); and having to use LVM in order to have full-disk encryption (because I had thought that it was usually possible to encrypt _without_ LVM, but really I don’t mind either way; there doesn’t seem to be any disadvantage to using LVM; I then of course elected to not encrypt my home directory).

So now I’m slowly getting KDE set up how I like it, and am running into various problems with the trackpoint, touchpad, and Kmail crashing. I’ll try to document the more interesting bits here, or add to the [KDE UserBase wiki](https://userbase.kde.org).