Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A144382F03
	for <linux-kselftest@vger.kernel.org>; Tue, 18 Aug 2026 23:18:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787095115; cv=none; b=hZTZLMOZwfNp05scsZy2CpasOIByOfb4NM2J/anaxYFPQQ9D4OtDLPWYd4aHe3S5JLOxFErMZaOsFTylvzIdvFFSTQPs6nr1ek1+WTbkzdbMMOctBdiZLPYBUXXAuFEq7REhyYios7Rr1fi3pDvBWT6lQX8vrof0dnfMGgWNgf0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787095115; c=relaxed/simple;
	bh=MEPpXyDD2yM8XuU1/JIlr4bR98o+GPv/YzF6OkvAOs0=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Cc:Subject:
	 References:In-Reply-To; b=LXcoW4geLq4OtRVv6d7SJDCmxaI2CDvmx+Yim2rpcuQn45dg7H5EDb+5cPVhUZyzjjYL171jzCL4TY0pylbWbKmP/Lj2U865eXMuxJ7oxApqwOAC/pBy/f79vINoLESzHYX1LbJZbkqo4NEhQ1JO/nBCqyjbD7y7BdfW2hXWTxE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=etsalapatis.com; spf=pass smtp.mailfrom=etsalapatis.com; dkim=pass (2048-bit key) header.d=etsalapatis-com.20251104.gappssmtp.com header.i=@etsalapatis-com.20251104.gappssmtp.com header.b=ogq+l76a; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=etsalapatis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=etsalapatis.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=etsalapatis-com.20251104.gappssmtp.com header.i=@etsalapatis-com.20251104.gappssmtp.com header.b="ogq+l76a"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-38759bcd877so602530a91.2
        for <linux-kselftest@vger.kernel.org>; Tue, 18 Aug 2026 16:18:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=etsalapatis-com.20251104.gappssmtp.com; s=20251104; t=1787095111; x=1787699911; darn=vger.kernel.org;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=FSh4v7e+Hfv1szWaqI/qmJdvU291yDZq8xvu03yI1qM=;
        b=ogq+l76aAvtZPPGn4b1v+hHP1T4HOIS9gCYENDY4WU1DlewbxnA7Tmlv75ZZTajH0w
         QdCwSKbChzb5DYJERUPs6pT3jY3c7/6VTKCInP3y8uocU+/Yq7kUtqBZsxY+VSg1qDYB
         62qegGzYmHKgfbxEAj23ayVq4suZKLXD1FoalNrDF8PijkU8HEGkY0z6VBd7uQUOlhQP
         OQx+lUwuAAi4QX8ohciWXTZtRDS6TV5bZGUmh2ZTSxy7+pR6J5jbpeFENGllAFI3k6zg
         oFd4UqvfV6xRTLms6c61G0MLaORffLOVswM09oV1ZNlxH+kG2kGus/DPlxlPr9sk/skt
         YqHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787095111; x=1787699911;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FSh4v7e+Hfv1szWaqI/qmJdvU291yDZq8xvu03yI1qM=;
        b=Ndtlpv8vXfpUj3mG1xN4/gTAFV2U4CyW00XpMfaIzV/ybzDtVg+/dwrZKwAEUqeujX
         JyPonIS82ki+J/pj4FsSrDIXJP+s4SIF/rsLHDhj1+tWgtmIZoteDHYUCZcyEyWIVdMm
         lb5BaHtz9bPGpiTXHsrIjuswVGxmbOIBsh6rA8/D4/W6+b2nItzQIR6Fbnpn0AxDSmUn
         RKpnd0KkvfPynnQGdm5gsVPcgMP6SjwvUm3h5prj6vCpYBW3mHQF15MiaxhM03dw0dPJ
         4mZ4DNpqW3ZcU8xyhRjQ0tnyLgNxlCCkR6xsZuKWPOFWkE3noyg828lfLuXfMaYCLwdB
         uzlA==
X-Forwarded-Encrypted: i=1; AHgh+RpI7ah/3UmgdHXuZyT8ruXu6wU9lil9VM7C+ogXU8Qjx/bTRfhj/sK8aH3+LIxnDJLK6/3vYvuAdLnOPLNerMI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxT47CgERWEVo4018kmTYcBe0l5OltAIh4I2M0tAHa7H6tDanAN
	YYuYwTwON0rwHQSxUx6jvuCrCk6MTIsLg/f5BJu583gjxpreI6gg5z+uqWIYjzCyiCA=
X-Gm-Gg: AR+sD10Ii8ua4nftbs0SAht6R5nrze2vtlMy9FN2J6TIiLK3ot036K/Hdnuf5NBTFn4
	MUj72hHi3icZNxm0SLgeoGBkoNN0xZV9WvctVZWQnbfUMa8VYO0RD0cEIGNakmGBVCpVT9GBAQJ
	noS6XxIt7YjN6JGDIrZwK1RxxaLKNJFlM6WHBbv0F6xxYZA2AUbYfIxI7b28bNiyZ5rG0xD6pBi
	Qhm4KiwygcKC0sQf9ORZH7U/ke9Th8Enw98ZopG+f+hTtB2WxOcjW6cO5MbBZnFs0/63KSOaW8J
	q0O7e130U5SRNNuCoZA40tls2J1LvlqiZ3fdVqkVtbSVIdo+O1rnducJaMBKuGs4TiDAXb5PjRq
	vQ186PhGOpFj8q1onQHHYZl9O60Zx9QmqDvKPpdUA9w5SXRxvbp+OUQvwJ0UkCgOF2wG+pFJCkN
	FxFxww6XLQBqcDC7mirU5rat2xDyGvZonqY/qFEBhNiLqkT+OBmNKowAP2emLBrGpCQP1tKYHvy
	n8iOcoXy3lvrZ9QuA==
X-Received: by 2002:a17:90b:510d:b0:38f:18f9:785 with SMTP id 98e67ed59e1d1-39580f2d498mr743485a91.8.1787095110988;
        Tue, 18 Aug 2026 16:18:30 -0700 (PDT)
Received: from localhost (107-190-31-17.cpe.teksavvy.com. [107.190.31.17])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3957f9ab8besm329084a91.6.2026.08.18.16.18.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Aug 2026 16:18:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 18 Aug 2026 19:18:29 -0400
Message-Id: <DKSGCFDM14NC.1YMDZUUT89UVM@etsalapatis.com>
From: "Emil Tsalapatis" <emil@etsalapatis.com>
To: "Jiayuan Chen" <jiayuan.chen@linux.dev>, <bpf@vger.kernel.org>
Cc: "Alexei Starovoitov" <ast@kernel.org>, "Daniel Borkmann"
 <daniel@iogearbox.net>, "Andrii Nakryiko" <andrii@kernel.org>, "Eduard
 Zingerman" <eddyz87@gmail.com>, "Kumar Kartikeya Dwivedi"
 <memxor@gmail.com>, "Martin KaFai Lau" <martin.lau@linux.dev>, "Song Liu"
 <song@kernel.org>, "Yonghong Song" <yonghong.song@linux.dev>, "Jiri Olsa"
 <jolsa@kernel.org>, "Emil Tsalapatis" <emil@etsalapatis.com>, "Ihor
 Solodrai" <ihor.solodrai@linux.dev>, "John Fastabend"
 <john.fastabend@gmail.com>, "Shuah Khan" <shuah@kernel.org>, "Sebastian
 Andrzej Siewior" <bigeasy@linutronix.de>, "Clark Williams"
 <clrkwllms@kernel.org>, "Steven Rostedt" <rostedt@goodmis.org>,
 <linux-kernel@vger.kernel.org>, <linux-kselftest@vger.kernel.org>,
 <linux-rt-devel@lists.linux.dev>
Subject: Re: [PATCH bpf-next v3 2/4] bpf: arena: allocate the fault-in page
 outside the lock
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260808140720.293604-1-jiayuan.chen@linux.dev>
 <20260808140720.293604-3-jiayuan.chen@linux.dev>
In-Reply-To: <20260808140720.293604-3-jiayuan.chen@linux.dev>

On Sat Aug 8, 2026 at 10:05 AM EDT, Jiayuan Chen wrote:
> arena_vm_fault() allocated the page while holding arena->spinlock, so it
> could only use the non-blocking allocator. Once the memcg is at
> memory.max that allocation just fails, the fault turns into
> VM_FAULT_SIGSEGV, and the process gets a SIGSEGV on a perfectly valid
> arena address. Hitting memory.max is routine (e.g. page cache from
> reading a big file), so this kills innocent processes.
>
> Rework the fault handler:
>
> - Preallocate the page before taking the lock, like do_anonymous_page()
>   does, so it can sleep, reclaim and go through the OOM path, and return
>   VM_FAULT_OOM on failure so the memcg OOM handler runs instead of a fake
>   segfault.
>
> - A lockless probe skips that preallocation when a page is already mapped
>   (e.g. allocated by the bpf program), so the common case wastes no
>   allocation. The rare race where such a page is freed before we take the
>   lock falls back to the non-blocking allocator under the lock.
>
> - Return VM_FAULT_SIGBUS for the non-recoverable errors (lock failure,
>   range-tree and page-table failures) instead of VM_FAULT_SIGSEGV; only
>   BPF_F_SEGV_ON_FAULT, and a scratch-page hole under that flag, is a real
>   user addressing error and keeps VM_FAULT_SIGSEGV.
>
> - Tidy up the error labels.
>
> Signed-off-by: Jiayuan Chen <jiayuan.chen@linux.dev>

Reviewed-by: Emil Tsalapatis <emil@etsalapatis.com>

> ---
>  kernel/bpf/arena.c | 92 +++++++++++++++++++++++++++++++++++-----------
>  1 file changed, 71 insertions(+), 21 deletions(-)
>
> diff --git a/kernel/bpf/arena.c b/kernel/bpf/arena.c
> index 555ee2531ef9..09a718ca4c8b 100644
> --- a/kernel/bpf/arena.c
> +++ b/kernel/bpf/arena.c
> @@ -481,7 +481,8 @@ static vm_fault_t arena_vm_fault(struct vm_fault *vmf=
)
>  	struct bpf_map *map =3D vmf->vma->vm_file->private_data;
>  	struct bpf_arena *arena =3D container_of(map, struct bpf_arena, map);
>  	struct mem_cgroup *new_memcg, *old_memcg;
> -	struct page *page;
> +	struct page *page, *new_page =3D NULL;
> +	vm_fault_t fault_ret;
>  	long kbase, kaddr;
>  	unsigned long flags;
>  	int ret;
> @@ -489,59 +490,108 @@ static vm_fault_t arena_vm_fault(struct vm_fault *=
vmf)
>  	kbase =3D bpf_arena_get_kern_vm_start(arena);
>  	kaddr =3D kbase + (u32)(vmf->address);
> =20
> -	if (raw_res_spin_lock_irqsave(&arena->spinlock, flags))
> +	page =3D vmalloc_to_page((void *)kaddr);
> +	if (!page && !(arena->map.map_flags & BPF_F_SEGV_ON_FAULT)) {
> +		/*
> +		 * We run in process context here, so preallocate the page
> +		 * outside the lock with an explicitly sleepable allocator. It
> +		 * can then go through reclaim (both memcg and global) and the
> +		 * OOM path, the way do_anonymous_page() does; under
> +		 * arena->spinlock only the non-blocking allocator is available,
> +		 * which never reclaims. That also decides the return value:
> +		 * VM_FAULT_OOM below is only meaningful if the OOM machinery was
> +		 * actually engaged, which the non-blocking allocator never does.
> +		 */
> +		bpf_map_memcg_enter(&arena->map, &old_memcg, &new_memcg);
> +		new_page =3D bpf_map_alloc_page_sleepable(map);
> +		bpf_map_memcg_exit(old_memcg, new_memcg);
> +		if (!new_page)
> +			return VM_FAULT_OOM;
> +	}
> +
> +	if (raw_res_spin_lock_irqsave(&arena->spinlock, flags)) {
>  		/*
>  		 * A failed lock means a possible deadlock was detected. Don't
>  		 * return VM_FAULT_RETRY: this handler never took mmap_lock, but
>  		 * the fault path would re-take it on retry and deadlock. Fail.
>  		 */
> +		if (new_page)
> +			free_pages_nolock(new_page, 0);
>  		return VM_FAULT_SIGBUS;
> +	}
> =20
>  	page =3D vmalloc_to_page((void *)kaddr);
>  	if (page) {
> -		if (page =3D=3D arena->scratch_page)
> -			/* BPF triggered scratch here; don't lazy-alloc over it */
> -			goto out_sigsegv;
> +		if (page =3D=3D arena->scratch_page) {
> +			/*
> +			 * A scratch page marks a hole. Segfault only if the user
> +			 * asked for it; otherwise we could lazy-allocate but
> +			 * choose not to over a hole, so report a bus error.
> +			 */
> +			fault_ret =3D (arena->map.map_flags & BPF_F_SEGV_ON_FAULT) ?
> +				    VM_FAULT_SIGSEGV : VM_FAULT_SIGBUS;
> +			goto out_err_locked;
> +		}
>  		/* already have a page vmap-ed */
>  		goto out;
>  	}
> =20
> +	if (arena->map.map_flags & BPF_F_SEGV_ON_FAULT) {
> +		/* User space requested to segfault when page is not allocated by bpf =
prog */
> +		fault_ret =3D VM_FAULT_SIGSEGV;
> +		goto out_err_locked;
> +	}
> +
>  	bpf_map_memcg_enter(&arena->map, &old_memcg, &new_memcg);
> =20
> -	if (arena->map.map_flags & BPF_F_SEGV_ON_FAULT)
> -		/* User space requested to segfault when page is not allocated by bpf =
prog */
> -		goto out_sigsegv_memcg;
> +	if (!new_page) {
> +		/*
> +		 * Very rare race: the bpf program had allocated a page here, so
> +		 * the lockless probe saw it and we skipped preallocation, but it
> +		 * freed the page before we took the lock. Now we do need one;
> +		 * sleeping is not allowed here, so fall back to the non-blocking
> +		 * allocator and give up if it fails.
> +		 */
> +		ret =3D bpf_map_alloc_pages(map, map->numa_node, 1, &new_page);
> +		if (ret) {
> +			fault_ret =3D VM_FAULT_SIGBUS;
> +			goto out_err_locked_memcg;
> +		}
> +	}
> =20
>  	ret =3D range_tree_clear(&arena->rt, vmf->pgoff, 1);
> -	if (ret)
> -		goto out_sigsegv_memcg;
> -
> -	struct apply_range_data data =3D { .arena =3D arena, .pages =3D &page, =
.i =3D 0 };
> -	/* Account into memcg of the process that created bpf_arena */
> -	ret =3D bpf_map_alloc_pages(map, NUMA_NO_NODE, 1, &page);
>  	if (ret) {
> -		range_tree_set(&arena->rt, vmf->pgoff, 1);
> -		goto out_sigsegv_memcg;
> +		fault_ret =3D VM_FAULT_SIGBUS;
> +		goto out_err_locked_memcg;
>  	}
> +	struct apply_range_data data =3D { .arena =3D arena, .pages =3D &new_pa=
ge, .i =3D 0 };
> =20
>  	ret =3D apply_to_page_range(&init_mm, kaddr, PAGE_SIZE, apply_range_set=
_cb, &data);
>  	if (ret) {
>  		range_tree_set(&arena->rt, vmf->pgoff, 1);
> -		free_pages_nolock(page, 0);
> -		goto out_sigsegv_memcg;
> +		fault_ret =3D VM_FAULT_SIGBUS;
> +		goto out_err_locked_memcg;
>  	}
>  	flush_vmap_cache(kaddr, PAGE_SIZE);
>  	bpf_map_memcg_exit(old_memcg, new_memcg);
> +	/* new_page was consumed */
> +	page =3D new_page;
> +	new_page =3D NULL;
>  out:
>  	page_ref_add(page, 1);
>  	raw_res_spin_unlock_irqrestore(&arena->spinlock, flags);
> +	if (new_page)
> +		free_pages_nolock(new_page, 0);
>  	vmf->page =3D page;
>  	return 0;
> -out_sigsegv_memcg:
> +
> +out_err_locked_memcg:
>  	bpf_map_memcg_exit(old_memcg, new_memcg);
> -out_sigsegv:
> +out_err_locked:
>  	raw_res_spin_unlock_irqrestore(&arena->spinlock, flags);
> -	return VM_FAULT_SIGSEGV;
> +	if (new_page)
> +		free_pages_nolock(new_page, 0);
> +	return fault_ret;
>  }
> =20
>  static const struct vm_operations_struct arena_vm_ops =3D {

