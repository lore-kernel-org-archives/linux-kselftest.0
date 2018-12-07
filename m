From: kent.overstreet@gmail.com (Kent Overstreet)
Date: Fri, 7 Dec 2018 13:35:35 -0500
Subject: [RFC v3 11/19] kunit: add Python libraries for handing KUnit
 config and kernel
In-Reply-To: <f8722f4a-44c8-24c2-c433-5178f9f40b82@ideasonboard.com>
References: <20181128193636.254378-1-brendanhiggins@google.com>
 <20181128193636.254378-12-brendanhiggins@google.com>
 <841cf4ae-501b-05ae-5863-a51010709b67@ideasonboard.com>
 <CAFd5g47x-UNja72k-CWPmWz9+LTn8pF8Wj5Poq+2FJ93E=vymA@mail.gmail.com>
 <20181204204701.GT28501@garbanzo.do-not-panic.com>
 <f8722f4a-44c8-24c2-c433-5178f9f40b82@ideasonboard.com>
Message-ID: <20181207183535.GA31228@kmo-pixel>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20181207183535.9KDuNNWvA8Ry_tIKGAy1Abq2kVIq1Kkagzwdv2d5tiY@z>

On Thu, Dec 06, 2018@12:32:47PM +0000, Kieran Bingham wrote:
> Oh - although, yes - there are some good concepts there - but I'm a bit
> weary of how easy it would be to 'run' the said test against multiple
> kernel version libraries... there would be a lot of possible ABI
> conflicts perhaps.
> 
> My main initial idea for a libumlinux is to provide infrastructure such
> as our linked-lists and other kernel formatting so that we can take
> kernel code directly to userspace for test and debug (assuming that
> there are no hardware dependencies or things that we can't mock out)

I think this would be a really wonderful to make happen, and could potentially
be much wore widely useful than for just running tests, by making it easier to
share code between both kernel and userspace.

For bcachefs I've got a shim layer that lets me build almost everything in
fs/bcachefs and use it as a library in the userspace bcachefs-tools - e.g. for
fsck and migrate. Mine was a quick and dirty hack, but even so it's been
_extremely_ useful and a major success - I think if this became something more
official a lot of uses would be found for it.

I'm not sure if you've actually started on this (haven't seen most of the thread
yet), but if any of the bcachefs-tools shim code is useful feel free to steal it
- I've got dirt-simple, minimum viable shims for the kthread api, workqueus,
timers, the block layer, and assorted other stuff:

https://evilpiepirate.org/git/bcachefs-tools.git/

Going forward, one issue is going to be that a libumllinux is going to want to
shim some interfaces, and for other things it'll just want to pull in the kernel
implementation - e.g. rhashtables. It might be nice if we could refactor things
a bit so that things like rhashtables could be built as a standalone library, as
is.
