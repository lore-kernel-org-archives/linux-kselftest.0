From: mpe at ellerman.id.au (Michael Ellerman)
Date: Fri, 28 Sep 2018 14:52:22 +1000
Subject: [PATCH v6] selftests: add headers_install to lib.mk
In-Reply-To: <20180904104721.27535-1-anders.roxell@linaro.org>
References: <20180809080402.24469-1-anders.roxell@linaro.org>
 <20180904104721.27535-1-anders.roxell@linaro.org>
Message-ID: <87y3bmte9l.fsf@concordia.ellerman.id.au>

[ + linuxppc-dev ]

Anders Roxell <anders.roxell at linaro.org> writes:
> If the kernel headers aren't installed we can't build all the tests.
> Add a new make target rule 'khdr' in the file lib.mk to generate the
> kernel headers and that gets include for every test-dir Makefile that
> includes lib.mk If the testdir in turn have its own sub-dirs the
> top_srcdir needs to be set to the linux-rootdir to be able to generate
> the kernel headers.
>
> Signed-off-by: Anders Roxell <anders.roxell at linaro.org>
> Reviewed-by: Fathi Boudra <fathi.boudra at linaro.org>
> ---
>
> I sent this (v5) a month ago and wondered if it got lost. Resending
> unchanged.
>
> Cheers,
> Anders
>
>  Makefile                                           | 14 +-------------
>  scripts/subarch.include                            | 13 +++++++++++++
>  tools/testing/selftests/android/Makefile           |  2 +-
>  tools/testing/selftests/android/ion/Makefile       |  2 ++
>  tools/testing/selftests/futex/functional/Makefile  |  1 +
>  tools/testing/selftests/gpio/Makefile              |  7 ++-----
>  tools/testing/selftests/kvm/Makefile               |  7 ++-----
>  tools/testing/selftests/lib.mk                     | 12 ++++++++++++
>  tools/testing/selftests/net/Makefile               |  1 +
>  .../selftests/networking/timestamping/Makefile     |  1 +
>  tools/testing/selftests/vm/Makefile                |  4 ----
>  11 files changed, 36 insertions(+), 28 deletions(-)
>  create mode 100644 scripts/subarch.include

This broke all the powerpc selftests :(

Why did it go in at rc5?

cheers
