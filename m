Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BD0E47143B
	for <linux-kselftest@vger.kernel.org>; Sat, 19 Sep 2026 10:41:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789814467; cv=none; b=g7E2dPwTcQ3e6eHILvFdVJaBvOIGrhigXwm8l+55zoIbbiT7jF2eIM6u1yAnSM7uClQo/lUkn9NO5vfWKqoH1KN0s/YuDtDxFcSrgBd3vUP7apQebeokizW5Dt5S/0yxRkytvOLY1Q145Lmncnb69FAqJXY2bTnEGw1wgiTRJ3U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789814467; c=relaxed/simple;
	bh=/zVhl/58ppW4f8bSySDdz7RMQAkYtKlqpvoNw49/sj4=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=eC1lkeA1Kqr9QDcXg3cgBXWbhiT2Rz23t4iNuE7cBcCgRpMF5l/gc6j02eGLvSp6tiATESPzP2vA3X0PfzAaAlCo2AOmz7etbIyvs0hG5J8ILYaSQuiinWhOnnDw+j9MOZcOga7Q+kBxMKY83hsjSZ8bVIoLg/mRQ9lJ5/B3Bww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gVxzNdvi; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gVxzNdvi"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49b912d3920so10468355e9.1
        for <linux-kselftest@vger.kernel.org>; Sat, 19 Sep 2026 03:41:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789814463; x=1790419263; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=x47tJsyRRuS9WWsrQkleNMY57Cc3HHS/YjAw1Ng37/U=;
        b=gVxzNdviichMzd2yMzrIoEvqk/U1s+6VzqyL5823Kt+CLSxSRO8k412xbU+X8Re3Dn
         I+RBzPJlwVfAEkTmqAdagEywzzSlJfGjNMP2gjNWzm79ZI1rKixefbsTngQYwi+9bcJI
         sHBmHlh+Ry2Hkz5mZpddGOI3o7xpzd2cJ5AWufzk9VZh5gX1IT/B6UrXkaQy0wxk+b2Z
         fFKRRYUuOjZF651Z9V/mNfCbg6og+w8/JqWuRh1+6NjpwmMlGvdRfuExZkIGE6kw59s4
         MwFi2sf6kxardcOXjBDW+ZtgpOguv4cS/DCzVjHCadd/lBqaPSrE8unmEIwsNuDhgE8A
         Z9zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789814463; x=1790419263;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=x47tJsyRRuS9WWsrQkleNMY57Cc3HHS/YjAw1Ng37/U=;
        b=Y6aMNAi/SI8gyq7pZ1n3E1yKlaGYfmwGuSBHb298BY0Vj7ssURKv4oQ7q2GJesMv6m
         WSioxF6FY1EcE2kM0ihsDBtOrwFrrF3tzwaJYcphkgWXxD1mOL2a9YQx0kJ6Tn9ui7/g
         M5IXWSIS5o+ikdFbHkUpdNgYCRapc0UM6sNLH845Ybip3OV+9hL8fV/eX+T2UZShG5EP
         i/X9ZFwRTjEMSNX0Jmbckiyi8163XPMrOhOxxgV409EzJtYFGggRz9qwRIZD50ZjJKCQ
         hS7NcjYT76oVlwB0+sZlJy3ZgXk3LpphFCj+mDU+Da00RaDHOFx5CbbVlMmjZ6KjJYje
         r8ow==
X-Forwarded-Encrypted: i=1; AKwUvBxxwxQ35Q8zjkG0pGbqJPB+j/EranAnr5+OgdsH1uznp22ruIR35q8c6u2H6fOGlyCiacsTQTfPB9ugj9AgOS0=@vger.kernel.org
X-Gm-Message-State: AFuF++kvWlFDdBJi5ATyDK7UFSBGwweTYcs4suIXPJIKzTPkq3r9/Qvf
	VgVcDE/rxFH48wdYJi3Dg8zPbG1jKH0WerkEZO3LoIig4IgJCJvfumgE
X-Gm-Gg: AYBFou0aXEJlZ7VqJHauw8vbJtpgprXgkEp+n7wGLuqjkzTSGU9s1sUFG3U2eHzHzmF
	//Wko9Ies0Y9pg9QuQP8N2yDf6V+Ut5GfG5g6kr9zcoQlpQZIc9iC7hDY7AuW+VGrnXC+mCc60e
	zWwyMXRTBGZWRkbt971xqDjHbt+MDpoObo4lvoT/kHYKKotiHiyHRO45HohU7vTbuVfvOKlRnn2
	wVsP4E9usreeBEA/GJoi8XtH5hrrnxsFRNGoORSug14rLLBp4rxu1dlGCQdcVgnU+1ya0pcuw/w
	UaPQBSXNwAmi31W+k4kusdMe0llDi+qcpVLi0RfUNR6z6D7CgZdDDbpo+OTFXVqhOCuY8l40mom
	r71Tl+PDYHofa2xATqYwqlqffWqyQ4S8TWfXuNnAF9LZ9u1v6nWdWaFYJyRCFgCc9B75NYx3/3s
	mJCL2BndpMbphOykvPHlkpWr1+QCzLJc8aGsK25vi8UP7F1SL2GAhHmhRtj/7fnpAbqCJpc2wy0
	eAefejBmHbOOM5a/BfVGEaFLwxV1+5z4AU=
X-Received: by 2002:a05:600c:8518:b0:49d:28c4:b304 with SMTP id 5b1f17b1804b1-49fc5741563mr73992215e9.29.1789814463336;
        Sat, 19 Sep 2026 03:41:03 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fc521f5d9sm32797955e9.2.2026.09.19.03.41.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 03:41:03 -0700 (PDT)
Date: Sat, 19 Sep 2026 11:41:01 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Karl Mehltretter <kmehltretter@gmail.com>
Cc: Vlastimil Babka <vbabka@kernel.org>, Harry Yoo <harry@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>, Rasmus Villemoes
 <linux@rasmusvillemoes.dk>, Hao Li <hao.li@linux.dev>, Christoph Lameter
 <cl@gentwo.org>, David Rientjes <rientjes@google.com>, Roman Gushchin
 <roman.gushchin@linux.dev>, Catalin Marinas <catalin.marinas@arm.com>, Kees
 Cook <kees@kernel.org>, "Gustavo A . R . Silva" <gustavoars@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Shuah Khan <shuah@kernel.org>, Nathan
 Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 linux-hardening@vger.kernel.org, linux-mm@kvack.org,
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
 llvm@lists.linux.dev
Subject: Re: [PATCH v3 1/5] slab: align ZERO_SIZE_PTR to
 ARCH_KMALLOC_MINALIGN
Message-ID: <20260919114101.34423251@pumpkin>
In-Reply-To: <20260903203720.63689-2-kmehltretter@gmail.com>
References: <20260903203720.63689-1-kmehltretter@gmail.com>
	<20260903203720.63689-2-kmehltretter@gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu,  3 Sep 2026 22:37:16 +0200
Karl Mehltretter <kmehltretter@gmail.com> wrote:

> The kmalloc entry points are annotated with __assume_kmalloc_alignment
> but return ZERO_SIZE_PTR, currently (void *)16, for zero-size requests.
> This violates the annotation when ARCH_KMALLOC_MINALIGN exceeds 16.
> 
> This can mislead compiler optimizations. Clang's UBSAN_ALIGNMENT detects
> the violation on armv5. GCC and Clang retain the ZERO_OR_NULL_PTR() range
> check but eliminate an exact ZERO_SIZE_PTR comparison after an annotated
> allocation.
> 
> Define ZERO_SIZE_PTR as the greater of 16 and ARCH_KMALLOC_MINALIGN,
> retaining the existing value where it is already aligned. Assert that
> ARCH_KMALLOC_MINALIGN remains below 0x100, the value of LIST_POISON1
> when POISON_POINTER_DELTA is zero, so the sentinel remains distinct
> from that poison pointer.
> 
> Fixes: 94a58c360a45 ("slab.h: sprinkle __assume_aligned attributes")
> Assisted-by: LLM
> Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
> ---
>  include/linux/slab.h | 12 +++++++++++-
>  1 file changed, 11 insertions(+), 1 deletion(-)
> 
> diff --git a/include/linux/slab.h b/include/linux/slab.h
> index cda126def67a..563dadc16d82 100644
> --- a/include/linux/slab.h
> +++ b/include/linux/slab.h
> @@ -262,13 +262,16 @@ enum _slab_flag_bits {
>  
>  /*
>   * ZERO_SIZE_PTR will be returned for zero sized kmalloc requests.
> + * It satisfies the alignment promised by __assume_kmalloc_alignment
> + * and keeps the historic value 16 where that is already aligned.
>   *
>   * Dereferencing ZERO_SIZE_PTR will lead to a distinct access fault.
>   *
>   * ZERO_SIZE_PTR can be passed to kfree though in the same way that NULL can.
>   * Both make kfree a no-op.
>   */
> -#define ZERO_SIZE_PTR ((void *)16)
> +#define ZERO_SIZE_PTR ((void *)(ARCH_KMALLOC_MINALIGN > 16 ? \
> +				ARCH_KMALLOC_MINALIGN : 16))

If ARCH_KMALLOC_MINALIGN is just a constant (I suspect it has to be)
this would be better as:
#if ARCH_KMALLOC_MINALIGN > 16
#define ZERO_SIZE_PTR ((void *)ARCH_KMALLOC_MINALIGN)
#else
#define ARCH_KMALLOC_MINALIGN ((void *)16)
#endif
to avoid bloat at all the expansions.

David

>  
>  #define ZERO_OR_NULL_PTR(x) ((unsigned long)(x) <= \
>  				(unsigned long)ZERO_SIZE_PTR)
> @@ -625,6 +628,13 @@ static inline bool kmem_dump_obj(void *object) { return false; }
>  #define KMALLOC_SHIFT_LOW ilog2(KMALLOC_MIN_SIZE)
>  #endif
>  
> +/*
> + * Keep ZERO_SIZE_PTR at most 128, i.e. below 0x100: LIST_POISON1 is
> + * 0x100 when POISON_POINTER_DELTA is 0, and no architecture currently
> + * has an ARCH_KMALLOC_MINALIGN above 128.
> + */
> +static_assert(ARCH_KMALLOC_MINALIGN < 0x100);
> +
>  /*
>   * Setting ARCH_SLAB_MINALIGN in arch headers allows a different alignment.
>   * Intended for arches that get misalignment faults even for 64 bit integer

