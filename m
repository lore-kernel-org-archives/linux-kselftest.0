From: vincenzo.frascino@arm.com (Vincenzo Frascino)
Date: Tue, 4 Jun 2019 13:10:31 +0100
Subject: [PATCH v6 15/19] arm64: Add vDSO compat support
In-Reply-To: <20190601093830.GA13589@arrakis.emea.arm.com>
References: <20190530141531.43462-1-vincenzo.frascino@arm.com>
 <20190530141531.43462-16-vincenzo.frascino@arm.com>
 <20190601093830.GA13589@arrakis.emea.arm.com>
Message-ID: <2027e092-2d76-9350-6c5b-7d3debc6a93f@arm.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190604121031.wmB6cEFr0gEJWM0adVZ-hW9_XY1WNYes3gpQY892GLg@z>

Hi Catalin,

thank you for testing my patches and providing the scripts you used to reproduce
the issue.

On 01/06/2019 10:38, Catalin Marinas wrote:
> On Thu, May 30, 2019@03:15:27PM +0100, Vincenzo Frascino wrote:
>> Add vDSO compat support to the arm64 building system.
>>
>> Cc: Catalin Marinas <catalin.marinas at arm.com>
>> Cc: Will Deacon <will.deacon at arm.com>
>> Signed-off-by: Vincenzo Frascino <vincenzo.frascino at arm.com>
>> ---
>>  arch/arm64/Kconfig         |  1 +
>>  arch/arm64/Makefile        | 23 +++++++++++++++++++++--
>>  arch/arm64/kernel/Makefile |  6 +++++-
>>  3 files changed, 27 insertions(+), 3 deletions(-)
>>
>> diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
>> index 952c9f8cf3b8..3e1d4f8347f4 100644
>> --- a/arch/arm64/Kconfig
>> +++ b/arch/arm64/Kconfig
>> @@ -108,6 +108,7 @@ config ARM64
>>  	select GENERIC_STRNLEN_USER
>>  	select GENERIC_TIME_VSYSCALL
>>  	select GENERIC_GETTIMEOFDAY
>> +	select GENERIC_COMPAT_VDSO if !CPU_BIG_ENDIAN
> 
> This select needs to also depend on COMPAT (or rather be selected from
> the COMPAT menuconfig), otherwise, trying to build this series with 64K
> pages where COMPAT is disabled, I get:
> 

This is a very good catch, my bad, will definitely fix in v7.

...

-- 
Regards,
Vincenzo
