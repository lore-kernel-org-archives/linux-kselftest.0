Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97F752E0938
	for <linux-kselftest@vger.kernel.org>; Tue, 14 Apr 2026 19:16:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776194180; cv=pass; b=NqPtLGk1SDiI7EsNHV5FKW2j6z50E18VTjwAHTcdoost4ym+wxVCdyU2wgkIkKffjtovBTKotFO5JtE9Y7VaV7tO+xywFpYeRyTfUXqidrL6EHdw6MkZw/RUXaE6edNp9+WhKYschCYEyaSRsXXvOmFSVJn0qT53oxomdkkba5o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776194180; c=relaxed/simple;
	bh=Pa9Tyq9G0aEPQgad+vwhYFPvxVvYUvSmDxYTMccNEa8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=M+HnHBVSurL3Rh9E/qmpBWPFPP4+SWgIrs+howpgdJh8LE657swCuyQfdRQJonMowGnHpoOyuTByxESdDemNHLlrqeG/mD7XlJK/vF7RLgVoqVNmN9cPZCrAGIaVDRD778CFGpu+ecgTmv5PIYwrnU2+nwBusBW2/OXVh/lxKZg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Mpc7xVpy; arc=pass smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Mpc7xVpy"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-488a9033b2cso72747785e9.2
        for <linux-kselftest@vger.kernel.org>; Tue, 14 Apr 2026 12:16:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776194177; cv=none;
        d=google.com; s=arc-20240605;
        b=d9e6nc5U4zkMVA2VZO9gyNl+XvMvZTBesnGMLAaiF9pCQdnCYYb0ezmi+TWAyQNfaB
         rqUCjnzA/AvWglwPVKwNqowEHI7WFeNBSNtyY3lT5eQGVsbECjE7yZr5QGmp48fPLsPV
         kEELGLj1PWeSMsleiWQt/63+7WTy5buhRtLVCwLfGNbrduFiK7VMztk7+qdkiVcm85LD
         E/wak6SYM6u4ZeDgGaOrAfBy0xbfk5tFAOccJhXCZGMX/aYIwU4h5UpO8dpdro07rOKU
         pdPkK3C3FP2KHNRRxfPIzR0Uy7jux37l5w5g2aQ4e1IkBaYyYeGkJ+h1TiXqil4Nl4Pz
         Fm1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Pa9Tyq9G0aEPQgad+vwhYFPvxVvYUvSmDxYTMccNEa8=;
        fh=sxu4Y8UG7V/56kWrWs68ZiworXdzO0sF1IsNJpaqdyA=;
        b=SB2ShPJbrkMQWAui9SJ/gBFxcpBjkKkCNGkpG4FafQ0AIb+CasAtjN6xIIN0sRlmGw
         q1Dx2TSCW/xKRtgKpF2me1dH37sC/oiES0GXhJ2ZrmFKT0RxCEzphWvMgb3vAYF4bse/
         MjjIHayjWxg04417cxvzBLs9HXcC6SyO8+LUQmhwazESQm/s9Zq4/dBnLh3W2Iy+7ech
         1s8G4Spp/tJpLAKPTy233yk4IVfHQRwZO8ybWLU4gkFz5UfnBwx7e4HOeIldXZk/sRon
         qs6DrDTG6wYMkXXAnhsxEEzp47PZU0DtYz+RRqnBASo4rPme8aY0UVfHdRDzgjIfcIv4
         vlIA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776194177; x=1776798977; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Pa9Tyq9G0aEPQgad+vwhYFPvxVvYUvSmDxYTMccNEa8=;
        b=Mpc7xVpy0aat/nOvxYcxYcf2t38XGL68q0eCA5v8oM4hPWbLdss4Rdsj8qSPNKhUqi
         KOczID1epKGzJJbY7riB26JVfzODnvHVKvoEUn79UDeMfee5OzhrgRdK1TpYXbhjZsWX
         JhK6CkseYiAEXB9MJqp7p5UviYRFK9SMlDFtSaWcj6Z8V9/HICDnls2FgnuLznBXww4p
         6snmdRCdSEuCc6aQnsWjc2cMPKwpaSRio8NKUZmUCm4qv0jybc+2GTvTOfosR7ZSPDGH
         J8H7u7gvVoRhzbOYL57IJGZujPjwoYSKuRkRVdro1b5v6HTcj2LCdPo81G1vaLdfglOp
         HxEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776194177; x=1776798977;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Pa9Tyq9G0aEPQgad+vwhYFPvxVvYUvSmDxYTMccNEa8=;
        b=Yz+3Fab6cFbmVv/8IoGlaPCq7f7qWUQjSKzQemqaWnu3HxaJiPzumHGYFwnYOLYxA+
         NU4ye5hsUZsq3e0sADcwHKJ/P0X6Qqkvi3XlPD69IYMp/G4qwwylShoOkDjzMXdPrIra
         JAlFtE96ESonlHXuGaJKo0VJFN2mpYno9Ads9BAhVH/5PGq4/QaPL1OCahe1IqSOvE5v
         DPVRvzsquk6JU2AADAhvTa3uumH4pil6X11j6ECOGCN0pUZqhtXcfrSZbvAQpGBaJ4Vb
         x1h4vtVt1JrrXLGopgX7Oszbyw2EV5bt2ByqT3EZMrzj4McUbxUSfjaE50E2GhlxyU0z
         vSCg==
X-Forwarded-Encrypted: i=1; AFNElJ/0127BdFltW1jay6bEa8MDkeBim55WEbETGOL0HQvtdIikN8w+xWAHASsBv0usUxIo/V9tzAOTA6tUm2WZl0w=@vger.kernel.org
X-Gm-Message-State: AOJu0YyI70Hg7Wy7ppszk5wxFIa6UvZ4NTxVQQRXeLtqLQqUtCtsO2cj
	Pg35jT6FxI6iBUElaq9NEu0xGtsHGBgwtHdtlvQtEWMkjbz0xjllNNQ2A1wdD+7yALGCtw4MMD8
	oQAEvDWz3dux5+Yp2kyk4RJEOirdmsYI=
X-Gm-Gg: AeBDietZ+LApVai0QxCk3NxOOYR3AhoSu6aWztjPc3YIZ7C0OH8uCD5FZk24eCJ0v/R
	1MSoVnpeK5XSCv/nZE/k0HLt/cM5WS3F3fxsNmJ2gw/u66Qr51Y196wxNatvFG9krb+fRRy0YGf
	AgdK766AU8k2fyQmxHwd1KoMFl3oumt/jgdoYQl9Zf0cfmv2d5dkOD1KkWT9FWaGU+CNpSQCTgL
	FKT9Gjb2rsdanNnsoQRz5LXS9UuN8j+UaAHSkgHHgZHFonurnKW8/SB10wG5LjMS0J1saeEIEar
	7eUw2JhGopFCGsiLp6TQVaFRJtwEdG78CDpUsUt7P4R9mIQuLAYNO7BjyBvjyPgQWy+sJinlSSo
	iS5/5IZPr4tVTBJjyQsBac5qo1QRb7F6gIu5k
X-Received: by 2002:a05:600c:1f83:b0:488:b99b:4177 with SMTP id
 5b1f17b1804b1-488d687bf61mr256552315e9.25.1776194176915; Tue, 14 Apr 2026
 12:16:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260413-kasan-v1-0-1a5831230821@bootlin.com> <20260413-kasan-v1-1-1a5831230821@bootlin.com>
 <CA+fCnZfubV6LgRjO3NQvhrG2Q5o0ftkFFupLWVYS50XDnmCaog@mail.gmail.com>
 <DHSWK17EZUDP.GIJ6BX2NFR6U@bootlin.com> <CAADnVQLJ=fJ7t1i2+_RYqU1gqYqiLP9Zrwo4vdZsgzjK_yzJTQ@mail.gmail.com>
 <DHT3JV7GTOBL.29205LGGNEDSH@bootlin.com>
In-Reply-To: <DHT3JV7GTOBL.29205LGGNEDSH@bootlin.com>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Tue, 14 Apr 2026 12:16:05 -0700
X-Gm-Features: AQROBzCIKxzyzm1_jzBBwpYG5l-_Hq5ftS9HvYZuKsAkHlvW0CNWB1k5nfXPFjQ
Message-ID: <CAADnVQ+c9h_wuNwj8pjx885oNErGY7bxxCwKi+DiJ0XKSpyYfg@mail.gmail.com>
Subject: Re: [PATCH RFC bpf-next 1/8] kasan: expose generic kasan helpers
To: =?UTF-8?Q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>
Cc: Andrey Konovalov <andreyknvl@gmail.com>, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, 
	Martin KaFai Lau <martin.lau@linux.dev>, Eduard Zingerman <eddyz87@gmail.com>, 
	Kumar Kartikeya Dwivedi <memxor@gmail.com>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
	John Fastabend <john.fastabend@gmail.com>, "David S. Miller" <davem@davemloft.net>, 
	David Ahern <dsahern@kernel.org>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, X86 ML <x86@kernel.org>, 
	"H. Peter Anvin" <hpa@zytor.com>, Shuah Khan <shuah@kernel.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Andrey Ryabinin <ryabinin.a.a@gmail.com>, Alexander Potapenko <glider@google.com>, 
	Dmitry Vyukov <dvyukov@google.com>, Vincenzo Frascino <vincenzo.frascino@arm.com>, 
	Andrew Morton <akpm@linux-foundation.org>, ebpf@linuxfoundation.org, 
	Bastien Curutchet <bastien.curutchet@bootlin.com>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Xu Kuohai <xukuohai@huawei.com>, 
	bpf <bpf@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, 
	Network Development <netdev@vger.kernel.org>, 
	"open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, 
	kasan-dev <kasan-dev@googlegroups.com>, linux-mm <linux-mm@kvack.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 14, 2026 at 11:41=E2=80=AFAM Alexis Lothor=C3=A9
<alexis.lothore@bootlin.com> wrote:
>
> On Tue Apr 14, 2026 at 4:36 PM CEST, Alexei Starovoitov wrote:
> > On Tue, Apr 14, 2026 at 6:13=E2=80=AFAM Alexis Lothor=C3=A9
> > <alexis.lothore@bootlin.com> wrote:
> >>
> >> Hi Andrey, thanks for the prompt review !
> >>
> >> On Tue Apr 14, 2026 at 12:19 AM CEST, Andrey Konovalov wrote:
> >> > On Mon, Apr 13, 2026 at 8:29=E2=80=AFPM Alexis Lothor=C3=A9 (eBPF Fo=
undation)
> >> > <alexis.lothore@bootlin.com> wrote:
> >> >>
> >>
> >> [...]
> >>
> >> >> +#ifdef CONFIG_KASAN_GENERIC
> >> >> +void __asan_load1(void *p);
> >> >> +void __asan_store1(void *p);
> >> >> +void __asan_load2(void *p);
> >> >> +void __asan_store2(void *p);
> >> >> +void __asan_load4(void *p);
> >> >> +void __asan_store4(void *p);
> >> >> +void __asan_load8(void *p);
> >> >> +void __asan_store8(void *p);
> >> >> +void __asan_load16(void *p);
> >> >> +void __asan_store16(void *p);
> >> >> +#endif /* CONFIG_KASAN_GENERIC */
> >> >
> >> > This looks ugly, let's not do this unless it's really required.
> >> >
> >> > You can just use kasan_check_read/write() instead - these are public
> >> > wrappers around the same shadow memory checking functions. And they
> >> > also work with the SW_TAGS mode, in case the BPF would want to use
> >> > that mode at some point. (For HW_TAGS, we only have kasan_check_byte=
()
> >> > that checks a single byte, but it can be extended in the future if
> >> > required to be used by BPF.)
> >>
> >> ACK, I'll try to use those kasan_check_read and kasan_check_write rath=
er
> >> than __asan_{load,store}X.
> >
> > No. The performance penalty will be too high.
>
> Since we are mentioning it, I did not consider yet any performance
> comparision/benchmarking (and I am not really familiar with usual bpf
> performance validation practices for new bpf features). Is there any
> existing test I should take a look at for this ? Maybe some specific
> benches in tools/testing/selftests/bpf/bench ?

So far everything in bpf/bench/ measures bpf infra like
maps, kprobes, tracepoints, etc.
We don't have benchmarks for bpf programs.
So we don't know how well JITs are generating code
and how much inlining done by the verifier, JITs actually helps.

Puranjay is working on creating a SPECint like set of benchmarks.

For this kasan work we should make the best decisions from
performance point of view, like not wasting unnecessary call
and not saving unnecessary registers. btw in the other patch
I think you can skip saving of r10 and r11.
But we cannot quantify yet that avoiding extra call gives us N%.

You can micro-benchmark, of course, but gotta be careful
interpreting the results. It might be too easy to get into
thinking that JIT must inline __asan_load() for the sake of performance.
