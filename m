From: catalin.marinas at arm.com (Catalin Marinas)
Date: Sat, 1 Jun 2019 10:38:30 +0100
Subject: [PATCH v6 15/19] arm64: Add vDSO compat support
In-Reply-To: <20190530141531.43462-16-vincenzo.frascino@arm.com>
References: <20190530141531.43462-1-vincenzo.frascino@arm.com>
 <20190530141531.43462-16-vincenzo.frascino@arm.com>
Message-ID: <20190601093830.GA13589@arrakis.emea.arm.com>

On Thu, May 30, 2019 at 03:15:27PM +0100, Vincenzo Frascino wrote:
> Add vDSO compat support to the arm64 building system.
> 
> Cc: Catalin Marinas <catalin.marinas at arm.com>
> Cc: Will Deacon <will.deacon at arm.com>
> Signed-off-by: Vincenzo Frascino <vincenzo.frascino at arm.com>
> ---
>  arch/arm64/Kconfig         |  1 +
>  arch/arm64/Makefile        | 23 +++++++++++++++++++++--
>  arch/arm64/kernel/Makefile |  6 +++++-
>  3 files changed, 27 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
> index 952c9f8cf3b8..3e1d4f8347f4 100644
> --- a/arch/arm64/Kconfig
> +++ b/arch/arm64/Kconfig
> @@ -108,6 +108,7 @@ config ARM64
>  	select GENERIC_STRNLEN_USER
>  	select GENERIC_TIME_VSYSCALL
>  	select GENERIC_GETTIMEOFDAY
> +	select GENERIC_COMPAT_VDSO if !CPU_BIG_ENDIAN

This select needs to also depend on COMPAT (or rather be selected from
the COMPAT menuconfig), otherwise, trying to build this series with 64K
pages where COMPAT is disabled, I get:

  VDSOC_GTD   arch/arm64/kernel/vdso32/vgettimeofday.o
  VDSOA   arch/arm64/kernel/vdso32/sigreturn.o
arch/arm64/kernel/vdso32/sigreturn.S: Assembler messages:
arch/arm64/kernel/vdso32/sigreturn.S:25: Error: expected #constant
arch/arm64/kernel/vdso32/sigreturn.S:35: Error: expected #constant
arch/arm64/kernel/vdso32/sigreturn.S:46: Error: expected #constant
arch/arm64/kernel/vdso32/sigreturn.S:56: Error: expected #constant
arch/arm64/kernel/vdso32/sigreturn.S:28: Error: undefined symbol __NR_compat_sigreturn used as an immediate value
arch/arm64/kernel/vdso32/sigreturn.S:38: Error: undefined symbol __NR_compat_rt_sigreturn used as an immediate value
make[2]: *** [arch/arm64/kernel/vdso32/Makefile:154: arch/arm64/kernel/vdso32/sigreturn.o] Error 1
make[2]: *** Waiting for unfinished jobs....
In file included from lib/vdso/gettimeofday.c:25:0,
                 from <command-line>:0:
arch/arm64/include/asm/vdso/compat_gettimeofday.h: In function 'gettimeofday_fallback':
arch/arm64/include/asm/vdso/compat_gettimeofday.h:22:31: error: '__NR_compat_gettimeofday' undeclared (first use in this function); did you mean '__NR_gettimeofday'?
  register long nr asm("r7") = __NR_compat_gettimeofday;
                               ^~~~~~~~~~~~~~~~~~~~~~~~
                               __NR_gettimeofday
arch/arm64/include/asm/vdso/compat_gettimeofday.h:22:31: note: each undeclared identifier is reported only once for each function it appears in
arch/arm64/include/asm/vdso/compat_gettimeofday.h: In function 'clock_gettime_fallback':
arch/arm64/include/asm/vdso/compat_gettimeofday.h:40:31: error: '__NR_compat_clock_gettime64' undeclared (first use in this function); did you mean '__NR_clock_gettime'?
  register long nr asm("r7") = __NR_compat_clock_gettime64;
                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~
                               __NR_clock_gettime
arch/arm64/include/asm/vdso/compat_gettimeofday.h: In function 'clock_getres_fallback':
arch/arm64/include/asm/vdso/compat_gettimeofday.h:58:31: error: '__NR_compat_clock_getres_time64' undeclared (first use in this function); did you mean '__NR_clock_gettime'?
  register long nr asm("r7") = __NR_compat_clock_getres_time64;
                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                               __NR_clock_gettime
arch/arm64/kernel/vdso32/vgettimeofday.c: In function '__vdso_clock_gettime':
arch/arm64/kernel/vdso32/vgettimeofday.c:15:17: error: 'TASK_SIZE_32' undeclared (first use in this function); did you mean 'TASK_SIZE_64'?
  if ((u32)ts >= TASK_SIZE_32)
                 ^~~~~~~~~~~~
                 TASK_SIZE_64
arch/arm64/kernel/vdso32/vgettimeofday.c: In function '__vdso_clock_gettime64':
arch/arm64/kernel/vdso32/vgettimeofday.c:25:17: error: 'TASK_SIZE_32' undeclared (first use in this function); did you mean 'TASK_SIZE_64'?
  if ((u32)ts >= TASK_SIZE_32)
                 ^~~~~~~~~~~~
                 TASK_SIZE_64
arch/arm64/kernel/vdso32/vgettimeofday.c: In function '__vdso_clock_getres':
arch/arm64/kernel/vdso32/vgettimeofday.c:41:18: error: 'TASK_SIZE_32' undeclared (first use in this function); did you mean 'TASK_SIZE_64'?
  if ((u32)res >= TASK_SIZE_32)
                  ^~~~~~~~~~~~
                  TASK_SIZE_64
make[2]: *** [arch/arm64/kernel/vdso32/Makefile:152: arch/arm64/kernel/vdso32/vgettimeofday.o] Error 1
make[1]: *** [arch/arm64/Makefile:182: vdso_prepare] Error 2
make: *** [Makefile:179: sub-make] Error 2

-- 
Catalin
