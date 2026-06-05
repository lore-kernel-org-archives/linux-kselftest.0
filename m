Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90A882DFF3F
	for <linux-kselftest@vger.kernel.org>; Fri,  5 Jun 2026 21:45:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780695937; cv=pass; b=hROWxQwjgiBnJ6pDq5Jg/Uqh958eAgN8MK5cTRrlPAqwvEJsn/ACO/ezIm/8N1rcZ1QF8zO1hmc7XEeiZbw6b1iSkdmKzFNd3c8sle8aOb/7tRgakpJNuwju4Nk9Yh1hvusO7P6FE9JsNRIpXDVXWkoHeU1V7lGplz/XYA8bRwU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780695937; c=relaxed/simple;
	bh=RbpDg/kYl6mwQXCz3qR5h0Vix9nrhHwv83Uv0CIXV0g=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nRR+wraF+/n4KKOL6Woy7ieJTR0CdW4IqXRB58euSlcaa3Ddd06/PIJbpFnHH4SRl2uOFtumPIoIh8z6dlZRLYPvg06YAbX0cCsjV2pLHabDLjoXRAc6zQRGNvAj/iMG6CAbvHYOJSERFOnIw8r34txrzdQ2yiQw6Ox5oiq61zE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=CLGV0o6h; arc=pass smtp.client-ip=74.125.82.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="CLGV0o6h"
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-137335bc3caso3019831c88.0
        for <linux-kselftest@vger.kernel.org>; Fri, 05 Jun 2026 14:45:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780695935; cv=none;
        d=google.com; s=arc-20240605;
        b=Y+ra8K/vKvXp4hSr6JDkVWW5AvKluAFGaLy1To7S3vzeOGz+hxhUg82bmGG+v9L1gT
         wmup1SJ+CpC3ybIFXaLbe05GsjlNXK3I/AevqCvNYLLp5nA7d6XX/a1HMzG3ih6hVPiC
         Tg1NAiCG41TSbj1dkohFsHGjg7lIfDXtc/ipwz8om3K+qIHt/nfUNKq8mT3mdu/Yt011
         niQXhlLude+uWhjtPqcn8ztL5kvq6kju3diZkCnhz4gGcdQ/OF0Dgx8Qh1zQTSe09gTV
         GMUw56/3r5LGmkNDGeOMFOh3SG4UYBpLc/klTtW6A+I4qVRCddBdJBNeTrNmQx6fGqIi
         1cHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=GS6Ei4jhGsPE0OXhrjRIOP6JH4B+eek+wO3pczZDLKA=;
        fh=EO9LTgYxYDzMV80Wae6SwZM2+hV/0ySLcSJhzmWQtCo=;
        b=Hu2cZNYo5pOCHYxHtzuj1/gWMvXRCFs1ltkoYr79RcBYYeK+HEGInunRTRgC2aoxFa
         VMaRz1p0qeIcsAPs1KF/8gAqVIxSfzkiZaj9IAH4V+Mw6+pSHGtdV6WahSig6EuRstbz
         Hh+/MYegKk8UrmnwDl18WxqAMUbZ6TumKkKTEGAcYq0cPtcKJFkF+m+JwqO41ZqPvKlS
         n8gpMsPX/bLxB+3FNnN/waMh2+JPCfSmE6G0hHXhtSVCEOXX+IqGoXZoIkx5WA++5FSv
         3Cqb+t+U2w31ZVHSSqw7x0bbwUHVKHFLlyi4DNrQUz511UfcQAuS8uVshJ+IP625FaTC
         Oqcw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780695935; x=1781300735; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=GS6Ei4jhGsPE0OXhrjRIOP6JH4B+eek+wO3pczZDLKA=;
        b=CLGV0o6hUi+JS0+86o0Si5phckCR2/vQFDAWC75m5IblbvSJyv95Qgo3zxcaKhaOHV
         hIUV4OBLNnxRs3Chb5gmf08A9RQTYO30H9tq+k4W6IKa6gwp9W6HB0V+bJvn5GNCbc9N
         ujgf6LSq+UfbsYU/jkGzytMYs6VYhdXkCYqfl2A6AhFGOK+s44uh/2YC7+aB4k5V1lxl
         IP+1pKqKJ76NZ40A4fiGeWK0v0WR6dYlk+NICU1hWLnpsNKdO0FP00Ignef51tk2K962
         vZYhnlydKCAdVvj/chFXn3Ci46PnM9YsXKxFMpvUYsKRMl9T73Kn+gUSNLuiZ3N4ZrHP
         wEEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780695935; x=1781300735;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GS6Ei4jhGsPE0OXhrjRIOP6JH4B+eek+wO3pczZDLKA=;
        b=HQiUM7UtHRbYNgNWIHL+E72NhltPubbLdZsAtYlWL8+2u1EKnMUgGDQQnlEutVJUE5
         C1I+PHqBsZA0YgB2a+eeEsdBQ9I9fu9INvbbLB6KGEH+FjCh13iK7R6mrCj6+B6BcOto
         nMIyXH0VfNSCOQMFjjFS+7myDj62Q0ngVq09m04FFJxHzmwrwHXCl6B6gIVFcAS6cbbv
         tmpixDTNxYGTT4Nb1B1e2v0GAqQ74tKjSa7wyYH8G8qrCQ89Psn29GfbNt5iojq/3rB2
         c0Z0zaodcK6wqJdnRrzItEX5aCPtorFx7gHgKGMrihYh089TQp2Y9Zw7s0otvcD8fupy
         wQ+A==
X-Forwarded-Encrypted: i=1; AFNElJ9SxWBay4qCOBpykZrzVb1IoA6LAZR9KthO2WTrgJe6WreTDCjanqhcO1ulpbAa/9xGYIjm6vriacTqfCcAe+I=@vger.kernel.org
X-Gm-Message-State: AOJu0YyPzLbavPmz9gIT775YqB6GRWNKmYMJjYJsUvv/NuyEPE4BFImO
	DvmK7Q7oQu7BiRDq/UdkkoPPD0UlW69LcEMkQOyhT2UuZD+/DGceAeG1ruJCo5zjSsNg00WCiLE
	2NwWU2zqWnAUPz/wsL8/vZroHT9G+B6k1T+/bZcsm
X-Gm-Gg: Acq92OES/6nrYTGVE0RpBVdAJagkFEiaFdv0kiSfb6khXe9AiCjZZLiB2mV3qIV8bR9
	64DkmSL5VtrczNNrm2bTy/VJajzGRiXT1tuc94RdGFPDAiYQuAaHr+MF/GDYIaVxOsDJlzQJtkj
	wF6sEi3iZ8gR8ur/XmH5fnC0zBaVFrqcQauQ7SEx7yJP7hlvGzQwBBsRzJ4c38w0XG1XOYMTYK9
	1F3WKyfOLv9R+wrAqoIhMDo6PCMS+rmZZrBP8BP4e7WbwRbQJGUviZSIs/B1cCzMQBOuFZJfTPF
	lEA3auyA9U/13i25tAwXDAkqRisMnrdyUMsmBg7B1NNm5sMfAUCoYwOGv1sprlRE3dOHi0bNxP+
	V6+tl
X-Received: by 2002:a05:7022:204:b0:137:edc4:a5e6 with SMTP id
 a92af1059eb24-138066fa2ddmr2670055c88.29.1780695933835; Fri, 05 Jun 2026
 14:45:33 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 5 Jun 2026 14:45:33 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 5 Jun 2026 14:45:33 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <aiCzNbtQ4FPu2yCR@google.com>
References: <20260603-snp-selftest-cleanup-v1-1-73b29fe31ce6@google.com> <aiCzNbtQ4FPu2yCR@google.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Fri, 5 Jun 2026 14:45:33 -0700
X-Gm-Features: AVHnY4JzG7VB0zlH5sUGVOnVVh6RIseJI5Gt8L6YDgks9g5Fz-PFBNcjuaYOVuo
Message-ID: <CAEvNRgHtpFa+HAhPVBvB4=ixUuEW-r_Xh49SHEPktUmHgzYcAw@mail.gmail.com>
Subject: Re: [PATCH] KVM: selftests: Make guest_code_xsave more friendly
To: Sean Christopherson <seanjc@google.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan <shuah@kernel.org>, kvm@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
	michael.roth@amd.com, jackyli@google.com, liruxin@google.com, 
	darwinguo@google.com, jacobhxu@google.com
Content-Type: text/plain; charset="UTF-8"

Sean Christopherson <seanjc@google.com> writes:

> On Wed, Jun 03, 2026, Ackerley Tng via B4 Relay wrote:
>> From: Ackerley Tng <ackerleytng@google.com>
>>
>> The original implementation of guest_code_xsave makes a jmp to
>> guest_sev_es_code in inline assembly. When code that uses guest_sev_es_code
>> is removed, guest_sev_es_code will be optimized out, leading to a linking
>> error since guest_code_xsave still tries to jmp to guest_sev_es_code.
>
> So, don't do that?
>

I was commenting out function calls while working on another part of
this selftest and ran into linking issues.

>> Rewrite guest_code_xsave() to instead make a call, in C, to
>> guest_sev_es_code(), so that usage of guest_sev_es_code() is made known to
>> the compiler.
>>
>> This rewriting also gives a name to the xsave inline assembly, improving
>> readability.
>>
>> Signed-off-by: Ackerley Tng <ackerleytng@google.com>
>> ---
>>  tools/testing/selftests/kvm/x86/sev_smoke_test.c | 24 +++++++++++++++++-------
>>  1 file changed, 17 insertions(+), 7 deletions(-)
>>
>> diff --git a/tools/testing/selftests/kvm/x86/sev_smoke_test.c b/tools/testing/selftests/kvm/x86/sev_smoke_test.c
>> index 1a49ee3915864..8b859adf4cf6f 100644
>> --- a/tools/testing/selftests/kvm/x86/sev_smoke_test.c
>> +++ b/tools/testing/selftests/kvm/x86/sev_smoke_test.c
>> @@ -80,13 +80,23 @@ static void guest_sev_code(void)
>>  	GUEST_DONE();
>>  }
>>
>> -/* Stash state passed via VMSA before any compiled code runs.  */
>
> Uh, so as the comment says, the goal is to stash state before _any_ compiled
> code runs.  Shoving the code into inline asm breaks that.  The compiler *probably*
> won't shove anything before the first inline assembly, but there are absolutely
> no guarantees.  E.g. you're subtly relying on a tail-call optimization to avoid
> any stack operations.  If I force guest_sev_es_code() to be inlined, then the
> prologue becomes:
>
> 0000000000402a10 <guest_code_xsave>:
>   402a10:       48 83 ec 08                                     sub    $0x8,%rsp
>   402a14:       b8 07 00 00 00                                  mov    $0x7,%eax
>   402a19:       31 d2                                           xor    %edx,%edx
>   402a1b:       0f ae 27                                        xsave  (%rdi)
>   402a1e:       b9 31 01 01 c0                                  mov    $0xc0010131,%ecx
>
> and we're hosed.
>

And omg, I thought I was running the tests!!

>> -extern void guest_code_xsave(void);
>> -asm("guest_code_xsave:\n"
>> -    "mov $" __stringify(XFEATURE_MASK_X87_AVX) ", %eax\n"
>> -    "xor %edx, %edx\n"
>> -    "xsave (%rdi)\n"
>> -    "jmp guest_sev_es_code");
>> +static void xsave_all_registers(void *addr)
>> +{
>> +	__asm__ __volatile__(
>> +		"mov $" __stringify(XFEATURE_MASK_X87_AVX) ", %eax\n"
>> +		"xor %edx, %edx\n"
>
> This doesn't even build.  When using input and/or output params, named registers
> like eax and edx need an extra '%' to escape them, e.g.
>
> 	asm volatile("mov $" __stringify(XFEATURE_MASK_X87_AVX) ", %%eax\n\t"
> 		     "xor %%edx, %%edx\n\t"
> 		     "xsave (%0)"
> 		:
> 		: "r"(addr)
> 		: "eax", "edx", "memory"
> 	 );
>

My bad, I was compiling this while having the caller of this function
commented out. Didn't realise that even within the same file, the inline
assembly won't even be compiled if there's no caller.

>> +		"xsave (%0)"
>> +		:
>> +		: "r"(addr)
>> +		: "eax", "edx", "memory"
>> +	 );
>> +}
>> +
>>
>> [...snip...]
>>

My bad, this patch is such a goof!

I still feel that it'd be nice to allow commenting out functions parts
of selftests while developing other parts, but let's shelve this for
now.

I think to clean this up I would do something like

1. Enter the guest, GUEST_SYNC(STAGE_READY)
2. In the host, write VMSA
3. vcpu_run(), guest will perform that __asm__ block, then GUEST_DONE()
4. Host performs compare_vmsa() to verify

But this relies on ucall support for SNP.
