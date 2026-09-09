Received: from mail-qv2-f12.google.com (mail-qv2-f12.google.com [74.125.230.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01E2C380FFE
	for <linux-kselftest@vger.kernel.org>; Wed,  9 Sep 2026 22:41:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788993706; cv=pass; b=hD/ESci6XV8+CSSvsuIERd0heycLJpXrwa0Ox4XASXulUQNyM36HboLKHkjilp6zFNHtAjQKS4xTrmctnIsqFyr4HjGkUU+pfv4/D0NO6awjIYu/J+87iYPbgy1VRxKrF3lwIEOLYPsHmrONii4UVG/hBfNhADfoXO7GUe3+OpM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788993706; c=relaxed/simple;
	bh=NTWMXK3qBllEwS5xxNNJmOXFEuix2lqI2KW5LUWH0nk=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=I7ThmBNC51L63NyNH8Q61IV8uVlIp2bl+Z68+Hmgrpp6eSopWQ+ItP4iXzYKOdgrWL2Bu+k9Lda7fHu5NZpPb+Z+5qojK45nI8h7Zlhc7z9i5dgmWzkkjkotCoUsx18tOaxrES/U5kW4H8lJWTv1AL5tUsGIRjOpLhyZBvgIU/U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=G2rqbkcd; arc=pass smtp.client-ip=74.125.230.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="G2rqbkcd"
Received: by mail-qv2-f12.google.com with SMTP id 6a1803df08f44-91058dd77a2so20674346d6.3
        for <linux-kselftest@vger.kernel.org>; Wed, 09 Sep 2026 15:41:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788993698; cv=none;
        d=google.com; s=arc-20260327;
        b=X1q4O0//bDNGTinUN3ccNjIsLtNauNx6PQp6OSfLjyKo06hgn10ntIzRvHo/VLQuWu
         6Hy5CoHfuzEKXix+uu3H7DT/jb2DA1L5g/uKsyBgCKy+BJ/23eBaaqC4Y2mr3UH+RVcK
         Ar3/zLrcu5WpnKyieKX1S9vw7T3ZV00VUfMSMtdvs2SppH2roFSDlTGL9/eaNanD6m7S
         KcFH47sT5JIK86Wo1FpGwR5kPo+g/3fnazZrP8CQ4P92w10RREZj+XeRvSC4vFuJrGU+
         JvltF6auERzlUcC9kD4CDcWAWkV20qmk44To0rZfO7pZXdETtG4/IKC/Y5Magp1D3F9V
         f3cA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=K7y90OKfcw5Kem65C7oA0LNo0uX7jIHf03YJVGFM0dg=;
        fh=sv7LNsP4maHMCSgm5JaGqwoIhK7ciyO2uzNSYmjVC+M=;
        b=XV8OUCrbRiO9qmWMyERMTIEju9MOYFgPKDFn70RQKv1mgBAW2UPdxXJlHNa3O/Mph6
         xTbRd7KEqknHvtuwRW9xty6Rg7NG+3bwKlkQmBksWMgd1+hev/0b+59d1p9OK6tUBq0R
         SbsRjHTgYcfcG/aoPXqUQWNKUdzMMape0uwhkf99LJGODmHo3ah48tduK4EpteD1trsd
         OvGuoizdo02ev7g8HJrV6faW4r/zx1nOR/74RiQEeRWYfwRl6asW6mSa3UbP89x5PtgJ
         z52mdcUxmkQeCeLhgcmUOdL3dt/XTvILCBcKjdPddGQI+TdTPLIrAFLSMXMqhtWfd12Q
         nDCg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788993698; x=1789598498; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=K7y90OKfcw5Kem65C7oA0LNo0uX7jIHf03YJVGFM0dg=;
        b=G2rqbkcdAr8tmLVUFqM9mdb/wGB3yaWC7Ys+HxXHpvuyU4TxjC/z2rCxCtc5RHaJkE
         Nabtmse/5Y7cQKBLwqW1DLuOk52CmzCmNGhIxRDAWPS9ecNe7UJcIOUDFo3HsGh3F65m
         O9cAPg5qIMovmw/N+e8WKKKzdTxUyF+v05AjXv48R6ZO+/LEzT+BqDj06Js2iSkSVLEg
         93Wm0GH0710DVzUecZtrwmpMfdE7uhDSkq1CG3uGWIaNvzaJ+vIa41reLT3IShT6ONWo
         cVcgnOOyCO6hK3bVOcCrTXtACRZhbIXgFtW4oQqlnD2TDB/KS8gQF0q6lIcXEgT4wRP0
         EHTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788993698; x=1789598498;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=K7y90OKfcw5Kem65C7oA0LNo0uX7jIHf03YJVGFM0dg=;
        b=J4ilIAvN2MgQgqa0BxABsCa/37DIfB8WLFEwAH6qT3tlPu+o/zT2171KHjVsBtMXQI
         f/FrrYpbyAbbINouq1uXCCrwVFfC3FpMRa6Jehy+9UmfkIdhLk1tqLiuuDLU1TC9jGem
         2lGSI7BpVfiucc5R0o2St2dvamjKcAjp169cwoSRRM7XfSCtUCiQnyh8aAcGEru5Tt6O
         1A2jJ3ue45lEmgegIDITaHOUax3a/GGpC7gsMncxUquaKvnr0xTtsYF03vX5lX8TZar2
         f4mLvOZ1oUJyeZQMwctEp49mHua+z59fzGOxTW9f6tjqQnYQXcq15E7419DdJp4oICOR
         xeWw==
X-Forwarded-Encrypted: i=1; AKwUvBwIPU3mDC3CXA7nFddXEiDVP/AiPNZb4R5+C/VVjcUejPVrUB1nEZMzAZG3mEuMoS4lAONEfiuxPix5FacosPQ=@vger.kernel.org
X-Gm-Message-State: AFuF++l8SwWXV1qx/fkb1WyPtaPH8hWy5ZvycUd3m1q0i8EzZsLJqkRP
	PZeQBKqVv8CMuyX1zoDbRxrlu0hn45atvw4KcBRI9r+UxxEQ5rjh5hfDz466XW3XZH3wAJh8zLL
	iWGCX6GdZrqhxpKXzY5nMGqpgcqWID2HHr3g4zsjq
X-Gm-Gg: AYBFou1MEk2t5ybL8GQVv610ZYci6FPj8JlhABKz9XfYnlgu0ODaRTn0NLt1n+C7uqk
	6RA8IM9AK0LxTMmw3ljJGUF1oheE1OciLDdaWj0m0jfbF7mjaqKq+9GfWZTA44K3RxEIuNR5l5v
	oh/wCiqIGLET2emqUjN1QylaajEk7sKTs1Oo04vkYeQEEIDQ3RdwE8D5iEzQp6Ak4Fu8KFojwj1
	E5SJxfjbP891fTAgyOa23fUhHWtxAlL3zfhfXX42CFagCq4yQHD70VNreVyieN8sliaGZGFbMln
	K/fySCBbJL9wk8oAD6p2f54BotAEkknrfyHPNjeEp2q7ahKN4X85B9ytlbsHmiQwEyJc7FCUsZR
	TJagPq+51YIsWm0gbiZtMqJqEJw0qT8upNbJM0UUj
X-Received: by 2002:a05:6214:4891:b0:910:345b:954a with SMTP id
 6a1803df08f44-9106b448140mr149416676d6.37.1788993697090; Wed, 09 Sep 2026
 15:41:37 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 9 Sep 2026 15:41:36 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 9 Sep 2026 15:41:35 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <20260902194657.79075-1-gourry@gourry.net>
References: <20260902194657.79075-1-gourry@gourry.net>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Wed, 9 Sep 2026 15:41:35 -0700
X-Gm-Features: AcwNN1WgHJXiyXU_ZBa_1-DE36OkQO7Bg_jMLCkg3DfJNHdXNcM4XNk-5IPdjJI
Message-ID: <CAEvNRgHWyBaBpZ4Bem1Eu86b-cuEA7NkyjxTJ4D3FnpGe1B2Yg@mail.gmail.com>
Subject: Re: [PATCH 0/5] KVM: guest_memfd: bind backing memory to a NUMA node
To: Gregory Price <gourry@gourry.net>, linux-mm@kvack.org
Cc: kvm@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org, kernel-team@meta.com, pbonzini@redhat.com, 
	seanjc@google.com, akpm@linux-foundation.org, david@kernel.org, 
	ziy@nvidia.com, matthew.brost@intel.com, joshua.hahnjy@gmail.com, 
	rakie.kim@sk.com, byungchul@sk.com, ying.huang@linux.alibaba.com, 
	apopple@nvidia.com, shuah@kernel.org
Content-Type: text/plain; charset="UTF-8"

Gregory Price <gourry@gourry.net> writes:

> guest_memfd allocates its folios through a per-inode shared mempolicy.
>
> Today that policy can only be set after the fact, with mbind() on a host
> mmap of the fd. That requires the fd to be mappable, and it cannot reach
> folios that are only ever guest-faulted. Neither holds for a
> non-mappable (confidential) guest_memfd.
>
> Add GUEST_MEMFD_FLAG_BIND_NODE and a node field to struct
> kvm_create_guest_memfd. When set, KVM builds an MPOL_BIND policy for the
> requested node and installs it over the whole inode, so every folio is
> allocated there with no userspace mbind().
>

Instead of a custom API to ensure all guest_memfd allocations come from
a single node, how about these options?

1. Using cgroups/cpuset to constrain allocations (could be troublesome
   if the guest memory is not preallocated, unless the vCPU threads are
   running with the cpuset config)

2. Process-level NUMA policy

3. Why not request the guest_memfd to be mmap-able just to be able to
   set a memory policy?

4. How about something like fbind() that takes an fd and offset range
   instead of mbind(), which has a prerequisite on mmap()?

This doesn't exist yet, but I'm hoping to discuss this at LPC 2026:

5. What if you could pass an fd representing a mount to guest_memfd at
   creation time, so to make all the allocations come from a single node

    Step 1: Create a tmpfs mount, specify mpol for mount to MPOL_BIND
    Step 2: Get some fd representing the tmpfs mount, hand that to
            guest_memfd at creation time
    Step 3: guest_memfd allocations will always come from that tmpfs
            mount, and abide by that tmpfs mount's memory policy.

May I know more about the use case behind this new feature?

>
> [...snip...]
>
