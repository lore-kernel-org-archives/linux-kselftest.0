Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 717FE280309
	for <linux-kselftest@vger.kernel.org>; Tue, 28 Jul 2026 01:22:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785201734; cv=none; b=dCpoYY2N0xqPEItsiaK7H/58RJVGfqDIdV2Nz3hTOtAIMbP5tAE1OS7pG5pOE4ZU6uxQaQEcTJ0q04kKBuL6F0ryuhUIIvAqRStCm7QidFr+K/r2MsliZtGJ59DA8952xuQyroc221B/myfdi29WnZgisZhuShl9zsKvujFnTX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785201734; c=relaxed/simple;
	bh=KR3d4J6TdQmaXeU+C598kPlRAQnqek1rF2txBciKk5A=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:Cc:
	 References:In-Reply-To; b=DNgS+eKWw6rdg63JGtAjJaxdQHut0HZHRKUcOVLGIFaf7wmi5eJ6m9IAONKGeLpEDnLNpe9d5ycg9UtKcS76CvBWh2uK1kqadSuX3LVOUiEhMAUFz8HLGlqdvDEPdIMxoeAh9HI/rLEKWDOHCU4yT+q5L4tVJWYT3J6G6eYzZcg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=etsalapatis.com; spf=pass smtp.mailfrom=etsalapatis.com; dkim=pass (2048-bit key) header.d=etsalapatis-com.20251104.gappssmtp.com header.i=@etsalapatis-com.20251104.gappssmtp.com header.b=gPvUOotR; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=etsalapatis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=etsalapatis.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=etsalapatis-com.20251104.gappssmtp.com header.i=@etsalapatis-com.20251104.gappssmtp.com header.b="gPvUOotR"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2cf50c6f235so40323475ad.0
        for <linux-kselftest@vger.kernel.org>; Mon, 27 Jul 2026 18:22:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=etsalapatis-com.20251104.gappssmtp.com; s=20251104; t=1785201732; x=1785806532; darn=vger.kernel.org;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=jhdXb3S04B9c2xXxAlgzeVBHU0NJuj6Uw/SLtYwV8xw=;
        b=gPvUOotRS94Bcu+iECwbGtru59/forPItBYcKIaCgHutIV7ZYgoCthFbmxlIapaKfm
         nVdS5DoCvqIlf/Mv6hEspS3t9CFYLcV1rgGE4HWP49z7VIQZtd2yex00gJTv8EcIvu+u
         lRbUZryW8KzUAGMxC92PaK6NFvk3d3yY6ilOiPVeTeoLLvoRnyZn+3gUBur3gU4+2QWz
         x/sIYjBBp5nKtq6jUOP1m7zaNTmACjGfuHfK8pPLf4G4eAsBMoOovSHdW297u/DtL+nZ
         u9XiK22cSE4mWGTOWxyMjQfwvPYGJxEFsgp4vDTnxXiSPzbGw2qy3RzEysW9OHR6MCOf
         kUVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785201732; x=1785806532;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jhdXb3S04B9c2xXxAlgzeVBHU0NJuj6Uw/SLtYwV8xw=;
        b=fVWolgKmjQTRXsb2UWGUI4E3j0fkgBGbtqnYq+8DuyfzWfKioiYAgCCe/sKmw8VQFW
         42IwrFOIsFXZwC2AymBWSUdAgE6CNTW4HucOlgTRPogrcC73AyLD9Ci6mjYpyQh5okO1
         PnwKFjjPONWWAyi90aHaraSuCMMBhRMNfpvxIiijAxMeSnrYs6EGZyMEgwzg+/A53tFq
         7rw/NXQlogIAiJQLgbXW1NhkfhnnXRGNFRyiew606ZAeUKDTbVnMKkIC4U8o8uHCLsvz
         /R/5FNBxp9qqMmZN4NW17IRFbwTH/HxifnYZo6U4v7z9XxuclZp2EMfE0bqtyMYY1/qC
         YPEw==
X-Forwarded-Encrypted: i=1; AHgh+RptVB5tYv7llGurzsNpkAlkE9bwjqrkf0XslKsjQBzU8TUHyjZvWP1k76kGmASjMaHUrguDcYZY0UYd0ydu7PI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzHs4mVT8tJzKcYvWAkPIhPK75VKkY9QYjAldwKKKYxjemVsZhp
	fbmDNwbLfTuRkt1GJpPmkrFjnsaDuV+e6VntywsNAao8vMG3fSbUUjS/+Lv9VjI72+Q=
X-Gm-Gg: AR+sD119Ppgz3byS8sNWx2+OnNPsUHYlGFBFBo+QLi/eIZfNjueLXE4uedLCDyGFhvU
	N5alfBeLFkKgrEDo1PCLEnSnpFYm3N1GRYRfWCaYe1A9RUpno9BepWVjk1AF38MhTIB4rjwGIez
	/XwNyqIYH76uZ8ZMVKjrAOd/SDj9rZX9EmS4/E95u91qKIzBlvjTfUmhMZrybMK/aVysfw0cumk
	9dLK5ttojbL+UbAbO7TYiiQJjL4QY8rJJAtS0Z+jDjDRlkDBICLrfKpNyvQZwygcRMTnwxNceiL
	uz1qe3McyvTzn97cO3PnkN6hggayN6QIZRoEkqE22EScT940lilb/kkZqReQ6/LD887jw373/Pd
	nmgoJCs8euQTK5QgJ8WmylEdOaN6q/Bm/NcsPVnt/pDif58lmOhNM2b+iLoDa1goQPQ8x88N6cR
	dhYWlaCneRi6X5ueC3KXEvNqap9CdukjFN+WmlDv95o/TO9dnBxeAlwSYAMuhLqzlIuxgQCcMA6
	+ueeMXAjORlwXp9AQ==
X-Received: by 2002:a17:902:d483:b0:2c9:fb11:1bf4 with SMTP id d9443c01a7336-2d015ae2c72mr3010415ad.7.1785201731695;
        Mon, 27 Jul 2026 18:22:11 -0700 (PDT)
Received: from localhost (107-190-31-17.cpe.teksavvy.com. [107.190.31.17])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cfde7bbdacsm43301665ad.47.2026.07.27.18.22.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Jul 2026 18:22:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 27 Jul 2026 21:22:10 -0400
Message-Id: <DK9T753AD314.1K18DTGBR7OYN@etsalapatis.com>
Subject: Re: [PATCH bpf-next 2/3] bpf: arena: allocate the fault-in page
 outside the lock
From: "Emil Tsalapatis" <emil@etsalapatis.com>
To: "Jiayuan Chen" <jiayuan.chen@linux.dev>, <bpf@vger.kernel.org>
Cc: "Alexei Starovoitov" <ast@kernel.org>, "Daniel Borkmann"
 <daniel@iogearbox.net>, "John Fastabend" <john.fastabend@gmail.com>,
 "Andrii Nakryiko" <andrii@kernel.org>, "Eduard Zingerman"
 <eddyz87@gmail.com>, "Kumar Kartikeya Dwivedi" <memxor@gmail.com>, "Martin
 KaFai Lau" <martin.lau@linux.dev>, "Song Liu" <song@kernel.org>, "Yonghong
 Song" <yonghong.song@linux.dev>, "Jiri Olsa" <jolsa@kernel.org>, "Emil
 Tsalapatis" <emil@etsalapatis.com>, "Shuah Khan" <shuah@kernel.org>,
 "Sebastian Andrzej Siewior" <bigeasy@linutronix.de>, "Clark Williams"
 <clrkwllms@kernel.org>, "Steven Rostedt" <rostedt@goodmis.org>,
 <linux-kernel@vger.kernel.org>, <linux-kselftest@vger.kernel.org>,
 <linux-rt-devel@lists.linux.dev>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260727062521.376231-1-jiayuan.chen@linux.dev>
 <20260727062521.376231-3-jiayuan.chen@linux.dev>
In-Reply-To: <20260727062521.376231-3-jiayuan.chen@linux.dev>

On Mon Jul 27, 2026 at 2:24 AM EDT, Jiayuan Chen wrote:
> arena_vm_fault() allocated the page while holding arena->spinlock, so it
> could only use the non-blocking allocator. Once the memcg is at
> memory.max that allocation just fails, the fault turns into
> VM_FAULT_SIGSEGV, and the process gets a SIGSEGV on a perfectly valid
> arena address. Hitting memory.max is routine (e.g. page cache from
> reading a big file), so this kills innocent processes.
>
> Preallocate the page before taking the lock, like do_anonymous_page()
> does, so the allocation can sleep and go through reclaim and the OOM
> path, and return VM_FAULT_OOM on failure so the memcg OOM handler runs
> instead of a fake segfault. Also tidy up the error labels.
>
> Signed-off-by: Jiayuan Chen <jiayuan.chen@linux.dev>
> ---
>  kernel/bpf/arena.c | 83 +++++++++++++++++++++++++++++++++++-----------
>  1 file changed, 63 insertions(+), 20 deletions(-)
>
> diff --git a/kernel/bpf/arena.c b/kernel/bpf/arena.c
> index 34f023a537fe..22a41e3c53b8 100644
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
> @@ -489,55 +490,97 @@ static vm_fault_t arena_vm_fault(struct vm_fault *v=
mf)
>  	kbase =3D bpf_arena_get_kern_vm_start(arena);
>  	kaddr =3D kbase + (u32)(vmf->address);
> =20
> -	if (raw_res_spin_lock_irqsave(&arena->spinlock, flags))
> +	page =3D vmalloc_to_page((void *)kaddr);
> +	if (!page) {
> +		/*
> +		 * Preallocate outside the lock so the allocation can sleep and go
> +		 * through reclaim (both memcg and global), the way do_anonymous_page(=
)
> +		 * does. Under arena->spinlock only the non-blocking allocator is
> +		 * available, which never reclaims.
> +		 *

Can you add here that we're in process context which is why we make an
explicitly sleepable call? That also strengthens the explanation of why
we want to preallocate in the first place.

> +		 * This has to be the sleepable variant: VM_FAULT_OOM below is only
> +		 * meaningful if the OOM machinery was actually engaged. A failure
> +		 * from the non-blocking allocator engages nothing, so the fault
> +		 * would be retried forever.
> +		 */
> +		bpf_map_memcg_enter(&arena->map, &old_memcg, &new_memcg);
> +		new_page =3D bpf_map_alloc_page_sleepable(map, NUMA_NO_NODE);
> +		bpf_map_memcg_exit(old_memcg, new_memcg);
> +		if (!new_page)
> +			return VM_FAULT_OOM;
> +	}
> +
> +	if (raw_res_spin_lock_irqsave(&arena->spinlock, flags)) {
>  		/* Make a reasonable effort to address impossible case */
> -		return VM_FAULT_RETRY;
> +		fault_ret =3D VM_FAULT_RETRY;
> +		goto out_err;
> +	}
> =20
>  	page =3D vmalloc_to_page((void *)kaddr);
>  	if (page) {
> -		if (page =3D=3D arena->scratch_page)
> +		if (page =3D=3D arena->scratch_page) {
>  			/* BPF triggered scratch here; don't lazy-alloc over it */
> -			goto out_sigsegv;
> +			fault_ret =3D VM_FAULT_SIGSEGV;
> +			goto out_err_locked;
> +		}
>  		/* already have a page vmap-ed */
>  		goto out;
>  	}
> =20
> +	/*
> +	 * The lockless probe was racy: it saw a page, so nothing was
> +	 * preallocated, but the re-check under the lock finds it gone - a
> +	 * concurrent free must have run in between. There is nothing to
> +	 * install and we cannot allocate under the lock, so retry the fault
> +	 * and preallocate next time.
> +	 */
> +	if (!new_page) {
> +		fault_ret =3D VM_FAULT_RETRY;
> +		goto out_err_locked;
> +	}
> +
>  	bpf_map_memcg_enter(&arena->map, &old_memcg, &new_memcg);
> =20
> -	if (arena->map.map_flags & BPF_F_SEGV_ON_FAULT)
> +	if (arena->map.map_flags & BPF_F_SEGV_ON_FAULT) {
>  		/* User space requested to segfault when page is not allocated by bpf =
prog */
> -		goto out_sigsegv_memcg;
> +		fault_ret =3D VM_FAULT_SIGSEGV;
> +		goto out_err_locked_memcg;
> +	}

Let's hoist this further up, I don't see why we're waiting to get so
much into handling the fault before checking if we're even allowed to
do it in the first place.

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
> +		fault_ret =3D VM_FAULT_OOM;

Can you add a comment that VM_FAULT_OOM is because the only way clearing
the tree can fail is if there is a failed range allocation?

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
> +		fault_ret =3D VM_FAULT_SIGSEGV;
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
> +out_err:
> +	if (new_page)
> +		free_pages_nolock(new_page, 0);

> +	return fault_ret;

The out_err label is used only once. Can we replace the label with
the code itself, even if this means some mild duplication? Four
different labels are too many imo.

>  }
> =20
>  static const struct vm_operations_struct arena_vm_ops =3D {

pw-bot: cr
