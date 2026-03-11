Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 300E934E74F
	for <linux-kselftest@vger.kernel.org>; Wed, 11 Mar 2026 15:45:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773243907; cv=pass; b=GoLZdXw1e3IAnfRKx7M9gXwKWsSTjGBZosvOr5/uW2WeHmGHGrplcloNxAN4sAnuED6+Tgqg/oRgeVBlXL9wny1lx36T/sQzE/2yG6ZEB+9Vwgy7XiSogdJKMxebzckf6C2gf+fMskP7wqmZtpv8vlRa7PX7mvlJ+facCVtN8bk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773243907; c=relaxed/simple;
	bh=Cealpa4wizJ8480d9oSZXFOM7NEwmmWz1/9vguosSAc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jio0c0aKNT4E+UHYhgui0Rc22xB+QWuNrVOMrU7qPIuIpgcnQ8teb04Zdl9BD5aIpak5a8D34xFoMHXXRD0ktnfW+g5oikcTNLple7Yk9+QDbo7uOUL6FgkHflZ21uFT10Fm2fcSnrgZO+StRekGvWymWiK1BgcCi0VYLoemyY0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FbQCxJiR; arc=pass smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FbQCxJiR"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4852f73d0a3so41083465e9.3
        for <linux-kselftest@vger.kernel.org>; Wed, 11 Mar 2026 08:45:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773243904; cv=none;
        d=google.com; s=arc-20240605;
        b=N6T3vig9e3s5WK0zbzEFUN4HwdrWJY5XR4f13eYzVtcbuBCEehiNZ2456AV/yG7nL+
         6eCR1uA369juDlJrttIWOxxyNYKWlc0ggfAe73nXA+eH77oz76CJwTzki2Ej8o77y8FE
         BPe9LDGyGt8/e6vOrUvnGyHbAJkuw2AFn1o784kwsqJc9QWmJg90Esy+85ZFi1CPH+Fo
         5shqAR5Tgw+IA70FVHxSmP6dZ/tCaJcI0O87/rTmDlsR9paK9QXqMhaW/6zoc7NDlKVD
         s8pB1+d3ah/6doYofrkDr+whd5zs+HkQNE3v9AG2J/mDvizt/WmC1b7PbA1ND+m3gYAn
         nmDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=zNclYUuaTkVzzaj4bgQikoxLr3W671Eu3QPe4ldAxiY=;
        fh=FmTUjLCEU7NvAJWEpaKSk02t/ERifECjE2qTd5FZLJ0=;
        b=B9TzTsv7IbXkBhxny9Ov4ysFRGTYUwQ6bIlTrZ27czL0Rbe5SyvCh7Ayi3qpopJtnG
         ynL08QSuY+xsPWF/9ieWKxrno8Ssfgk/72pr2bFUt87+SFSs4inY5yLC+gXXO4/tu6mO
         CbHH4DvhrJPce/eNdifYj7MyPCfsdIjkfLKpenWf6rY6mn5wZygLFykMr8AIU5+3+2ZO
         HS/ib+o/UPqFU/zfo25SGEKc3z/AG4X+F444uJYOMp8SvOe+EwHqKPpD6rxMhPvHhSkJ
         RA9w89YMyqXD4Zz0XApHumi9cTcTz+HF1yycdWB9ez4MR845Qf7GX3sXJaKCyV78d5nw
         LX8A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773243904; x=1773848704; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zNclYUuaTkVzzaj4bgQikoxLr3W671Eu3QPe4ldAxiY=;
        b=FbQCxJiRxh0p6uVjU7Q2Ntc+AaW3L8DV9W2dfQ0XRv9gBXubLT7H7HG6yxUYoBPN5R
         yk3fkpIFgOTuJA0lf5NpDVjEDiqXW+g16YF30XydPl6i9bw0AcNH7nkZekB1oyrVPz1b
         Yo6GXYrqM8j1rJdYoX3cnbVl0O6k7SH9nlKv/sm+Q8c4F7c96j8VJdBot7EMF3yC9b5x
         azhNDcR9Ft2n22N699sYnbcf9yzF6pHxrrWWovBWr3tc3Olt6DLAA7ddf0lGPFXK6OPK
         lVAMDfnTU0mdFg78idbHZhnChIZoFVgy3uGhkzC24AoC1gBxG8Cc4hDOTVHYEQBsChxz
         XSBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773243904; x=1773848704;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zNclYUuaTkVzzaj4bgQikoxLr3W671Eu3QPe4ldAxiY=;
        b=TlVGxAO4BQfyxO3bhj/wjMiWoY/gowb3O4CDxGOlhOuzvxyJbZXdunrcJHGcvAW92J
         y32K7ac8VAJqO9CJ8VVckr5s6vFbKr5ZhtzPRpIsrl7WqiTKnvbQaAFqV8MdDbdVGp1s
         BxEbIcjFtvEnTUYPS8VnrMEAmnZJwcPZlP69eiKv+uosKYvf+5VkTx420TciEoI+PS34
         iJf0JFUdVKnLfsj/cf2hJGo6c9cSrhcvwrfB25bvOg3PVzm7kk4WCLQoGj7ZGXFbTVnC
         pfobaRPmG5axvi6sVJrmYf+f3quJFi8Y4O7xkWLzP7rO5duyoC9drUqPufCrUfdYuAQ3
         ZoLw==
X-Forwarded-Encrypted: i=1; AJvYcCX3gbTm58TGnHZVagdPI6ZYjQdhbzCR37VJng/pIcNefVd/kxFr2LB5gqBglNJUEWFiwbAFt1/m1eV/mR8I8OE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzG7fS5ioiF7cVuyf3Uj1jMoRpdk+Ppydgy3z3ivLXJPLJTIUya
	2Ddl39wsko+selS484zXkpYI9+MyiZAPQeEtvQy7RH1dUcgEbsiUX6cpHztoe6dfTmpBosGAq9b
	3IMxYj5VOGmAhFq3gIBYfcBz+xA30F4Y=
X-Gm-Gg: ATEYQzx1bwWPKpXEzff9biC6Z6AMtm4u6OknOiUw0b7CNlyJfRX+bBTimioEYBgUSQ/
	FJcDsDMohdI4YJaGfTmRpq+czCq8ZkRpoRdAdvMG7jH08Kv9dhHkXW/Gyur1M2unbAJqSL3LFkX
	oCHM6/MSni8ilQanZnPquuDsVlhV7WGX4kyApSMHFyngbMBqYm0+YMiCa7GjIXEHQyucsrW7vTy
	XPKrAb+F49ZmjIqJt5SKUJp6LX0VS4ChB0m5TxwvjaaKN+UjxoAGsp/d7W/rNAahwZUTK8eXSrD
	jcdZtMTF9G4YrXWwdLPsagFsXMWKT2UVSmeReYE43IZJXtv3uF34Dg3L0XCYCtaH2YraT5V6Y81
	/KRN9XTgNwJXpdeGsamOOK7OD6w==
X-Received: by 2002:a05:600c:64cc:b0:485:3d3e:1675 with SMTP id
 5b1f17b1804b1-4854b0b97fdmr48721955e9.8.1773243904237; Wed, 11 Mar 2026
 08:45:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260303150639.85007-4-leon.hwang@linux.dev> <47fbcb9aa941b07054bfef30b802d488688fafdf6df889e78b38313a614b98c1@mail.kernel.org>
 <CAP01T74sqmUAL7=PuzFPNbghX+6N_OzrsZiOHcMEMtg01CuL4A@mail.gmail.com>
 <94cfdbdc-833a-4838-af84-e0989e988418@linux.dev> <CAP01T74w4KVMn9bEwpQXrk+bqcUxzb6VW1SQ_QvNy0A4EY-9Jg@mail.gmail.com>
In-Reply-To: <CAP01T74w4KVMn9bEwpQXrk+bqcUxzb6VW1SQ_QvNy0A4EY-9Jg@mail.gmail.com>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Wed, 11 Mar 2026 08:44:52 -0700
X-Gm-Features: AaiRm53SchNpZb8YhY7jsacq3OKB-1k2FHbNE7n6phLF0ekD6dALQr59DCuF8EI
Message-ID: <CAADnVQJ=NGUydRq9SghNgoo2a3JZqz4498Sk81t4CfdHm0vSHA@mail.gmail.com>
Subject: Re: [PATCH bpf-next v3 3/6] bpf: Disallow !kprobe_write_ctx progs
 tail-calling kprobe_write_ctx progs
To: Kumar Kartikeya Dwivedi <memxor@gmail.com>
Cc: Leon Hwang <leon.hwang@linux.dev>, bot+bpf-ci@kernel.org, bpf <bpf@vger.kernel.org>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>, Eduard <eddyz87@gmail.com>, 
	Song Liu <song@kernel.org>, Yonghong Song <yonghong.song@linux.dev>, 
	John Fastabend <john.fastabend@gmail.com>, KP Singh <kpsingh@kernel.org>, 
	Stanislav Fomichev <sdf@fomichev.me>, Hao Luo <haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>, 
	Shuah Khan <shuah@kernel.org>, Feng Yang <yangfeng@kylinos.cn>, 
	Menglong Dong <menglong8.dong@gmail.com>, Puranjay Mohan <puranjay@kernel.org>, 
	=?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>, 
	Pu Lehui <pulehui@huawei.com>, LKML <linux-kernel@vger.kernel.org>, 
	"open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>, 
	Network Development <netdev@vger.kernel.org>, kernel-patches-bot@fb.com, 
	Martin KaFai Lau <martin.lau@kernel.org>, Chris Mason <clm@meta.com>, 
	Ihor Solodrai <ihor.solodrai@linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 11, 2026 at 2:22=E2=80=AFAM Kumar Kartikeya Dwivedi
<memxor@gmail.com> wrote:
>
> On Wed, 11 Mar 2026 at 07:08, Leon Hwang <leon.hwang@linux.dev> wrote:
> >
> > On 11/3/26 01:23, Kumar Kartikeya Dwivedi wrote:
> > > On Tue, 3 Mar 2026 at 17:04, <bot+bpf-ci@kernel.org> wrote:
> > >>
> > >>> diff --git a/kernel/bpf/core.c b/kernel/bpf/core.c
> > >>> --- a/kernel/bpf/core.c
> > >>> +++ b/kernel/bpf/core.c
> > >>
> > >> [ ... ]
> > >>
> > >>> +     switch (match) {
> > >>> +     case BPF_MAP_OWNER_MATCH_FOR_INIT:
> > >>> +             if (owner->kprobe_write_ctx !=3D aux->kprobe_write_ct=
x)
> > >>> +                     return false;
> > >>> +             break;
> > >>> +
> > >>> +     case BPF_MAP_OWNER_MATCH_FOR_UPDATE:
> > >>> +             if (!owner->kprobe_write_ctx && aux->kprobe_write_ctx=
)
> > >>> +                     return false;
> > >>> +             break;
> > >>> +     }
> > >>
> > >> In the v1 review, Alexei Starovoitov asked for strict conformance
> > >> both ways rather than one-directional validation:
> > >>
> > >>     "Don't be fancy. Require strict conformance both ways
> > >>     in *all* patches."
> > >>
> > >> https://lore.kernel.org/bpf/CAADnVQ+-V0-1i8_+CYpK7G0CnV-2n8e9Szv43yM=
3Az197eL_0A@mail.gmail.com/
> > >>
> > >> The BPF_MAP_OWNER_MATCH_FOR_UPDATE case still uses one-directional
> > >> matching, rejecting only !owner->kprobe_write_ctx && aux->kprobe_wri=
te_ctx
> > >> but allowing the reverse.  Was this an intentional design choice, an=
d
> > >> if so, should the changelog note the disagreement?
> > >>
> > >
> > > Let's follow the approach Alexei outlined, while the changes look ok
> > > to me, let's remove the one way check and just do
> > > owner->kprobe_write_ctx !=3D aux->kprobe_write_ctx, same for the othe=
r
> > > two checks. With this we can also get rid of this INIT vs UPDATE
> > > distinction.
> > >
> > > Other than that I think patches are good, please also test both
> > > directions in the selftest in next respin.
> > >
> >
> > Hi Kumar,
> >
> > Thanks for your review.
> >
> > I agreed that both-ways check could simplify the code. But, the UX coul=
d
> > not be great.
> >
> > Let me explain it with an example.
> >
> > struct {
> >         __uint(type, BPF_MAP_TYPE_PROG_ARRAY);
> >         __uint(max_entries, 1);
> >         __uint(key_size, sizeof(__u32));
> >         __uint(value_size, sizeof(__u32));
> > } jmp_table SEC(".maps");
> >
> > SEC("?kprobe")
> > int prog_a(struct pt_regs *regs)
> > {
> >         regs->ax =3D 0;
> >         bpf_tail_call_static(regs, &jmp_table, 0);
> >         return 0;
> > }
> >
> > SEC("?kprobe")
> > int prog_b(struct pt_regs *regs)
> > {
> >         return 0;
> > }
> >
> > prog_a is kprobe_write_ctx.
> > prog_b is !kprobe_write_ctx. And, it will be added to jmp_table.
> >
> > With both-ways check, prog_b is required to modify regs. I think it's
> > too restrictive for users to use prog_b as tail callee.
> >
> > With one-way-check of this patch, prog_b can be used as tail callee to
> > keep regs as-is.
> >
> > This was what I was concerned about, and the reason why I did not follo=
w
> > Alexei's approach.
>
> I agree but the main question is whether such a case is realistic, are
> we going to have write_ctx programs tail calling this way?
> Tail calls are already pretty rare, thinking more about it extension
> programs are probably also broken wrt checks in this set.
> bpf_check_attach_target is doing none of these things for
> prog_extension =3D true. Nobody reported a problem, so I doubt anyone is
> hitting this.
> It probably also needs to be fixed.
> Since you noticed it, we should close the gap conservatively for now,
> and wait for a real use case to pop up before enabling this one-way.

+1
tail_calls in general hopefully will be deprecated soon.
As soon as we have support for indirect calls there won't be any reason
for tail calls to exist. (other than not breaking current users).
We definitely don't want to open it up further.
So the simplest fix.
