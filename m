From: brendanhiggins@google.com (Brendan Higgins)
Date: Wed, 17 Oct 2018 18:14:49 -0700
Subject: [RFC v1 26/31] arch: um: added stubs for mock iomem for KUnit
In-Reply-To: <CABGGisyMYC12UZtZ3wBw_1GO1Qq9-MEzSznq0r8796kVsQ6DoA@mail.gmail.com>
References: <20181016235120.138227-1-brendanhiggins@google.com>
 <20181016235120.138227-27-brendanhiggins@google.com>
 <CABGGisyMYC12UZtZ3wBw_1GO1Qq9-MEzSznq0r8796kVsQ6DoA@mail.gmail.com>
Message-ID:
 <CAFd5g445rkyALoe=RYsSzsn_coDX67c8dYC+8EAG3gXbAzMkPQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20181018011449.A94B4AAQ3TiL-j4PtOzV5kpKbSySl2fhcse9SwUjsTs@z>

On Wed, Oct 17, 2018@3:28 PM Rob Herring <robh@kernel.org> wrote:
<snip>
> > diff --git a/arch/um/Kconfig.common b/arch/um/Kconfig.common
> > index 07f84c842cc31..72e7efb74f7fd 100644
> > --- a/arch/um/Kconfig.common
> > +++ b/arch/um/Kconfig.common
> > @@ -19,7 +19,13 @@ config MMU
> >         default y
> >
> >  config NO_IOMEM
> > -       def_bool y
> > +       bool
> > +       default y if !KUNIT
> > +
> > +config HAS_IOMEM
>
> HAS_IOMEM is essentially a disable flag for lots of drivers on UML.
> Ignoring drivers, it doesn't really control a significant amount of
> code (albeit small amount of code you need for this series). As a
> driver disable, it does a poor job as lots of drivers aren't MMIO and
> aren't disabled. I think we should decouple these 2 things. Perhaps
> get rid of the driver disable part altogether. We already do 'depends
> on ARCH_FOO || COMPILE_TEST' for lots of drivers.
>
I think that makes sense. Any code that can build should be able to
build under KUnit, but we probably want to turn that on on a per
driver basis as we write tests for them.

> Also, I wouldn't be surprised if turning on HAS_IOMEM causes UML
> randconfig failures. Arnd does lots of randconfig testing and might be
> willing to help check.
>
It almost certainly would fail randconfig. As you point out below, I
don't implement everything that's required, just enough to show off
KUnit in a couple examples.

> > +       bool "Turns on fake IOMEM support for KUnit"
> > +       depends on KUNIT
> > +       select MOCK_IOMEM
> >
> >  config ISA
> >         bool
> > diff --git a/arch/um/Kconfig.um b/arch/um/Kconfig.um
> > index 20da5a8ca9490..8d35e0e2c23d1 100644
> > --- a/arch/um/Kconfig.um
> > +++ b/arch/um/Kconfig.um
> > @@ -122,3 +122,8 @@ config SECCOMP
> >           defined by each seccomp mode.
> >
> >           If unsure, say Y.
> > +
> > +config PLATFORM_MOCK
> > +       bool "Enable a mock architecture used for unit testing."
> > +       depends on KUNIT && OF
> > +       default n
> > diff --git a/arch/um/include/asm/Kbuild b/arch/um/include/asm/Kbuild
> > index b10dde6cb793b..9fd2827ab76d1 100644
> > --- a/arch/um/include/asm/Kbuild
> > +++ b/arch/um/include/asm/Kbuild
> > @@ -12,7 +12,6 @@ generic-y += ftrace.h
> >  generic-y += futex.h
> >  generic-y += hardirq.h
> >  generic-y += hw_irq.h
> > -generic-y += io.h
> >  generic-y += irq_regs.h
> >  generic-y += irq_work.h
> >  generic-y += kdebug.h
> > diff --git a/arch/um/include/asm/io-mock-shared.h b/arch/um/include/asm/io-mock-shared.h
> > new file mode 100644
> > index 0000000000000..6baf59cb17a58
> > --- /dev/null
> > +++ b/arch/um/include/asm/io-mock-shared.h
> > @@ -0,0 +1,33 @@
> > +/* SPDX-License-Identifier: GPL-2.0 */
> > +#ifndef _ASM_UM_IO_MOCK_SHARED_H
> > +#define _ASM_UM_IO_MOCK_SHARED_H
> > +
> > +#define readb readb
> > +u8 readb(const volatile void __iomem *);
>
> What about all the other flavors of MMIO accessors like __raw_readb,
> readb_relaxed, etc.? readX/writeX is intended for PCI based drivers
> which doesn't seem to be what you are targeting in this series.
>
Those need to be done too. I just mostly wanted to illustrate that it
can be done, and what is needed to support mocking MMIO. I wasn't sure
how controversial my approach would be, so I didn't want to put any
more work than was necessary for illustration without getting some
feedback.

> I think it would be good if this capability was not just on UML. I
> could also imagine wanting to run tests on real h/w. Perhaps you just

I think that's reasonable.

> want to log and/or check i/o accesses. Or you need some dependencies
> in place rather than trying to fake everything (clocks, gpios, pinmux,
> irq, etc.). That being said, I'm not trying to add a bunch of things
> for you to do. Though maybe it makes sense to split this series some.

Almost definitely. I figured this patchset, as is, is a good
illustration of what I am trying to do, what is possible, and the kind
of work that is necessary to get there. If people like what I am doing
and want more of this type of thing, I think focussing on getting base
support in and then working on features separately is the way to go.

> How many of the patches are needed to convert the DT unittests for
> example?

At first glance, just you probably only need the stuff in the first 9
patches for that. You don't appear to be doing any IO of any sort, so
you don't need this stuff. You appear to depend only on some fake
data; everything else seems pretty self contained, so you don't need
any of the mocking support for that. So if I understand correctly you
just need the base support needed for bare bones unit tests, all that
stuff is in the first 9 patches.

Cheers
