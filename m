Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com [209.85.221.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCED93D413D
	for <linux-kselftest@vger.kernel.org>; Wed, 11 Mar 2026 09:22:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773220957; cv=pass; b=mbN4R6q4GNeR8zIy4FDAVty+QRgV95ILvf0EU/fy+OKWY6BG6grkQfRaozuqeWYuZHX9sBdf4rfUelvY1h6qGWAipePfvcxQM7rX7XSa/zR09Ecx84sOxdXs3BFmXcMttRzhCdQdS8tFsKZVgDUq8/55etuj5IBrfWyMrCEPYw8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773220957; c=relaxed/simple;
	bh=YACcX35xOsZaWzEwi+YLtodbEl58LHKv9PHt6kgvIE4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QAHQ4J2b/e3AEnRvFzi2aS7S0LNxzzOxwnNG6alvWkXSLyjs0JJw1NglArb4w0TSQM8kJLCMa0JyFiDTuroHoZPoCp/R62PWOHZMqngcgqsXDqFc4fzL6NrcRvoEr1TBozRtPgfCpy9D7MjQaiCIg88DvzClvbZmfPL2Pt/nM9M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ickx9bIH; arc=pass smtp.client-ip=209.85.221.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ickx9bIH"
Received: by mail-wr1-f66.google.com with SMTP id ffacd0b85a97d-439cd6b0aedso5710651f8f.1
        for <linux-kselftest@vger.kernel.org>; Wed, 11 Mar 2026 02:22:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773220952; cv=none;
        d=google.com; s=arc-20240605;
        b=SyWACAxo/2Uhm0w2S+FSiej78vuHCgJZZOT09pLIi9TzhCf9uIgBcDanouRov8UaxD
         Az++hWj25Moowfp6kH9MxsZ1cFOdYbINSVxHSd3J7qP6ctbNkUxcOuHwSHoBXE3vLqZ0
         Qh7N0B2FAJq9QYDUXmSvrKPZ0MlwMXE5CcJBLwUZuC01xARvkxFGAZJK7mbXsuBkBAMW
         YYZZNUY15IojYxtKdstf/6J6cYnynxKAuiibTNoN9pLg8HU/CCbONSxrmA0oh/mvqR0l
         wdKHzlTJDAY0jwqZrFZ+j4K48SocLxKEPdu+GjF3CTtpNr9bgZd/5QQ1OZZIPIWRJB1z
         ZkOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=lFgMihWsoMtZghWDDXPtR/BAjR1Y+4atLFgxslVUViE=;
        fh=kCyRLDh5J3gIiREFLY8j0Np5W6jJYz493Cq4oJBa4aA=;
        b=dSDTzDY1PEfVfKYokqpAuIy8zTLSkjeCmDxiHol/Ykt6KIwXH6zXfbk9BjO1L4V/O5
         Wu4a/ZgSdg7GgWlLARhQup1BnRENlCV1rae7IRwQrPuRXP7AVQnF9pxpnPneltYSk5As
         YIKExT+Os5dUM+5xFHUDD0Ch3SgKiMkg/eAEmYN7Jr/Zgr92tDkwzj1UoAuCjHMJMtDD
         KXwxr4+7d6aKFXmQwkXswYdJFNdiFcHSrUw1og0WSUj8LlhQOjzh+HTAk5CDEX/JLh3H
         spQk009d7Pl7FE9DPXMgLSznIYIy2iPsNZxJVRYYtw9Htwrv0e+iK/SlcZK2ArO1o8NA
         XFxQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773220952; x=1773825752; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=lFgMihWsoMtZghWDDXPtR/BAjR1Y+4atLFgxslVUViE=;
        b=ickx9bIHtBU+sEi1aRGjZqo71gBfwNnWragbJ5Y8eH6yQJeAOCXmN2Cs0w4diTS98P
         fAHrLuQUe90UVcLlBnQ7IckbzDv9YyEf/SsjmvzrA4l+teUaYAT5UV/+0oqPhMP+sFTe
         Bx3o8QJABxpQrLpMey/y0vFDienmPw6fZSFBf/8AiVUV3YbWRc7K1ZcaNtJTQQnXsmIJ
         Fpsg0G2Hs0P8gzaZis4iEpH1EBHNUWzoAIpTm1HlkLUFWdPTJekar4JDGd6F8beE2d5N
         CwC2T9QKkwm8Ogr8r6qMCmzFcXwh9jPLR+K41Pg40VIbP64xQiFc92GWxhPIpA8XjUF3
         54FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773220952; x=1773825752;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lFgMihWsoMtZghWDDXPtR/BAjR1Y+4atLFgxslVUViE=;
        b=l9nXcum+SfgmGUm904yaa2cyFET4xpKGjyAP1XIW8cgUNw6nJKfeqtDNH9WdaD4xVK
         NeyIN05aeuYMHDX6fOdngpnkEQ4L0fTAFnF7DEvNTmofi7MOuqFA+sMWFk0xMbD4YuW7
         2HxV6obrIByBHAT0Cjn54FUwi9v8asGUQF9ByC60OlO97rVS+mee6OAbW2CAzms8/zJs
         PhgJkSfHMADqXpGOp/KhMi2vgelby0P/h04k5hCQM8lc9vN/4CYGwsca+yvabRp1IV9m
         9FE6FpSXre9t+FKH5H1e71UKIbSlmLURaIFcP0+Fhzg03gE+G3SPRMT8fkp/hGMFfxDk
         4GLg==
X-Forwarded-Encrypted: i=1; AJvYcCWGi7jLG59xkoFP4Hu3H4WMDMv6fxeNS3qVXXkb+3xGEGTyV2hS7A6569e5eS8pgZzy9kjIQbJ7eksVhUfYPJY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1CpuC6SM8aC/1LHzMLY0ddCkiA+CbbkFTgjJIgDErZLiDcRqe
	JY/r4oRful6WY1GoESqjSl284rsWOJDV67d7ObNY08sRThhemGTInA79qIkF98qdIunqkv+ZjpN
	gWGBEVafGtyTrAbH15EDzM9HH5LejWHE=
X-Gm-Gg: ATEYQzyxXGVDZ567Tq0RQqP09ky6Qefh7eflaQ6yZY8V10qhF9kkU5lvmkCQZqkiQva
	udZVIhMoZwi0kU6mYN3WJ1Zg5dvdoju5thHRTzHO3Gbv9Ky3esGAVayIOlLftM7ubv+WSI9kI8r
	BJccrib+IMm/LnGavAcWEOiG2yF2tUK5e5u5BnhVIglYqiFYgX0RhgD5vqNtIwtZwwpcV9oGcjV
	OvgXsWS6YjARhORnqHfnlJMh2Vy+dUdorGoelbNxF80NZWRcA/Fhl3Cdvh1yyV++W4bpl9N0H4I
	ndPC2SGGZu45GKCeBduKeMZ2zTk9y4oybT+2hnQSgry9ZLP2DtBn52N1UUlP
X-Received: by 2002:a5d:5e01:0:b0:439:bcc2:bf0a with SMTP id
 ffacd0b85a97d-439f81e7e25mr3490492f8f.23.1773220951904; Wed, 11 Mar 2026
 02:22:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260303150639.85007-4-leon.hwang@linux.dev> <47fbcb9aa941b07054bfef30b802d488688fafdf6df889e78b38313a614b98c1@mail.kernel.org>
 <CAP01T74sqmUAL7=PuzFPNbghX+6N_OzrsZiOHcMEMtg01CuL4A@mail.gmail.com> <94cfdbdc-833a-4838-af84-e0989e988418@linux.dev>
In-Reply-To: <94cfdbdc-833a-4838-af84-e0989e988418@linux.dev>
From: Kumar Kartikeya Dwivedi <memxor@gmail.com>
Date: Wed, 11 Mar 2026 10:21:53 +0100
X-Gm-Features: AaiRm50nAQdzlpHM51HW1PyT3VT1H1H64hcFybhjy9jwHkvvigOgK5QbW0gQV78
Message-ID: <CAP01T74w4KVMn9bEwpQXrk+bqcUxzb6VW1SQ_QvNy0A4EY-9Jg@mail.gmail.com>
Subject: Re: [PATCH bpf-next v3 3/6] bpf: Disallow !kprobe_write_ctx progs
 tail-calling kprobe_write_ctx progs
To: Leon Hwang <leon.hwang@linux.dev>
Cc: bot+bpf-ci@kernel.org, bpf@vger.kernel.org, ast@kernel.org, 
	daniel@iogearbox.net, andrii@kernel.org, martin.lau@linux.dev, 
	eddyz87@gmail.com, song@kernel.org, yonghong.song@linux.dev, 
	john.fastabend@gmail.com, kpsingh@kernel.org, sdf@fomichev.me, 
	haoluo@google.com, jolsa@kernel.org, shuah@kernel.org, yangfeng@kylinos.cn, 
	menglong8.dong@gmail.com, puranjay@kernel.org, bjorn@kernel.org, 
	pulehui@huawei.com, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, netdev@vger.kernel.org, 
	kernel-patches-bot@fb.com, martin.lau@kernel.org, clm@meta.com, 
	ihor.solodrai@linux.dev
Content-Type: text/plain; charset="UTF-8"

On Wed, 11 Mar 2026 at 07:08, Leon Hwang <leon.hwang@linux.dev> wrote:
>
> On 11/3/26 01:23, Kumar Kartikeya Dwivedi wrote:
> > On Tue, 3 Mar 2026 at 17:04, <bot+bpf-ci@kernel.org> wrote:
> >>
> >>> diff --git a/kernel/bpf/core.c b/kernel/bpf/core.c
> >>> --- a/kernel/bpf/core.c
> >>> +++ b/kernel/bpf/core.c
> >>
> >> [ ... ]
> >>
> >>> +     switch (match) {
> >>> +     case BPF_MAP_OWNER_MATCH_FOR_INIT:
> >>> +             if (owner->kprobe_write_ctx != aux->kprobe_write_ctx)
> >>> +                     return false;
> >>> +             break;
> >>> +
> >>> +     case BPF_MAP_OWNER_MATCH_FOR_UPDATE:
> >>> +             if (!owner->kprobe_write_ctx && aux->kprobe_write_ctx)
> >>> +                     return false;
> >>> +             break;
> >>> +     }
> >>
> >> In the v1 review, Alexei Starovoitov asked for strict conformance
> >> both ways rather than one-directional validation:
> >>
> >>     "Don't be fancy. Require strict conformance both ways
> >>     in *all* patches."
> >>
> >> https://lore.kernel.org/bpf/CAADnVQ+-V0-1i8_+CYpK7G0CnV-2n8e9Szv43yM3Az197eL_0A@mail.gmail.com/
> >>
> >> The BPF_MAP_OWNER_MATCH_FOR_UPDATE case still uses one-directional
> >> matching, rejecting only !owner->kprobe_write_ctx && aux->kprobe_write_ctx
> >> but allowing the reverse.  Was this an intentional design choice, and
> >> if so, should the changelog note the disagreement?
> >>
> >
> > Let's follow the approach Alexei outlined, while the changes look ok
> > to me, let's remove the one way check and just do
> > owner->kprobe_write_ctx != aux->kprobe_write_ctx, same for the other
> > two checks. With this we can also get rid of this INIT vs UPDATE
> > distinction.
> >
> > Other than that I think patches are good, please also test both
> > directions in the selftest in next respin.
> >
>
> Hi Kumar,
>
> Thanks for your review.
>
> I agreed that both-ways check could simplify the code. But, the UX could
> not be great.
>
> Let me explain it with an example.
>
> struct {
>         __uint(type, BPF_MAP_TYPE_PROG_ARRAY);
>         __uint(max_entries, 1);
>         __uint(key_size, sizeof(__u32));
>         __uint(value_size, sizeof(__u32));
> } jmp_table SEC(".maps");
>
> SEC("?kprobe")
> int prog_a(struct pt_regs *regs)
> {
>         regs->ax = 0;
>         bpf_tail_call_static(regs, &jmp_table, 0);
>         return 0;
> }
>
> SEC("?kprobe")
> int prog_b(struct pt_regs *regs)
> {
>         return 0;
> }
>
> prog_a is kprobe_write_ctx.
> prog_b is !kprobe_write_ctx. And, it will be added to jmp_table.
>
> With both-ways check, prog_b is required to modify regs. I think it's
> too restrictive for users to use prog_b as tail callee.
>
> With one-way-check of this patch, prog_b can be used as tail callee to
> keep regs as-is.
>
> This was what I was concerned about, and the reason why I did not follow
> Alexei's approach.

I agree but the main question is whether such a case is realistic, are
we going to have write_ctx programs tail calling this way?
Tail calls are already pretty rare, thinking more about it extension
programs are probably also broken wrt checks in this set.
bpf_check_attach_target is doing none of these things for
prog_extension = true. Nobody reported a problem, so I doubt anyone is
hitting this.
It probably also needs to be fixed.
Since you noticed it, we should close the gap conservatively for now,
and wait for a real use case to pop up before enabling this one-way.

>
> Thanks,
> Leon
>
