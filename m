Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5489A314A73
	for <linux-kselftest@vger.kernel.org>; Fri, 12 Jun 2026 07:31:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781249465; cv=pass; b=KkTQO/flCnLCV5X+L3/+btOU3EVg9l6FgeCWmgxi5RlrYM6ycZ0GDcJKDxffKC7e01lwYK1/6Y+D5rTpObOeQsBzbpvRHjTUw91Vsb44Q6b5a1rkccviCW/EuI7xJ1rFvADuUPlJijnxyoAzMzTfFnh99BmFmbLjExyYhw08oGc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781249465; c=relaxed/simple;
	bh=TJhwC0TjtETgO7UDDcPQsbkdSGcQTc0ybmTI+jD//dA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rtQt7ShCP8c2bv9Fir7bbHzo5I+sUcUk5pKMVxbZt6a0aMbawjQLlshV8TVJAKsWabU5fAk8sGUhSrIOwm1ZlORw7SrpD6e9Mj29VAlWirSvMwS73h0AlRiYhB7V2a30JUVl/rV+pDdw3gKveCg4DNoP/3MVeWu/sKF9rMWphEY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=L58aOBc1; arc=pass smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="L58aOBc1"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-68d23396ed3so1190961a12.1
        for <linux-kselftest@vger.kernel.org>; Fri, 12 Jun 2026 00:31:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781249462; cv=none;
        d=google.com; s=arc-20240605;
        b=gpD8yBHatCYFWUX9V9Bvk9eXAm56E4y/UBmU+UERUXAVWlSlqOzKauL2gzKq128D9e
         x66uTFHns/ewswa8u+7+NTAFWb9i6YcLYab1bwALkikqmxE6cVvXXKfsVRblvqpUFpO9
         xjfOOLKcGxyFovqM6t7mm3pJkOtW5BfXbM4K990tk0oUgdWMu0Ab9t8v5deJ9wv0PJaj
         JNw5GaTS58RZ9nvo0ciQAalwX8068kPkyxMt1bBvlZxbM89Ug4XU9j5/0v3zYT+GVeOc
         PBZmru85aVhRylvfPBWR+V7i/SlrxXnWBy16USvQbITXol7IzWI8nhh1HQy7JXPXiOem
         5HTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=SbYOYDefhLvBGJQzilDjssSWO2zIKceTdBiGnToKxU0=;
        fh=W7sKix2HZRj3W6MN6rrNV2KFysxH9ScqUnV/Uz5QlOw=;
        b=cMfQkqKyXXBbf0shwkkGFhhb8iR7B/5RvjMT00LeHBX+V9h/gve8iqRasu453QGCl+
         TXlYVI64wnQmbE9/N5zhGHMX2vkWeIvtVOa6EmE/59OWE0fzHozjj9Se6FRgjbcUCSJe
         kJamrvicU4Hx1VEeBSBtrWzgnazIvMxPKoG9WHzuT0vVuFue7m/+MzEA4y30c9DUhnsD
         ell1KkwUCSa+Ap2LTmlR1aDCHZtG+rl4RT3avXNC0UQLEAZNCL1OBQlhInGmKHwPv8Sl
         pBhJ8BnhBVNyLK3bFO5XHhmpA3CVz9TIQT9WYjjpBDXalt7auC5r4sRhxOg3unORQl5k
         Px4g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781249462; x=1781854262; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SbYOYDefhLvBGJQzilDjssSWO2zIKceTdBiGnToKxU0=;
        b=L58aOBc1t+GGEQcW9ZUCClwQvWRVSfh0l0dwUX8RnHUPdAiHfoAgoY/hLcJF5PqmDz
         wD8Dm+3RibTWmuGetriZAkwjyoP2m+Q4jWl7sqx5+R0KFi0niCRZuAdEfb7uJHjaLBIs
         buBnyvjXmSXIzid5o7u60MGJ5+6TJrjvLQfTIaiUjxT7msImLvAEluy5rwmU3flVIOmT
         6gWjbSPp4E9eYP8MuxGF+1HB8FU2Rwrdd5LhA+49UXBs0si3uKubqA6+S+ONUEfSN359
         OEJcXHBCDuoFF8wcGR8XNKobiWWA3Bo0w18RacL+2ijuRLf/mOQ6KqaZNYaAj0u6AMh5
         5/vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781249462; x=1781854262;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=SbYOYDefhLvBGJQzilDjssSWO2zIKceTdBiGnToKxU0=;
        b=G0mmkkgbnfgJq4pl+UPcxhsUdJRYLqSGJkQvCyDK5SnDQfty7EzOvRYEu3JUCm0C6A
         9OY7Dp+ZbpDmO/1X9fwY5RWlxim0U8WPFgtGH9g1itYSC9SwW5cV/NRhbAnyAOgmM99N
         nxfs9kihKcWLhZQs02jjgGNf2ImZq4qM+Bd44K7GYCmPVz5os69JOo4f+IsIa9PmUSFH
         IfCoKGmLHkJa0bCJ59jUfIhyzO37WD2YMQMGLlT3iokviL4tpeMaFO2aLWA/hGu4jCAu
         1KetlvmvWX+jSzqBBUV9+Oclv0SiFikByLbEu1/j+PJmEFjMUle+Efdzw+WIFbTSNSUk
         EZcw==
X-Forwarded-Encrypted: i=1; AFNElJ9AtFzjUM9099xBnR0oR3ji+LJ08wV8Wj9EetuR+3fggFsw2Gsr6rLrjV+9mWOXcxoqtJ45kIjYIzOLRuW5Fro=@vger.kernel.org
X-Gm-Message-State: AOJu0YyaS3sLF7H2oBr3cWvCYONryYXqsMAdFjp4gVR6YZ6hrrDrbfJY
	JNrNOeXRwIlFRL3C6QVvKANSRRbgHf4cG3S6frxTPiqAMCv5wuWCiaHMZqjeiJcUOjZgNzY3/+5
	0tfGVXfIAexrbD74Z2D4ZJn7hDsksJ7U1l4gkRm8/
X-Gm-Gg: Acq92OG79+FzDxlg9jDbd0xvwPUIyBnOo8oBJjMwhEj1za3ea1AExutaYh3n8W0qxY2
	0VpKgrElGwiUx5Lu7IRx4KxuM6k495caBWu7OEQnys5Kmz8Lb3URyx1Zith6/gcRwn4ZixX8UH0
	CvnNE6bVbBGdB8J4YF2RZVG7eTgbXRBZpf5X7XXt79sxzIdu4ZlHbENtAegZ6/yN02ASutJi28p
	8usX07xWLL8b9qdsr6lmxaF/pok5zH8kfXbbxuz8aMvaCCrTHVOJopljJRbPy164fxjP1Wz7kx3
	b9MLDLhupB1TTGTvahfeaO6tbL7lsCTdmkTCbg==
X-Received: by 2002:a05:6402:360e:b0:691:ad29:ea33 with SMTP id
 4fb4d7f45d1cf-693779d1edfmr692502a12.12.1781249461160; Fri, 12 Jun 2026
 00:31:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260611-b4-kcov-dataflow-v2-v2-0-0a261da3987c@est.tech> <20260611-b4-kcov-dataflow-v2-v2-3-0a261da3987c@est.tech>
In-Reply-To: <20260611-b4-kcov-dataflow-v2-v2-3-0a261da3987c@est.tech>
From: Alexander Potapenko <glider@google.com>
Date: Fri, 12 Jun 2026 09:30:22 +0200
X-Gm-Features: AVVi8CevQ1ha7IS1m5wrojNeqF7AokFDz6V9vLKSYwmszS5cFjeqHBoSGHAAq9c
Message-ID: <CAG_fn=XRzSuFrxtFbz2t9jjY8HPUUhhnU3iWJiSV-X4+hg66cw@mail.gmail.com>
Subject: Re: [RFC PATCH v2 03/14] kcov: add barriers to recursion guard in kcov_df_write
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
	linux-doc@vger.kernel.org, Yeoreum Yun <yeoreum.yun@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 11, 2026 at 6:21=E2=80=AFPM Yunseong Kim <yunseong.kim@est.tech=
> wrote:
>
> The recursion guard (bit-31 of kcov_df_seq) prevents reentry when
> copy_from_kernel_nofault() or other called functions are instrumented
> with INSTRUMENT_ALL. Without compiler barriers, the guard set/clear
> can be reordered relative to the function body, making the protection
> ineffective under optimization.
>
> Add barrier() after setting the guard and before clearing it, ensuring
> the compiler does not move instrumented operations outside the guarded
> region.
>
> Cc: Peter Zijlstra <peterz@infradead.org>
> Signed-off-by: Yunseong Kim <yunseong.kim@est.tech>
> ---
>  kernel/kcov_dataflow.c | 2 ++

Please merge this patch into the one introducing kcov_dataflow.c


>  1 file changed, 2 insertions(+)
>
> diff --git a/kernel/kcov_dataflow.c b/kernel/kcov_dataflow.c
> index df7e8bf70bfa..5248293280d5 100644
> --- a/kernel/kcov_dataflow.c
> +++ b/kernel/kcov_dataflow.c
> @@ -86,6 +86,7 @@ kcov_df_write(u64 type_marker, u64 pc, u64 meta, void *=
ptr,
>         if (t->kcov_df_seq & (1U << 31))
>                 return;
>         t->kcov_df_seq |=3D (1U << 31);
> +       barrier();

Please make sure barriers have comments explaining which barriers they
pair with (see kernel/kcov.c)
