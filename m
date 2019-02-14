From: mcgrof@kernel.org (Luis Chamberlain)
Date: Thu, 14 Feb 2019 09:26:39 -0800
Subject: [RFC v3 14/19] Documentation: kunit: add documentation for KUnit
In-Reply-To: <CAFd5g46cO_rZYjqKu6CooKcV-uAsCUJjuib38cQv6WHQS3ooaA@mail.gmail.com>
References: <20181128193636.254378-15-brendanhiggins@google.com>
 <b4c72234-8c56-6efa-8003-f89d99a9779e@ideasonboard.com>
 <20181130034525.GP18410@garbanzo.do-not-panic.com>
 <CAFd5g47Cew6pmebsopjzmkd4RpnnC3zLAUfxCybjdhrO35OBpQ@mail.gmail.com>
 <0927c42a-8e65-f410-e6ed-27576572577f@ideasonboard.com>
 <CAFd5g44fKzriEs_pGyANxe7GuC9Ji2SD7EEz76__h8q9jjg8yA@mail.gmail.com>
 <57c3dc86-236f-e981-249a-8bbfe5c19f0e@ideasonboard.com>
 <CAFd5g46AEquMKzfrjLDVi+PP5-7aGs6C6pCunGAXDn3VRkJP+g@mail.gmail.com>
 <eade3052-0aa4-90b4-d55b-8c44556f98bc@ideasonboard.com>
 <CAFd5g46cO_rZYjqKu6CooKcV-uAsCUJjuib38cQv6WHQS3ooaA@mail.gmail.com>
Message-ID: <20190214172639.GD11489@garbanzo.do-not-panic.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190214172639.EV_JTuMnBYDOUE7h0Op7eIGpYz70R180PlWt2zjTwzk@z>

On Wed, Feb 13, 2019@04:17:13PM -0800, Brendan Higgins wrote:
> On Wed, Feb 13, 2019 at 1:55 PM Kieran Bingham
> <kieran.bingham@ideasonboard.com> wrote:
> Oh, yep, you are right. Does that mean we should bother at all with a defconfig?

If one wanted a qemu enabled type of kernel and also for kuniut one
could imply run:

make kvmconfig
make kunitconfig

That would get what you suggest above of default "bells and whistles"
and keep the kuniut as a fragment.

Hm, actually the kvmconfig doesn't really enable the required fragments
for qemu, so perhaps one would be good. It would have the serial stuff
for instance.

> Luis, I know you said you wanted one. I am thinking just stick with
> the UML one? The downside there is we then get stuck having to
> maintain the fragment and the defconfig. I right now (in the new
> revision I am working on) have the Python kunit_tool copy the
> defconfig if no kunitconfig is provided and a flag is set. It would be
> pretty straightforward to make it merge in the fragment instead.

Up to you in the end.

  Luis
