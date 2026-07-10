Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D55C73E51FC
	for <linux-kselftest@vger.kernel.org>; Fri, 10 Jul 2026 08:11:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783671067; cv=none; b=n0xUA4AYpYL0wlfd+THuLo0W8za/jMk0voh3ClVxEjRJAlqHWcUQxKmsgJb2zkXVWaugOl1wqPfmYxuHkaXK69xj7p7IoB3KGv8A5BHmwOHyKs/peRPGDklevXqM2Oe3mwg8ue7zfxLYoecv8ZhMgwWKttrCEjVEX/pHxE0pGhg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783671067; c=relaxed/simple;
	bh=fxlcw6288+e8imbR4cGoArS+B9rHJ1GDKL4sRRdcSqs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qYPnEkCgMhKV29qnJ3jglZLutnuOiLqmL9q3cK1AkDHV4Vi+YIK1sss/X3JB0DMbpLY3P9gyu6AKAZMx+7K3yp0kridcyd1WtXgCjjfac6iWfkWp3qYryrw9oeovB6Bm5oNZzQgYZuXSaLjbQ4IA/HqrLeZBAsiK1YeYVMiql30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=GpSy9iW0; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="GpSy9iW0"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-4629051c9d1so378601f8f.2
        for <linux-kselftest@vger.kernel.org>; Fri, 10 Jul 2026 01:11:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1783671064; x=1784275864; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bmNLcYZ7DY0jmVRO7inGJQa9CXuBgSwFuE+h0UJtvU4=;
        b=GpSy9iW0x/W7Df8CzpzCRW/RkF5pi7LXHWWjWMN5gJ80Vu2EsWe05DYDPEgI8e5PFF
         FDCUfkLLmnu0sAIYtQMDaBEvLOzvKiNBCL4aq3VqWw/6puYuNwRfQX7PhK9krEQ5spCZ
         6UpmxgUmFa6IFqYDxH/ay4lNY9vkTbxSpjqbtkZgrluwMx7WqHMihrDGt1X5VRkoJRzX
         N0oeBD7jwapOlCl3xQ6ShTzBrfiidXN79CATzqqcx6Cw4tHVRBm/o4EmyPnYwfk7CSTG
         m9ikJTZPOCZKwcm/HNke27BvP7T/ZkUZz/gEEdaEuWgCqsiC3jnYnKY5dyoZqPqcA/yz
         Z8bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783671064; x=1784275864;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bmNLcYZ7DY0jmVRO7inGJQa9CXuBgSwFuE+h0UJtvU4=;
        b=an65tVXZVSiCXOK93Pn7IVdiAXPQPl3C9+g4HLTSlKK8Q1UVYLKhgmnvtfcXKUz4pb
         R1jBrDjHy8oBDx1hNRI74CMgB8k0dr6pTouuZwhcXB722H5iHUX+W8DB2Pnrvz+9Xi+j
         pjMWR1Q1mQvg3hpBT7f/uYOjxBaviz+WuY8jV2ShS7q45N613IKFzXppDCSnLT0UFUD5
         AxpxVC6M8K16gbW6prmstt7+WxjaA1DvayD+rizKSFOy3ECacx/PiaJM4Io3T6Ev1kb8
         l/IUyfFdbsufjsH5y1P5liF34Fg2ZO79Xn2Bch2vn975QKoXaoIPHzT4sNt5FFMERura
         daew==
X-Forwarded-Encrypted: i=1; AHgh+RqJz805DuusrgKNlO3JqMpNy0XkCVk8UKgMv5PZ8NwKNCOA4rud/riDc2YpsDFyRvAJ9Uufex/ZgoGrq5mT7aE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwcEEf8VtlqmTPH2cJaj9Yna4c0zHkqqt2WgY5IrzQDEVBKcXn1
	Ean7eel46Ecp1sEZyEIo5SJbYRHMYyRC7sre/1KI2KYlKiKD9tZynFEPbKANglabe4Q=
X-Gm-Gg: AfdE7cl+GPPC/EzVnC9te0IC0caRH4yxOWjzlfccO5B+raeKssxjxIAeV1ZGlZA44nM
	jP2JYHvbZUzI953JRrkOZWCctFJB5aWq1K8FpwyEzjSYTdxsYta4XSuzOAmyW6s1Ysq6S04sv92
	DWN1wwFvbGdnBSy6BLIOrSIqoBVdJkI9n/IA3r9Mhoo7Z8/QYg3LeTtUOBfAbJBzv4+rvMIO7bM
	y6yEfJYlgbG+FiLlZXHdU3Ws1oRWhXUEsZevFnF+8nVOF1DFia/CbCrcUFX7Yl2cB+AikJ71uf9
	UTNqgybeMlA1fTOWCA9w138rkdvnlPoL4GxxS96mY3PC6Rj4A2Atx+MJ6Fi/j0PaDGNtHHVBqxm
	pypIiF5MqvtVRQ+nf2zs4dIKtPnaEO0wOkKsnlamuxWB+1ppttZGghzSbcj2CJVof3K/jkIdf0I
	Lq765/DXiJvjTgRgKGqc6dkNzKjLMsZWfAxhM=
X-Received: by 2002:a05:600c:e54a:10b0:492:3754:15f2 with SMTP id 5b1f17b1804b1-493e68d4081mr70813635e9.32.1783671064124;
        Fri, 10 Jul 2026 01:11:04 -0700 (PDT)
Received: from u94a (27-53-185-121.adsl.fetnet.net. [27.53.185.121])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ca5b3b251eesm4566350a12.31.2026.07.10.01.10.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 01:11:03 -0700 (PDT)
Date: Fri, 10 Jul 2026 16:10:54 +0800
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
Message-ID: <alCnt-xdKWzy71Xk@u94a>
References: <20260708090151.151729-1-sun.jian.kdev@gmail.com>
 <20260708090151.151729-2-sun.jian.kdev@gmail.com>
 <ak5HLLrYK3R_g2y_@u94a>
 <CABFUUZHpPwuTk69hb54WugJwssFuvoqFFPv34dZRbKLLc1PwwQ@mail.gmail.com>
 <ak8XSRiLKx5WcIQw@u94a>
 <1f8aad47f61fbf85eb55276e4bb01bfcff61393e.camel@gmail.com>
 <CABFUUZEXYduca34g22YZ1ESyYe3Yc3kYQrTEWLMxB5X0ZmYn8w@mail.gmail.com>
 <alCgmxFh9q-vjE0O@u94a>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alCgmxFh9q-vjE0O@u94a>

Forgot to include the verifier log when running
verifier_raw_tp_writable/raw_tracepoint_writable as evidence.

On Fri, Jul 10, 2026 at 04:00:27PM +0800, Shung-Hsi Yu wrote:
> So I think I now have a better picture of what's going on. Before
> 022ac0750883, negative const offset is rejected at *load* time because
> the const offset is accumulated into `off` before the negative check:
> 
>     // check_mem_access()
>     off += reg->off
> 	// __check_buffer_access()
> 	if (off < 0) return return -EACCES;
> 	if (!tnum_is_const(reg->var_off) || reg->var_off.value) return -EACCES;

On 136114e0abf0 ("Merge tag 'mm-nonmm-stable-2026-02-12-10-48'...") I
get:

  libbpf: prog 'tracepoint_writable_reject_negative_const_offset': BPF program load failed: -EACCES
  ...
  0: R1=ctx() R10=fp0
  ; asm volatile ("					\ @ verifier_raw_tp_writable.c:56
  0: (79) r6 = *(u64 *)(r1 +0)          ; R1=ctx() R6=tp_buffer()
  1: (07) r6 += -8                      ; R6=tp_buffer(off=-8)
  2: (79) r0 = *(u64 *)(r6 +0)
  R6 invalid tracepoint buffer access: off=-8, size=8
  processed 3 insns (limit 1000000) max_states_per_insn 0 total_states 0 peak_states 0 mark_read 0

> After 022ac0750883 the const offset accumulation does not happen, and
> thus now negative const offset is no longer rejected at load time.
> 
> 	// __check_buffer_access()
> 	if (off < 0) return return -EACCES;
> 	if (!tnum_is_const(reg->var_off)) return -EACCES;

On a4553044d1af ("Merge branch
'bpf-bound-rdonly-rdwr_buf_size-kfunc-return-size'") I get

  0: R1=ctx() R10=fp0
  ; asm volatile ("					\ @ verifier_raw_tp_writable.c:56
  0: (79) r6 = *(u64 *)(r1 +0)          ; R1=ctx() R6=tp_buffer()
  1: (07) r6 += -8                      ; R6=tp_buffer(imm=-8)
  2: (79) r0 = *(u64 *)(r6 +0)          ; R0=scalar() R6=tp_buffer(imm=-8)
  3: (95) exit
  processed 4 insns (limit 1000000) max_states_per_insn 0 total_states 0 peak_states 0 mark_read 0
  
> [...]
