From: mcgrof at kernel.org (Luis Chamberlain)
Date: Tue, 4 Dec 2018 12:47:01 -0800
Subject: [RFC v3 11/19] kunit: add Python libraries for handing KUnit
 config and kernel
In-Reply-To: <CAFd5g47x-UNja72k-CWPmWz9+LTn8pF8Wj5Poq+2FJ93E=vymA@mail.gmail.com>
References: <20181128193636.254378-1-brendanhiggins@google.com>
 <20181128193636.254378-12-brendanhiggins@google.com>
 <841cf4ae-501b-05ae-5863-a51010709b67@ideasonboard.com>
 <CAFd5g47x-UNja72k-CWPmWz9+LTn8pF8Wj5Poq+2FJ93E=vymA@mail.gmail.com>
Message-ID: <20181204204701.GT28501@garbanzo.do-not-panic.com>

On Mon, Dec 03, 2018 at 03:48:15PM -0800, Brendan Higgins wrote:
> On Thu, Nov 29, 2018 at 5:54 AM Kieran Bingham
> <kieran.bingham at ideasonboard.com> wrote:
> >
> > Hi Brendan,
> >
> > Thanks again for this series!
> >
> > On 28/11/2018 19:36, Brendan Higgins wrote:
> > > The ultimate goal is to create minimal isolated test binaries; in the
> > > meantime we are using UML to provide the infrastructure to run tests, so
> > > define an abstract way to configure and run tests that allow us to
> > > change the context in which tests are built without affecting the user.
> > > This also makes pretty and dynamic error reporting, and a lot of other
> > > nice features easier.
> >
> >
> > I wonder if we could somehow generate a shared library object
> > 'libkernel' or 'libumlinux' from a UM configured set of headers and
> > objects so that we could create binary targets directly ?
> 
> That's an interesting idea. I think it would be difficult to figure
> out exactly where to draw the line of what goes in there and what
> needs to be built specific to a test a priori. Of course, that leads
> into the biggest problem in general, needed to know what I need to
> build to test the thing that I want to test.
> 
> Nevertheless, I could definitely imagine that being useful in a lot of cases.

Whether or not we can abstract away the kernel into such a mechanism
with uml libraries is a good question worth exploring.

Developers working upstream do modify their kernels a lot, so we'd have
to update such libraries quite a bit, but I think that's fine too. The
*real* value I think from the above suggestion would be enterprise /
mobile distros or stable kernel maintainers which have a static kernel
they need to support for a relatively *long time*, consider a 10 year
time frame. Running unit tests without qemu with uml and libraries for
respective kernels seems real worthy.

The overhead for testing a unit test for said targets, *ideally*, would
just be to to reboot into the system with such libraries available, a
unit test would just look for the respective uname -r library and mimic
that kernel, much the same way enterprise distributions today rely on
having debugging symbols available to run against crash / gdb. Having
debug modules / kernel for crash requires such effort already, so this
would just be an extra layer of other prospect tests.

All ideaware for now, but the roadmap seems to be paving itself.

  Luis
