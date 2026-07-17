Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F6353C81B6
	for <linux-kselftest@vger.kernel.org>; Fri, 17 Jul 2026 23:33:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784331188; cv=none; b=kF9rAkLAejLl/QwWqJ/2f1PiJXNVi480IEWT+0SSUOZoYiow53NIm2sRVGr2vlw4CkXsQvEMe+AjcJxn61C5v1jERfnZkzFc0IIzvpdTHksgkXxjH8PLQgrSCJJ81KVY8SiBfvhqLLtzbuz9HIn+DZjBfG/CCMXaKVtHUPp376k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784331188; c=relaxed/simple;
	bh=TEMdKZg4KEifG3GYYRMv7C2bXIPR7Kfr8gDF+3F+4So=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Cc:Subject:
	 References:In-Reply-To; b=u4ID4HN1DyFSpGsub1Cux56dbYFYoPcYUp+PSuT7FXGZajWe5Dn/9iGRmi42Cqn5QMPLAdNkmv+Xm0wh7LGLyOiuIVqt+pMIOD4mWff6ZjT7697ZMQUXr2OpYwOyE/ro8t2G3oMHXIuWrSzVSyfoZhup1MEPW1P0VEQoR5kaoMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=etsalapatis.com; spf=pass smtp.mailfrom=etsalapatis.com; dkim=pass (2048-bit key) header.d=etsalapatis-com.20251104.gappssmtp.com header.i=@etsalapatis-com.20251104.gappssmtp.com header.b=USfJSyRc; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=etsalapatis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=etsalapatis.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=etsalapatis-com.20251104.gappssmtp.com header.i=@etsalapatis-com.20251104.gappssmtp.com header.b="USfJSyRc"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2cacf197759so83155765ad.2
        for <linux-kselftest@vger.kernel.org>; Fri, 17 Jul 2026 16:33:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=etsalapatis-com.20251104.gappssmtp.com; s=20251104; t=1784331186; x=1784935986; darn=vger.kernel.org;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=84V6BymvtCbFj4DfL8xP1DyPKjZR0+mssoiC4CaKJs8=;
        b=USfJSyRcTFRqO6uNklw3ypC6WVQYyHwlwUC7TjBuAZagoA1aD5QGVt26A1Tq/PVnIJ
         gFOxgrT7koqhQHue919xUaCuaLntg6jJV/duclNOxcpFr1fq1saEuVS2NGkUCtAfl/E2
         26Ypii8vjMCgJYqA3kVBIITKv5vFX+MVwh5c+nGIUDShoUtdatPVqgpzus1xTEq0WGoT
         WkmJYy/pVqou7Pn3kxXvOevni3kPME7XuUVOjYAMz8ACgIynIBU1gc1Ezpg2obdMSsvz
         pQQmCGciYvEre4pXw4phSVchV2h/U5JBm3x9pjOHcFr+aLCzjyG700ImejdPmAbctBkH
         HBqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784331186; x=1784935986;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=84V6BymvtCbFj4DfL8xP1DyPKjZR0+mssoiC4CaKJs8=;
        b=VuqUM6XRw76z50WnTUKchPck52zFbQI8nqqg5NKGVadfTWyA4XyTp3aFaZKDb1/mE5
         oae/AhEJiE6nuoSCvRpwKw2QVfEzLIvHI/+cVsI8FULJ2u6L2UyVk97RnKFHm3itnMVN
         oXD/1JMFbapo1zYYockk7+7TJAlFkdbyu8oz0Zg4fxoJVsWFyXFLp6oKsBaN2WcQNOm3
         krRvOlnTSV7hYdO4SCvSoEGZx3+rF//PYVsUcXpveuwU0SiUff4bEBfi3EjREkj1Xpg2
         cMtR2XZMbNsr4KcA6R0wyCEABk2Po7bARM4GTkBuy0NZT0m6MkMOvILMHEqtSeugWCo4
         FeOQ==
X-Forwarded-Encrypted: i=1; AHgh+Rqr54ExTQ5aqSdyPYCHZykvsSX0b2a02r97WxL9xBrde4xFeJOy1pCpgzc5zsjUbey2B8QAwJjN7VBgOLDqL90=@vger.kernel.org
X-Gm-Message-State: AOJu0YxNzHd7tcnJDHVc1xyLE6+ALNq6Ur8uGwOqd1nztzUsGlptCHIy
	fFg3t3w45bVXBVNUQ1uzJ+24A3zRhuZ2jjBqGqajLtyRGSj5JlxEnt2xJ/PThQ9IbTUUK2H1dM8
	QmeGRo2dqEg==
X-Gm-Gg: AfdE7clAmIaB9gLzOIiGhZmsHAFr8zVTC2KW/DNEVGIaEQpuQiEggzIPLyjCVHiPoLZ
	W1LLBnf7uA8bxA//ycxl9HVBLTPLnLALBYCitqCIn6HNlfckORZ/nYUX2pM00Euy+K5tzOzGO4j
	aEJwD7RHYIcduR6113e54LI3A9U674395KY/H8rPH2OqOz2NWfQyGsewgcdT0mVHVDCpzImieEd
	Gc7pdszbhtiJhqmJ4zvO4eunRNxQME+YHJ4fhSoC+ejnIEHEo5L8qvkMxYbI5hLPKqs4X8xOLhn
	hhggUpHNFr5vubO+XROAunTo1oda6IhAT+/xj2i3vv45PnrrKqriu4XFivxxYFsfV+7+sGY7TiU
	xUY8GjW6jKpCkYrnZSc/yxUup5u7jNoX4MY0iBpw054V2NmCw1bgJqYlWJlw=
X-Received: by 2002:a17:903:2287:b0:2ca:b8fd:1a8f with SMTP id d9443c01a7336-2cf349c2497mr53405745ad.39.1784331185827;
        Fri, 17 Jul 2026 16:33:05 -0700 (PDT)
Received: from localhost ([2620:10d:c090:600::f5f9])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13ce2ddfb35sm9069068c88.14.2026.07.17.16.33.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Jul 2026 16:33:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 17 Jul 2026 19:33:03 -0400
Message-Id: <DK18M5FD69A2.2U0WEYWFGIBC0@etsalapatis.com>
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
Subject: Re: [PATCH bpf-next v2 2/4] bpf: Add memory usage for arena
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260717114117.350851-1-jiayuan.chen@linux.dev>
 <20260717114117.350851-3-jiayuan.chen@linux.dev>
In-Reply-To: <20260717114117.350851-3-jiayuan.chen@linux.dev>

On Fri Jul 17, 2026 at 7:37 AM EDT, Jiayuan Chen wrote:
> arena is the only map type whose map_mem_usage() still returns 0, so
> "bpftool map show" and fdinfo always showed 0 memlock for an arena no
> matter how many pages it had.
>
> Count the pages that are actually mapped into the arena: bump a counter i=
n
> apply_range_set_cb() when a page goes in and drop it in
> apply_range_clear_cb() when a page goes out, both under the arena spinloc=
k.
> map_mem_usage() then just returns nr_pages << PAGE_SHIFT.
>
> Only real data pages are counted, not the scratch page.
>
> Signed-off-by: Jiayuan Chen <jiayuan.chen@linux.dev>

Reviewed-by: Emil Tsalapatis <emil@etsalapatis.com>

>
> ---
> To sashiko:
> 1. __bpf_alloc_page::can_alloc_pages already check whether we are under l=
ock.
> 2. apply_to_page_range() does not allocate page tables here. arena_map_al=
loc() already did it.
> ---
>  kernel/bpf/arena.c | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
>
> diff --git a/kernel/bpf/arena.c b/kernel/bpf/arena.c
> index 8dbc24460890..f046e878f7ae 100644
> --- a/kernel/bpf/arena.c
> +++ b/kernel/bpf/arena.c
> @@ -55,8 +55,10 @@ struct bpf_arena {
>  	struct vm_struct *kern_vm;
>  	struct page *scratch_page;
>  	struct range_tree rt;
> -	/* protects rt */
> +	/* protects rt and nr_pages */
>  	rqspinlock_t spinlock;
> +	/* number of pages currently populated in the arena */
> +	u64 nr_pages;
>  	struct list_head vma_list;
>  	/* protects vma_list */
>  	struct mutex lock;
> @@ -196,6 +198,7 @@ static int apply_range_set_cb(pte_t *pte, unsigned lo=
ng addr, void *data)
>  	set_pte_at(&init_mm, addr, pte, pteval);
>  #endif
>  	d->i++;
> +	WRITE_ONCE(d->arena->nr_pages, d->arena->nr_pages + 1);
>  	return 0;
>  }
> =20
> @@ -231,6 +234,7 @@ static int apply_range_clear_cb(pte_t *pte, unsigned =
long addr, void *data)
>  		return 0;
> =20
>  	__llist_add(&page->pcp_llist, d->free_pages);
> +	WRITE_ONCE(d->arena->nr_pages, d->arena->nr_pages - 1);
>  	return 0;
>  }
> =20
> @@ -413,7 +417,9 @@ static int arena_map_check_btf(struct bpf_map *map, c=
onst struct btf *btf,
> =20
>  static u64 arena_map_mem_usage(const struct bpf_map *map)
>  {
> -	return 0;
> +	struct bpf_arena *arena =3D container_of(map, struct bpf_arena, map);
> +
> +	return (u64)READ_ONCE(arena->nr_pages) << PAGE_SHIFT;
>  }
> =20
>  struct vma_list {

