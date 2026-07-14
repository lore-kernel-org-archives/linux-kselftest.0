Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D30D2D7DEF
	for <linux-kselftest@vger.kernel.org>; Tue, 14 Jul 2026 05:01:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784005307; cv=none; b=mU7ZnrWOnRv2EdGGGlCoKeGgIjqfOFMlM5ieFXFeu1RnvCbCPDR14KQ1vycqcULnzYXJBuhVl0jfXEf7EkNzzJn5lg0iowXNUrqnBuW1fLLtWZcJbZRgbnw+pbZ8jCz5UPhoDNEQYEyPJWTdFIkq/2SOvUtdiMUaw4/HzeXYo6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784005307; c=relaxed/simple;
	bh=FCPW8Mm9ioFQS/wDdx5VCJNPs/X3lZS2KcJ9ZczL4JU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SomuqN84DdRuyReN8j3CHJdz2oeIThbWA9U7pa41fruFBZrMK42sYGZaAKrt75dGzvenCy3XQeJbtc22OJNfi+T8jb5jvR2x0bpynpFDP5bHH9l5TOz5p81NboB2i+eR2UZbwZ+rc5IaTMbMGEMM83rYmBgPg5K6Ibbf9MNCh4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=OqvFkh+C; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="OqvFkh+C"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-698beff7178so6707753a12.3
        for <linux-kselftest@vger.kernel.org>; Mon, 13 Jul 2026 22:01:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1784005304; x=1784610104; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=w9LEcgwtvSHopCw2U3XmWpNwJWVPsCyK67cqWbn8b9c=;
        b=OqvFkh+Cy8Be9BClbFua91QIIJlCGrcYXLDSrUQZUjsS/s4tTGq58Jn2aPRedXmiUr
         WMnWwuzlzhwaHH20xWXnrDeA82//r9cs532AfovHS0IhpXFpjoVgt2s5KTu2asS15PXo
         gGiDEz0Okege71OplohtQvfJYayxZ/B2Fr29Uopkh8hnzfVB3UK4RX1OqDztWBW8vohv
         gOTUrrhq8k8ya9SxIJAxQjWTnLPu4zVcHW15PKyWim4BX+IQP5bAGU9iinCcDw44RV7O
         E9LNIg3Y1DPPkv+BGtUlK0awaLHecr8NVqfndw9rcQAkta0ZFAvJ1yMuXRKzhCwD+Gwn
         8Bug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784005304; x=1784610104;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=w9LEcgwtvSHopCw2U3XmWpNwJWVPsCyK67cqWbn8b9c=;
        b=NX0Gu+hQWnqkS4NkjnO4HuZlJti3Z81fhbjmqRcLaxkWVAvwpnDfwow1ZCw8xnAz2w
         M8NzB5GmnmtzX+yDtOHjvZWXXV+eilEmocPaEPfB7xu5tBxXLmlfYJ5rvxVC2mkkVgGI
         Z6ymwudw0aMeSqmaPSEmbV/NC7PyxJOolMiJOV8SWL7sCtNAiskNVLl7OhFqqoKoo8I/
         9kTkRS+RxQegHtSf+mVqUTgWIyZreLKzVfUS63esbCRm064ISIkHrmiy5iXcSf4PCTEB
         7YZnM7pVHxXtXrR4eBQhf6BOtU9uFrh5EeThpdQQaJ1CeejJ5UNSGOd5iVg9ZjUWaHuO
         FD0Q==
X-Forwarded-Encrypted: i=1; AHgh+RqcRBiPpddRPBUCRVao12uBO67Ms8yD6nLTbr9MIN8Anc1ghrJGgZgx3pXihF/aTiii6D/p7xUla6wBjLZJjIE=@vger.kernel.org
X-Gm-Message-State: AOJu0YyPEZWcKg8McDQSz4qd3zV+K93bTXcWXJRCQ929GrCil2IqQDD6
	7U3DjLTcauiK+NVral/stnch/OGjp1QtJ5fHffIxJUQMVlt6smtmnbVpn5eX6PyO2B0=
X-Gm-Gg: AfdE7ckDaSU3FXMpIEDpB0m3eQRpHNSVzMUYhPcBYkRnuSpVxNcoVV4CWzYYEqYfWLU
	gSsMgYkE1q5wjoBVTGkD46Vy6UWVuMOWYFKsYu6JoTYjVIF+zPQx53c8gQojxxRNoFrFmkGAdE8
	dDpBihb/xgArngsCr3uny6phUVKIHg37UIdjDU2BpNqD+BKDxcJGzOdbiOWKv6RD68SmhEnXUxN
	G9hfreSnMyDnsTSJncsa9aBClZYIiclzYefBGJr8TRAgmnjt8aePYzWVg7NUIHexm6dqCx6Nt8m
	/vWne99SBgOuwBdlLkGNGB3vhbKPT5yhAuinNucvQmEUf5YhpE/QhW83VkTpct469rF5i8LBv7j
	NRQqFfc6mh4iZnAINYbrHpSPBEN6IFlFyW7TTufPCxchtHsMxRo2sG+RqOCQDZmZmPRdj5PeGIZ
	WFoEJ/Dur84/n++AGJ2WsdCMpi310M+UyK
X-Received: by 2002:a17:907:1ca0:b0:c15:f005:63fb with SMTP id a640c23a62f3a-c161e940115mr425942166b.3.1784005303928;
        Mon, 13 Jul 2026 22:01:43 -0700 (PDT)
Received: from u94a (27-51-48-151.adsl.fetnet.net. [27.51.48.151])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7ebcae1dce3sm14429042a34.3.2026.07.13.22.01.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 22:01:42 -0700 (PDT)
Date: Tue, 14 Jul 2026 13:01:32 +0800
From: Shung-Hsi Yu <shung-hsi.yu@suse.com>
To: sun jian <sun.jian.kdev@gmail.com>, 
	Eduard Zingerman <eddyz87@gmail.com>
Cc: bpf@vger.kernel.org, ast@kernel.org, daniel@iogearbox.net, 
	john.fastabend@gmail.com, andrii@kernel.org, memxor@gmail.com, martin.lau@linux.dev, 
	song@kernel.org, yonghong.song@linux.dev, jolsa@kernel.org, emil@etsalapatis.com, 
	shuah@kernel.org, mmullins@fb.com, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH bpf v4 1/2] bpf: Reject negative const offsets for buffer
 pointers
Message-ID: <alXBjNMotfDYXeNX@u94a>
References: <ak5HLLrYK3R_g2y_@u94a>
 <CABFUUZHpPwuTk69hb54WugJwssFuvoqFFPv34dZRbKLLc1PwwQ@mail.gmail.com>
 <ak8XSRiLKx5WcIQw@u94a>
 <1f8aad47f61fbf85eb55276e4bb01bfcff61393e.camel@gmail.com>
 <CABFUUZEXYduca34g22YZ1ESyYe3Yc3kYQrTEWLMxB5X0ZmYn8w@mail.gmail.com>
 <alCgmxFh9q-vjE0O@u94a>
 <CABFUUZEnd9f7tV-+jT+cgL7sFVp7pL5-tjdwMvxcR9ist1s-xg@mail.gmail.com>
 <alRtilWhKw4zzMkI@u94a>
 <3430dc0a2a141769a596ab21d7abdd86a0a804db.camel@gmail.com>
 <alWvvwpn3z9Nn0zw@u94a>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alWvvwpn3z9Nn0zw@u94a>

On Tue, Jul 14, 2026 at 12:31:38PM +0800, Shung-Hsi Yu wrote:
...
> > >	var_off = (s64)reg->var_off.value;
> > >	if (var_off >= BPF_MAX_VAR_OFF || var_off <= -BPF_MAX_VAR_OFF)
> > 
> > This should hold already.
> 
> FWIW, I had thought so, but after checking I realize that the verifier
> only ensure that
> 
>   -BPF_MAX_VAR_OFF < smin < BPF_MAX_VAR_OFF
> 
> holds true in check_reg_sane_offset_{scalar,ptr}(), and does not check
> smax, so technically var_off.value can be greater than BPF_MAX_VAR_OFF
> when we reach here...

Scratch that, it cannot. Below just shows that (var_off.value |
var_off.mask) can be greater than BPF_MAX_VAR_OFF, not var_off.value.

So what Eduard said is correct, and
  
  -BPF_MAX_VAR_OFF < var_off.value < BPF_MAX_VAR_OFF

does always hold.

> ..., just that it doesn't really matter much as it is
> rejected anyway. And if it is a constant then smin=smax, so for a
> constant value it does always falls between +-BPF_MAX_VAR_OFF.
> 
>   0: (79) r6 = *(u64 *)(r1 +0)          ; R1=ctx() R6=tp_buffer()
>   1: (85) call bpf_get_prandom_u32#7    ; R0=scalar()
>   2: (bf) r2 = r0                       ; R0=scalar(id=1) R2=scalar(id=1)
>   3: (67) r2 <<= 32                     ; R2=scalar(smax=0x7fffffff00000000,smin32=0,smax32=umax32=0,var_off=(0x0; 0xffffffff00000000))
>   4: (77) r2 >>= 32                     ; R2=scalar(smin=0,smax=umax=0xffffffff,var_off=(0x0; 0xffffffff))
>   5: (07) r2 += 536870911               ; R2=scalar(smin=umin=0x1fffffff,smax=umax=0x11ffffffe,var_off=(0x0; 0x1ffffffff))
>                 /* r2 is now [2^29 - 1, 2^32 + 2^29 - 2] */
>   6: (0f) r6 += r2
>   7: R2=scalar(smin=umin=0x1fffffff,smax=umax=0x11ffffffe,var_off=(0x0; 0x1ffffffff)) R6=tp_buffer(smin=umin=0x1fffffff,smax=umax=0x11ffffffe,var_off=(0x0; 0x1ffffffff))
>   7: (79) r0 = *(u64 *)(r6 +0)
>   R6 invalid variable buffer offset: off=0, var_off=(0x0; 0x1ffffffff)
> 
[...]
