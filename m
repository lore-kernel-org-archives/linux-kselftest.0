Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com [209.85.221.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7955371D03
	for <linux-kselftest@vger.kernel.org>; Fri,  6 Mar 2026 23:28:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772839732; cv=pass; b=aHa4NbJt9IQuPrGcT5geZJoUD7NTF6hKGAlDz/1/P83zGMzhY8Jt/Rvi6fe+7YZRPP+2fj8uGBIa1Xutwa8Nc0/hSXu/u5akN/TZVuTIR0Ehlfpz1IUHwC08CDD1/zhY9IuNzvkf8b30CyxVW+ZQ2oPzpEpoCs+swh3BhuujH4E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772839732; c=relaxed/simple;
	bh=J8YV8Zbb7IJ8yfnYcO3AmdJBhTfVD8gCnS0YbtrTmmA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=leXVSUiVVuJD3UwnUdbvvvDdcnqsKnW2lLz+Q11zY4PS/kfqetiOTl/R/kZZWvt91YMzR5+xW2q1k5O7TZcz/2mE06qj2Dnyf2843DfcLgSFRA8q8pVpfuV/3maQq1L8WJyIpMnIRl6wrng1rNqnE35ICJyjsQ2DdzyyAJjK4Ac=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DThY/pQi; arc=pass smtp.client-ip=209.85.221.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DThY/pQi"
Received: by mail-wr1-f65.google.com with SMTP id ffacd0b85a97d-439b6d9c981so4328617f8f.1
        for <linux-kselftest@vger.kernel.org>; Fri, 06 Mar 2026 15:28:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772839728; cv=none;
        d=google.com; s=arc-20240605;
        b=N+Jeksd4VDKDFqe3b1liXk4aCvlgeaXTxfFkiHjfu3tbRAPQKtx2nyPwd0wGRoyvS2
         PnBk6wHxXolDbOrmuJ2GtFTn2bttQWcpJp+LYYPYy7Hk3Es2LRf4JuD/Ef5KszKMNLZ4
         MQRkVIkfjDo/wf2rs3kArAxOx24Jsdn3JbddiRIkObF4yVbC0UCPhTcGAwKCJwcvCvTU
         2IrigL9LWCS9LGO0QRBIM/NIAGL65mnhLkDO/PwkcmtB7SthtncYPFPTZgIpSqQBBnBm
         0pxykysWGR8Wq9aVUvIJWwoBgsLqvULQVcI2sZHBKyr9TcA7CXXzg9mMfx0/8TfO3SxU
         E4Ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=NeYiPJgeyzwWd76b4ev6h2531NRyjC6o2fQHmG/hpOY=;
        fh=bNFEpGKFktX9dORfIrdhmWrY0X0L8v8bemGauzVjpik=;
        b=LExtOAxl9v11/nCAdIOPuEwANmVcmjxjv9wuBxb7G6HXm4c8HW6EtbdVIea6JWMDNf
         X5KGv0T5pap9JKPsnxox6yFxhd6BShTl9IaQdJBcv/teopkTF501CSdlyi7oJwYLrCXs
         baFKqUxriABPdbdiIC1yhjlG4p04ZJXq2kdkeizHMAKPf+sjZdm0K5a2KTwURNWE+99/
         HaTWDkk6Y5/NRswG9DCq8IjLL75udaQA1JKwdurfQNno0X0Ftb5RRzgJA7b4HxDVhxhA
         NjNte3/x0rv9wzYbWXZRphYx2eZ8d1th71DvyRSFdtf9kxy+7A7aXfKKtRrlTCFaeTMs
         J5YQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772839728; x=1773444528; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NeYiPJgeyzwWd76b4ev6h2531NRyjC6o2fQHmG/hpOY=;
        b=DThY/pQi/mCTjd/PwyKQLyFXGI9PfKC5fY8u/GsU0yTrDJCHfYWf2WGJ9LFuEmLcC9
         Ow70YsUU4hCKepHxT2tGykklAojJdLyZaQYb24BYTJvR7Z+u2d1Biwp2+VKDl49c3vfj
         6B4yQZOwHLi2xMIj+m/3QsIHQBNGbOn8yuj4CBhLsYX+Xg56GAvJRkX29Ke+oVb0dP3I
         CzU/A6HlJTVsPSr7iJe+C4TWM4/Gj3NQrl21fWpUkMEyrpGpa2GTqBl1vD1tR9/zyL6f
         0j5ruVaxiKxrvGEqZyfaKaKaRf05bGb249mwfSls4Zp+dB1MLWaVArzMyNx3BK7g0BTe
         Wi0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772839728; x=1773444528;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=NeYiPJgeyzwWd76b4ev6h2531NRyjC6o2fQHmG/hpOY=;
        b=WOzbMwWlNBRaIRncD4bQVGyjjEIPkT6ZcyPgikCYHM3qSbKRDOZonTnJTALlZpNgM8
         t89VVQr/RzDvkOQz6ZNttNp0mVsWnFQD6XyvR5Pa0wgTh7RH60t9svqpMLZRM+KGy1W6
         QJBnqpyjOPs9ymGyPcy5HOlqm0SP9LIPZAOOfpj7k8fjYnIWOdYDCjTWRoBwJWAZoVZZ
         SjLQLHqL3kRtsZq9QORxJO7Ze6/Wg6p9FcenUs7lxWaTg4nTyT9nBuCzSSE6q0rAiLae
         ozb1cuLCcE5OGskz1kunG3YwVUOPr3Ee9VWCIrx91ogRwR/Nruj6XU+EGV23aKnGpF/k
         H7SA==
X-Forwarded-Encrypted: i=1; AJvYcCW18rc4EvdXgaxlhzxg6Ir8jufXA410Cn8oidoDlHOaqSMRUeYOww72gdq/pLC4dNsYlkiH/aYfWMt7u9NFkB4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxRPD3riUAYsZJeCx3wFkrTUWiCPb2blKKu0ToO2h881CedvAbG
	F9JnhghZZv3xQ9hULPFMYU6o/AjBIbylQYIEuvzNWRBfOHQ0dX5vt6m8adqvZVUGCgce+8ZYl8U
	KgNPqm8F1kNwHfMZuR7Qh8kC8HpwGwPQ=
X-Gm-Gg: ATEYQzwcDnY4ZxFHhxCSvNdE87vvwI8STCIkrfMbKbspflv9lBAbBmzKe+A6uyWzgex
	KCGahrdCPE+mSUEKK9nAI0j9rZbILmmhr6NeGW1+UXW93wGfpV5ZZG4wiTky/48iUtBdDPYPXyQ
	dIS/if7NWDoDCDZ8dOx7r/8yCwwbm9W5qxU8K+FFN9mVobJm3fx5Gv6p/VdpicdeHELxHldPLR0
	z7aBSaT0J/9f+R4dmYqNWce/TJAXWgsd+9w2+s2V4d/uwF7JfKGYcN3kTGO/9NjZG6K1nqG4wwm
	fUvNQRZLTsyUTfSuIKPrH3w/95VdNM3TIAqw6SYqYBQeanqKtBaJwzL/gqo=
X-Received: by 2002:a5d:588c:0:b0:439:c24b:ec27 with SMTP id
 ffacd0b85a97d-439da3343acmr7010312f8f.10.1772839728070; Fri, 06 Mar 2026
 15:28:48 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260225210820.177674-1-wusamuel@google.com> <CAG2Kctp1q1QtB1-JT2cgBsYu-WceV1YdSM1sSwNm8pyGtZQ6TA@mail.gmail.com>
In-Reply-To: <CAG2Kctp1q1QtB1-JT2cgBsYu-WceV1YdSM1sSwNm8pyGtZQ6TA@mail.gmail.com>
From: Kumar Kartikeya Dwivedi <memxor@gmail.com>
Date: Sat, 7 Mar 2026 00:28:11 +0100
X-Gm-Features: AaiRm537BfrVvWxy8BqiLfZ8O8P9sumBwCwNjDsbTsWFCXNUag0MUkc5L-gKx30
Message-ID: <CAP01T776Ni9R6CT_phx5wNDUoN13Tztz3DD5ZgKWedNLx7Nb0g@mail.gmail.com>
Subject: Re: [PATCH bpf-next v5 0/2] Add wakeup_source iterators
To: Samuel Wu <wusamuel@google.com>
Cc: Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>, 
	Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, John Fastabend <john.fastabend@gmail.com>, 
	KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@fomichev.me>, Hao Luo <haoluo@google.com>, 
	Jiri Olsa <jolsa@kernel.org>, Shuah Khan <shuah@kernel.org>, kernel-team@android.com, 
	linux-kernel@vger.kernel.org, bpf@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 5 Mar 2026 at 02:31, Samuel Wu <wusamuel@google.com> wrote:
>
> On Wed, Feb 25, 2026 at 1:08=E2=80=AFPM Samuel Wu <wusamuel@google.com> w=
rote:
> >
> > This patch series introduces BPF iterators for wakeup_source, enabling
> > BPF programs to efficiently traverse a device's wakeup sources.
> >
> > Currently, inspecting wakeup sources typically involves reading interfa=
ces
> > like /sys/class/wakeup/* or debugfs. The repeated syscalls to query the
> > sysfs nodes is inefficient, as there can be hundreds of wakeup_sources,=
 and
> > each wakeup source have multiple stats, with one sysfs node per stat.
> > debugfs is unstable and insecure.
> >
> > The iterators utilize pre-existing wakeup_sources_walk_* functions to
> > traverse over the SRCU that backs the list of wakeup_sources.
> >
> > Changes in v5:
> >  - Add CORE definitions for *__local variables to fix s390 build per bp=
f-ci
> >  - v4 link: https://lore.kernel.org/all/20260211235055.239024-1-wusamue=
l@google.com/
> >
> > Changes in v4:
> >  - Proper init of variables in ws_iter_check_sleep_times() test per bpf=
-ci
> >  - Remove PM patch since it's already part of rebase
> >  - v3 link: https://lore.kernel.org/all/20260124012133.2451708-1-wusamu=
el@google.com/
> >
> > Changes in v3:
> >  - Update wakeup_sources_walk_start() to handle an empty list per bpf-c=
i
> >  - Simplify read of a struct's field in BPF program selftest per Andrii
> >  - Drop open coded iterators for wakeup_sources
> >  - Fix condition from !get_ws_iter_stream to get_ws_iter_stream in self=
test
> >  - Read event_count instead of wakeup_count in selftest
> >  - v2 link: https://lore.kernel.org/all/20260108225523.3268383-1-wusamu=
el@google.com/
> >
> > Changes in v2:
> >  - Guard BPF Makefile with CONFIG_PM_SLEEP to fix build errors
> >  - Update copyright from 2025 to 2026
> >  - v1 link: https://lore.kernel.org/all/20251204025003.3162056-1-wusamu=
el@google.com/
> >
> >
> > Samuel Wu (2):
> >   bpf: Add wakeup_source iterator
> >   selftests/bpf: Add tests for wakeup_sources
> >
> >  kernel/bpf/Makefile                           |   3 +
> >  kernel/bpf/wakeup_source_iter.c               | 103 ++++++
> >  tools/testing/selftests/bpf/config            |   1 +
> >  .../bpf/prog_tests/wakeup_source_iter.c       | 300 ++++++++++++++++++
> >  .../selftests/bpf/progs/wakeup_source_iter.c  |  80 +++++
> >  5 files changed, 487 insertions(+)
> >  create mode 100644 kernel/bpf/wakeup_source_iter.c
> >  create mode 100644 tools/testing/selftests/bpf/prog_tests/wakeup_sourc=
e_iter.c
> >  create mode 100644 tools/testing/selftests/bpf/progs/wakeup_source_ite=
r.c
> >
> > --
> > 2.53.0.473.g4a7958ca14-goog
> >
>
> Hi Andrii, any thoughts on this patchset? I've addressed your
> suggestion from v2 of this patchset regarding selftest, but nothing
> fundamental has changed since then.

I think it's still unclear why this cannot be achieved by exploring
what Andrii proposed initially in [0], i.e. by using existing
primitives and adding extra kfuncs where necessary to solve
bottlenecks, and I didn't see any indication where it was explored
sufficiently.

I think all we need is the wakeup source read_lock()/unlock() APIs as
KF_ACQUIRE/KF_RELEASE kfuncs. Just need to ensure we pair each lock
with unlock by passing the index, which can be an opaque value
returned from the kfunc (e.g. dummy empty struct pointer encoding the
index). Then you can use bpf_for() to open-code the list iteration.
The iterator would become unnecessary, and everything can be done from
a syscall program's BPF_PROG_RUN invocation. I didn't
check how we can get the pointer to the wakeup_sources LIST_HEAD, but
you could try several options (__ksym,
bpf_kallsyms_lookup_name+bpf_core_cast and then walk it, or return
pointer from a new kfunc and walk it using bpf_for()+bpf_core_cast()).

Also, how much speed up does this really provide? It is hard to
understand the motivation from the current cover letter. Is the
bottleneck due to opening multiple files in sysfs? You will still have
to read text and parse text from the iterator's output in your current
solution. Wouldn't it be faster if you just used a syscall program,
and used binary output (using a ring buffer) to stream data to user
space?

  [0]: https://lore.kernel.org/all/CAEf4BzZv9kCAmX0Fo4kR8qh9mu5NB-wLDmNAK_R=
=3DVzcxL7VPpQ@mail.gmail.com/

>
> Thanks!
> Sam
>
