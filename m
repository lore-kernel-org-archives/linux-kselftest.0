From: brendanhiggins at google.com (Brendan Higgins)
Date: Thu, 25 Apr 2019 14:37:11 -0700
Subject: [PATCH v1 14/17] Documentation: kunit: add documentation for KUnit
In-Reply-To: <20190424185813.xabwr4lt6aunvpsd@gabell>
References: <20190404220652.19765-1-brendanhiggins@google.com>
 <20190404220652.19765-15-brendanhiggins@google.com>
 <20190424185813.xabwr4lt6aunvpsd@gabell>
Message-ID: <CAFd5g45CD7=dMvvRgmLKomirXDWpO59hFSed9A=o0kdBxp7v-w@mail.gmail.com>

On Wed, Apr 24, 2019 at 11:58 AM Masayoshi Mizuma <msys.mizuma at gmail.com> wrote:
>
> Hi Brendan,
>
> KUNIT_ASSERT_NOT_ERR_OR_NULL() should be replaced to
> KUNIT_EXPECT_NOT_ERR_OR_NULL(), right?

Generally speaking, no.

There may be places that I have used it improperly, but I think it is
generally okay to use.

If you are refering to the discussion with Frank and Stephen in RFC
v4, my take was that the resolution was that there were some things I
needed to fix in its implementation, but it is conceptually okay, and
that Frank doesn't want me to use it in drivers/of/unittest.c.
Consequently, I fixed the implementation issues that Frank and Stephen
pointed out, and I am holding off on drivers/of/unittest.c for this
patchset. The usage in this file should be fine.

>
> On Thu, Apr 04, 2019 at 03:06:49PM -0700, Brendan Higgins wrote:
> > Add documentation for KUnit, the Linux kernel unit testing framework.
> > - Add intro and usage guide for KUnit
> > - Add API reference
> >
> > Signed-off-by: Felix Guo <felixguoxiuping at gmail.com>
> > Signed-off-by: Brendan Higgins <brendanhiggins at google.com>
> > ---
>
> <snip>

<snip>

Cheers
