Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 419F83D75A0
	for <linux-kselftest@vger.kernel.org>; Fri, 12 Jun 2026 07:33:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781249605; cv=pass; b=qm1tOr+qnNSybX78JF2vb0KjsUq8ox3J+A0M/XTBjblfjpUPlbQ/7iwnQiPdfmgX6dAVIJ+UHXnZ+e0dvmMn2DxPrIAfQ1FonQXvD3+nAZ+ZSswuQ+MkxiuOdQzxIPoJIHRsLQ89qA6QOaperqJf0yYjgSYKmcbSMIL7yLYlHw8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781249605; c=relaxed/simple;
	bh=+CK+tt771npQ32DrjHpsZa5xuUy11BpcBUH4eDrxn4c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NZyG2dRHA4Wepyd5nhO+TASEoJiAeQQqCqI454PVsXl24FCvYerHmpMSzhUeY1w4l4tFZ0WaIulZ1AMxgZJrHEtClCq94fXKQDzRsycdy++fH1mioAffDALEIsumi+JoqU/k2I/uzmRwfzF1KCBFIELuJEy6DE1G5OkKIYCi3UI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=tutk9yub; arc=pass smtp.client-ip=209.85.128.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="tutk9yub"
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-7e8833c99fcso7018297b3.3
        for <linux-kselftest@vger.kernel.org>; Fri, 12 Jun 2026 00:33:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781249603; cv=none;
        d=google.com; s=arc-20240605;
        b=CFKEc1x8CvHlhYs/7T0cu9hlba1H7JGiKh60MZ+eN+hEUB/yp2HWMxAGPEDNwOewOI
         ZZRecrzPUjvmVLMGKT7n0wEuLECQKmfdZTGnNNeGRD7Y6PZZZVgfGBHZd7qyQ4gMTq9B
         hu0vPWiJCShBH64rImWPJ6s1FUWJCALzI5e8Te3eZb9ADyaBHsDn3TolW3t/7A/se3F+
         ZPcpPVPctIYXPXd2IPym2XiXUpGzWEemq8jmfkrEDIZ8EqEMlgP+isYwTQ6RjHKyOJSb
         KxyAc8r9QpiUCxfiNNCyYuK3WHwp4cVngKwq7GDMtL+goCgicSXkX6OztdNXtxPfBIwB
         +mQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=37yHv6yFdGH61lIGAgzgwqwgl+igTLCwlH4B//p5pEE=;
        fh=bskroX55nDgQjdaKuJbW5LlCrIiVqRZoUd/tcw2cIdc=;
        b=dWsTAeuDez9ujrvQGTZdAL9wBK4oGYaTpQYaukhTKwKYsP5zdroXMcgpI9B+og0Wxv
         K+XVZv8Sl2TMX0Tik66L6fJwYcKwiY9FjMQDYGqDptsk806dJYXIXogIapJwFYlsYjXA
         U6jxhdazomMScvym3se6g7Uy2CIHIe1YKzy2AVX8GMj0xLUUoWgkjfYhCzS6h0uNI3Wx
         StBi35KXe3QnAfJYLrJaX5JbJrhIJRwT4+qr7uC9qTtJm2AToeJGBi4+RNJXcMZCza+w
         Y5nXTflrIz3pDPEWkgWIRjksTU4r18vrcV/KdOzr9zXAC01eWCd5kai3j5P4iCmQWJbd
         ZkjA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781249603; x=1781854403; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=37yHv6yFdGH61lIGAgzgwqwgl+igTLCwlH4B//p5pEE=;
        b=tutk9yubKt7rHGQInrqHwM30HuPbjoAYyeaA/DlyS9ulVx7Xam6hQFFnFX0Mntw92w
         FP29nQouQzxm7wsKMLZY9u7LhPVrwxPgreKyPQz+S+b1V9tFNgpbFHN2YWIMM0RIMHcr
         zjt2S4JuWLGXVZYA3yuWEPE/YdiePv9l1bm1gYpu0qFrN2+JVUvGRAWCLC/ID3UaDJzJ
         fJwS58v324aOEln5ZKPwjAIJ1a4KXwF0TgrBZ8fzjZo6bgxDwdDdbqNfcCRbmwpHVJO/
         g2b2lpak3J2s9Dxyk6EQrBvA9Hail/tGrtjlGeqQbgRdwbiFAyEv1Ls+u9aS+jjcRX5E
         O/Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781249603; x=1781854403;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=37yHv6yFdGH61lIGAgzgwqwgl+igTLCwlH4B//p5pEE=;
        b=JXXU5S8mNeh9ZeT53AFlUEDHdJkfia2BCtLRIFcH/WvIyLXTCvxYR8DYJ6tdLt2a9T
         2HqfX3mQewJFUcmlhoVWvEQnamxywkg5r8ROQGytO6r9hlwR0ObCczXzlxSb/aM8mkbr
         kvV5eb7vlplqslNoVCwgBHH3aieDMCi3uNOSvBPEuJwglh8ZjGxDkE4Rho63Ywf4UoJA
         Owa77vL/NxZVPSr1DKO5Dhv8qYfEIj+2CKBxo7W662p9J9jSYLRHirc0Ij7rcothxrvF
         JDQ/0bf61DUyDF5b0DMI/Yxe2/2CpzqIgWblD4EE4d/rndGuCg1ft0Q1XH3e7dpAKETv
         HYUw==
X-Forwarded-Encrypted: i=1; AFNElJ9NCgRhhW2rZUyslkPjKe62SPxRsFKlI1OGDW/kUI3IydBCFxWLJF8U10pwAMFN03Tmevzq4jBa8S/CeVSaono=@vger.kernel.org
X-Gm-Message-State: AOJu0YzhR4NQcqBSjtNK8W/TyG5RpJGexO9WzeWVJA7LrY/SnirR020s
	RRHKfOLQjgq8LxA3dWqR3AjvNWUBKV45o1+GEd8eRMGYwcLyxKWSO8DX66rGcf2fsMomvPiYpQG
	p3mCwa+5CjWXwHpB7aY7gaZ/vtMnm+9pmH5NPd/jR
X-Gm-Gg: Acq92OEeeg75DQyEdamX8P8OTJmi59QDuM/lhTqc8I+VjgiN+AujyfrvqG9o3MkKiC5
	6rMFQvnSX/jZDDeGHxC7tVaLrMx6FoZZ+Ipg4lPZvuPuE9kyFNIv1NTsQQJUfSGuNckkfnofOR1
	LCOBq1c9LI9iUEOIIg6kem3+znRIugz2CajQdGH7en13Xj/bvaJ9wPWqzWLYSrbMcQ321jZsgQ2
	jnE1by0EmGj+C6fhVCELIFZdoixtKIRqxFfUGwOFjZuSU4rDGHwKmMG8yNMyZg3HbTrGxZzs5iJ
	iW/qdfS+YGpNPjalLqqf8Hm9M1Dd+BB/12mCRg==
X-Received: by 2002:a05:690c:c502:b0:7bd:8752:cdbd with SMTP id
 00721157ae682-7f7bdb01a78mr15009497b3.41.1781249602660; Fri, 12 Jun 2026
 00:33:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260611-b4-kcov-dataflow-v2-v2-0-0a261da3987c@est.tech> <20260611-b4-kcov-dataflow-v2-v2-4-0a261da3987c@est.tech>
In-Reply-To: <20260611-b4-kcov-dataflow-v2-v2-4-0a261da3987c@est.tech>
From: Alexander Potapenko <glider@google.com>
Date: Fri, 12 Jun 2026 09:32:43 +0200
X-Gm-Features: AVVi8CfstzQNbiRE_Nzp0e98G9-7hbopDZWc7hVRExeHcpnRY99AeT5FguWPzQ8
Message-ID: <CAG_fn=UJTVm+XVjq-wq1GsfFLvQuET7N1A6ZF_BWtYwmDab_TQ@mail.gmail.com>
Subject: Re: [RFC PATCH v2 04/14] kcov: reject enable on multiple dataflow fds simultaneously
To: Yunseong Kim <yunseong.kim@est.tech>
Cc: Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>, 
	Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>, 
	Dietmar Eggemann <dietmar.eggemann@arm.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>, 
	Valentin Schneider <vschneid@redhat.com>, K Prateek Nayak <kprateek.nayak@amd.com>, 
	Andrey Konovalov <andreyknvl@gmail.com>, Dmitry Vyukov <dvyukov@google.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Kees Cook <kees@kernel.org>, 
	David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
	"Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, Shuah Khan <shuah@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, linux-kernel@vger.kernel.org, 
	kasan-dev@googlegroups.com, rust-for-linux@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, llvm@lists.linux.dev, linux-mm@kvack.org, 
	linux-kselftest@vger.kernel.org, workflows@vger.kernel.org, 
	linux-doc@vger.kernel.org, Yeoreum Yun <yeoreum.yun@arm.com>, 
	sashiko-bot <sashiko-bot@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 11, 2026 at 6:21=E2=80=AFPM Yunseong Kim <yunseong.kim@est.tech=
> wrote:
>
> A task could enable tracing on multiple kcov_dataflow file descriptors,
> corrupting the internal tracking state when one is subsequently closed.
>
> Check current->kcov_df_enabled before allowing KCOV_DF_ENABLE and
> return -EBUSY if already active. This matches kcov's check of
> t->kcov !=3D NULL in the KCOV_ENABLE path.
>
> Reported-by: sashiko-bot <sashiko-bot@kernel.org>
> Closes: https://sashiko.dev/#/patchset/20260603-kcov-dataflow-next-202606=
03-v2-0-fee0939de2c4%40est.tech
> Signed-off-by: Yunseong Kim <yunseong.kim@est.tech>
> ---
>  kernel/kcov_dataflow.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/kernel/kcov_dataflow.c b/kernel/kcov_dataflow.c
> index 5248293280d5..27587b8ceeab 100644
> --- a/kernel/kcov_dataflow.c
> +++ b/kernel/kcov_dataflow.c

Please merge this patch into the one introducing kcov_dataflow.c
