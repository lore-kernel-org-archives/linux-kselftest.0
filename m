Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C10F3955CD
	for <linux-kselftest@vger.kernel.org>; Fri, 17 Jul 2026 23:32:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784331155; cv=none; b=tbDj0FPZ/MWasG+zzdNybEpeGxRZPTM/8wfLu/0CzbKmSZH61wZjHLlsonREiAV+8rGXannbdpAUJDrO6GPQIcwy4aWom1NLXwJQwbQceb0uzHZ0noui04hMF3cHPJsiRybT/c0JQ28X2yw+33RGbGgri9A1lJOr7XvFi/pAb5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784331155; c=relaxed/simple;
	bh=u5/8i9EL/zTT/PkAagShk6updmC8nt5CAhIUDvqMV/0=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:Cc:
	 References:In-Reply-To; b=USJsSa1u7jNYLN6npNHSuRS6H0RiRi3nwdFx+M5XY5rpUFcqzjXkqRMfaFHbTfwmBOpy7xDAZMKsFSUXPO72YWyXDZX1Xknr16IU6uvLRT5JjIg89CtqS5q73kKdsNWpsMn94OuU4b0KGDG0XX/Nr9aOFpH5rhavnk8cJ9tZeuI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=etsalapatis.com; spf=pass smtp.mailfrom=etsalapatis.com; dkim=pass (2048-bit key) header.d=etsalapatis-com.20251104.gappssmtp.com header.i=@etsalapatis-com.20251104.gappssmtp.com header.b=YoZ/iLQF; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=etsalapatis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=etsalapatis.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=etsalapatis-com.20251104.gappssmtp.com header.i=@etsalapatis-com.20251104.gappssmtp.com header.b="YoZ/iLQF"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-3856d6fbcb3so4495257a91.2
        for <linux-kselftest@vger.kernel.org>; Fri, 17 Jul 2026 16:32:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=etsalapatis-com.20251104.gappssmtp.com; s=20251104; t=1784331154; x=1784935954; darn=vger.kernel.org;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=hecXEwthW5UhpI1rZJUqjzexYnMj86IiovIkDq4y2s8=;
        b=YoZ/iLQFIi8FwXRKQYx+m8ntf2DWDB8nahPjbXR+QOE9HV9vVOwSYeMSEQIpf1a74b
         T6JTe0WoVCFnnS7LffcLxiob1hIEwxMJl38mWeF/6JkHCi/Lxz4O0l2nIBtBVotxidA7
         QMeUgYXE9agfIk7UWWUVAM61Lh6BDnR16JF7xiYVTjAJmE+FELhgG3T3PJwYKzLZ0+03
         dfQOongh2LL4A6rWK5Pz5O/VBo1P+UMfUTY7Qe/739mYtK0Znt+G1nnr6Jt99Un1mTR1
         mSF6HqLJ/52Nimdp+UI2TV6Uf7+f08y2iZMBC4TcyEayIerCq6IfBsjL/7l814zguikz
         fZFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784331154; x=1784935954;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hecXEwthW5UhpI1rZJUqjzexYnMj86IiovIkDq4y2s8=;
        b=DIAGe/ElpGw1ItfcUV2+5fXQLy6h2SfIQ9XCwdtSFslZcsbHyjMv6T1alHRej6h372
         +KZ+BLDCKPxTj6wuAL97Tnjhtu+U4v2MZhyqLEXSbj0MTy0G4gLF+Q9i2N2/DFwkuM9y
         bF7naHN8fF0SVWJveKHOWEGLOAjo3zFbPgi7rbQKLyQ7djcAbP1HcNSdXBujAYwVLG1S
         YQEAZX8BBsH6kt9jAfcdvUtBsqgxrLFRpI8ga4NCUrYvfNlePypuXhKszjkkT20TqH31
         VQu7Iyi6cRbUdFHao8PAYDeCOjTHmUiZ+Fy1LcE7YG3eSCIy2Tiad+0xLEck8fQ8/WvW
         Lm1A==
X-Forwarded-Encrypted: i=1; AHgh+RpJRbNQEU36VFfneMIvGpZk+MS4V1RaL40ZizBvKK+UM1bjpiWy5q2/HYZlPTbsI530yjZw6LNHLDU1t52E/ng=@vger.kernel.org
X-Gm-Message-State: AOJu0YyiCG2kmKCBO1bnz9f7tjtHa/alLIjHWTVS0vNRqBYHBkvQv7KF
	x9O+2JsXRzKrY0ueDTPthTm1EPEo3uKh9iMuDwF3cxALBVlcgpa4BaEavfvbwyfzA5Y=
X-Gm-Gg: AfdE7ckFGuyyeZfRB7A/XfXWFWKPLcR9Aw2OG4un4p5+v6ZvIo8CMOz6/cjbd3zTwrr
	VGpbnVcQ/mkpTKu2YacYI4XQ87b0F4hozXGc39ZXkKs9a/fK1JLK5PTASGO+q8glBHxTFeS281T
	mQKglFyht0Y2yGdSm1/5+BU5KWaoKUaWg1i3BO580reCAcSUCoxvXecviK3/q29hKrXo0BKbQqA
	pOKjkiEgAPGrfPm8mX0NlJ5a5IPSdKF1lD10kZb1WKBK086dDarmsTWDjS4Kz/azyvllsHt556z
	IMQW/skOt9Ae16vkJJoIJg5Y0ccN5e6Ly8UV4M5ZeRGEGlmmdnoQmjvJbLNPmr+oRuyzVyO8pdr
	DCIlhA8Fa3+FOZi7mR3+Reo099rTspAqjldYvmFDu4DneIuYE4GLiGWPG9ss=
X-Received: by 2002:a17:90b:1dce:b0:38e:6dd:a9ad with SMTP id 98e67ed59e1d1-38e4b26eb48mr5005205a91.0.1784331153572;
        Fri, 17 Jul 2026 16:32:33 -0700 (PDT)
Received: from localhost ([2620:10d:c090:600::f5f9])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3142a1bb770sm12047549eec.16.2026.07.17.16.32.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Jul 2026 16:32:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 17 Jul 2026 19:32:30 -0400
Message-Id: <DK18LQHQ127K.1AKZKD9UWPWQ2@etsalapatis.com>
Subject: Re: [PATCH bpf-next v2 1/4] bpf: Pass arena instead of scratch_page
 to the pte callbacks
From: "Emil Tsalapatis" <emil@etsalapatis.com>
To: "Jiayuan Chen" <jiayuan.chen@linux.dev>, <bpf@vger.kernel.org>
Cc: "Alexei Starovoitov" <ast@kernel.org>, "Daniel Borkmann"
 <daniel@iogearbox.net>, "Andrii Nakryiko" <andrii@kernel.org>, "Eduard
 Zingerman" <eddyz87@gmail.com>, "Kumar Kartikeya Dwivedi"
 <memxor@gmail.com>, "Martin KaFai Lau" <martin.lau@linux.dev>, "Song Liu"
 <song@kernel.org>, "Yonghong Song" <yonghong.song@linux.dev>, "Jiri Olsa"
 <jolsa@kernel.org>, "Emil Tsalapatis" <emil@etsalapatis.com>, "Shuah Khan"
 <shuah@kernel.org>, "Woojin Ji" <random6.xyz@gmail.com>, "Puranjay Mohan"
 <puranjay@kernel.org>, "Saket Kumar Bhaskar" <skb99@linux.ibm.com>, "Ihor
 Solodrai" <ihor.solodrai@linux.dev>, <linux-kernel@vger.kernel.org>,
 <linux-kselftest@vger.kernel.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260717114117.350851-1-jiayuan.chen@linux.dev>
 <20260717114117.350851-2-jiayuan.chen@linux.dev>
In-Reply-To: <20260717114117.350851-2-jiayuan.chen@linux.dev>

On Fri Jul 17, 2026 at 7:37 AM EDT, Jiayuan Chen wrote:
> Replace the scratch_page field in the pte-callback data with the arena
> pointer; later patches use other arena fields from these callbacks. No
> functional change.
>
> Signed-off-by: Jiayuan Chen <jiayuan.chen@linux.dev>

Reviewed-by: Emil Tsalapatis <emil@etsalapatis.com>

> ---
>  kernel/bpf/arena.c | 17 ++++++++---------
>  1 file changed, 8 insertions(+), 9 deletions(-)
>
> diff --git a/kernel/bpf/arena.c b/kernel/bpf/arena.c
> index 80b7b8a69446..8dbc24460890 100644
> --- a/kernel/bpf/arena.c
> +++ b/kernel/bpf/arena.c
> @@ -143,14 +143,14 @@ static long compute_pgoff(struct bpf_arena *arena, =
long uaddr)
>  }
> =20
>  struct apply_range_data {
> +	struct bpf_arena *arena;
>  	struct page **pages;
> -	struct page *scratch_page;
>  	int i;
>  };
> =20
>  struct clear_range_data {
> +	struct bpf_arena *arena;
>  	struct llist_head *free_pages;
> -	struct page *scratch_page;
>  };
> =20
>  static int apply_range_set_cb(pte_t *pte, unsigned long addr, void *data=
)
> @@ -180,7 +180,7 @@ static int apply_range_set_cb(pte_t *pte, unsigned lo=
ng addr, void *data)
> =20
>  		if (pte_none(old))
>  			continue;
> -		if (WARN_ON_ONCE(pte_page(old) !=3D d->scratch_page))
> +		if (WARN_ON_ONCE(pte_page(old) !=3D d->arena->scratch_page))
>  			return -EBUSY;
>  		ptep_get_and_clear(&init_mm, addr, pte);
>  		flush_tlb_before_set(addr);
> @@ -227,7 +227,7 @@ static int apply_range_clear_cb(pte_t *pte, unsigned =
long addr, void *data)
>  	 * scratches its PTE. A later bpf_arena_free_pages() over that range wa=
lks
>  	 * here. Without the skip, scratch_page would be freed.
>  	 */
> -	if (page =3D=3D d->scratch_page)
> +	if (page =3D=3D d->arena->scratch_page)
>  		return 0;
> =20
>  	__llist_add(&page->pcp_llist, d->free_pages);
> @@ -506,8 +506,7 @@ static vm_fault_t arena_vm_fault(struct vm_fault *vmf=
)
>  	if (ret)
>  		goto out_sigsegv_memcg;
> =20
> -	struct apply_range_data data =3D { .pages =3D &page, .i =3D 0,
> -					 .scratch_page =3D arena->scratch_page };
> +	struct apply_range_data data =3D { .arena =3D arena, .pages =3D &page, =
.i =3D 0 };
>  	/* Account into memcg of the process that created bpf_arena */
>  	ret =3D bpf_map_alloc_pages(map, NUMA_NO_NODE, 1, &page);
>  	if (ret) {
> @@ -696,8 +695,8 @@ static long arena_alloc_pages(struct bpf_arena *arena=
, long uaddr, long page_cnt
>  		bpf_map_memcg_exit(old_memcg, new_memcg);
>  		return 0;
>  	}
> +	data.arena =3D arena;
>  	data.pages =3D pages;
> -	data.scratch_page =3D arena->scratch_page;
> =20
>  	if (raw_res_spin_lock_irqsave(&arena->spinlock, flags))
>  		goto out_free_pages;
> @@ -873,8 +872,8 @@ static void arena_free_pages(struct bpf_arena *arena,=
 long uaddr, long page_cnt,
>  	range_tree_set(&arena->rt, pgoff, page_cnt);
> =20
>  	init_llist_head(&free_pages);
> +	cdata.arena =3D arena;
>  	cdata.free_pages =3D &free_pages;
> -	cdata.scratch_page =3D arena->scratch_page;
>  	/* clear ptes and collect struct pages */
>  	apply_to_existing_page_range(&init_mm, kaddr, page_cnt << PAGE_SHIFT,
>  				     apply_range_clear_cb, &cdata);
> @@ -981,8 +980,8 @@ static void arena_free_worker(struct work_struct *wor=
k)
>  	bpf_map_memcg_enter(&arena->map, &old_memcg, &new_memcg);
> =20
>  	init_llist_head(&free_pages);
> +	cdata.arena =3D arena;
>  	cdata.free_pages =3D &free_pages;
> -	cdata.scratch_page =3D arena->scratch_page;
>  	arena_vm_start =3D bpf_arena_get_kern_vm_start(arena);
>  	user_vm_start =3D bpf_arena_get_user_vm_start(arena);
> =20

