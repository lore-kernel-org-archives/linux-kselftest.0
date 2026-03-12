Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 493053F1654
	for <linux-kselftest@vger.kernel.org>; Thu, 12 Mar 2026 17:13:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773335633; cv=pass; b=dOCjVvIBhVAQtyEn9yogReWaoIVCmS+ZEysZGuNIRU6OPmf6OajJ2eH95AspOblDJ7WYDQlIK88S+BT4IdpVUYGYrj/KCmr/sWAvgQvKWmlYvDrx1W48lJ5XJSPzogDP1zkcCxwS8IN8yvTOkjBCktX7y0/gG5RXIr4ZfZ1y1+k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773335633; c=relaxed/simple;
	bh=Qarh+60tr9Vhypw9EaR6FndlagE17HBNIP90zwt0hAc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=agMcKJT1yMNXycI1rY5Kb5b02Bq1gODqNL84fNkXugFxzrXYWsohMpsHpRGV4yghgB1GDPy/hXkbSG0VTqe8bKfjH43KicwzzCf23IaCJRadeLEuR8GU6GyFQ95oWU5t9EXe+K437kE3lRW94Cvo6Fpx8XMfkWV6uwSW0p3CcnM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=g1pOUXo1; arc=pass smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="g1pOUXo1"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-b942a41c5fcso164350266b.0
        for <linux-kselftest@vger.kernel.org>; Thu, 12 Mar 2026 10:13:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773335628; cv=none;
        d=google.com; s=arc-20240605;
        b=XH9l7LVPZ//P0F7M4oZ6hFwQJx8QJERrnoZmLs26HVAiNXXv3NwfJkrIAJ1kbp7eis
         1JvMXJ9IQABDCNudpfZ8XnlA00yslLpIQrUJWeJ5gtHgJNeXsrM7DiN05Ly0M759MRwj
         EwLoUcrx0pRGWW2PZI52DWQtnyh77VTVa/O8+B6pDUfDoW8ZuzoXWQqJiSEvvBS3iy1M
         ezhikWkKNGty6y9ebPnI8Pq/DPytnraBPd/FCBUslUUUliQ/lx7VG1y2ZRkaBfSJ9rsn
         uG66SZZQhrJ1D22vaGdymmZf5AxCn654vg3lvXQq20luBpV0uhgVGbk4rxnuCFHVBXlJ
         RIzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Q3Us2s0ytc91Z8HkFiJJSVXFlWx4veaTgJEHu++sdXI=;
        fh=nEGpxJIDUCG016So/T+b5QdfCVdf687tcHxc4XxZWuw=;
        b=JiyZAJgAOzNf9MFBni3coD1NHgMf3sic9pUYmUX6YklWTiYT/vCtrnYrCdnlT6cJGX
         BBncX39YxGYrLQA76v2P1MCnfl5Z7M/IkP4mbs86ONPdJ4a9F426j5XXvxiwekUrK+id
         xcmEANuon5BB6ThSO08XlugfBrUICDpBDl52lOgLWu0+DdD/4wUVbLBXwP62azAQALGn
         uF1yDKM9v5K4WrMBpzz4D56vOOLvhkD3YDzxpQdsZXlfMoyzxCJX8ntHKbG7mIYuogT8
         L3/lNCwjqe259orkPQG/ZnarYDheEe+EGWxfZ550yBLL3+g0mNAW33x3MrdzktDhBldu
         y86w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1773335628; x=1773940428; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q3Us2s0ytc91Z8HkFiJJSVXFlWx4veaTgJEHu++sdXI=;
        b=g1pOUXo1yEw3tcztV5PQwIUH9r6cnDWFyoK/aC8JfPNMQy3+UOqEl1Aus7NL5Dt5mL
         gpiUzDbuF33wDg014yhrGIOElGAkJ6iTsF++R+18WlzjCDgBFZ91G69mB1jkwzr6thZe
         7PrTTXIOZRk2HFyl3yKZdudMp6g0jyhYdoS/bzYbK3ez/KtIAcZCPQ1GitNQr4iHrRKy
         +VOAHExXDllB7c4yihXidC70frGFR0drYirJuaJDlzoPvz1ig8tTVBbhGaX4StI+Toi8
         ct/4KkGWylV6tK4R+Ot/oGZpAsA0Or+LyHlw1MJpuwySMFr9hql8o8idZ6l7QtX68bOt
         BruQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773335628; x=1773940428;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Q3Us2s0ytc91Z8HkFiJJSVXFlWx4veaTgJEHu++sdXI=;
        b=VNBuTSStpvO6w2h+icmSq6HvPP8jcnmM8AN+5Q+jgvuRDQ/yvpdYYWAqlqnKGuLTCx
         JCvWy81XjQgZj/G0gLO3g367wBkCmaTr4f+CD7A9sJmFWN+JBkqRlAGIzYs6FYv1nl9L
         qOwY24IvgX3XlU1WPgrOMWne9yL28ziw/S5G/WB0fc8BF0aioc+MH6HeNMSpteSFmX17
         8py9gf58aB+Wy6qSq1yqeq6YfUlLWaq5rXHr0/+nuaf9zRk5dtpcYWr/3HJfPWoh2cCg
         oL4voDZM3Up6z5NXH72VAZa2zxTWaCnL+xDEbZ8gvUFlYPXA0M8r8bHinEeMeK3/ql5+
         8pNQ==
X-Forwarded-Encrypted: i=1; AJvYcCVaQZmCgzgS2dwwt6yoxPvkzHWfj5tezUw98nwz6lPtqSBC4tbcw1VWK/SYCWmt1VAeUTqLvNtrP6hlDLoIWKE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxUvkawwgTQTetqXP7QVcKVM+Z3MBrgxZ7MkZq5JUvphw99Kq5v
	5H9l6BbLcy8hhbNIaxnSIxp/E/YugnSaanqDvbRsj6l9JvmmJsWWtfD4hcJ33tiUhx+uNhkDrMP
	QVF5m3whMbiTILVWLM1rZBv4cZLMX/BPio9yTu6kR
X-Gm-Gg: ATEYQzwur4ycbX1WlfBCHqqI7so5O5S+SaOyU7EG7CMe9Q4gU85UoAam6yeBJCQ8lrl
	eh6V98ovyJLsiQiGooRCkTOxin2e12bP696Msc3SjX88iK7+fnvhoIMhhIes9OLMyvU+TqlVuse
	L74yBCA5uozsMzlQQEzn7WQcI056MUW25t5P2BPgE/OXiS04ZmkPFAJaiW2BVmpj1vu+5csYVgF
	19EZXNJZZUFgnNu0PzsmUAkYDU/h/B2MNPuY6voQyBYovrLSAoVQjq0FsyH/U+Q4MJdOAk9QWrv
	0etqUhVgrsJ2xDIF9LS7MZYAyLSq1zybcRkT+Q==
X-Received: by 2002:a17:906:68d:b0:b96:ff4f:11ec with SMTP id
 a640c23a62f3a-b9765376406mr10240466b.44.1773335627950; Thu, 12 Mar 2026
 10:13:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260225210820.177674-1-wusamuel@google.com> <CAG2Kctp1q1QtB1-JT2cgBsYu-WceV1YdSM1sSwNm8pyGtZQ6TA@mail.gmail.com>
 <CAP01T776Ni9R6CT_phx5wNDUoN13Tztz3DD5ZgKWedNLx7Nb0g@mail.gmail.com>
 <CAP01T77EZDLhjwtZBSt+DXLG-ftHfows-p_6FgXZQDQGowcDtw@mail.gmail.com>
 <CAG2KctrkGjk3SMQ=8-rrYnKCTUseSmBV+kg+=OyT9M2mBT1bwg@mail.gmail.com> <CAP01T77YFR9227YpTZin-i7w-hNLWMM9ANuzmiAzLwzPGJ=gEw@mail.gmail.com>
In-Reply-To: <CAP01T77YFR9227YpTZin-i7w-hNLWMM9ANuzmiAzLwzPGJ=gEw@mail.gmail.com>
From: Samuel Wu <wusamuel@google.com>
Date: Thu, 12 Mar 2026 10:13:36 -0700
X-Gm-Features: AaiRm51B_dIIfyACyk-OAOec3hanGlP08SBv_HehG83WVK_MCf0gXzElUeZ7ZiY
Message-ID: <CAG2KctqiMYUChu7stigNj1UKmWgPyWAt6T1G9imu1QqnQ3NyGQ@mail.gmail.com>
Subject: Re: [PATCH bpf-next v5 0/2] Add wakeup_source iterators
To: Kumar Kartikeya Dwivedi <memxor@gmail.com>
Cc: "Paul E . McKenney" <paulmck@kernel.org>, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, 
	Martin KaFai Lau <martin.lau@linux.dev>, Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, John Fastabend <john.fastabend@gmail.com>, 
	KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@fomichev.me>, Hao Luo <haoluo@google.com>, 
	Jiri Olsa <jolsa@kernel.org>, Shuah Khan <shuah@kernel.org>, kernel-team@android.com, 
	linux-kernel@vger.kernel.org, bpf@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 11, 2026 at 2:06=E2=80=AFAM Kumar Kartikeya Dwivedi
<memxor@gmail.com> wrote:
>
> On Wed, 11 Mar 2026 at 01:23, Samuel Wu <wusamuel@google.com> wrote:
> >
> > On Sat, Mar 7, 2026 at 12:17=E2=80=AFPM Kumar Kartikeya Dwivedi
> > <memxor@gmail.com> wrote:
> > >
> > > On Sat, 7 Mar 2026 at 00:28, Kumar Kartikeya Dwivedi <memxor@gmail.co=
m> wrote:
> >
> > [...]
> >
> > > > I think it's still unclear why this cannot be achieved by exploring
> > > > what Andrii proposed initially in [0], i.e. by using existing
> > > > primitives and adding extra kfuncs where necessary to solve
> > > > bottlenecks, and I didn't see any indication where it was explored
> > > > sufficiently.
> > > >
> > This is my bad, I misinterpreted/misunderstood Andrii's original
> > proposal to apply only to open-coded BPF iterators, hence the follow
> > up patches with them removed. However, I don't disagree this can be
> > achieved via open-coding. Both proposals are viable to traverse wakeup
> > sources via BPF, however I see two distinct advantages of the BPF
> > iterator:
> >
> > 1. Iterators provide a stable kernel interface that decouples the BPF
> > code from the kernel's internal data structures and refactors
>
> I think this is my concern; committing to a stable interface that
> we'll have to maintain forever.
> It's a narrow use case that can be better served by dedicated kfuncs
> and rolling your own solution.
> There will be no end to the number of iterators if we keep making one
> for every linked list in the kernel.
>
> It would be different if the synchronization scheme for the
> wakeup_sources list was really complicated and hard to express inline
> in the verifier, but that is not the case.
>

I completely agree it's a viable approach, it seems to come down to
where/who carries the maintenance burden. Regardless, let me explore
how to prototype this cleanly to handle the details like the static
address, and then we will have something concrete for comparisons. I
appreciate the alternative suggestion and the feedback here.

> > 2. If wakeup sources are accessible via BPF, the next step should be
> > to deprecate the existing interfaces for wakeup sources, such as the
> > sysfs and debugfs stats. In that case, a text-based BPF iterator
> > output will provide less friction during the transition.
> >
>
> I would agree if this was a one-to-one conversion, where you just
> replace the directory for look up.
> But you'll be reading from one file vs several, so it's already a
> non-trivial change in the consumer.
> At that point, the conversion burden doesn't have the same weight in
> deciding whether to stick with textual representation.

My understanding is that most (all?) current consumers ultimately want
the aggregate list of wakeup source stats, not a single node in
isolation; the reason there are multiple nodes is to adhere to the
precedent that sysfs nodes contain a singular stat. A single
text-based output node with the aggregated stats would be a
straightforward change that simplifies userspace code consuming these
stats.

> > > > I think all we need is the wakeup source read_lock()/unlock() APIs =
as
> > > > KF_ACQUIRE/KF_RELEASE kfuncs. Just need to ensure we pair each lock
> > > > with unlock by passing the index, which can be an opaque value
> > > > returned from the kfunc (e.g. dummy empty struct pointer encoding t=
he
> > > > index). Then you can use bpf_for() to open-code the list iteration.
> > >
> > > I had a longer discussion with Paul on this. When having multiple ope=
n
> > > SRCU sections, mixing nested calls doesn't flatten the protection
> > > scopes and leads to all kinds of issues, an example of which is in
> > > [0]. That said, in this case, the verifier isn't tracking what the
> > > underlying SRCU section protects or isn't even aware of it, all it
> > > needs to ensure is that section is closed eventually, out-of-order
> > > unlocks are ok, it would just exist to allow looking at the list in a
> > > stable fashion using safe bpf_core_cast() accesses.
> > >
> > > So, I just wanted to clarify why I think this should be perfectly ok.
> > >
> > >   [0]: https://www.kernel.org/pub/linux/kernel/people/paulmck/Answers=
/RCU/SRCUhoha.html
> > >
> > > (if you are like me, please follow the link at the bottom of [0]
> > > before feeling good about understanding the example).
> >
> > Appreciate the thoughtful feedback from you and Paul. The example was
> > nuanced but well-explained by the post, however, a key difference I
> > see is that the BPF iterator solution creates continuous locking
> > segments during traversal, as opposed to hand-over-hand locking in the
> > example provided. I could be missing something fundamental here- do
> > you mind elaborating?
>
> It was just an illustration to identify what guarantees the verifier
> would need to enforce.
> The most we need to do is just ensure SRCU indices are passed back
> during unlock, in whatever order.
> Critical section will be using bpf_core_cast() anyway to do safe
> walking of the list.
> With the KF_ACQUIRE/KF_RELEASE kfuncs you will still have a continuous
> locking segment.
> Just enclose your list walking loop between lock() and unlock().
>
> >
> > >
> > > > The iterator would become unnecessary, and everything can be done f=
rom
> > > > a syscall program's BPF_PROG_RUN invocation. I didn't
> > > > check how we can get the pointer to the wakeup_sources LIST_HEAD, b=
ut
> > > > you could try several options (__ksym,
> > > > bpf_kallsyms_lookup_name+bpf_core_cast and then walk it, or return
> > > > pointer from a new kfunc and walk it using bpf_for()+bpf_core_cast(=
)).
> > > >
> >
> > Getting the static variable is key to the open-coded approach, but a
> > clean way forward isn't obvious to me. Passing around raw addresses
> > seems brittle and can raise security concerns. The wrapper kfunc to
>
> I don't understand the security concern. All of this happens inside
> the BPF program.
> If you're writing these addresses to user space and leaking them, it's yo=
ur bug.
> You can do that with iterators too. You have all the raw addresses
> available to you.
>
> > get the static address might be the best option, but it feels like it
> > violates the power subsystem's encapsulation. The iterator approach
> > abstracts all of this cleanly.
> >
> > > > Also, how much speed up does this really provide? It is hard to
> > > > understand the motivation from the current cover letter. Is the
> > > > bottleneck due to opening multiple files in sysfs? You will still h=
ave
> > > > to read text and parse text from the iterator's output in your curr=
ent
> > > > solution. Wouldn't it be faster if you just used a syscall program,
> > > > and used binary output (using a ring buffer) to stream data to user
> > > > space?
> >
> > With the BPF iterator approach on a Pixel 6 in a quiescent state, I'm
> > seeing a 10x speedup when traversing wakeup sources; the speedup would
> > likely be even greater on a loaded system.
> >
>
> I'm sure you can replicate it with the approach described above.
> It might even be faster than parsing text from the file.
>
> > As alluded to earlier, the next step is to remove the
> > /sys/class/wakeup node and debugfs nodes. My apologies for not
> > explicitly listing this in the cover letter, but ultimately this would
> > save memory by removing those nodes, eliminate work by not creating
> > the nodes, and improve performance with a faster traversal, all while
> > transparently replacing legacy interfaces.
>
> And you can do that regardless of the type of solution chosen above.
>
> >
> > Thanks!
> > Sam
> >
> > [...]
