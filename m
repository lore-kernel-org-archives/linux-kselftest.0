From: robh at kernel.org (Rob Herring)
Date: Thu, 6 Dec 2018 18:41:46 -0600
Subject: [RFC v3 17/19] of: unittest: migrate tests to run on KUnit
In-Reply-To: <CAFd5g45-HGytAPTx7OQD8B0oAdLncDGSMMTyHCTtyobeUJ15AQ@mail.gmail.com>
References: <20181128193636.254378-1-brendanhiggins@google.com>
 <20181128193636.254378-18-brendanhiggins@google.com>
 <CAL_Jsq+09Kx7yMBC_Jw45QGmk6U_fp4N6HOZDwYrM4tWw+_dOA@mail.gmail.com>
 <18814973-8f0a-4647-a097-fcc3dc0b3cd3@infradead.org>
 <CAFd5g475RK9v9X4qxmXwuHiPMOs05WrZAw6EJWNdVoAHQWguFQ@mail.gmail.com>
 <CAL_JsqL_PivQbrJFEusdKAy-2EQtKL3OHbmyYSK9bzuTOQegqA@mail.gmail.com>
 <CAFd5g45-HGytAPTx7OQD8B0oAdLncDGSMMTyHCTtyobeUJ15AQ@mail.gmail.com>
Message-ID: <CAL_JsqKvsCNk5oz-f9-G2TsKbfvO=9HO+-+QfOMz_xEAN8TJJg@mail.gmail.com>

On Wed, Dec 5, 2018 at 5:43 PM Brendan Higgins
<brendanhiggins at google.com> wrote:
>
> On Tue, Dec 4, 2018 at 5:41 AM Rob Herring <robh at kernel.org> wrote:
> >
> > On Mon, Dec 3, 2018 at 6:14 PM Brendan Higgins
> > <brendanhiggins at google.com> wrote:
> > >
> > > On Thu, Nov 29, 2018 at 4:40 PM Randy Dunlap <rdunlap at infradead.org> wrote:
> > > >
> > > > On 11/28/18 12:56 PM, Rob Herring wrote:
> > > > >> diff --git a/drivers/of/Kconfig b/drivers/of/Kconfig
> > > > >> index ad3fcad4d75b8..f309399deac20 100644
> > > > >> --- a/drivers/of/Kconfig
> > > > >> +++ b/drivers/of/Kconfig
> > > > >> @@ -15,6 +15,7 @@ if OF
> > > > >>  config OF_UNITTEST
> > > > >>         bool "Device Tree runtime unit tests"
> > > > >>         depends on !SPARC
> > > > >> +       depends on KUNIT
> > > > > Unless KUNIT has depends, better to be a select here.
> > > >
> > > > That's just style or taste.  I would prefer to use depends
> > > > instead of select, but that's also just my preference.
> > >
> > > I prefer depends too, but Rob is the maintainer here.
> >
> > Well, we should be consistent, not the follow the whims of each maintainer.
>
> Sorry, I don't think that came out the way I meant it. I don't really
> think we are consistent on this point across the kernel, and I don't
> feel very strongly about the point, so I was just looking to follow
> the path of least resistance. (I also just assumed Rob would keep us
> consistent within drivers/of/.)

I meant across unittests, we should be consistent. All unittests do
either "depends on KUNIT" or "select KUNIT". The question I would ask
is does KUNIT need to be user visible or is useful to enable without
any unittests enabled? With depends, a user has 2 options to go enable
vs. 1 with select.

But if you want a global kill switch to turn off all unittests, then
depends works better.

> I figure if we are running unit tests from the test runner script or
> from an automated system, you won't be hunting for dependencies for a
> single test every time you want to run a test, so select doesn't make
> it easier to configure in most imagined use cases.
>
> KUNIT hypothetically should not depend on anything, so select should
> be safe to use.
>
> On the other hand, if we end up being wrong on this point and KUnit
> gains widespread adoption, I would prefer not to be in a position
> where I have to change a bunch of configs all over the kernel because
> this example got copied and pasted.

You'll be so happy that 100s of tests have been created using kunit,
it won't be a big deal. :)

In any case, I wouldn't spend more time on this.

Rob
