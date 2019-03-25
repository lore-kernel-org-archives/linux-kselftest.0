From: brendanhiggins@google.com (Brendan Higgins)
Date: Mon, 25 Mar 2019 15:11:14 -0700
Subject: [RFC v4 00/17] kunit: introduce KUnit, the Linux kernel unit
 testing framework
In-Reply-To: <0e6eb370-3e62-e1a5-1b91-bccc5868e8e4@gmail.com>
References: <20190214213729.21702-1-brendanhiggins@google.com>
 <CAFd5g45F3YUsAjse+Vt5hj5CLjaXrRWgr5zCZZ6CJKc0hboP6Q@mail.gmail.com>
 <0e6eb370-3e62-e1a5-1b91-bccc5868e8e4@gmail.com>
Message-ID:
 <CAFd5g46ZW5PqQ1-k0gXRxZ+Zp3ukYWmhGYBz589NoFre7f+kzA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190325221114.2LWiEe2X569CUhZZjyFcn9KcaWQB1W9MX7RtuXTaBfw@z>

On Thu, Mar 21, 2019@6:23 PM Frank Rowand <frowand.list@gmail.com> wrote:
>
> On 3/4/19 3:01 PM, Brendan Higgins wrote:
> > On Thu, Feb 14, 2019 at 1:38 PM Brendan Higgins
< snip >
> > Someone suggested I should send the next revision out as "PATCH"
> > instead of "RFC" since there seems to be general consensus about
> > everything at a high level, with a couple exceptions.
> >
> > At this time I am planning on sending the next revision out as "[PATCH
> > v1 00/NN] kunit: introduce KUnit, the Linux kernel unit testing
> > framework". Initially I wasn't sure if the next revision should be
> > "[PATCH v1 ...]" or "[PATCH v5 ...]". Please let me know if you have a
> > strong objection to the former.
> >
> > In the next revision, I will be dropping the last two of three patches
> > for the DT unit tests as there doesn't seem to be enough features
> > currently available to justify the heavy refactoring I did; however, I
>
> Thank you.
>
>
> > will still include the patch that just converts everything over to
> > KUnit without restructuring the test cases:
> > https://lkml.org/lkml/2019/2/14/1133
>
> The link doesn't work for me (don't worry about that), so I'm assuming
> this is:
>
>    [RFC v4 15/17] of: unittest: migrate tests to run on KUnit

That's correct.

>
> The conversation on that patch ended after:
>
>    >> After adding patch 15, there are a lot of "unittest internal error" messages.
>    >
>    > Yeah, I meant to ask you about that. I thought it was due to a change
>    > you made, but after further examination, just now, I found it was my
>    > fault. Sorry for not mentioning that anywhere. I will fix it in v5.
>
> It is not worth my time to look at patch 15 when it is that broken.  So I
> have not done any review of it.

Right, I didn't expect you to, we were still discussing things on RFC
v3 at the time. I think I got you comments on v3 in a very short time
frame around sending out v4; hence why your comments were not
addressed.

>
> So no, I think you are still in the RFC stage unless you drop patch 15.

Noted. I might split that out into a separate RFC then.

>
> >
> > I should have the next revision out in a week or so.
> >
>

Cheers!
