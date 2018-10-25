From: brendanhiggins@google.com (Brendan Higgins)
Date: Thu, 25 Oct 2018 14:25:28 -0700
Subject: [RFC v2 00/14] kunit: introduce KUnit, the Linux kernel unit
 testing framework
In-Reply-To: <20181024091449.GL324@phenom.ffwll.local>
References: <20181023235750.103146-1-brendanhiggins@google.com>
 <20181024091449.GL324@phenom.ffwll.local>
Message-ID:
 <CAFd5g44RGcYzEb68y0jBpcpZPhbY9=M-==+9cNvs0XyMamobLA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20181025212528.6_wnKqjUP4qrM7is5Mkuzhabg-G9T1bEl5g3u9hXi4k@z>

On Wed, Oct 24, 2018@2:14 AM Daniel Vetter <daniel@ffwll.ch> wrote:
>
> On Tue, Oct 23, 2018@04:57:36PM -0700, Brendan Higgins wrote:
<snip>
> > ## Changes Since Last Version
> >
> >  - Updated patchset to apply cleanly on 4.19.
> >  - Stripped down patchset to focus on just the core features (I dropped
> >    mocking, spying, and the MMIO stuff for now; you can find these
> >    patches here: https://kunit-review.googlesource.com/c/linux/+/1132),
> >    as suggested by Rob.
> >  - Cleaned up some of the commit messages and tweaked commit order a
> >    bit based on suggestions.
>
> Do you have some example unit tests somewhere? The docs are all neat, but
> real example helps a lot with the tried&true art of copypasting :-)

Yes! So I have quite a few tests for KUnit itself, but they are mostly
in the patches that I cut from the previous version of the RFC:
https://kunit.googlesource.com/linux/+/c58019fb4fe15f820e51f857ae4ff14cd34075af/kunit/mock-macro-test.c
https://kunit.googlesource.com/linux/+/c58019fb4fe15f820e51f857ae4ff14cd34075af/kunit/mock-test.c
https://kunit.googlesource.com/linux/+/c58019fb4fe15f820e51f857ae4ff14cd34075af/kunit/string-stream-test.c
https://kunit.googlesource.com/linux/+/c58019fb4fe15f820e51f857ae4ff14cd34075af/kunit/test-stream-test.c
https://kunit.googlesource.com/linux/+/c58019fb4fe15f820e51f857ae4ff14cd34075af/kunit/test-test.c

There are some in this patchset (like here:
https://lore.kernel.org/patchwork/patch/1002904/), but I should
probably include some more...

In any case, if you are looking for a more "realistic" example, you
could look at these sets of tests, which I think is pretty good, and
actually found a couple bugs in existing code:
https://kunit.googlesource.com/linux/+/e10484ad2f9fc7926412ec84739fe105981b4771/drivers/i2c/busses/i2c-aspeed-test.c
https://kunit.googlesource.com/linux/+/4b41b1594ffeab70f1b4364721940cb909509d97/net/ipv6/route-test.c

>
> I'd like to give this a test spin with some of the unit tests we already
> have in drm. And especially figuring out how we could integrate this with
> our existing infrastructure.

Awesome! I am looking forward to hearing how it goes!

Cheers
