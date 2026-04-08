Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72E653AE1A0
	for <linux-kselftest@vger.kernel.org>; Wed,  8 Apr 2026 08:51:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775638312; cv=none; b=oFnCrsPNMnePIS5Ae38TfJ39VvCWLYK5Ok8PU/AQ29u+krLhUlQQhc1mGLvyr70p/W5WJcvpNNlyQAWhQ1p6gvsxqBwHPzzlTqa4gZVUKVksOMsoukozDqKlcYM+nUTeQz90OgT0c20GTWabJZ0TnYO3MiJnhswnWYuxsJ4trNQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775638312; c=relaxed/simple;
	bh=OdpbZkOEnS3X0w7YqfmUNIh1exwEDunneiqFraB7cxA=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=EltzGPnLpxgJlGnoa081A0XbZLl2kgs9aFcpierMOz+LLHurc7FawCy2KvyP5vKsCPFVOHIWQZHdVE/q8Adl4dF8GxarrGvzivJhVd/07o7n2+Rw5eg2odFQ2pECGyx8BQ1TTLY68KvbycOb+yXKrbzmWFWTLFFpBoBA0glOMpE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TE8qiypr; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TE8qiypr"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-43d04fc3bf2so3404556f8f.3
        for <linux-kselftest@vger.kernel.org>; Wed, 08 Apr 2026 01:51:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775638306; x=1776243106; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UwZ1NZojcZyIHHjXUhSN3HmaShicc8wOej9+fnTFD5U=;
        b=TE8qiypru2XKqDaA0Bxf4OTigw9uq0R8bWy5N5CFKhOc5JwqMnTb0fOpL/W4Kpfbzg
         7SqE4qJBp56g/3u06h2svr7M9PI7BjJcVG9Y57dCQC6AD5Uly1/CDM52VGgnsOeakcBn
         akNqtyMZ7MADoKMrlHIpEYXH2EU9aU+K1gqc5Y5CNhzJ8c8Ovm8UxMm9m2LirBOpXgmF
         LUxDRS+CnZ/+yhJIJo/QMQ57YNUYgfbIFOnAP9rEh+iFKYAVLc83qh0K6HgaxNatmBOx
         3S2LuUClpcaEc7yVl07VOGIbsuFOWRLrQBlDHMmM46Bta2zwGVM/sV7XRgiEW+wdsxyJ
         EbEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775638306; x=1776243106;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=UwZ1NZojcZyIHHjXUhSN3HmaShicc8wOej9+fnTFD5U=;
        b=a9L7+KWCG03Brr12CrAj5AapD2SiSCf2S4t/+NzsV2Yrq+joHdiVKv32/Vj6o4vWWC
         Kp3FICz3zlfpMqv81ImRMoLwUHiEhLSQ+zgHyZFkhHBBW8+RRABKq8l0OiG30ATDjKdZ
         YSnBLmFRf3uMKBNsCLh/boqNRjFwkjjMkUWyeFkJ6Cr9oYGRiozp8HJERdsVbhYMk2Eu
         BzUP1MbbzEF2ny6OcEajcLPcNg1l5VbJstKFTFmgBdEwlPQiwfgyk00IXP2ngESEmUpO
         J9RsGWm24YI9ycp2C1b7SS2CaoXpVgR+su4znEqQt+sXWWACVnY6FIVzjsSC6zL+rQJb
         nY4w==
X-Forwarded-Encrypted: i=1; AJvYcCW78HNSS77jRW4mJuWbyngvxptFKibivLhI82rCC/5AtiMkEPrLosu5AAzeylbnQoSWB1bbxr4BRcyfob2Iq3I=@vger.kernel.org
X-Gm-Message-State: AOJu0YwN/je1Vs8nraAWH9NAqWCz9+XirH3XwzD5r9Kmp5Ht3KPZpgJm
	4vWHNDBY7rR2sEmREssQvScXkDb3LnI/hRLkKANCOcX7Flmg+3/O6B6T
X-Gm-Gg: AeBDies+ISmIdyuBvqCVEZJBm8FwtZ3/G6zIYQuGmXSlQwdKEybW99QGMsqbaoKM+Z4
	x3CZEnkkKFxyOm6+ICJsO8ifns8mHOi5/rp52RpHKfSeIXDUKJyK+rxXcTvfcO0S8WrY4+aDVz3
	F34evK9XRCiYQ3n7NJi4D8sIXZhll61+hVniVe6u2sBj5DC5aM1GKQq8FV+hVZbVv7WM8x+EOhP
	tJNGhTs0453TjwPzYBW6/A52xHW5ycBEg5CIW66PVg1B10EylCSLmxlsxAwRVz7m0ZxCgWs9yZP
	jBMEnIAcxiYGzurTOha0M2UrKrtmOLgdHfcPa27EXRlAJMEsaEYYSYm0JpC2hMfQd3INRheYBJx
	/mTsXDtJ5H7EGEe9M9Dh2PMi45qp3pncVtT5xKApEs7zBt1gNlcISuIztMaacjVIbzpnGPQ3wcM
	Rlq8yNc7ctvC4rpnfHotxuvm/bzQzqhdZMF1RCNUdZELOx/oDTjnOzQpu8vHGS7sRZ
X-Received: by 2002:a05:6000:420c:b0:43c:f90b:5661 with SMTP id ffacd0b85a97d-43d292f9a52mr29631251f8f.50.1775638306415;
        Wed, 08 Apr 2026 01:51:46 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d1e4d2738sm58190229f8f.24.2026.04.08.01.51.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Apr 2026 01:51:46 -0700 (PDT)
Date: Wed, 8 Apr 2026 09:51:44 +0100
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
Message-ID: <20260408095144.41ee4cbc@pumpkin>
In-Reply-To: <adV6bnZC_2BEZxjk@wieczorr-mobl1.localdomain>
References: <cover.1775581451.git.m.wieczorretman@pm.me>
	<bf872c3f7591dc7580679e35b343b08534be2d5a.1775581451.git.m.wieczorretman@pm.me>
	<20260407223653.2d3d3c60@pumpkin>
	<adV6bnZC_2BEZxjk@wieczorr-mobl1.localdomain>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 07 Apr 2026 21:53:32 +0000
Maciej Wieczor-Retman <m.wieczorretman@pm.me> wrote:

> On 2026-04-07 at 22:36:53 +0100, David Laight wrote:
> >On Tue, 07 Apr 2026 17:45:20 +0000
> >Maciej Wieczor-Retman <m.wieczorretman@pm.me> wrote:
> >  
> >> From: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>
> >>
> >> With the announcement of ChkTag, it's worth preparing a stable x86
> >> linear address masking (lam) user interface. One important aspect of lam
> >> is the tag width, and aligning it with other industry solutions can
> >> provide a more popular, generalized interface that other technologies
> >> could utilize.
> >>
> >> ChkTag will use 4-bit tags and since that's the direction other memory
> >> tagging implementations seem to be taking too (for example Arm's MTE)
> >> it's reasonable to converge lam in linux to the same specification. Even
> >> though x86's LAM supports 6-bit tags it is beneficial to shorten lam to
> >> 4 bits as ChkTag will likely be the main user of the interface and such
> >> connection should simplify things in the future.
> >>
> >> Shrink the maximum acceptable tag width from 6 to 4.
> >>
> >> Signed-off-by: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>
> >> ---
> >> Changelog v4:
> >> - Ditch the default wording in the patch message.
> >> - Add the imperative last line as Dave suggested.
> >>
> >> Changelog v3:
> >> - Remove the variability of the lam width after the debugfs part was
> >>   removed from the patchset.
> >>
> >>  arch/x86/kernel/process_64.c | 8 ++++----
> >>  1 file changed, 4 insertions(+), 4 deletions(-)
> >>
> >> diff --git a/arch/x86/kernel/process_64.c b/arch/x86/kernel/process_64.c
> >> index 08e72f429870..1a0e96835bbc 100644
> >> --- a/arch/x86/kernel/process_64.c
> >> +++ b/arch/x86/kernel/process_64.c
> >> @@ -797,7 +797,7 @@ static long prctl_map_vdso(const struct vdso_image *image, unsigned long addr)
> >>
> >>  #ifdef CONFIG_ADDRESS_MASKING
> >>
> >> -#define LAM_U57_BITS 6
> >> +#define LAM_DEFAULT_BITS	4
> >>
> >>  static void enable_lam_func(void *__mm)
> >>  {
> >> @@ -814,7 +814,7 @@ static void enable_lam_func(void *__mm)
> >>  static void mm_enable_lam(struct mm_struct *mm)
> >>  {
> >>  	mm->context.lam_cr3_mask = X86_CR3_LAM_U57;
> >> -	mm->context.untag_mask =  ~GENMASK(62, 57);
> >> +	mm->context.untag_mask =  ~GENMASK(57 + LAM_DEFAULT_BITS - 1, 57);  
> >
> >I'm not sure that GENMASK() is really the best way to describe that value.
> >It really is ((1ul << LAM_BITS) - 1) << 57 and even the 57 shouldn't be
> >a magic constant.  
> 
> I recall people were annoyed when I previously open coded something that could
> have been a GENMASK() instead. Is there a downside to using GENMASK() here?

Some people do like GENMASK(), personally I don't think it helps in many cases.
Fine if you are describing a hardware register that has some single bit
fields and some multi-bit fields - especially if the documentation uses
bit numbers (which is often true).
But here you want something that has a base bit number (57) and a width
(LAM_BITS) and that isn't GENMASK().

> 
> >I also wonder how userspace knows which bits to use. The other patches
> >just seem to handle a count from userspace, but you aren't giving out
> >the highest available bits.  
> 
> I'd imagine if someone was writing a userspace program that'd interface with LAM
> they'd have to know which bits are okay to use.
> 
> But maybe I'm misunderstanding what you meant.

That is exactly what I meant, how do they find out which bits to use.
The API seems so let them say how many they want, but not which ones.

	David

> 
> >If this had been done for 48bit vaddr, you would really have wished that
> >that bits 62-59 had been used not 51-48.
> >
> >	David
> >  
> 

