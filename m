Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795084556;
	b=CTTYTc/hcNnjKZ6rnLf1lVmWuZnlOCGw4+QzNCqv+QEvf5rMREvbr5WQ6QlYWnykq7VU
	 wu+xzEc3NCEgvI/imGi6dYIwnywwqihxhp6qdz2+0dchaQ0NulzQE97vNBF2FArKrddAR
	 AK9hq80OlY3C6hQ/C1kSzAMfmc9Z2IUFmt5XhrIi1N8ZylD1Rm+5kgfPWp6NKWHST/xdZ
	 AMoZn+spxbIntRwmC/+msE3/h6PdASWqd2JDDlXSQ6pfwekekM7XUyhIqeMqmyX/QRwvN
	 ZNU6aAdA2xPXCPUBEW933I0w/TIBA/nowbr5BtWvOLolBjFW66BoNqj0Eg61rrxXkbg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795084556;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=GgDxgmdIK5ZFV6i2LVaxKcVaEgHgnRDEHjSLl+YAUZg=;
	b=pmhuZcWsui0gyoceYVsV5uP8v+M/ln10DVBNJThGg9w0DqmcYWXYfwfSDKK9CzENZWbg
	 HrQasqRXncaQPfUwOjsc9PgZbxsYc4XZExSw2IzoB9w8mmQfLZrv02O/pUSHXl3qrcUt4
	 PgsvoNaLREdm9OzsrzJjwfgbH8L+qUAqiDlllHiQPP5UaPPv3hVpKeIE3alA/JJlIy7xV
	 Gj62iiLdfnJkbYd8amzFbMQE4W/NY5hqR7zAb2qGyXayzAOfP5FqN6EDKHuogeQHtRLuJ
	 cRdA1EjVukjlEP2s1MnQTPETeFdposNb7PHZvpa+vMti3R7cmvYYxnmvmn0JsSMK7Aw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=Ukd6Bz4k;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 91A6D606A326;
	Thu, 19 Nov 2026 10:35:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 91A6D606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=Ukd6Bz4k
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1C2221575;
	Thu, 19 Nov 2026 02:35:52 -0800 (PST)
Received: from e129823.arm.com (e129823.arm.com [10.2.213.3])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9E0AD3F632;
	Thu, 19 Nov 2026 02:35:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795084555; bh=OQ40n8vCPLl2z6BAfUVaBr1U7k9Hcye30/imffmeJkU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ukd6Bz4kAAGvhzWNxydXfeleNFT7s4hkrLTBz8YA0eSfizAgpG284yfj/uWv8Qmg/
	 GU7Mc3I3LUmAbziW00YfUH2GQnnv/0d7Yj9KSsSxJX/sdAF/1I4qnwOfRpFJksRSS7
	 /tH7gbrgw7jm7xXpEwdKoFzcCptXzAiwFIlesn2g=
Date: Thu, 19 Nov 2026 10:35:51 +0000
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: Kevin Brodsky <kevin.brodsky@arm.com>
Cc: linux-arm-kernel@lists.infradead.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Linu Cherian <linu.cherian@arm.com>,
	Mark Brown <broonie@kernel.org>, Shuah Khan <shuah@kernel.org>,
	Will Deacon <will@kernel.org>, Yeoreum Yun <yeoreum.yun@arm.com>,
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v2 2/2] kselftest/arm64: Add test for atomic futex
 uaccess with POE
Message-ID: <av7RB7jJa0PfDsXG@e129823.arm.com>
References: <20261119-poe_futex-v2-0-244c7a01f788@arm.com>
 <20261119-poe_futex-v2-2-244c7a01f788@arm.com>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261119-poe_futex-v2-2-244c7a01f788@arm.com>

Look good to me.

Reviewed-by: Yeoreum Yun <yeoreum.yun@arm.com>

On Thu, Nov 19, 2026 at 09:54:38AM +0000, Kevin Brodsky wrote:
> Add a new test to ensure that atomic futex uaccess succeeds on
> memory mapped with a non-default POIndex/pkey.
> 
> In the absence of FEAT_LSUI, atomic futex uaccess operations such as
> those triggered by FUTEX_WAKE_OP use privileged atomic load/store
> instructions and thus cannot have user permission overlays (POR_EL0)
> applied. In case the kernel enabled POE at EL1, it is worth
> checking that kernel overlays (POR_EL1) are not applied to these
> accesses, as that would fail for non-zero pkeys.
> 
> Note that if such misconfiguration occurs, futex_wake_op() may get
> stuck in an infinite loop because futex_atomic_op_inuser() will fail
> but fault_in_user_writeable() will still report success.
> 
> Signed-off-by: Kevin Brodsky <kevin.brodsky@arm.com>
> ---
>  tools/testing/selftests/arm64/Makefile        |  2 +-
>  tools/testing/selftests/arm64/poe/.gitignore  |  2 +
>  tools/testing/selftests/arm64/poe/Makefile    |  6 +++
>  tools/testing/selftests/arm64/poe/poe_futex.c | 62 +++++++++++++++++++++++++++
>  4 files changed, 71 insertions(+), 1 deletion(-)
> 
> diff --git a/tools/testing/selftests/arm64/Makefile b/tools/testing/selftests/arm64/Makefile
> index e456f3b62fa1..bad5c3b33dce 100644
> --- a/tools/testing/selftests/arm64/Makefile
> +++ b/tools/testing/selftests/arm64/Makefile
> @@ -4,7 +4,7 @@
>  ARCH ?= $(shell uname -m 2>/dev/null || echo not)
>  
>  ifneq (,$(filter $(ARCH),aarch64 arm64))
> -ARM64_SUBTARGETS ?= tags signal pauth fp mte bti abi gcs
> +ARM64_SUBTARGETS ?= tags signal pauth fp mte bti abi gcs poe
>  else
>  ARM64_SUBTARGETS :=
>  endif
> diff --git a/tools/testing/selftests/arm64/poe/.gitignore b/tools/testing/selftests/arm64/poe/.gitignore
> new file mode 100644
> index 000000000000..0dce4a3aa38b
> --- /dev/null
> +++ b/tools/testing/selftests/arm64/poe/.gitignore
> @@ -0,0 +1,2 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +poe_futex
> diff --git a/tools/testing/selftests/arm64/poe/Makefile b/tools/testing/selftests/arm64/poe/Makefile
> new file mode 100644
> index 000000000000..2af2bbf3f6d3
> --- /dev/null
> +++ b/tools/testing/selftests/arm64/poe/Makefile
> @@ -0,0 +1,6 @@
> +# SPDX-License-Identifier: GPL-2.0
> +
> +CFLAGS += $(KHDR_INCLUDES)
> +TEST_GEN_PROGS := poe_futex
> +
> +include ../../lib.mk
> diff --git a/tools/testing/selftests/arm64/poe/poe_futex.c b/tools/testing/selftests/arm64/poe/poe_futex.c
> new file mode 100644
> index 000000000000..21a2e109ee43
> --- /dev/null
> +++ b/tools/testing/selftests/arm64/poe/poe_futex.c
> @@ -0,0 +1,62 @@
> +// SPDX-License-Identifier: GPL-2.0
> +#include <stdint.h>
> +#include <stdlib.h>
> +#include <unistd.h>
> +
> +#include <linux/futex.h>
> +#include <sys/syscall.h>
> +
> +#include "kselftest_harness.h"
> +
> +static int sys_pkey_alloc(unsigned long flags, unsigned long init_val)
> +{
> +	return syscall(__NR_pkey_alloc, flags, init_val);
> +}
> +
> +static int sys_pkey_mprotect(void *ptr, size_t size, int prot, int pkey)
> +{
> +	return syscall(__NR_pkey_mprotect, ptr, size, prot, pkey);
> +}
> +
> +static int futex_wake_op(uint32_t *uaddr, uint32_t val, uint32_t val2,
> +			 uint32_t *uaddr2, uint32_t val3)
> +{
> +	return syscall(SYS_futex, uaddr, FUTEX_WAKE_OP, val, val2,
> +		       uaddr2, val3);
> +}
> +
> +/*
> + * Trigger some atomic uaccess on a page mapped with a non-default pkey.
> + *
> + * This ensures that such access is not mistakenly checked against the
> + * kernel's POR_EL1 register.
> + */
> +TEST(poe_futex)
> +{
> +	int ret, pkey;
> +	void *ptr;
> +	size_t size = getpagesize();
> +
> +	pkey = sys_pkey_alloc(0, 0);
> +
> +	if (pkey == -1 && errno == ENOSPC)
> +		SKIP(return, "pkeys are not supported");
> +
> +	ASSERT_GT(pkey, 0);
> +
> +	ptr = mmap(NULL, size, PROT_READ | PROT_WRITE,
> +		   MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
> +	ASSERT_NE(ptr, MAP_FAILED);
> +
> +	ret = sys_pkey_mprotect(ptr, size, PROT_READ | PROT_WRITE, pkey);
> +	ASSERT_EQ(ret, 0);
> +
> +	/*
> +	 * There is no one to wake up so this syscall boils down to *(ptr+4) = 0
> +	 * (arch_futex_atomic_op_inuser() called with FUTEX_OP_SET and op_arg=0).
> +	 */
> +	ret = futex_wake_op(ptr, 1, 1, ptr + sizeof(uint32_t), 0);
> +	ASSERT_EQ(ret, 0);
> +}
> +
> +TEST_HARNESS_MAIN
> 
> -- 
> 2.56.0
> 

-- 
Sincerely,
Yeoreum Yun
