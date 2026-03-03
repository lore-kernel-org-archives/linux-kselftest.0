Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBFB2149C7B;
	Tue,  3 Mar 2026 07:09:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772521777; cv=none; b=vE/bPMYUt1UNnnqpsiX14ZsqTfk12+iF1YFjojSa5mLXatA40aX0xPP+DC3/tLM89+LMm1Jt+lTKBjuQCokGKn/HkUHCT0v3UwvHrsb7A4TT+siFGlOOkTx1gvHVHwgK4vDo2hmj1aIHxPeQxyOlhwC3oenbJUECyyAtdacn7BQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772521777; c=relaxed/simple;
	bh=S2hyWDTjtOZ6PFcrmL53uq+Ut9lQFYrRfbPfG5BD0tQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pEhgFUS5NQqNqgeGzj08NY1uOMGc2MPqfmXWvdS2Ih/0CG8LD/rASaDabpLU+rULprvyUGndXj5QvQ7L2paCIu1If69HCy//WDP0BsekhCCJxT3KGP69O24pIJe2iBFjOxwW+9i4EmO6cCfpCqy2+TPvar7SU3woQVa+oSj6ltg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=blV+KjoE; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="blV+KjoE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1772521774;
	bh=S2hyWDTjtOZ6PFcrmL53uq+Ut9lQFYrRfbPfG5BD0tQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=blV+KjoEK4/magl2I67qFyGBhkUPrpQ1V2CP+03cTLIzwvvSEKOBKBwhp92lHI4WQ
	 3wzn3soX95MZMFtZ5UZTbqMIvRBNNlIckOppgdpRTnb5vCEbBXMY03cRdWmYzgtMce
	 sRxm1O2lT9VgEGA4onE7yDBTRqqpOd8kXgeVbCw0=
Date: Tue, 3 Mar 2026 08:09:33 +0100
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
To: Jordan Richards <jordanrichards@google.com>
Cc: Pasha Tatashin <pasha.tatashin@soleen.com>, 
	Mike Rapoport <rppt@kernel.org>, Pratyush Yadav <pratyush@kernel.org>, 
	Shuah Khan <shuah@kernel.org>, Willy Tarreau <w@1wt.eu>, Jason Miu <jasonmiu@google.com>, 
	David Matlack <dmatlack@google.com>, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v3 1/2] tools/nolibc: add ftruncate()
Message-ID: <c65fdf06-2f69-4c81-be21-a14229eaf1b6@t-8ch.de>
References: <20260303010039.2969125-1-jordanrichards@google.com>
 <20260303010039.2969125-2-jordanrichards@google.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260303010039.2969125-2-jordanrichards@google.com>

Hi Jordan,

On 2026-03-03 01:00:38+0000, Jordan Richards wrote:
> On architectures with 32-bit longs, call the compat syscall
> __NR_ftruncate64. As off_t is 64-bit it must be split into 2 registers.
> Unlike llseek() which passes the high and low parts in explicitly named
> arguments, the order here is endian independent.
> 
> Some architectures (arm, mips, ppc) require this pair of registers to
> be aligned to an even register, so add custom sys_ftruncate64 wrappers
> for those.
> 
> A test case for ftruncate is added which validates negative length or
> invalid fd return the appropriate error, and checks the length is
> correct on success.

Thanks, this all looks good in general.

In nolibc-next we renamed all the my_syscall*() functions to
__nolibc_syscall*(), merging this patch through the liveupdate tree
will lead to semantic conflicts.

I see different ways to handle this:
* An an immutable branch to merge into the liveupdate tree
* Split up the series
  * Use raw syscall(__NR_ftruncate) in the liveupdate
    selftests, as it is sufficient for that.
  * Merge the nolibc bits through the nolibc tree.
  * Next cycle, switch to proper nolibc ftruncate().
  * Let Linus handle the conflict when merging the tree.

There are some nitpicks inline, but we can also fix those up when
applying the patch.

> Signed-off-by: Jordan Richards <jordanrichards@google.com>
> ---
>  tools/include/nolibc/arch-arm.h              | 11 +++++
>  tools/include/nolibc/arch-mips.h             | 11 +++++
>  tools/include/nolibc/arch-powerpc.h          | 11 +++++
>  tools/include/nolibc/unistd.h                | 35 ++++++++++++++
>  tools/testing/selftests/nolibc/nolibc-test.c | 51 ++++++++++++++++++++
>  5 files changed, 119 insertions(+)
> 
> diff --git a/tools/include/nolibc/arch-arm.h b/tools/include/nolibc/arch-arm.h
> index 251c42579028..ed65fb674e61 100644
> --- a/tools/include/nolibc/arch-arm.h
> +++ b/tools/include/nolibc/arch-arm.h
> @@ -6,9 +6,11 @@
>  
>  #ifndef _NOLIBC_ARCH_ARM_H
>  #define _NOLIBC_ARCH_ARM_H

Nit: keep an empty line after the include guards.

> +#include <linux/unistd.h>
>  #include "compiler.h"
>  #include "crt.h"
> +#include "std.h"
>  
>  /* Syscalls for ARM in ARM or Thumb modes :
>   *   - registers are 32-bit
> @@ -196,4 +198,13 @@ void __attribute__((weak, noreturn)) __nolibc_entrypoint __no_stack_protector _s
>  }
>  #endif /* NOLIBC_NO_RUNTIME */
>  
> +#ifdef __NR_ftruncate64

Should be unnecessary.

> +static __attribute__((unused))
> +int sys_ftruncate64(int fd, uint32_t length0, uint32_t length1)
> +{
> +	return my_syscall4(__NR_ftruncate64, fd, 0, length0, length1);
> +}
> +#define sys_ftruncate64 sys_ftruncate64
> +#endif
> +
>  #endif /* _NOLIBC_ARCH_ARM_H */
> diff --git a/tools/include/nolibc/arch-mips.h b/tools/include/nolibc/arch-mips.h
> index a72506ceec6b..26d044004ec6 100644
> --- a/tools/include/nolibc/arch-mips.h
> +++ b/tools/include/nolibc/arch-mips.h
> @@ -6,9 +6,11 @@
>  
>  #ifndef _NOLIBC_ARCH_MIPS_H
>  #define _NOLIBC_ARCH_MIPS_H

Also an empty line.

> +#include <linux/unistd.h>
>  #include "compiler.h"
>  #include "crt.h"
> +#include "std.h"
>  
>  #if !defined(_ABIO32) && !defined(_ABIN32) && !defined(_ABI64)
>  #error Unsupported MIPS ABI
> @@ -269,4 +271,13 @@ void __attribute__((weak, noreturn)) __nolibc_entrypoint __no_stack_protector __
>  }
>  #endif /* NOLIBC_NO_RUNTIME */
>  
> +#ifdef __NR_ftruncate64
> +static __attribute__((unused))
> +int sys_ftruncate64(int fd, uint32_t length0, uint32_t length1)
> +{
> +	return my_syscall4(__NR_ftruncate64, fd, 0, length0, length1);
> +}
> +#define sys_ftruncate64 sys_ftruncate64
> +#endif
> +
>  #endif /* _NOLIBC_ARCH_MIPS_H */
> diff --git a/tools/include/nolibc/arch-powerpc.h b/tools/include/nolibc/arch-powerpc.h
> index e0c7e0b81f7c..71829cb027e8 100644
> --- a/tools/include/nolibc/arch-powerpc.h
> +++ b/tools/include/nolibc/arch-powerpc.h
> @@ -6,9 +6,11 @@
>  
>  #ifndef _NOLIBC_ARCH_POWERPC_H
>  #define _NOLIBC_ARCH_POWERPC_H
> +#include <linux/unistd.h>
>  
>  #include "compiler.h"
>  #include "crt.h"
> +#include "std.h"
>  
>  /* Syscalls for PowerPC :
>   *   - stack is 16-byte aligned
> @@ -218,4 +220,13 @@ void __attribute__((weak, noreturn)) __nolibc_entrypoint __no_stack_protector _s
>  }
>  #endif /* NOLIBC_NO_RUNTIME */
>  
> +#ifdef __NR_ftruncate64
> +static __attribute__((unused))
> +int sys_ftruncate64(int fd, uint32_t length0, uint32_t length1)
> +{
> +	return my_syscall4(__NR_ftruncate64, fd, 0, length0, length1);
> +}
> +#define sys_ftruncate64 sys_ftruncate64
> +#endif
> +
>  #endif /* _NOLIBC_ARCH_POWERPC_H */
> diff --git a/tools/include/nolibc/unistd.h b/tools/include/nolibc/unistd.h
> index bb5e80f3f05d..85ac253f9189 100644
> --- a/tools/include/nolibc/unistd.h
> +++ b/tools/include/nolibc/unistd.h
> @@ -48,6 +48,41 @@ int access(const char *path, int amode)
>  	return faccessat(AT_FDCWD, path, amode, 0);
>  }
>  
> +#if !defined(sys_ftruncate64) && defined(__NR_ftruncate64)
> +static __attribute__((unused))
> +int sys_ftruncate64(int fd, uint32_t length0, uint32_t length1)
> +{
> +

Nit: Spurious empty line.

> +	return my_syscall3(__NR_ftruncate64, fd, length0, length1);
> +}
> +#define sys_ftruncate64 sys_ftruncate64
> +#endif
> +
> +static __attribute__((unused))
> +int sys_ftruncate(int fd, off_t length)
> +{
> +#ifdef sys_ftruncate64
> +	union {
> +		off_t length;
> +		struct {
> +			uint32_t length0;
> +			uint32_t length1;
> +		};
> +	} arg;
> +
> +	arg.length = length;
> +
> +	return sys_ftruncate64(fd, arg.length0, arg.length1);
> +#else
> +	return my_syscall2(__NR_ftruncate, fd, length);
> +#endif
> +}
> +
> +static __attribute__((unused))
> +int ftruncate(int fd, off_t length)
> +{
> +	return __sysret(sys_ftruncate(fd, length));
> +}
>  
>  static __attribute__((unused))
>  int msleep(unsigned int msecs)
> diff --git a/tools/testing/selftests/nolibc/nolibc-test.c b/tools/testing/selftests/nolibc/nolibc-test.c
> index 1b9d3b2e2491..6a84dfbb4b73 100644
> --- a/tools/testing/selftests/nolibc/nolibc-test.c
> +++ b/tools/testing/selftests/nolibc/nolibc-test.c
> @@ -969,6 +969,56 @@ int test_fork(enum fork_type type)
>  	}
>  }
>  
> +int test_ftruncate(void)
> +{
> +	int ret;
> +	int fd;
> +	struct stat stat_buf;
> +	const char *filename = "/tmp/ftruncate_test";
> +
> +	ret = ftruncate(-1, 0);
> +	if (ret != -1 || errno != EBADF) {
> +		errno = EINVAL;
> +		return __LINE__;
> +	}
> +
> +	fd = open(filename, O_RDWR | O_CREAT);

Missing the mode argument.
O_TMPFILE would make things easier.

> +	if (fd == -1)
> +		return __LINE__;
> +
> +	ret = ftruncate(fd, -1);
> +	if (ret != -1 || errno != EINVAL) {
> +		if (ret == 0)
> +			errno = EINVAL;
> +		ret = __LINE__;
> +		goto end;
> +	}
> +
> +	ret = ftruncate(fd, 42);
> +	if (ret != 0) {
> +		ret = __LINE__;
> +		goto end;
> +	}
> +
> +	ret = fstat(fd, &stat_buf);
> +	if (ret != 0) {
> +		ret = __LINE__;
> +		goto end;
> +	}
> +
> +	if (stat_buf.st_size != 42) {
> +		errno = EINVAL;
> +		ret = stat_buf.st_size;
> +		goto end;
> +	}

Could you also add a variant which tests that 64-bit values work correctly?

> +
> +end:
> +	close(fd);
> +	unlink(filename);
> +
> +	return ret;
> +}
> +
>  int test_stat_timestamps(void)
>  {
>  	struct stat st;
> @@ -1406,6 +1456,7 @@ int run_syscall(int min, int max)
>  		CASE_TEST(file_stream);       EXPECT_SYSZR(1, test_file_stream()); break;
>  		CASE_TEST(file_stream_wsr);   EXPECT_SYSZR(1, test_file_stream_wsr()); break;
>  		CASE_TEST(fork);              EXPECT_SYSZR(1, test_fork(FORK_STANDARD)); break;
> +		CASE_TEST(ftruncate);         EXPECT_SYSZR(1, test_ftruncate()); break;
>  		CASE_TEST(getdents64_root);   EXPECT_SYSNE(1, test_getdents64("/"), -1); break;
>  		CASE_TEST(getdents64_null);   EXPECT_SYSER(1, test_getdents64("/dev/null"), -1, ENOTDIR); break;
>  		CASE_TEST(directories);       EXPECT_SYSZR(proc, test_dirent()); break;
> -- 
> 2.53.0.473.g4a7958ca14-goog
> 
