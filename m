From: brendanhiggins at google.com (Brendan Higgins)
Date: Thu, 14 Feb 2019 16:56:34 -0800
Subject: [RFC v3 18/19] of: unittest: split out a couple of test cases
 from unittest
In-Reply-To: <88fe0546-7850-5bb4-9673-b1aef2dccb3e@gmail.com>
References: <20181128193636.254378-1-brendanhiggins@google.com>
 <20181128193636.254378-19-brendanhiggins@google.com>
 <990bfc7d-dc5e-d8d3-c151-9b321ff2ac10@gmail.com>
 <CAFd5g45tOGgf_sKGYRC=fpnTBKGaG=8frbQdgZ3ZTkQFyTfP5A@mail.gmail.com>
 <88fe0546-7850-5bb4-9673-b1aef2dccb3e@gmail.com>
Message-ID: <CAFd5g444f-FBq4x3U7BL-EY+bFxP0rsJhJ14=mjOi89PhMkURg@mail.gmail.com>

On Thu, Feb 14, 2019 at 3:57 PM Frank Rowand <frowand.list at gmail.com> wrote:
>
> On 12/5/18 3:54 PM, Brendan Higgins wrote:
> > On Tue, Dec 4, 2018 at 2:58 AM Frank Rowand <frowand.list at gmail.com> wrote:
> >>
> >> Hi Brendan,
> >>
> >> On 11/28/18 11:36 AM, Brendan Higgins wrote:
> >>> Split out a couple of test cases that these features in base.c from the
> >>> unittest.c monolith. The intention is that we will eventually split out
> >>> all test cases and group them together based on what portion of device
> >>> tree they test.
> >>
> >> Why does splitting this file apart improve the implementation?
> >
> > This is in preparation for patch 19/19 and other hypothetical future
> > patches where test cases are split up and grouped together by what
> > portion of DT they test (for example the parsing tests and the
> > platform/device tests would probably go separate files as well). This
> > patch by itself does not do anything useful, but I figured it made
> > patch 19/19 (and, if you like what I am doing, subsequent patches)
> > easier to review.
>
> I do not see any value in splitting the devicetree tests into
> multiple files.
>
> Please help me understand what the benefits of such a split are.

Sorry, I thought it made sense in context of what I am doing in the
following patch. All I am trying to do is to provide an effective way
of grouping test cases. To be clear, the idea, assuming you agree, is
that we would follow up with several other patches like this one and
the subsequent patch, one which would pull out a couple test
functions, as I have done here, and another that splits those
functions up into a bunch of proper test cases.

I thought that having that many unrelated test cases in a single file
would just be a pain to sort through deal with, review, whatever.

This is not something I feel particularly strongly about, it is just
pretty atypical from my experience to have so many unrelated test
cases in a single file.

Maybe you would prefer that I break up the test cases first, and then
we split up the file as appropriate?

I just assumed that we would agree it would be way too much stuff for
a single file, so I went ahead and broke it up first, because I
thought it would make it easier to review in that order rather than
the other way around.

Cheers
