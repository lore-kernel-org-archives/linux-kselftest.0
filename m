Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E07E33E37C
	for <linux-kselftest@vger.kernel.org>; Wed, 11 Mar 2026 00:23:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773188601; cv=pass; b=oPnRkZA4munfLJx9vUV4ffWAZiG+auoL2O61yDmxYxocUb1vQLHVITim8BnmJ5uMAK5Y90RCf3SCKA55lh9K4Yq0kDxnq5OCPRiGIHRX4mg+DgZYrW81G8BI+5VnBCy+QQlME9RyO8Mm2WQIgifrmQu0cqoCH22bY1ICyPWlnZw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773188601; c=relaxed/simple;
	bh=GN4XYFV6O6lscwjZhhZz9otu+B/MUQEkvI2DaNBXw+Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hna2xUYef8iDlU9qZ5Bjm7F3gQ6BqM1rOIj7Y2yk8YmxruSw0MnP39ppbXdfS1W06smXTpOYEuIP+wTgUlUR6KuI76ZDIf6JCQ6vARjmruMdZ3hwMwKKjHORC2eYQ2ndlBvkVo2bg4+vvAreOBzJKuAUHUXIPgFMGZ68Z5S/mpg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=lhetZIjJ; arc=pass smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="lhetZIjJ"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-6631e0edde8so134045a12.1
        for <linux-kselftest@vger.kernel.org>; Tue, 10 Mar 2026 17:23:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773188597; cv=none;
        d=google.com; s=arc-20240605;
        b=TT9uL3f+1S8rywmg+dr53kAKEXpL9UeQs0VnPr6i0OmlawaOZI9lNWerhzy9P6xQ53
         MrhDHCRYLhOit2gINWmD0rHe/JVY2B3qJDuna1rx3mi+harVNq3UZ4FXfC0qOJIcZQVe
         lrY5FVyRsxzszgK1YS+9xZzD0xHopFUNR2WsdIwPUc0N+BBRykAl2VObu4UyK5R7GX/K
         cK1lVSjtbIgSbJIq9BFyXzvyES5iKgTf01G6m1+z4Orz4WE7gCqNXcmrP5tiNasOswO6
         5REsdcvxdas2i6LSHns1f3Wz0vVclbQGit2bn68FVfwwn9eKP6Q15IzpuqG8XrLNNeqJ
         PkiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vVDJ+se5YBkxb5fHkzfjuBw3OsieoxQLUwxzQDU7i7s=;
        fh=qAauEOghMYl4MDigKBjCs48Vqp3+wdtoVy/ZdiOeqCA=;
        b=gnR5zYm/mYpjKePN04/K417TdcwoL84FVWOCO1Jll745/vs8CSiErDt00z3xwKYAq6
         jKysktb2JdVGgql3jE3epuj1hssVjH7i6V6KF7dQJ2JvDovFkcuNIWu+zmyCqyxRMZY8
         6jPZil5HAmM4Sunu0t2jlEKFTv4YUijajSD7PdRJX/eBOtpO2hnQ5+PdpW0zES9Ku5+y
         OmaLH7PjtKx2CmamNbr0nUrTZmrZLAgPvm6pFqQ20735f0Qx0S182dsViYMo4bFPa5FN
         wYkLiWPzUVqzVgtfF0UdSRX7w8Rl5gsmnl8EVspRYJtwvLdreCgFmZPBKucxnJf9qH+z
         PPrg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1773188597; x=1773793397; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vVDJ+se5YBkxb5fHkzfjuBw3OsieoxQLUwxzQDU7i7s=;
        b=lhetZIjJRowis17bgzbBbdjYBmwRwMQtTw6qNv8dGutB2/uK4fGHE4uRHGU36P4zFy
         AGGavrLzahLs9vp3Kj6Blw5AP5UUUnp0svqsQePC/WpVZ49sRRf5rMWY+8hPPJ+aqa2M
         x9TcENZ4DKoGZkDuXhJVoFM1tIo2t+QxJpCeiN7NY2vY7ZMNREChcs1x/0bLLGQ+9m51
         E66Be0z5hJBbE3KmVov5D1hS0S7/KQvbj9ypiHZ/DkM7PENaJeENhnHPTEfo0YTwpZtM
         3jr78wCTd2bBDdN0TI9tX7StaQhQaZeJytqmPx3AmEhWm8zLeNDhOygIisZAZIElx/Sz
         iQ2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773188597; x=1773793397;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vVDJ+se5YBkxb5fHkzfjuBw3OsieoxQLUwxzQDU7i7s=;
        b=oiURa02W0PGKwRdoISW9oNEmDjOodvFPIqZ8UWcfu+jmnv4r75lj6M5SLf9pK144BM
         H3DzVUMfaeTzeTuSRPObU/nTUdJaYNXmTqSBImvFZtnjJ2KMEtGBXDOA8mWHPLZ+3huj
         0q5WjRZtu/Y6mcUesIbGMbgBZ6pjYBucRL05wYRZG7o9RXcL1UuWNLSlb4dMe1qmRvFR
         bLLN9KsxFCRkVQI8RKexeaMgPCeAVh6QN4F111OSRZEC0wkaJjkugXz/1cqPIYQkOSXW
         Oy0BIujkiT+jjrHtwGZ4h8+OkL3b5cMW6LBuoH/OiN9M7MAvWq0HniOsEwDJcNVKYeWL
         Gk9g==
X-Forwarded-Encrypted: i=1; AJvYcCU1ZJGe0W8/WhVHYo4/NalkbslWjlOgrIbsWzbSlUncMFzKOzRZj2IF3iAIlS3custyZJl1C0bLp/cyCva50pI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7aCQDa4km1iU8FWn6a230PjYOr0/WHGb2SOYqDG7IqJESMgS6
	yjQZlCPYtNZZYIk1g+0AIgYLvmi8zfnxgMSkn18UwVERZr51jTB32m8UaXYHMQz1RBV+JhCeO/E
	Nl+t8sfLCjLFq/z3h1Tx5nI9SdSPBGcq6arRseP5B
X-Gm-Gg: ATEYQzyKF7nELNKOT+VgJ2T4t+5sAK25AkmkPiLdbQvxYjccDKju4wburf8Qih3ZnK0
	tOi8HUyrhWWSLEvISMI9MGGhxhswuZeH/x0wpXiIfuzed63liGdAXiCj0Xt+wISslHzfBjqfvAz
	1cWlgDOXL9R3ILlYL7vuGLa0Sxuh+SgLphlspG6isdkey4PjLyGN73rCPG2rH1wtew6WbuSAE0H
	ae4hkgVmD6oyiJxC7l4Yk8rs+O+6JcBO/+f2+bnWUu05I/RuNc3DQ33y97lSuEp2kygd5iXu5aI
	r5telEPnujRfIxvQOMnuAMaslYSjzQ1rug9cpA==
X-Received: by 2002:a17:907:7295:b0:b96:d877:3c9c with SMTP id
 a640c23a62f3a-b972e4e680emr27653066b.38.1773188596162; Tue, 10 Mar 2026
 17:23:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260225210820.177674-1-wusamuel@google.com> <CAG2Kctp1q1QtB1-JT2cgBsYu-WceV1YdSM1sSwNm8pyGtZQ6TA@mail.gmail.com>
 <CAP01T776Ni9R6CT_phx5wNDUoN13Tztz3DD5ZgKWedNLx7Nb0g@mail.gmail.com> <CAP01T77EZDLhjwtZBSt+DXLG-ftHfows-p_6FgXZQDQGowcDtw@mail.gmail.com>
In-Reply-To: <CAP01T77EZDLhjwtZBSt+DXLG-ftHfows-p_6FgXZQDQGowcDtw@mail.gmail.com>
From: Samuel Wu <wusamuel@google.com>
Date: Tue, 10 Mar 2026 17:23:03 -0700
X-Gm-Features: AaiRm53E7fKLBly6PX-MDmAqz6l99IhWtBoRqWALZg9xPcF8szHPs2Ucp1c4PSY
Message-ID: <CAG2KctrkGjk3SMQ=8-rrYnKCTUseSmBV+kg+=OyT9M2mBT1bwg@mail.gmail.com>
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

On Sat, Mar 7, 2026 at 12:17=E2=80=AFPM Kumar Kartikeya Dwivedi
<memxor@gmail.com> wrote:
>
> On Sat, 7 Mar 2026 at 00:28, Kumar Kartikeya Dwivedi <memxor@gmail.com> w=
rote:

[...]

> > I think it's still unclear why this cannot be achieved by exploring
> > what Andrii proposed initially in [0], i.e. by using existing
> > primitives and adding extra kfuncs where necessary to solve
> > bottlenecks, and I didn't see any indication where it was explored
> > sufficiently.
> >
This is my bad, I misinterpreted/misunderstood Andrii's original
proposal to apply only to open-coded BPF iterators, hence the follow
up patches with them removed. However, I don't disagree this can be
achieved via open-coding. Both proposals are viable to traverse wakeup
sources via BPF, however I see two distinct advantages of the BPF
iterator:

1. Iterators provide a stable kernel interface that decouples the BPF
code from the kernel's internal data structures and refactors
2. If wakeup sources are accessible via BPF, the next step should be
to deprecate the existing interfaces for wakeup sources, such as the
sysfs and debugfs stats. In that case, a text-based BPF iterator
output will provide less friction during the transition.

> > I think all we need is the wakeup source read_lock()/unlock() APIs as
> > KF_ACQUIRE/KF_RELEASE kfuncs. Just need to ensure we pair each lock
> > with unlock by passing the index, which can be an opaque value
> > returned from the kfunc (e.g. dummy empty struct pointer encoding the
> > index). Then you can use bpf_for() to open-code the list iteration.
>
> I had a longer discussion with Paul on this. When having multiple open
> SRCU sections, mixing nested calls doesn't flatten the protection
> scopes and leads to all kinds of issues, an example of which is in
> [0]. That said, in this case, the verifier isn't tracking what the
> underlying SRCU section protects or isn't even aware of it, all it
> needs to ensure is that section is closed eventually, out-of-order
> unlocks are ok, it would just exist to allow looking at the list in a
> stable fashion using safe bpf_core_cast() accesses.
>
> So, I just wanted to clarify why I think this should be perfectly ok.
>
>   [0]: https://www.kernel.org/pub/linux/kernel/people/paulmck/Answers/RCU=
/SRCUhoha.html
>
> (if you are like me, please follow the link at the bottom of [0]
> before feeling good about understanding the example).

Appreciate the thoughtful feedback from you and Paul. The example was
nuanced but well-explained by the post, however, a key difference I
see is that the BPF iterator solution creates continuous locking
segments during traversal, as opposed to hand-over-hand locking in the
example provided. I could be missing something fundamental here- do
you mind elaborating?

>
> > The iterator would become unnecessary, and everything can be done from
> > a syscall program's BPF_PROG_RUN invocation. I didn't
> > check how we can get the pointer to the wakeup_sources LIST_HEAD, but
> > you could try several options (__ksym,
> > bpf_kallsyms_lookup_name+bpf_core_cast and then walk it, or return
> > pointer from a new kfunc and walk it using bpf_for()+bpf_core_cast()).
> >

Getting the static variable is key to the open-coded approach, but a
clean way forward isn't obvious to me. Passing around raw addresses
seems brittle and can raise security concerns. The wrapper kfunc to
get the static address might be the best option, but it feels like it
violates the power subsystem's encapsulation. The iterator approach
abstracts all of this cleanly.

> > Also, how much speed up does this really provide? It is hard to
> > understand the motivation from the current cover letter. Is the
> > bottleneck due to opening multiple files in sysfs? You will still have
> > to read text and parse text from the iterator's output in your current
> > solution. Wouldn't it be faster if you just used a syscall program,
> > and used binary output (using a ring buffer) to stream data to user
> > space?

With the BPF iterator approach on a Pixel 6 in a quiescent state, I'm
seeing a 10x speedup when traversing wakeup sources; the speedup would
likely be even greater on a loaded system.

As alluded to earlier, the next step is to remove the
/sys/class/wakeup node and debugfs nodes. My apologies for not
explicitly listing this in the cover letter, but ultimately this would
save memory by removing those nodes, eliminate work by not creating
the nodes, and improve performance with a faster traversal, all while
transparently replacing legacy interfaces.

Thanks!
Sam

[...]
