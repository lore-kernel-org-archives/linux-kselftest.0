Received: from mail-oa1-f43.google.com (mail-oa1-f43.google.com [209.85.160.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFE1523EAAF
	for <linux-kselftest@vger.kernel.org>; Sat, 20 Jun 2026 17:47:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781977649; cv=none; b=FYE2BJXyqB11vRUP92S3TWPp4r3/ybZH8qMrPZXECePq+YGqobv9i61qrT8NPX7zEI8wGnVe52nBGS5BP88hnRD/23SXD7B+W0tK0D5uUx2ZF6tz838MSQTRB9JYzd6/xh/nfcKc775BHBFSxGqATBs7FuNwcnitQdRaFKHnP9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781977649; c=relaxed/simple;
	bh=mz9O4NhXNnSqCz/PQBwbu/ZRdHDjGfKV+23fwcNV5g0=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:Cc:
	 References:In-Reply-To; b=RTCELEEB4ZtGPL3BXLXj2MfnunzkRaYqnW0lNTGab69R0Ku69ci7V8OL+eehp2CjZ83gCQnVoxuyuSSjoDP1u3RP1/SNjPuCDvtLCMo7X/4GAsxMg4/9KtfwdwXvr6oLHAoH4nRlLJZDVz5lbh2KRCvqIIYmk3+C6qhlqsZkHHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WivaQk0E; arc=none smtp.client-ip=209.85.160.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WivaQk0E"
Received: by mail-oa1-f43.google.com with SMTP id 586e51a60fabf-446f87b6de1so1066990fac.3
        for <linux-kselftest@vger.kernel.org>; Sat, 20 Jun 2026 10:47:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781977647; x=1782582447; darn=vger.kernel.org;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ek8DQr9nJ3BPznx4klyAIQIxgUfOyaW6fbrOfQf2ozQ=;
        b=WivaQk0EXbNLW4/DTOO5Lx6iUqHt2oleKjteNzGdyryusV590HF7yRrTh+iPosJFUx
         EgiGOESx7MTgTE2v7F5thHkReaH6KQiQCOzlZxyIcm9JUYIIuqr0Y3Bo0D02itMg51Kx
         iErXKlznpRJEACahjdA5RsbSDVHkWxOaEbWrCW5j5/7p/wUm33M1eWo1F6RbkL6ySqoD
         mUeku2RW/k+hcd5ncjageeBSZR7pYdv7EiwXCSIca8hfFRAnJnDTHiD87hhLD6836yAA
         8Pbrl35meVb/Bhet+zt1f9lYYOAQCLq6j/VBUsnmXE5pJRpQCBblY34pDlN/1DUazD6+
         sPyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781977647; x=1782582447;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ek8DQr9nJ3BPznx4klyAIQIxgUfOyaW6fbrOfQf2ozQ=;
        b=IyLseK3j8Otym0soJXTwBkMkUpHW3zs2UyclVwGFvgsPFSVIDkMh3IMr7ecqiuSNZa
         lHC6Yh8fQL56wAcOEv9gLgGT86WL++VkuGxjceHBrDoVy3pouZg0LUMshX9pK3Iilqat
         ovkLWrPAoMT/Tz8GbS5zCp9Dqw4PtqvKSdi528z5CF2jX5VaaI4vLVPvKfSZTVJ3WkVO
         2Ds+5YCt4u/9DHOjWvW5bAgD3aOFkmherlT1fbuLKDdGFgMGPDcQVGCCx52TzsY50/Sj
         g25VOQ4Re3UgFnxmAbWudAyS7ghtKi6H7KYiRz/uqDJd5dyAaDQEOX4i5VbwAo01CkJ7
         lZ8g==
X-Forwarded-Encrypted: i=1; AFNElJ/agqX7kz1ywaVIXohPSPVVDAF2TS6z10MDhgVSkxsUpL+dEYPFv9P8TDV24qhWhV2CL1ZSlel3jwS2RuMNJz0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8NYCxUSb1LCbxT7pyXDt/bUPISH0+MM2v3Wn2tYdDdUCl+4iZ
	xF9amKLGU0GkERoSQn764Y/wUiaod8jW3+sHgCjMwZ7RVKVgVUFrKL9n
X-Gm-Gg: AfdE7cmQyGJBTw239zVALNRR7bWkcDxiFD6OOKzLYwGJXmDzM5FT790ea3/8WHjEyuk
	/whzuiInfM8CGGdc2oPoZhCTgq6bbkfUoPCM3qyVX5T8yU9TVINRufivkHvTrOFyHCnypjH/nOD
	GtunSjBRDAsytvkaJ4SzJHEELgZMgdly8xb1STt3Cim13eMgTM64CC45ls7L6bYNUZAeyPFLbvA
	IzMlAPuV3VBiQXUYSWtERMEZlhkhC4BxF3Y4Hom2L94U1Yo+flfDMLuM5BxAYHAgq3PoavpucaV
	fJFY5rZu1pJ4uuTfEWlB1sLKFN0P6OJfHtVdbWRkQ7zc86i778/u4mhZHCBv3n2RmC2TdYXpuVr
	HiGT5ivs8Anc4Zmi11B2lrtdiGGhZ2Mn5exlXIdXe1VA3vSTC3Rs2qk6iSUKh7z8VOuBo9g34Jc
	bcECCJnTWwvGN7z4ZSUL/R3xXeE9+IdsQ9Pg8QDIQmYB7B//ZY+RBT1boVO0XkZ8EiLhoSBBrqy
	GHFdAg=
X-Received: by 2002:a05:6871:147:b0:43d:30c1:6573 with SMTP id 586e51a60fabf-44716a6ddc6mr5057538fac.6.1781977647499;
        Sat, 20 Jun 2026 10:47:27 -0700 (PDT)
Received: from localhost ([2a03:2880:10ff:70::])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4472ec52815sm2489338fac.1.2026.06.20.10.47.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 20 Jun 2026 10:47:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 20 Jun 2026 10:47:26 -0700
Message-Id: <DJE2CTA52OO1.1M9LF27NDWK2V@gmail.com>
Subject: Re: [PATCH bpf 1/2] bpf: Mark bpf_get_kmem_cache() as nullable
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: "Nuoqi Gui" <gnq25@mails.tsinghua.edu.cn>, "Alexei Starovoitov"
 <ast@kernel.org>, "Daniel Borkmann" <daniel@iogearbox.net>, "Andrii
 Nakryiko" <andrii@kernel.org>, "Eduard Zingerman" <eddyz87@gmail.com>,
 "Kumar Kartikeya Dwivedi" <memxor@gmail.com>
Cc: "Martin KaFai Lau" <martin.lau@linux.dev>, "Song Liu" <song@kernel.org>,
 "Yonghong Song" <yonghong.song@linux.dev>, "Jiri Olsa" <jolsa@kernel.org>,
 "Shuah Khan" <shuah@kernel.org>, <bpf@vger.kernel.org>,
 <linux-kselftest@vger.kernel.org>, <linux-kernel@vger.kernel.org>
X-Mailer: aerc
References: <20260620-f01-16-kmem-cache-ret-null-v1-0-c146154a2816@mails.tsinghua.edu.cn> <20260620-f01-16-kmem-cache-ret-null-v1-1-c146154a2816@mails.tsinghua.edu.cn>
In-Reply-To: <20260620-f01-16-kmem-cache-ret-null-v1-1-c146154a2816@mails.tsinghua.edu.cn>

On Sat Jun 20, 2026 at 8:47 AM PDT, Nuoqi Gui wrote:
> bpf_get_kmem_cache() returns NULL when virt_addr_valid() rejects the
> address or when virt_to_slab() does not find a slab. The verifier uses
> KF_RET_NULL to add PTR_MAYBE_NULL to kfunc return registers, but the
> registration currently lacks that flag.
>
> Add KF_RET_NULL so callers have to prove that the returned kmem_cache
> pointer is non-NULL before dereferencing fields.
>
> Fixes: a992d7a397912 ("mm/bpf: Add bpf_get_kmem_cache() kfunc")
> Signed-off-by: Nuoqi Gui <gnq25@mails.tsinghua.edu.cn>
> ---
>  kernel/bpf/helpers.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/kernel/bpf/helpers.c b/kernel/bpf/helpers.c
> index b5314c9fed3cf..57a6ab72ae3cc 100644
> --- a/kernel/bpf/helpers.c
> +++ b/kernel/bpf/helpers.c
> @@ -4817,7 +4817,7 @@ BTF_ID_FLAGS(func, bpf_iter_bits_next, KF_ITER_NEXT=
 | KF_RET_NULL)
>  BTF_ID_FLAGS(func, bpf_iter_bits_destroy, KF_ITER_DESTROY)
>  BTF_ID_FLAGS(func, bpf_copy_from_user_str, KF_SLEEPABLE)
>  BTF_ID_FLAGS(func, bpf_copy_from_user_task_str, KF_SLEEPABLE)
> -BTF_ID_FLAGS(func, bpf_get_kmem_cache)
> +BTF_ID_FLAGS(func, bpf_get_kmem_cache, KF_RET_NULL)

This is wrong. Nothing to fix.
It works as designed.
Instead of sending broken patches do your home work.
You're saying commit a992d7a397912 is buggy. Read its commit log, selftest
and the email thread and see why this patch is wrong.

Such poor quality patches undermine your other legitimate fixes.
You have to step up in quality.

pw-bot: cr

