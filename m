From: vincenzo.frascino@arm.com (Vincenzo Frascino)
Date: Tue, 28 May 2019 12:57:24 +0100
Subject: [PATCH v4 3/3] kselftest: Extend vDSO selftest to clock_getres
In-Reply-To: <87lfyrp0d2.fsf@concordia.ellerman.id.au>
References: <20190523112116.19233-1-vincenzo.frascino@arm.com>
 <20190523112116.19233-4-vincenzo.frascino@arm.com>
 <87lfyrp0d2.fsf@concordia.ellerman.id.au>
Message-ID: <afb7395f-43e9-c304-2db2-349e6727b687@arm.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190528115724.DO_YF07-SW3-uDHx4V0QDuew2tWpyZM3OcxiD_4WmW4@z>

Hi Michael,

thank you for your reply.

On 28/05/2019 07:19, Michael Ellerman wrote:
> Vincenzo Frascino <vincenzo.frascino at arm.com> writes:
> 
>> The current version of the multiarch vDSO selftest verifies only
>> gettimeofday.
>>
>> Extend the vDSO selftest to clock_getres, to verify that the
>> syscall and the vDSO library function return the same information.
>>
>> The extension has been used to verify the hrtimer_resoltion fix.
> 
> This is passing for me even without patch 1 applied, shouldn't it fail
> without the fix? What am I missing?
> 

This is correct, because during the refactoring process I missed an "n" :)

if·((x.tv_sec·!=·y.tv_sec)·||·(x.tv_sec·!=·y.tv_sec))

Should be:

if·((x.tv_sec·!=·y.tv_sec)·||·(x.tv_nsec·!=·y.tv_nsec))

My mistake, I am going to fix the test and re-post v5 of this set.

Without my patch if you pass "highres=off" to the kernel (as a command line
parameter) it leads to a broken implementation of clock_getres since the value
of CLOCK_REALTIME_RES does not change at runtime.

Expected result (with highres=off):

# uname -r
5.2.0-rc2
# ./vdso_clock_getres
clock_id: CLOCK_REALTIME [FAIL]
clock_id: CLOCK_BOOTTIME [PASS]
clock_id: CLOCK_TAI [PASS]
clock_id: CLOCK_REALTIME_COARSE [PASS]
clock_id: CLOCK_MONOTONIC [FAIL]
clock_id: CLOCK_MONOTONIC_RAW [PASS]
clock_id: CLOCK_MONOTONIC_COARSE [PASS]

The reason of this behavior is that the only clocks supported by getres on
powerpc are CLOCK_REALTIME and CLOCK_MONOTONIC, the rest on the clocks use
always syscalls.

> # uname -r
> 5.2.0-rc2-gcc-8.2.0
> 
> # ./vdso_clock_getres
> clock_id: CLOCK_REALTIME [PASS]
> clock_id: CLOCK_BOOTTIME [PASS]
> clock_id: CLOCK_TAI [PASS]
> clock_id: CLOCK_REALTIME_COARSE [PASS]
> clock_id: CLOCK_MONOTONIC [PASS]
> clock_id: CLOCK_MONOTONIC_RAW [PASS]
> clock_id: CLOCK_MONOTONIC_COARSE [PASS]
> 
> cheers
> 
>> Cc: Shuah Khan <shuah at kernel.org>
>> Signed-off-by: Vincenzo Frascino <vincenzo.frascino at arm.com>
>> ---
>>
>> Note: This patch is independent from the others in this series, hence it
>> can be merged singularly by the kselftest maintainers.
>>
>>  tools/testing/selftests/vDSO/Makefile         |   2 +
>>  .../selftests/vDSO/vdso_clock_getres.c        | 124 ++++++++++++++++++
>>  2 files changed, 126 insertions(+)
>>  create mode 100644 tools/testing/selftests/vDSO/vdso_clock_getres.c

-- 
Regards,
Vincenzo
