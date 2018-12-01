From: brendanhiggins@google.com (Brendan Higgins)
Date: Fri, 30 Nov 2018 18:14:17 -0800
Subject: [RFC v3 03/19] kunit: test: add string_stream a std::stream like
 string builder
In-Reply-To: <20181130032924.GH18410@garbanzo.do-not-panic.com>
References: <20181128193636.254378-1-brendanhiggins@google.com>
 <20181128193636.254378-4-brendanhiggins@google.com>
 <20181130032924.GH18410@garbanzo.do-not-panic.com>
Message-ID:
 <CAFd5g46AXpnoWpm+aFNfvNm2-As5RCO7QdMPhcOMXWRPwHqrGg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20181201021417.dBcx1UFYjCpQlldXu-SAQYY8i1VeGwrzsC2U036UnNk@z>

On Thu, Nov 29, 2018@7:29 PM Luis Chamberlain <mcgrof@kernel.org> wrote:
>
> On Wed, Nov 28, 2018@11:36:20AM -0800, Brendan Higgins wrote:
> > A number of test features need to do pretty complicated string printing
> > where it may not be possible to rely on a single preallocated string
> > with parameters.
> >
> > So provide a library for constructing the string as you go similar to
> > C++'s std::string.
>
> Hrm, what's the potential for such thing actually being eventually
> generically useful for printk folks, I wonder? Petr?

Are you saying you think this is applicable for other things? Or are
you saying that you are afraid that somebody might try to use this
elsewhere?

In the former case, this doesn't belong here. In the latter case, it
explicitly depends on KUnit, so it is only available when running
tests.

Cheers
