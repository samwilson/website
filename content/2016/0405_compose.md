---
title: Enable Left Win as the Compose Key on Ubuntu
date: 2016-04-05 16:50:35 +08:00
timezone: Australia/Perth
tags:
  - Programming
  - Compose Key
  - Linux
  - typing
  - typography
  - ubuntu
  - Windows Key
  - Writing
---
It is very easy to type “special” characters on Linux (i.e. those that aren’t printed on the keyboard).
It’s called the *[Compose](https://en.wikipedia.org/wiki/Compose_key)* or *Multi* Key, and it’s brilliant.

First, enable it in ‘Keyboard settings > Advanced > Position of Compose Key’.
I’ve got it set to `Left <a href="https://en.wikipedia.org/wiki/Windows_key">Win</a>`
because I never use that for anything and it’s in a similar position to the key on Apple computers
that serves a similar purpose (but whose name I cannot remember).

If the Left Win option is missing (as it seems to be on some Ubuntu installations), you just need to edit `/etc/default/keyboard` and set:

    XKBOPTIONS="compose:lwin"

Then run:

    sudo dpkg-reconfigure keyboard-configuration

Once it’s all working you just need to [look up](https://cgit.freedesktop.org/xorg/lib/libX11/tree/nls/en_US.UTF-8/Compose.pre)
the characters you want (Tim Starling also [has a good list](http://tstarling.com/stuff/ComposeKeys.html)).
