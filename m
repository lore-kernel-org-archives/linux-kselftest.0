From: mpe@ellerman.id.au (Michael Ellerman)
Date: Tue, 28 May 2019 16:19:21 +1000
Subject: [PATCH v4 3/3] kselftest: Extend vDSO selftest to clock_getres
In-Reply-To: <20190523112116.19233-4-vincenzo.frascino@arm.com>
References: <20190523112116.19233-1-vincenzo.frascino@arm.com>
 <20190523112116.19233-4-vincenzo.frascino@arm.com>
Message-ID: <87lfyrp0d2.fsf@concordia.ellerman.id.au>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190528061921.PLXX4E-6HH0bbgoXs8U_QL9iRl2vb3yhwqpHRp-YsWU@z>

Vincenzo Frascino <vincenzo.frascino at arm.com> writes:

> The current version of the multiarch vDSO selftest verifies only
> gettimeofday.
>
> Extend the vDSO selftest to clock_getres, to verify that the
> syscall and the vDSO library function return the same information.
>
> The extension has been used to verify the hrtimer_resoltion fix.

This is passing for me even without patch 1 applied, shouldn't it fail
without the fix? What am I missing?

# uname -r
5.2.0-rc2-gcc-8.2.0

# ./vdso_clock_getres
clock_id: CLOCK_REALTIME [PASS]
clock_id: CLOCK_BOOTTIME [PASS]
clock_id: CLOCK_TAI [PASS]
clock_id: CLOCK_REALTIME_COARSE [PASS]
clock_id: CLOCK_MONOTONIC [PASS]
clock_id: CLOCK_MONOTONIC_RAW [PASS]
clock_id: CLOCK_MONOTONIC_COARSE [PASS]

cheers

> Cc: Shuah Khan <shuah at kernel.org>
> Signed-off-by: Vincenzo Frascino <vincenzo.frascino at arm.com>
> ---
>
> Note: This patch is independent from the others in this series, hence it
> can be merged singularly by the kselftest maintainers.
>
>  tools/testing/selftests/vDSO/Makefile         |   2 +
>  .../selftests/vDSO/vdso_clock_getres.c        | 124 ++++++++++++++++++
>  2 files changed, 126 insertions(+)
>  create mode 100644 tools/testing/selftests/vDSO/vdso_clock_getres.c
