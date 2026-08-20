Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com [209.85.210.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C5295CDF1
	for <linux-kselftest@vger.kernel.org>; Thu, 20 Aug 2026 01:49:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787190584; cv=none; b=uOQHUa0v2R0RZUnODQxMMik/6ERHVBVhAn82fvJ+xPbvUeKwA/s8+2keuPs3vOnUa2jtXwgGrxluEfUCisL+hI/F+2boodbahrNz0kvJqI2Hu1Fi2HJm+8q4ubUj4W8t5A76LZyd20OGcQQq6gyn6CZODDVbyy6Fd41SKIuZ86E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787190584; c=relaxed/simple;
	bh=QerFprJmkV3UezqNsEtxQ+2hoOwyt1iH/St58v3zFXM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ToB6f8LAIbUTk8aBPHDarjEJGDaD5HH2SAAsgWkf9pZYG1rvAsX7vchzYDXmIA/DaRbyAJoQ8O6CG7/tBu5BlvY0GefUjd06HdvTuwQ7bzCJDAI+yPuoiuryX5lyJg1xrRqn2+BwwVB3LuAKvHcT/kBgbdA4RcSxP0j2EZxWSk0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com; spf=pass smtp.mailfrom=sifive.com; dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b=EwGfUiId; arc=none smtp.client-ip=209.85.210.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sifive.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="EwGfUiId"
Received: by mail-ot1-f48.google.com with SMTP id 46e09a7af769-7eb61bbeb25so1244201a34.1
        for <linux-kselftest@vger.kernel.org>; Wed, 19 Aug 2026 18:49:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1787190582; x=1787795382; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ze1L0S4sesJZh95VqJNWzJb8j2n+58CZfzAPSw1jjOA=;
        b=EwGfUiIdBgM0/bnPFEdnlsJMqZVFfmc+5Y593PzyQJKZiw1qba5LfK799/F5jGuOZ7
         U3KPqxdA3D85seFBRORD0c4aQN0KfCQFBwNP9lqlNDeaz3x1cPyP1SEtFg8qFgT65weE
         PvpS3RLurHm90tEcdbaiYsoUB0UgRBU/yCv8KCLFu2renDeJZ7OqtPGn+Opr2SQ/tYKc
         GABr/CQBdzyL/86vJs+AwHWIZ1LhBR0PvLH4m0QFr7JEg0FqIpOI9wk/d778AXkhS7Fn
         1u2Shj5TtjuJI3cFtU1FthMHj3kW+WcnktB2pcBagAHMvhjawpkvxTJS+2Nw/MuUrQrH
         MCrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787190582; x=1787795382;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ze1L0S4sesJZh95VqJNWzJb8j2n+58CZfzAPSw1jjOA=;
        b=hHxnaqb1C+ymfanD3OGM9fBgtOR06c1yNzCEdiw4uZY2aIATTrg3PmtUgGRuMKWwyq
         /MEFUixKRyutWou59Lgra2KWhu9Awe2iZSBYGLchI6tzcOA4xqaedEZMhInNdvGnoQht
         9bnaiFIULr/gIUl9j/SeLYhgv7jJhTAJoiuvDZ4+AcWNUlr2uTo/GyKZWDrkxlSNRCDp
         nEfykdmimWy8wd0qyLa/6WSa8GI36cGJBKkpZwZ443F2v/Unb9+qM8gM/Ack0rGpIbJq
         jDYHYzhOObJCoUafgQdRtHgeZWtFR6n/Q06fA9KYVC3u3RH+qXeSqVlUnYvAMl1zKAIV
         0bcw==
X-Forwarded-Encrypted: i=1; AHgh+RoRV/e0voTjywpAyh4pg4MP3rjo5B6CWzmXdTZK1lAN7LPnvX9VcmGvKBKYF4vJSftc/llWEV8vLgVd319cKB0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwxHl6SstZJN1lynxn5Sv0e7d8k3CB8ypYtZZOPYDgvERH9az8j
	dEs/Ib/Gz9oDkjXLeT90/L9Q5uHuUduY5bvFfyAFRgiTg7isQeAZqHptEVV0M3F9ip8=
X-Gm-Gg: AR+sD13tIls6Gs4zwmOl4T7x8IsLBeizZGdJRp/FLQTJHul32Ozpb/9ds1bPwRquKtP
	2zhSOp2/b8INKTiVVpbxyjFIWf5Dl0PMXsYUp5bbu1h8cetI5SqWLtrAcT3c25ehtEGGxJaLWeJ
	XphdR6wPhp0wRAhLtpb05iz2p/ut/XFwYpWyGwfBIMvib8Cf5XF7mtJ2v/FKuNtTfU73Qtl07pG
	O0psV1QuMokYlXgTwmH6qA0fEk+takTgNkPh5BgeVj39VvctTuvmcFEwoN3CCyri3aCzLmGhqu3
	c3XjHPkBH9m4UMwfdBYnbTfNXF2Pj6MHR7g5dxmCgIlUpMcYnSlaGxBR8oTTEkfP3hrmmEzuhke
	KcS5Q9MKl7wvt6w/w8cP0USVJYWC9dyYbMj+XPwrkSm7irMcfQg+W+VKxfq5oKCb3ju6fpgrZwX
	BLhs5UiFu/Ap1dmKP2/xw8mVubzIjwdBUffCj9SubSpgL0H2X5VF1pIIckYo4VCcclN+jSslFmH
	Xn+WH3KW1s=
X-Received: by 2002:a05:6830:2117:b0:7e9:d4b5:8004 with SMTP id 46e09a7af769-7f43f95afe1mr10936044a34.5.1787190581986;
        Wed, 19 Aug 2026 18:49:41 -0700 (PDT)
Received: from [100.64.0.1] ([170.85.102.82])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7f43fe70786sm3565200a34.4.2026.08.19.18.49.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Aug 2026 18:49:41 -0700 (PDT)
Message-ID: <1e5340c0-6a36-4727-b96e-19ac40565a92@sifive.com>
Date: Wed, 19 Aug 2026 20:49:39 -0500
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] riscv: selftests: Fix pointer masking test failures on
 real hardware
To: JinRui <jinrui@haiwei.tech>, Shuah Khan <shuah@kernel.org>,
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>
Cc: Alexandre Ghiti <alex@ghiti.fr>, Charlie Jenkins <charlie@rivosinc.com>,
 linux-kselftest@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <04B199F7DC302BCA+20260721065242.233233-1-jinrui@haiwei.tech>
From: Samuel Holland <samuel.holland@sifive.com>
Content-Language: en-US
In-Reply-To: <04B199F7DC302BCA+20260721065242.233233-1-jinrui@haiwei.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 2026-07-21 1:52 AM, JinRui wrote:
> From: jinrui <jinrui@haiwei.tech>
> 
> The pointer masking selftest contains several bugs that cause it to fail
> on real RISC-V hardware:
> 
> 1. test_pmlen() did not pass PR_TAGGED_ADDR_ENABLE when requesting a
>    non-zero PMLEN. The kernel requires this flag; without it, PMLEN is
>    forced to 0 regardless of the requested value (see process.c:352).

Ouch, sorry, this is a bug in the kernel, introduced by commit 3033b2b1e394
("riscv: Reset pmm when PR_TAGGED_ADDR_ENABLE is not set"). The kernel
documentation and existing selftest logic are correct. PMLEN is independent from
PR_TAGGED_ADDR_ENABLE so userspace can use pointer masking internally without
changing the syscall ABI. This allows userspace software to behave like it does
on arm64, where TBI is always enabled, but the tagged address ABI is disabled by
default.

I was not paying enough attention and should not have Reviewed-by that patch. I
just sent a revert:
https://lore.kernel.org/linux-riscv/20260820014551.1979772-1-samuel.holland@sifive.com/

> 2. set_tagged_addr_ctrl() required the PR_GET return value to exactly
>    match the PR_SET argument. However, the kernel may legitimately:
>    - Force PMLEN to 0 when the ABI is disabled (tagged_addr_abi=false)
>    - Round up PMLEN (e.g., request=1 -> PMLEN=7 or PMLEN=16)

There should be no rounding here, because set_tagged_addr_ctrl() is only ever
called with pmlen set to 0, min_pmlen, or max_pmlen. All of these are values
that the kernel is known to support (in other words, they are already rounded).
The remaining issues described here should be fixed by the revert linked above.

Regards,
Samuel

> 3. test_dereference_pmlen() always passed tagged_addr_abi=false, even
>    for non-zero PMLEN values. This meant PMLEN was never actually
>    enabled, so the valid tag dereference test always triggered SIGSEGV.
> 
> 4. test_fork_exec() passed tagged_addr_abi=false, causing the fork
>    child's tagged pointer dereference to fail because the inherited
>    PMLEN was 0.
> 
> Additionally, add an explicit #include <stdint.h> for uintptr_t, which
> is required by the C standard and must be included explicitly on some
> compiler/libc combinations.
> 
> Fixes: 7470b5afd150 ("riscv: selftests: Add a pointer masking test")
> Signed-off-by: jinrui <jinrui@haiwei.tech>
> ---
>  .../selftests/riscv/abi/pointer_masking.c     | 34 +++++++++++++++++--
>  1 file changed, 31 insertions(+), 3 deletions(-)
> 
> diff --git a/tools/testing/selftests/riscv/abi/pointer_masking.c b/tools/testing/selftests/riscv/abi/pointer_masking.c
> index 2d540af7b558..106f12f1ea44 100644
> --- a/tools/testing/selftests/riscv/abi/pointer_masking.c
> +++ b/tools/testing/selftests/riscv/abi/pointer_masking.c
> @@ -5,6 +5,7 @@
>  #include <setjmp.h>
>  #include <signal.h>
>  #include <stdbool.h>
> +#include <stdint.h>
>  #include <sys/prctl.h>
>  #include <sys/wait.h>
>  #include <unistd.h>
> @@ -17,6 +18,9 @@
>  #ifndef PR_PMLEN_MASK
>  #define PR_PMLEN_MASK			(0x7fUL << PR_PMLEN_SHIFT)
>  #endif
> +#ifndef PR_TAGGED_ADDR_ENABLE
> +#define PR_TAGGED_ADDR_ENABLE		1
> +#endif
>  
>  static int dev_zero;
>  
> @@ -44,7 +48,10 @@ static void test_pmlen(void)
>  	for (int request = 0; request <= 16; request++) {
>  		int pmlen, ret;
>  
> -		ret = prctl(PR_SET_TAGGED_ADDR_CTRL, request << PR_PMLEN_SHIFT, 0, 0, 0);
> +		ret = prctl(PR_SET_TAGGED_ADDR_CTRL,
> +			    request << PR_PMLEN_SHIFT |
> +			    (request ? PR_TAGGED_ADDR_ENABLE : 0),
> +			    0, 0, 0);
>  		if (ret)
>  			goto pr_set_error;
>  
> @@ -85,6 +92,22 @@ static int set_tagged_addr_ctrl(int pmlen, bool tagged_addr_abi)
>  		ret = prctl(PR_GET_TAGGED_ADDR_CTRL, 0, 0, 0, 0);
>  		if (ret == arg)
>  			return 0;
> +
> +		/*
> +		 * When tagged_addr_abi is false, the kernel forces PMLEN
> +		 * to 0 regardless of what was requested. Accept the result
> +		 * as long as PR_TAGGED_ADDR_ENABLE is not set.
> +		 */
> +		if (!tagged_addr_abi && !(ret & PR_TAGGED_ADDR_ENABLE))
> +			return 0;
> +
> +		/*
> +		 * When tagged_addr_abi is true, the kernel may round up
> +		 * the PMLEN (e.g. request=1 -> PMLEN=7 or PMLEN=16).
> +		 * Accept the result if the enable bit is set.
> +		 */
> +		if (tagged_addr_abi && (ret & PR_TAGGED_ADDR_ENABLE))
> +			return 0;
>  	}
>  
>  	return ret < 0 ? -errno : -ENODATA;
> @@ -96,7 +119,12 @@ static void test_dereference_pmlen(int pmlen)
>  	volatile int *p;
>  	int ret;
>  
> -	ret = set_tagged_addr_ctrl(pmlen, false);
> +	/*
> +	 * When pmlen is 0, the tagged address ABI cannot be enabled (the
> +	 * kernel rejects PR_TAGGED_ADDR_ENABLE when PMLEN is 0). Disable
> +	 * pointer masking and test the invalid tag path instead.
> +	 */
> +	ret = set_tagged_addr_ctrl(pmlen, pmlen ? true : false);
>  	if (ret)
>  		return ksft_test_result_error("PMLEN=%d setup (%d)\n", pmlen, ret);
>  
> @@ -157,7 +185,7 @@ static void test_fork_exec(void)
>  
>  	ksft_print_msg("Testing fork/exec behavior\n");
>  
> -	ret = set_tagged_addr_ctrl(min_pmlen, false);
> +	ret = set_tagged_addr_ctrl(min_pmlen, true);
>  	if (ret)
>  		return ksft_test_result_error("setup (%d)\n", ret);
>  

