From: brendanhiggins at google.com (Brendan Higgins)
Date: Mon, 3 Dec 2018 15:48:15 -0800
Subject: [RFC v3 11/19] kunit: add Python libraries for handing KUnit
 config and kernel
In-Reply-To: <841cf4ae-501b-05ae-5863-a51010709b67@ideasonboard.com>
References: <20181128193636.254378-1-brendanhiggins@google.com>
 <20181128193636.254378-12-brendanhiggins@google.com>
 <841cf4ae-501b-05ae-5863-a51010709b67@ideasonboard.com>
Message-ID: <CAFd5g47x-UNja72k-CWPmWz9+LTn8pF8Wj5Poq+2FJ93E=vymA@mail.gmail.com>

On Thu, Nov 29, 2018 at 5:54 AM Kieran Bingham
<kieran.bingham at ideasonboard.com> wrote:
>
> Hi Brendan,
>
> Thanks again for this series!
>
> On 28/11/2018 19:36, Brendan Higgins wrote:
> > The ultimate goal is to create minimal isolated test binaries; in the
> > meantime we are using UML to provide the infrastructure to run tests, so
> > define an abstract way to configure and run tests that allow us to
> > change the context in which tests are built without affecting the user.
> > This also makes pretty and dynamic error reporting, and a lot of other
> > nice features easier.
>
>
> I wonder if we could somehow generate a shared library object
> 'libkernel' or 'libumlinux' from a UM configured set of headers and
> objects so that we could create binary targets directly ?

That's an interesting idea. I think it would be difficult to figure
out exactly where to draw the line of what goes in there and what
needs to be built specific to a test a priori. Of course, that leads
into the biggest problem in general, needed to know what I need to
build to test the thing that I want to test.

Nevertheless, I could definitely imagine that being useful in a lot of cases.

> > diff --git a/tools/testing/kunit/kunit_kernel.py b/tools/testing/kunit/kunit_kernel.py
> > new file mode 100644
> > index 0000000000000..bba7ea7ca1869
> > --- /dev/null
> > +++ b/tools/testing/kunit/kunit_kernel.py
...
> > +     def make(self, jobs):
> > +             try:
> > +                     subprocess.check_output([
> > +                                     'make',
> > +                                     'ARCH=um',
> > +                                     '--jobs=' + str(jobs)])
>
> Perhaps as a future extension:
>
> It would be nice if we could set an O= here to keep the source tree
> pristine.
>
> In fact I might even suggest that this should always be set so that the
> unittesting could live along side an existing kernel build? :
>
>  O ?= $KBUILD_SRC/
>  O := $(O)/kunittest/$(ARCH)/build

I agree with that. It would be pretty annoying to run a unit test and
have it mess up your .config and force you to rebuild everything else.
(I have actually done this to myself a couple of times...)

Cheers
