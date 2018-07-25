From: anders.roxell@linaro.org (Anders Roxell)
Date: Wed, 25 Jul 2018 18:08:17 +0200
Subject: [PATCH v4] selftests: add headers_install to lib.mk
In-Reply-To: <f222aa8d-88b8-140c-30ed-83fd908bfd09@kernel.org>
References: <20180413090351.25662-1-anders.roxell@linaro.org>
 <20180607110911.12252-1-anders.roxell@linaro.org>
 <CADYN=9J=hSFb2wCZ1+dXL=023p9y05MEGUPvH48WfPX7XDZvwQ@mail.gmail.com>
 <f222aa8d-88b8-140c-30ed-83fd908bfd09@kernel.org>
Message-ID:
 <CADYN=9LSA60E4mFwrbeY-RGi4kZV6hO0ygz0-C6QB3+KKaoxQg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180725160817.WlZTgOGxyA1yjkh4CCnL0rFjuifeTzyczaIaojawYJU@z>

On Tue, 24 Jul 2018@19:11, Shuah Khan <shuah@kernel.org> wrote:
>
> On 07/23/2018 02:49 PM, Anders Roxell wrote:
> > On Thu, 7 Jun 2018@13:09, Anders Roxell <anders.roxell@linaro.org> wrote:
> >>
> >> If the kernel headers aren't installed we can't build all the tests.
> >> Add a new make target rule 'khdr' in the file lib.mk to generate the
> >> kernel headers and that gets include for every test-dir Makefile that
> >> includes lib.mk If the testdir in turn have its own sub-dirs the
> >> top_srcdir needs to be set to the linux-rootdir to be able to generate
> >> the kernel headers.
> >>
> >> Signed-off-by: Anders Roxell <anders.roxell at linaro.org>
> >> Reviewed-by: Fathi Boudra <fathi.boudra at linaro.org>
> >> ---
> >>  Makefile                                           | 14 +-------------
> >>  scripts/subarch.include                            | 13 +++++++++++++
> >>  tools/testing/selftests/android/Makefile           |  2 +-
> >>  tools/testing/selftests/android/ion/Makefile       |  2 ++
> >>  tools/testing/selftests/futex/functional/Makefile  |  1 +
> >>  tools/testing/selftests/gpio/Makefile              |  7 ++-----
> >>  tools/testing/selftests/kvm/Makefile               |  7 ++-----
> >>  tools/testing/selftests/lib.mk                     | 12 ++++++++++++
> >>  tools/testing/selftests/net/Makefile               |  1 +
> >>  .../selftests/networking/timestamping/Makefile     |  1 +
> >>  tools/testing/selftests/vm/Makefile                |  4 ----
> >>  11 files changed, 36 insertions(+), 28 deletions(-)
> >>  create mode 100644 scripts/subarch.include
> >>
> >> diff --git a/Makefile b/Makefile
> >> index 6b9aea95ae3a..8050072300fa 100644
> >> --- a/Makefile
> >> +++ b/Makefile
> >> @@ -286,19 +286,7 @@ KERNELRELEASE = $(shell cat include/config/kernel.release 2> /dev/null)
> >>  KERNELVERSION = $(VERSION)$(if $(PATCHLEVEL),.$(PATCHLEVEL)$(if $(SUBLEVEL),.$(SUBLEVEL)))$(EXTRAVERSION)
> >>  export VERSION PATCHLEVEL SUBLEVEL KERNELRELEASE KERNELVERSION
> >>
> >> -# SUBARCH tells the usermode build what the underlying arch is.  That is set
> >> -# first, and if a usermode build is happening, the "ARCH=um" on the command
> >> -# line overrides the setting of ARCH below.  If a native build is happening,
> >> -# then ARCH is assigned, getting whatever value it gets normally, and
> >> -# SUBARCH is subsequently ignored.
> >> -
> >> -SUBARCH := $(shell uname -m | sed -e s/i.86/x86/ -e s/x86_64/x86/ \
> >> -                                 -e s/sun4u/sparc64/ \
> >> -                                 -e s/arm.*/arm/ -e s/sa110/arm/ \
> >> -                                 -e s/s390x/s390/ -e s/parisc64/parisc/ \
> >> -                                 -e s/ppc.*/powerpc/ -e s/mips.*/mips/ \
> >> -                                 -e s/sh[234].*/sh/ -e s/aarch64.*/arm64/ \
> >> -                                 -e s/riscv.*/riscv/)
> >> +include scripts/subarch.include
>
> What is the reason for this SUBARCH block move to to scripts/subarch.include?
> Is this necessary for adding headers install dependency to lib.mk?

This is needed to create headers for cross build.

Cheers,
Anders
--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
