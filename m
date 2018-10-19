From: brendanhiggins at google.com (Brendan Higgins)
Date: Thu, 18 Oct 2018 23:27:34 -0700
Subject: [RFC v1 00/31] kunit: Introducing KUnit, the Linux kernel unit
 testing framework
In-Reply-To: <CAA9_cmeRE3mPvxb3NciGFYjNu9aMFx4iTMeUq2fC3UtsyXky2A@mail.gmail.com>
References: <20181016235120.138227-1-brendanhiggins@google.com>
 <CAA9_cmeRE3mPvxb3NciGFYjNu9aMFx4iTMeUq2fC3UtsyXky2A@mail.gmail.com>
Message-ID: <CAFd5g46P8PuGH8B5B3mT=M1a4Lg7JTOdWJ8LECo8-i2a=fUZDA@mail.gmail.com>

On Wed, Oct 17, 2018 at 8:55 PM Dan Williams <dan.j.williams at intel.com> wrote:
<snip>
> > ## More information on KUnit
> >
> > There is a bunch of documentation near the end of this patch set that
> > describes how to use KUnit and best practices for writing unit tests.
> > For convenience I am hosting the compiled docs here:
> > https://google.github.io/kunit-docs/third_party/kernel/docs/
>
> Nice! I've been using mocking techniques in kernel code for the
> libnvdimm test infrastructure in tools/testing/nvdimm/. It's part unit
> test infrastructure, part emulation, and I've always had the feeling
> it's all a bit too adhoc. I'm going to take a look and see what can be
> converted to kunit. Please include linux-nvdimm at lists.01.org on future
> postings.

Great to hear!

Interesting, is this kind of like the nfsim stuff?
>
> I'll shamelessly plug my lwn article about unit testing
> https://lwn.net/Articles/654071/ because it's always good to find
> fellow co-travelers to compare notes and advocate for more test
> oriented kernel development.

Most definitely! I will take a look, and be in touch.

Cheers!
