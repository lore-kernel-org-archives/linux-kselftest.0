Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51D8E3E715B
	for <linux-kselftest@vger.kernel.org>; Tue, 24 Mar 2026 11:09:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774350541; cv=none; b=RYCNz853VjQHJlJec4l1IGV9Vl03C+SlaqKxxhwQ8/gxFW9I+YX8t2XH4TiRh54JODeeUBX+9Fv54bO/NoVjC2IOILLF3QZLlQX5PX/Af4/bcMRNlNNsD/uptgUgQZ+D3NU+neZnmNzol0KeFx0Xv+73yowM1t21dgRIoI8nk4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774350541; c=relaxed/simple;
	bh=xgUbhSj0IzZJFn1rMT9sdzlT25uBk9cJBjY1uEfrljE=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=THInpwcAo5s3xAPsM4BD6fydeXj4qxum8slZnQgV2EIl6x4A1mgqmGk5fct0uYcO0prVqc42f4/yQ4/uziQp+aq7AszHrsVKoo2ycll6YSZO/aoGKUx5xOfl342/7naolzu7hEXyJ625mMboEy0YkGIIVacJvG1SLHRcN63l93g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sqtPaoDa; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sqtPaoDa"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-439b94a19fdso3557259f8f.0
        for <linux-kselftest@vger.kernel.org>; Tue, 24 Mar 2026 04:09:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774350539; x=1774955339; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YGHIFn5R3KWwpZZgBcpBITWeEdgXniPxwku1lvGKL40=;
        b=sqtPaoDaO5cRnXvr5U4zWdOglaPn9dBMoSpjPjyErHt2o+JYH0ihzMNwkHEU9a7KZh
         9aQblR/P7yVOXwB3QntQ8PNTJ19iJV1TOBYivxO8f3sOaia2u1HpnEB6MexQWElKf1v4
         yp7L7qLUOU4Za3svw9JRUKc6Kv5/lra+lKdviuJL3IlH8DwnuLtOMtAzBvVZlutX+S8p
         MOda9eaadnd24qV8dWQGNNPdD4RwSNBkfSJUeh2pZIgVPGEF0Q2QlICYKjPZHPdcWphb
         eNEzA6td7I4NQAfEVdOr5gA4XjUDuFuWoDK8HZipidV8G0/eY299MQExjd9OW9n2+iQP
         l7ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774350539; x=1774955339;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YGHIFn5R3KWwpZZgBcpBITWeEdgXniPxwku1lvGKL40=;
        b=qcBueqUmSTnaGO4wd47sF73l5NdWSRQQYaD7lr+858h0y7SQ1mB4G+OJgwNTzEe/km
         +Sw7Js/Ri3rVgbwdsgFRuq1WzwSlnw3pV+gTmeaIvf+Qh+e4T/KsXApNTfjw4bm1W1/H
         UcF0VHV+yo8OtIk/ZXOTUIfd9ShyENnkwgGTAnr9aMuJk1MiAPrcSMaTRGNO6fdXqfIO
         3lSWSXIIOkhCtgriELpPVC9i9eBR7ZdgllCAVieXLLn5bPpX4QdXfERUrbmp2PWxhSfB
         Cj87NQr87l5zCnt3smfpqZYRRtdkxaMUhPAbAVVYAG/rtGwvdSL6umSmTNykkRaPO+qO
         dlzQ==
X-Forwarded-Encrypted: i=1; AJvYcCVlwKcu3LSwsYLWW5QRjlYh+0Z2eZpJLDH1xYGTa6qbBxEeevcnoIKB4KLwj/KIaFE8DHXKrV3UxcZo0A1+w7c=@vger.kernel.org
X-Gm-Message-State: AOJu0YzyfqW62Am4XbfDT1xampxjW4sE7sRvyi2VeXb+W/e1DcBLmBFX
	N8V3mwwTvhqHfQSpKNl/NcqFlmhg38UhzqxYRoXyRYdHebaljwiuETHT
X-Gm-Gg: ATEYQzxBjJY7o3683A7Rep8DoU8eJH1G0/9P/t8ZsjQdaiXAds3oTUdjPSCxnQZ57ut
	6KyJq5veCSAWdLhYsPfuVZAzrHb4tGwmQE4XUwn1gDjWxCJSqzx/BvyBmPO9DkoUFYirwVJmnqV
	xa8KwKTSdIvxfIHUTsbyKYV+M5F522Khde8Mt63EY6J8BGc0mg3UNmCrObdUPohuZ2QTbvwIDUD
	Z/gHz2YU8fY8AQDb2L+ciD/tSeqHrVZ7BOZ0HypP4gEfnSLlJj8zPWAPZ6Vn0WXhNC9PY/LHHz9
	Z32r49RaYNlAZjMF/yDIFt8HTcHAgWZrH4RKmPokgh0y2akgZj6wdiCSO4I7w8jM2XNbfWh+Q5i
	+AOKU4aE3tEwlGoI0PdnFdMEHwMW+JE2MKnK//jU0UJXzN+TO67aMWkydYIsV7R7zSqBv05N2dn
	MIx3RTkUnCFvmvkNpzgwztggBoUdp754nkVBUO+Mq9ZBjAv8u/tuqwoIWqNU4cOq9X
X-Received: by 2002:a5d:5267:0:b0:43b:584b:96a8 with SMTP id ffacd0b85a97d-43b6427d210mr19496901f8f.47.1774350538318;
        Tue, 24 Mar 2026 04:08:58 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b644ae016sm35920055f8f.4.2026.03.24.04.08.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 04:08:58 -0700 (PDT)
Date: Tue, 24 Mar 2026 11:08:56 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Yi Lai <yi1.lai@intel.com>
Cc: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 x86@kernel.org, hpa@zytor.com, Shuah Khan <shuah@kernel.org>,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH] selftests/x86: Fix sysret_rip assertion failure on FRED
 systems
Message-ID: <20260324110856.5e9e9c76@pumpkin>
In-Reply-To: <20260320063301.489599-1-yi1.lai@intel.com>
References: <20260320063301.489599-1-yi1.lai@intel.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 20 Mar 2026 14:33:01 +0800
Yi Lai <yi1.lai@intel.com> wrote:

> The existing 'sysret_rip' selftest asserts that 'regs->r11 ==
> regs->flags'. This check relies on the behavior of the SYSCALL
> instruction on legacy x86_64, which saves 'RFLAGS' into 'R11'.
> 
> However, on systems with FRED (Flexible Return and Event Delivery)
> enabled, instead of using registers, all state is saved onto the stack.
> Consequently, 'R11' retains its userspace value, causing the assertion
> to fail.
> 
> Fix this by detecting FRED support via CPUID (Leaf 0x7, Subleaf 0x1, EAX
> bit 17) and skipping the register assertion if FRED is present.

For the selftest can't you just allow for R11 being unchanged?
That would be much simpler.
It isn't as though the test is doing much more than checking that
R11 is corrupted by being overwritten by EFLAGS.

	David

> 
> Signed-off-by: Yi Lai <yi1.lai@intel.com>
> ---
>  tools/testing/selftests/x86/sysret_rip.c | 16 +++++++++++++---
>  1 file changed, 13 insertions(+), 3 deletions(-)
> 
> diff --git a/tools/testing/selftests/x86/sysret_rip.c b/tools/testing/selftests/x86/sysret_rip.c
> index 2e423a335e1c..0228d6174d5b 100644
> --- a/tools/testing/selftests/x86/sysret_rip.c
> +++ b/tools/testing/selftests/x86/sysret_rip.c
> @@ -21,6 +21,7 @@
>  #include <sys/user.h>
>  #include <sys/mman.h>
>  #include <assert.h>
> +#include <cpuid.h>
>  
>  #include "helpers.h"
>  
> @@ -64,9 +65,18 @@ static void sigusr1(int sig, siginfo_t *info, void *ctx_void)
>  	ctx->uc_mcontext.gregs[REG_RIP] = rip;
>  	ctx->uc_mcontext.gregs[REG_RCX] = rip;
>  
> -	/* R11 and EFLAGS should already match. */
> -	assert(ctx->uc_mcontext.gregs[REG_EFL] ==
> -	       ctx->uc_mcontext.gregs[REG_R11]);
> +	/*
> +	 * SYSCALL works differently on FRED, it does not save RIP and RFLAGS
> +	 * to RCX and R11.
> +	 */
> +	unsigned int eax, ebx, ecx, edx;
> +
> +	__cpuid_count(0x7, 0x1, eax, ebx, ecx, edx);
> +	if (!(eax & (1 << 17))) {
> +		/* R11 and EFLAGS should already match. */
> +		assert(ctx->uc_mcontext.gregs[REG_EFL] ==
> +		       ctx->uc_mcontext.gregs[REG_R11]);
> +	}
>  
>  	sethandler(SIGSEGV, sigsegv_for_sigreturn_test, SA_RESETHAND);
>  }

