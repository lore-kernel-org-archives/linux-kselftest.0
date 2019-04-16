From: will.deacon at arm.com (Will Deacon)
Date: Tue, 16 Apr 2019 18:08:57 +0100
Subject: [PATCH v2 5/5] kselftest: Extend vDSO selftest to clock_getres
In-Reply-To: <20190416161434.32691-6-vincenzo.frascino@arm.com>
References: <20190416161434.32691-1-vincenzo.frascino@arm.com>
 <20190416161434.32691-6-vincenzo.frascino@arm.com>
Message-ID: <20190416170857.GC7342@fuggles.cambridge.arm.com>

On Tue, Apr 16, 2019 at 05:14:34PM +0100, Vincenzo Frascino wrote:
> The current version of the multiarch vDSO selftest verifies only
> gettimeofday.
> 
> Extend the vDSO selftest to clock_getres, to verify that the
> syscall and the vDSO library function return the same information.
> 
> The extension has been used to verify the hrtimer_resoltion fix.
> 
> Cc: Shuah Khan <shuah at kernel.org>
> Signed-off-by: Vincenzo Frascino <vincenzo.frascino at arm.com>
> ---
>  tools/testing/selftests/vDSO/Makefile         |   2 +
>  .../selftests/vDSO/vdso_clock_getres.c        | 108 ++++++++++++++++++
>  2 files changed, 110 insertions(+)
>  create mode 100644 tools/testing/selftests/vDSO/vdso_clock_getres.c

Assuming this will go via Shuah's tree.

Will
