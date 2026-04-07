Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27D3B37B01C
	for <linux-kselftest@vger.kernel.org>; Tue,  7 Apr 2026 21:36:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775597821; cv=none; b=aJM+u0H202lfHjgpirdqOOdRbjzxWjIpCT8g+wCvFKq2ueKQAlREDz0XWK2ZsRnfYxu2Q74OcEbtrk7JarfDBP5U+FoSia65uJ4lkjvzEa9e8D7zZDRW244FwMXDzIjALswDSImI+yl+co5yon005oVJqblg26qKlr7CVg3iFBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775597821; c=relaxed/simple;
	bh=EpKTL3G7H2XFaseYYG+2w0nRlWysJEnHpsD48AKJrRs=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hc5efWaOwaESdU6rO/Mr4krjAZM1jq8WluX4ubPDu77SnyvS1rcWe/itwZqBF/WD9d4U7RuLHsaZGM2IFbtHfLdn290tdWan66bOj2Kur7p0N+mRLfOJMv/Eaew2jvkA2wFIEpJAG+q1KsTZZtAXU79HOSFSXa7N99ZcDm4aLSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P/inMpMo; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P/inMpMo"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-488ba840146so15504685e9.1
        for <linux-kselftest@vger.kernel.org>; Tue, 07 Apr 2026 14:36:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775597817; x=1776202617; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hKcy50S1bW/vY4PpqHDf6kRxjpQRD4gf10Ur4mE7VLM=;
        b=P/inMpMoKeSaO30YmvEjixJ+lZypQ8cU6k5RKFvDH+F7aTdbh36orDnjTKBV3+Ji6O
         rrj/dTIlh/SNjRBUv2V6J82UD5X/kUKUfj9EwW3sH/quD1IJcms64tKKx5dhhM44KjRm
         iEzB6uNfWpMEsxr88hX1DK7PVywxqxEEhwnsd02MttlQMQfvQ1qoQIvfvpPgO3p95ICm
         LAfrCAHuvFTmaQbfpPIhxGCHjdCdWewWbOQtNjjwNOb/kLxOL9zT43BRtdq7x4R24xzt
         3ww7x5YQvZAyTTv5Jed9mC3MyWU0yriyZjJyWPAF8UQbg9HmXVEFAWxbgnpt48fTLM0h
         5RLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775597817; x=1776202617;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hKcy50S1bW/vY4PpqHDf6kRxjpQRD4gf10Ur4mE7VLM=;
        b=lk0tdE/eDIXXj4ldcWKo/e41VjPipfjUlSk3rwfApOV6ZH9KsO4Zo1fExep60jA06e
         Fp1NsytX2zFgJ3g2hYAaryNJovS+puaQJpB3ioguiWbjnnsRqxvmJF0CM4BrUcE3riah
         FGD1SKzEMfA9oa2zQZNpVkXS6EbGAbYbHOFweEKVv1Xq6UKx3IH3b64eEBZ/D6FYtJPV
         PFkN1GmpLRbQoEQMmTy5tN8INi81IlrLGt8Ow4NMRFwGnSrOyLBfPXSj5Xesjg7g2muV
         HfoIpspYQmdJnwYztvvBRF1BPyna1nhASQgqp+F4hjqBq1gJ2N6fQ/DDX3XqXtxInOdD
         zcrw==
X-Forwarded-Encrypted: i=1; AJvYcCUrPxpW+1RGpM0uboVev7ZdvyLqBM2COPaN0VdhAhIdWlgnjYNDR8bDoo8DNCrDRf5aNhbgPhfbXQ5o1R69kyU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxC6gfLrwWnX3IGMlYoEipOcTy/sYWv82UcX0haZODTqgbCq3uo
	lcIc5AbKDex75+/PI4tixPO7tQn6vBK9ZVW4hTLY/3whxNOqVJZWCyzA
X-Gm-Gg: AeBDietX/huejhKwmrX5E3wLp6NDOkFrYR1Aa0KeHrJM50Ae/OfGSgcPEmaiI1YNIAu
	emIkXHPvx7W9wteawau20NT04Li61zoO3HPwWfi40qQ4/A2yHYDzakcDwU6+iq5xV1sRskjTn+t
	dY5dE6aWtg4Awsmcv24geUsn5X1bqlEeSjRtEKU9en6u/AGDHkuyVT5ldA7SiGQktDbBUIoT9BK
	z6F1UmZhNkohZYtl+mzf58zJEGugBUDOuLpp7fW1vmvGbJbOgq1rtZW/tCXSVM6DHqezrJjPUPG
	Ks/xsRI2viw8Y6z5YB6CNLPP4wDrA2DbWCpdfby5FPxU+QB7FiANw/BpTwtUwAf1+H8j0JiZz5U
	tumuRWKe5MLnzX66bkLLgDQ2t+wpZWkA0yFUqrn8ccov4MynlihHLPg29NCP920knIHvMckIohB
	DvQOBYQnqqR8fnNdlFDrl2GQ7mHmYKtdkuVgLGFR+SzSDDtYT7RStBHXDDDmKHxgaS
X-Received: by 2002:a05:600c:3acb:b0:485:557d:9fe with SMTP id 5b1f17b1804b1-4889972b8c2mr222088045e9.12.1775597817192;
        Tue, 07 Apr 2026 14:36:57 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4887e83682fsm611304445e9.7.2026.04.07.14.36.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Apr 2026 14:36:56 -0700 (PDT)
Date: Tue, 7 Apr 2026 22:36:53 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Maciej Wieczor-Retman <m.wieczorretman@pm.me>
Cc: houwenlong.hwl@antgroup.com, dave.hansen@linux.intel.com,
 ryan.roberts@arm.com, nick.desaulniers+lkml@gmail.com, bp@alien8.de,
 will@kernel.org, maciej.wieczor-retman@intel.com, david@kernel.org,
 nathan@kernel.org, justinstitt@google.com, seanjc@google.com,
 perry.yuan@amd.com, oleg@redhat.com, tglx@kernel.org, hpa@zytor.com,
 james.morse@arm.com, mingo@redhat.com, akpm@linux-foundation.org,
 jgross@suse.com, peterz@infradead.org, morbo@google.com,
 ilpo.jarvinen@linux.intel.com, xin@zytor.com, shuah@kernel.org,
 x86@kernel.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH v5 1/3] x86/process: Shorten the default LAM tag width
Message-ID: <20260407223653.2d3d3c60@pumpkin>
In-Reply-To: <bf872c3f7591dc7580679e35b343b08534be2d5a.1775581451.git.m.wieczorretman@pm.me>
References: <cover.1775581451.git.m.wieczorretman@pm.me>
	<bf872c3f7591dc7580679e35b343b08534be2d5a.1775581451.git.m.wieczorretman@pm.me>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 07 Apr 2026 17:45:20 +0000
Maciej Wieczor-Retman <m.wieczorretman@pm.me> wrote:

> From: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>
> 
> With the announcement of ChkTag, it's worth preparing a stable x86
> linear address masking (lam) user interface. One important aspect of lam
> is the tag width, and aligning it with other industry solutions can
> provide a more popular, generalized interface that other technologies
> could utilize.
> 
> ChkTag will use 4-bit tags and since that's the direction other memory
> tagging implementations seem to be taking too (for example Arm's MTE)
> it's reasonable to converge lam in linux to the same specification. Even
> though x86's LAM supports 6-bit tags it is beneficial to shorten lam to
> 4 bits as ChkTag will likely be the main user of the interface and such
> connection should simplify things in the future.
> 
> Shrink the maximum acceptable tag width from 6 to 4.
> 
> Signed-off-by: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>
> ---
> Changelog v4:
> - Ditch the default wording in the patch message.
> - Add the imperative last line as Dave suggested.
> 
> Changelog v3:
> - Remove the variability of the lam width after the debugfs part was
>   removed from the patchset.
> 
>  arch/x86/kernel/process_64.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/x86/kernel/process_64.c b/arch/x86/kernel/process_64.c
> index 08e72f429870..1a0e96835bbc 100644
> --- a/arch/x86/kernel/process_64.c
> +++ b/arch/x86/kernel/process_64.c
> @@ -797,7 +797,7 @@ static long prctl_map_vdso(const struct vdso_image *image, unsigned long addr)
>  
>  #ifdef CONFIG_ADDRESS_MASKING
>  
> -#define LAM_U57_BITS 6
> +#define LAM_DEFAULT_BITS	4
>  
>  static void enable_lam_func(void *__mm)
>  {
> @@ -814,7 +814,7 @@ static void enable_lam_func(void *__mm)
>  static void mm_enable_lam(struct mm_struct *mm)
>  {
>  	mm->context.lam_cr3_mask = X86_CR3_LAM_U57;
> -	mm->context.untag_mask =  ~GENMASK(62, 57);
> +	mm->context.untag_mask =  ~GENMASK(57 + LAM_DEFAULT_BITS - 1, 57);

I'm not sure that GENMASK() is really the best way to describe that value.
It really is ((1ul << LAM_BITS) - 1) << 57 and even the 57 shouldn't be
a magic constant.

I also wonder how userspace knows which bits to use. The other patches
just seem to handle a count from userspace, but you aren't giving out
the highest available bits.

If this had been done for 48bit vaddr, you would really have wished that
that bits 62-59 had been used not 51-48.

	David

