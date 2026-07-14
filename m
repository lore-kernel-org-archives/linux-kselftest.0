Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 449771C6FF5
	for <linux-kselftest@vger.kernel.org>; Tue, 14 Jul 2026 04:31:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784003515; cv=none; b=WCivIT2+llO9GB+m5AFpSkm+ECWmjkmeSJUCKGAMMER9G3p6s2PTn6YBWU+Mg0CQzuUjXqg3wkHpVSNA5IsLeJxqKb7GoxhvmWNJlcjuffN9Gw692buIwjRHt2MI2Vq+3sHqYHLuk95ynyXjoEcXmM5ZO7Q9XlDcLd6llbTMufw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784003515; c=relaxed/simple;
	bh=amcnccEfV2zMP1CmqZTPxJKIVmiE92ewOOkbR/0ra+Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eJ+vJ6okF9Ttga8lFbU5NsMraN3U1WnGOE8X9xEddwDHwe2tma2furWhGGmtE2I4dw4glVn+p7n2cTJgedaxgUwfO+sQUb7wosZwabXySja4eFnwLqSypQuszgVbMhtWBIfxf1mtKwvwRkDm93aGsB8ykZzM5PiU6Cy5L7oFwUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=DS/PD253; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="DS/PD253"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-c15d111ca99so375661966b.0
        for <linux-kselftest@vger.kernel.org>; Mon, 13 Jul 2026 21:31:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1784003512; x=1784608312; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=5QjGoG5qAeIc1Na3vyNRDThJoCp+F3AJc5d4xY+kAQs=;
        b=DS/PD253eqzhAgKlUyYRQArdVNddzxBQ4DWdN9ld/umA7XgYdwBc2eKRgDj/FOOh+L
         6as1CRTWNVK6FvvsAzCJsdac+YZH2Ul5XoznPmdEA9AxH3IyFaJsNa8nL2uCYsuZUi8e
         zDxSOl5OqgCmWHoTa9iMV/6csmmML+kfGdMawqyKODgxd/FdGr2cVVksPHArBPLgow6I
         rmnh2Shn9bi+qIdFks3wZSQYDrf2XAPde8D+zH2Rlor8OVXQctSL28p5MEkrPSt0nhxS
         bXje33XABMIolW9bXAQ93AZQ+B5xrOAsW0zg0QKQY6+gD7kXIECq7VPmShtKi8YLsySk
         08ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784003512; x=1784608312;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=5QjGoG5qAeIc1Na3vyNRDThJoCp+F3AJc5d4xY+kAQs=;
        b=N6ZoJ3VNtWFvrbmdCpMNr2+H50lkNSCB/mXV48Tu6rs4rjxLFYW408NJenQhaVS90+
         Yoff6RYoZsj71FVbArIFXyQVLLiNKlu9wrmZX1wgn/Tf95itdWBrYWj/q1BkyHP7OSmF
         GmreVFtx2Y3OIF25PLIM/tsSU1/CEsYwnpl/rEPMIijKPrFSWYENZhs9Ws9qDhfnmHOY
         ZyUo6omVqzcfY6qI3p0O/A9S2jH9JUkZcG7+UZaT3jcUoAoRE7onhuxEkpkEe8FjhBLy
         Uq2uW8D+9V6M/h/jad0mhpuuvBeEPab8HNUlaa0TQmL3NN2mnKZJxYSQU064xrvmsdFD
         g/KQ==
X-Forwarded-Encrypted: i=1; AHgh+RrPLZ2WZ40tbNt4YEuUYYAkbfYxJzcI6pa31GWspAFrklMW1GMcLx2r8Q7NNSDGTWOqP/EB5scnqZc48XCmkWg=@vger.kernel.org
X-Gm-Message-State: AOJu0YzUyWsoeFaJMuGQ7Daf1kKliToInF4dTDllTALJJ5DGo82sErYf
	+mAsWuGRiAB2jSYhdXGn6ERfJd4rULdz7vKnpy838tnQM39v0FlO4hxKcNPpdkkfxtY=
X-Gm-Gg: AfdE7cm0t+O8fW9jIe/blMyXSxPjx98ZVL0S/Quze0GIT2ezFtX0lLHoDnbcvjQevmr
	WZ0hUdS+CMhx1FZ1qN7FQsTGjIyIR+HVMUeSG4YRs56v5qJ/lGRYm6lnngLwEJ3CaaWti9Wz8mX
	7Ve2sqaSj3seZbxo/D9XreblQAh7sqjyZ0F7iXY8Qjx+K8xCA3m1MU8N5TpIERMeDZaSoalF6fE
	W6MhiW0XcsdKk5SN5juKNVzh0//fTt+aj8Jha9FR0qYF4EeARMF749kBfbFknQl7gjSCbR5Ea8h
	n3IgE8sTkIda/DDs5hcH2sWtl1nioRblMh/mrNP5sDlmMCdjtDRIJjdSQNbg5s1L7FTEZgkJLdR
	nhUSgxWKXAhWDHwbDDhFPP9DDD++11qkzrXjH4nVEN7Oin4dbuP0VVMCjvww8rmkZxy605xhQZp
	07O2o1VTzmEoYCA/I692Z5glqENtW6op7tK8uTMSHkdxE=
X-Received: by 2002:a17:907:6e89:b0:c11:ff2c:4f33 with SMTP id a640c23a62f3a-c161f3886bdmr502412366b.45.1784003512434;
        Mon, 13 Jul 2026 21:31:52 -0700 (PDT)
Received: from u94a (27-51-48-151.adsl.fetnet.net. [27.51.48.151])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7ebcafdf8f2sm14419654a34.11.2026.07.13.21.31.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 21:31:50 -0700 (PDT)
Date: Tue, 14 Jul 2026 12:31:38 +0800
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
Message-ID: <alWvvwpn3z9Nn0zw@u94a>
References: <20260708090151.151729-2-sun.jian.kdev@gmail.com>
 <ak5HLLrYK3R_g2y_@u94a>
 <CABFUUZHpPwuTk69hb54WugJwssFuvoqFFPv34dZRbKLLc1PwwQ@mail.gmail.com>
 <ak8XSRiLKx5WcIQw@u94a>
 <1f8aad47f61fbf85eb55276e4bb01bfcff61393e.camel@gmail.com>
 <CABFUUZEXYduca34g22YZ1ESyYe3Yc3kYQrTEWLMxB5X0ZmYn8w@mail.gmail.com>
 <alCgmxFh9q-vjE0O@u94a>
 <CABFUUZEnd9f7tV-+jT+cgL7sFVp7pL5-tjdwMvxcR9ist1s-xg@mail.gmail.com>
 <alRtilWhKw4zzMkI@u94a>
 <3430dc0a2a141769a596ab21d7abdd86a0a804db.camel@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3430dc0a2a141769a596ab21d7abdd86a0a804db.camel@gmail.com>

On Mon, Jul 13, 2026 at 01:44:18PM -0700, Eduard Zingerman wrote:
> On Mon, 2026-07-13 at 13:05 +0800, Shung-Hsi Yu wrote:
> > On Fri, Jul 10, 2026 at 06:27:41PM +0800, sun jian wrote:
> > [...]
> > > One detail about the attach-time check: I agree that some negative-offset
> > > constructions can still be rejected later if the max_tp_access accounting
> > > produces a large value. But the runtime reproducer I used exercises this
> > > specific access:
> > > 
> > >     r6 = *(u64 *)(r1 + 0)
> > >     r6 += -8
> > >     *(u64 *)(r6 + 0) = 0
> > > 
> > > Here reg->var_off.value is (u64)-8, off is 0, and size is 8. With the current
> > > accounting,
> > >     reg->var_off.value + off + size
> > > wraps to 0. So max_tp_access records 0 and the attach-time writable_size check
> > > does not reject it, even though the effective access starts at -8.
> > 
> > Yes, that should had been rejected.
> > 
> > > On the bpf base without the verifier fix, the temporary reproducer did load
> > > and attach successfully:
> > >     negative_bpf_load: PASS
> > >     negative_raw_tp_open: PASS
> > >     negative_test_run: PASS
> > > and KASAN reported the stack-out-of-bounds write in ___bpf_prog_run.
> > > 
> > > So for this particular range, this looks like more than a load-time policy
> > > difference: the missing lower-bound check leaves the access executable on the
> > > bpf tree.
> > 
> > Actually I got this reproduced in the *bpf-next* tree now. And I think I
> > know why Eduard wasn't able to reproduce the issue.
> > 
> > The main problem was that CONFIG_BLK_DEV_NBD was not enabled in the
> > default BPF selftests configuration, so nbd_send_request wasn't
> > available, and thus the attachment always fail with -2 without
> > exercising the checks that we have in bpf_probe_register().
> > 
> > With CONFIG_BLK_DEV_NBD enabled, and negative_var_off_program[] updated
> > to do use offset of 0 (instead of 28 + 8), I was able to reproduce the
> > issue on top of commit `9a3a07d06e7d` "Merge branch
> > 'bpf-fix-warning-in-bpf_trampoline_multi_detach'" with the following
> > updated version of your patch.
> > 
> >   0: R1=ctx() R10=fp0
> >   0: (79) r6 = *(u64 *)(r1 +0)          ; R1=ctx() R6=tp_buffer()
> >   1: (07) r6 += -8                      ; R6=tp_buffer(imm=-8)
> >   2: (79) r0 = *(u64 *)(r6 +0)          ; R0=scalar() R6=tp_buffer(imm=-8)
> >   3: (95) exit
> >   processed 4 insns (limit 1000000) max_states_per_insn 0 total_states 0 peak_states 0 mark_read 0
> >   tp_fd: 8
> >   check_nbd_attach_reject:FAIL:nbd_invalid_negative_var_off unexpected nbd_invalid_negative_var_off: actual 8 >= expected 0
> >   #319     raw_tp_writable_reject_nbd_invalid:FAIL
> > 
> > So I would say a fixes tag that points to 022ac0750883 is still needed
> > after all.
> 
> Hi Shung-Hsi, Sun,
> 
> Shung-Hsi, thank you for figuring out the quirk with the config.
> Indeed if I modify the test to be config independent the following
> program is both accepted at load and attached:
> 
>   *r6 = *(u64 *)(r1 +0)
>   r6 += -8
>   r0 = *(u64 *)(r6 +0)
> 
> Worse yet, the mechanism affects both PTR_TO_TP_BUFFER and PTR_TO_BUF.
> The PTR_TO_BUF is reachable from helpers/kfuncs with custom 'size' assignments,
> as far as I understand.
> 
> Sun, of checks added by this patch:
> 
> >	var_off = (s64)reg->var_off.value;
> >	if (var_off >= BPF_MAX_VAR_OFF || var_off <= -BPF_MAX_VAR_OFF)
> 
> This should hold already.

FWIW, I had thought so, but after checking I realize that the verifier
only ensure that

  -BPF_MAX_VAR_OFF < smin < BPF_MAX_VAR_OFF

holds true in check_reg_sane_offset_{scalar,ptr}(), and does not check
smax, so technically var_off.value can be greater than BPF_MAX_VAR_OFF
when we reach here, just that it doesn't really matter much as it is
rejected anyway. And if it is a constant then smin=smax, so for a
constant value it does always falls between +-BPF_MAX_VAR_OFF.

  0: (79) r6 = *(u64 *)(r1 +0)          ; R1=ctx() R6=tp_buffer()
  1: (85) call bpf_get_prandom_u32#7    ; R0=scalar()
  2: (bf) r2 = r0                       ; R0=scalar(id=1) R2=scalar(id=1)
  3: (67) r2 <<= 32                     ; R2=scalar(smax=0x7fffffff00000000,smin32=0,smax32=umax32=0,var_off=(0x0; 0xffffffff00000000))
  4: (77) r2 >>= 32                     ; R2=scalar(smin=0,smax=umax=0xffffffff,var_off=(0x0; 0xffffffff))
  5: (07) r2 += 536870911               ; R2=scalar(smin=umin=0x1fffffff,smax=umax=0x11ffffffe,var_off=(0x0; 0x1ffffffff))
                /* r2 is now [2^29 - 1, 2^32 + 2^29 - 2] */
  6: (0f) r6 += r2
  7: R2=scalar(smin=umin=0x1fffffff,smax=umax=0x11ffffffe,var_off=(0x0; 0x1ffffffff)) R6=tp_buffer(smin=umin=0x1fffffff,smax=umax=0x11ffffffe,var_off=(0x0; 0x1ffffffff))
  7: (79) r0 = *(u64 *)(r6 +0)
  R6 invalid variable buffer offset: off=0, var_off=(0x0; 0x1ffffffff)

In short, it is much simpler to just check tnum_is_const() right away
before using var_off.value.

> >	start = var_off + off;
> >	if (start < 0)
> 
> This one is necessary.
> 
> >	if (size < 0) {
> 
> Technically this one is bounded by 1,2,4,8 in case of instructions and
> by BPF_MAX_VAR_SIZ in case of a helper/kfunc (see check_mem_size_reg()).

Oh right, missed the check_mem_size_reg() case. But as Eduard said, this
should still be bounded, so can drop this check.

[...]
