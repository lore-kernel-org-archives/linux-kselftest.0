Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B47A3A5453
	for <linux-kselftest@vger.kernel.org>; Fri, 12 Jun 2026 06:56:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781247395; cv=pass; b=MhMACI8ujjoig5RBSOqaocueeMTHwMaJ/r8xSfjkhGfovkiOzrvi08sT3s9LN4v32zu1R6Z7nLjmavUj8zDYZTWTBhkMeFBcAV4AMTmLhuaJxdj+Ir9j2eso3LJxEb8T4NunwBLwpXgNhgs22YGD4HKYb/JeLCHntWxncwsKWcg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781247395; c=relaxed/simple;
	bh=3lBHS9HDKEcHXBILsrP2x1PQFt4q9srNsFjMrwfX9Vs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=X+rjp/pYUHRr3VwJEESOhSMg7A1qq3mm/wLrNCaomJhTv6JqQd6LmQUt+cqdhyKUK8M5xO5hnoM6Q3GhJhv6hKINT8hAkvMa3WOY3iQKU0s0eAjdwp4Qp2HcbUg1EttmuzkibiLh4ZvkxnO9rh1HnKMm60WZM3oPmOZDnZUsShs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=EqDjjaIn; arc=pass smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="EqDjjaIn"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-68ced97b6eeso1032947a12.0
        for <linux-kselftest@vger.kernel.org>; Thu, 11 Jun 2026 23:56:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781247393; cv=none;
        d=google.com; s=arc-20240605;
        b=LKZWRoZAZNkeYF9BEkwxThSwGRx93HI4eclhnMdA6o3dyYwBNAfUky0NoTGevQU0Ji
         j9ijdLGX86u3qF/fk43XplRmRthCb/Z+Vpbr9NjxYkQxXCIh9Usn5yZSHKqDyU/0/Mbs
         9skcj4LvnfAhbScT0lFNl9KW0LioD9qiZeXKvpmr/F3P1tMJOsrsP6Agv2Chcoc7Yu4B
         xjO8rpJWbUzRX5F3HIVtzNVQ29P8/pKCmGirr7/2Rzi69ToqCNGmccRprE2xLulpMjUM
         yjo6gxTCb5/OSFBsJ/2dBF3EKI4Z8cBbc9EO/8D+om69MpBLrMN5kHBu7C0oisyRXuAa
         ftoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=3lBHS9HDKEcHXBILsrP2x1PQFt4q9srNsFjMrwfX9Vs=;
        fh=MkkGF7/4BpxYUXqM9tdmymxIft0zQsAbFkwRL2bLwpk=;
        b=d3/475TRhqCmLjPPVd4/4Wv+XifDgY0vEwSnOedHH8GhUU4G8S0ocbhDMMZXHem262
         Fx4IGqfRZSySyvy6jREoFIUoFBsBMEthEqDgW+23MSBKTIFdFbUuL59WSeoq7YN3XB3Q
         BfBsmHCg8+f4ketWiXZV7uLIYcHQJbPRSa1ldX3vYsYccJkt6zJn+pk0ITsyrme2Aa6X
         ZBXCKmclGoGMH38rh+XhR+MIwLNY4x0bwDeQl6o46Z797Wi3hzMbyvTNcvjFbIEh/Ecs
         SlVO0iF54fh8GlWYdojFmpRtuiejfv8OZC0YIzHp5oZZDzW0tZVnq6wZdSvFsJnDGMLU
         Ik0Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781247393; x=1781852193; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3lBHS9HDKEcHXBILsrP2x1PQFt4q9srNsFjMrwfX9Vs=;
        b=EqDjjaInov0ka4alN+yEFWBFuaxhdbrfTeM99dBjBHVH1TGqPNOwMXvp3aBAtkNwGy
         wuUszsiCnccC+mXgVgklYrmJpM4ITNLR+1Pdq81iYB9iH8fIQ4Bj7siJSio/GUKufXNx
         uXLplkNvuYKJ356p1ai5tl+9d3qggFzGRiMQ0Y85CiE+L3Q12ToW+x1COpZlQo+fpOZE
         Apr3vb1VXwL/9IHBFx3WjOH6ceWGtdi2t3QdLCyf1j21yuQZfrSPzo1HjsEevZyy96Wl
         FDOKchXplfC1MTsnyxN7ZPsFme7ZJTfu3QPEZC/sMXV7SCV1Jl+fh+kNG5QUGdXfpb45
         NfYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781247393; x=1781852193;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3lBHS9HDKEcHXBILsrP2x1PQFt4q9srNsFjMrwfX9Vs=;
        b=N9hfY+rXB5KPYAnIunWub2YN8LImktfsWnCBaIfAsBQsy5ijDScgHTnF/ZF4qJU2CV
         mmc29CNkr4iAvq5p+ZC9JzKzkCcghMwNX7WXAXGVLYILJatYwOv72o/z7PAild23mEtJ
         j0f4k8AyYWJv1gOvtWWWu6EjnIFNePkjXUX03WFOsFImgvr4vu66iwbClexHWoCpyTyn
         ArZMH+TaSjB5/a411ZxYd9cFSF517yKRKyfn+fX3vgmzYKG+s2BVWkmfSYsNerVcYatf
         c8ZGxh2KUWutvZgemvQ3bYUSY7GO+BUzziM1G/ez7zOesGZwJ7rlt1ccoIvm32bHo0G2
         dboA==
X-Forwarded-Encrypted: i=1; AFNElJ9NAjT9e+ljzJAsPd1cQhX1oIhTPM32yr8bKXA83iiV53HVaX7qGwAMwwnBBFzcMnAb6hCeU5DRqNWKK870Cpg=@vger.kernel.org
X-Gm-Message-State: AOJu0YwsRURr8DWBQI7v+E0RDFk8/HUpVHXnpGV2LD2KNFIsrq/9K6lP
	cZS3xKQvq1RXtH5NkVMOJGNQ/AnjF+j2DbmQR3yVvv9GMtDtrpi6ox7d9DaP84yjJPiRQZXAN0E
	MWU5Q7zBqPzMe6UC0jqKm2whCwD3nlMqQqxeqSTSc
X-Gm-Gg: Acq92OFqGFkAGTm4g0FcJg5ZBRKcnykI7WDHcSmKw7Zr5gVkxEHPA1VMShrAFwQ02Oo
	FNj6NzYd+36ETTawI9yhXCYEmCEg57+HT+7bQbdsTWVGGZb81vUrF64iQ2qP8DravZO18HTLZYI
	Ycxp7jxvfkTVyd6DEM8cL09ODO1kYiQrOLGvwfLtB1FODEyOjeMm1Npb/WWTSXSQJYkSsI7gbhh
	5d4LO0ubYF9lIqmXmdo6wqq00b/MYFF4WPM3/kVLITZM4+ak5MwxLXm8aPWdc1VTQLA7jUUqhdy
	LllZ/5eIrhZcMKdxZYp7hTIZROueBElseMLcuA==
X-Received: by 2002:a05:6402:434b:b0:68b:d10a:a48a with SMTP id
 4fb4d7f45d1cf-693784fb02dmr602313a12.11.1781247392123; Thu, 11 Jun 2026
 23:56:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260611-b4-kcov-dataflow-v2-v2-0-0a261da3987c@est.tech> <20260611-b4-kcov-dataflow-v2-v2-2-0a261da3987c@est.tech>
In-Reply-To: <20260611-b4-kcov-dataflow-v2-v2-2-0a261da3987c@est.tech>
From: Alexander Potapenko <glider@google.com>
Date: Fri, 12 Jun 2026 08:55:54 +0200
X-Gm-Features: AVVi8CdLRn3HUIKr4oSFNxeMmeQ95IhSWpzIU1V25ylhb68DqGsVy-9EpMVuQUY
Message-ID: <CAG_fn=V1+_xLgCZgdLnT7Y-muRO0CXkrNKkC8AzrqzWoL4eR8w@mail.gmail.com>
Subject: Re: [RFC PATCH v2 02/14] kcov: fix INIT_TRACK race in kcov_dataflow
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
> Two threads calling KCOV_DF_INIT_TRACK concurrently could both observe
> df->area =3D=3D NULL, drop the lock to allocate, and then both assign the=
ir
> allocation to df->area, leaking one buffer.
>
> Fix by rechecking df->area after re-acquiring the lock. If another
> thread won the race, free the allocation and return -EBUSY. This
> matches the pattern used by KCOV_INIT_TRACE in kernel/kcov.c.
>
> Reported-by: sashiko-bot <sashiko-bot@kernel.org>
> Closes: https://sashiko.dev/#/patchset/20260603-kcov-dataflow-next-202606=
03-v2-0-fee0939de2c4%40est.tech
> Signed-off-by: Yunseong Kim <yunseong.kim@est.tech>

Can we please avoid this?
kcov_dataflow.c is being introduced in the same series, there is no
need to send a buggy commit and a follow-up fix - just squash the two
together and note the changes after Signed-off-by: separated by a
triple dash.
