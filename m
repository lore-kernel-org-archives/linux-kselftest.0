From: mcgrof at kernel.org (Luis Chamberlain)
Date: Thu, 6 Dec 2018 17:05:17 -0800
Subject: [RFC v3 11/19] kunit: add Python libraries for handing KUnit
 config and kernel
In-Reply-To: <f8722f4a-44c8-24c2-c433-5178f9f40b82@ideasonboard.com>
References: <20181128193636.254378-1-brendanhiggins@google.com>
 <20181128193636.254378-12-brendanhiggins@google.com>
 <841cf4ae-501b-05ae-5863-a51010709b67@ideasonboard.com>
 <CAFd5g47x-UNja72k-CWPmWz9+LTn8pF8Wj5Poq+2FJ93E=vymA@mail.gmail.com>
 <20181204204701.GT28501@garbanzo.do-not-panic.com>
 <f8722f4a-44c8-24c2-c433-5178f9f40b82@ideasonboard.com>
Message-ID: <20181207010517.GH28501@garbanzo.do-not-panic.com>

On Thu, Dec 06, 2018 at 12:32:47PM +0000, Kieran Bingham wrote:
> My main initial idea for a libumlinux is to provide infrastructure such
> as our linked-lists and other kernel formatting so that we can take
> kernel code directly to userspace for test and debug (assuming that
> there are no hardware dependencies or things that we can't mock out)

The tools/ directory already does this for a tons of things. Its where
I ended up placing some API I tested a long time ago when I wanted to
test it in userspace, and provide the unit test in userspace (for my
linker table patches).

> Now we just have to start the race to see who can tweak the kernel build
> system to produce an output library first :)

Should be relatively easy if the tools directory used. Yes, there is
an inherent risk of duplication, but that was decided long ago.

  Luis
