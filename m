From: robh@kernel.org (Rob Herring)
Date: Wed, 17 Oct 2018 17:28:04 -0500
Subject: [RFC v1 26/31] arch: um: added stubs for mock iomem for KUnit
In-Reply-To: <20181016235120.138227-27-brendanhiggins@google.com>
References: <20181016235120.138227-1-brendanhiggins@google.com>
 <20181016235120.138227-27-brendanhiggins@google.com>
Message-ID:
 <CABGGisyMYC12UZtZ3wBw_1GO1Qq9-MEzSznq0r8796kVsQ6DoA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20181017222804.ldTctGbdrzGziI_Fu2nDeexhiHjL_pitHCaSiWeuWCA@z>

On Tue, Oct 16, 2018 at 6:54 PM Brendan Higgins
<brendanhiggins@google.com> wrote:
>
> This mocks out some iomem functions (functions like readl and writel),
> for mocking hardware interfaces.
>
> Signed-off-by: Brendan Higgins <brendanhiggins at google.com>
> ---
>  arch/um/Kconfig.common               |  8 +++++-
>  arch/um/Kconfig.um                   |  5 ++++
>  arch/um/include/asm/Kbuild           |  1 -
>  arch/um/include/asm/io-mock-shared.h | 33 +++++++++++++++++++++
>  arch/um/include/asm/io-mock.h        | 43 ++++++++++++++++++++++++++++
>  arch/um/include/asm/io.h             |  8 ++++++
>  arch/um/kernel/Makefile              |  1 +
>  arch/um/kernel/io-mock.c             | 40 ++++++++++++++++++++++++++
>  kunit/Kconfig                        |  1 +
>  9 files changed, 138 insertions(+), 2 deletions(-)
>  create mode 100644 arch/um/include/asm/io-mock-shared.h
>  create mode 100644 arch/um/include/asm/io-mock.h
>  create mode 100644 arch/um/kernel/io-mock.c
>
> diff --git a/arch/um/Kconfig.common b/arch/um/Kconfig.common
> index 07f84c842cc31..72e7efb74f7fd 100644
> --- a/arch/um/Kconfig.common
> +++ b/arch/um/Kconfig.common
> @@ -19,7 +19,13 @@ config MMU
>         default y
>
>  config NO_IOMEM
> -       def_bool y
> +       bool
> +       default y if !KUNIT
> +
> +config HAS_IOMEM

HAS_IOMEM is essentially a disable flag for lots of drivers on UML.
Ignoring drivers, it doesn't really control a significant amount of
code (albeit small amount of code you need for this series). As a
driver disable, it does a poor job as lots of drivers aren't MMIO and
aren't disabled. I think we should decouple these 2 things. Perhaps
get rid of the driver disable part altogether. We already do 'depends
on ARCH_FOO || COMPILE_TEST' for lots of drivers.

Also, I wouldn't be surprised if turning on HAS_IOMEM causes UML
randconfig failures. Arnd does lots of randconfig testing and might be
willing to help check.

> +       bool "Turns on fake IOMEM support for KUnit"
> +       depends on KUNIT
> +       select MOCK_IOMEM
>
>  config ISA
>         bool
> diff --git a/arch/um/Kconfig.um b/arch/um/Kconfig.um
> index 20da5a8ca9490..8d35e0e2c23d1 100644
> --- a/arch/um/Kconfig.um
> +++ b/arch/um/Kconfig.um
> @@ -122,3 +122,8 @@ config SECCOMP
>           defined by each seccomp mode.
>
>           If unsure, say Y.
> +
> +config PLATFORM_MOCK
> +       bool "Enable a mock architecture used for unit testing."
> +       depends on KUNIT && OF
> +       default n
> diff --git a/arch/um/include/asm/Kbuild b/arch/um/include/asm/Kbuild
> index b10dde6cb793b..9fd2827ab76d1 100644
> --- a/arch/um/include/asm/Kbuild
> +++ b/arch/um/include/asm/Kbuild
> @@ -12,7 +12,6 @@ generic-y += ftrace.h
>  generic-y += futex.h
>  generic-y += hardirq.h
>  generic-y += hw_irq.h
> -generic-y += io.h
>  generic-y += irq_regs.h
>  generic-y += irq_work.h
>  generic-y += kdebug.h
> diff --git a/arch/um/include/asm/io-mock-shared.h b/arch/um/include/asm/io-mock-shared.h
> new file mode 100644
> index 0000000000000..6baf59cb17a58
> --- /dev/null
> +++ b/arch/um/include/asm/io-mock-shared.h
> @@ -0,0 +1,33 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +#ifndef _ASM_UM_IO_MOCK_SHARED_H
> +#define _ASM_UM_IO_MOCK_SHARED_H
> +
> +#define readb readb
> +u8 readb(const volatile void __iomem *);

What about all the other flavors of MMIO accessors like __raw_readb,
readb_relaxed, etc.? readX/writeX is intended for PCI based drivers
which doesn't seem to be what you are targeting in this series.

I think it would be good if this capability was not just on UML. I
could also imagine wanting to run tests on real h/w. Perhaps you just
want to log and/or check i/o accesses. Or you need some dependencies
in place rather than trying to fake everything (clocks, gpios, pinmux,
irq, etc.). That being said, I'm not trying to add a bunch of things
for you to do. Though maybe it makes sense to split this series some.
How many of the patches are needed to convert the DT unittests for
example?

Rob
