Received: from mail-ej2-f10.google.com (mail-ej2-f10.google.com [74.125.228.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7ACA3F484D
	for <linux-kselftest@vger.kernel.org>; Fri, 21 Aug 2026 19:38:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787341117; cv=none; b=aI0HF7biQl5nPqSGVO/gAROhK9gGfLl4zGYqV0b7gHZwjLD9q2qiEERmVIxNpx3uzWYfo60PzM5hXkZI2SSZujIrTOeZ0MGWdZ/DMVMcEDDwc39ZEpivSdDwW9IwyevVHeGsfBAK30Fbgp+auBdA1pbx4m8O4yXc9zsg0jxheLM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787341117; c=relaxed/simple;
	bh=5exMekd6cq7ZbEYRVdULv/pnWTFOFgtQahn1mksCL5Q=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=SRkuyqyWn6ziuwY3fahJLl7DCGFgJY6fDOoLNfjv2BzrGiZTo9qgHGW16PxMIvSnyas3MYFDFql3GHeMM7PZjcmL5RHzkyYLua+YUAVJTz4/25D8/2YmbdQLcxlkDuB9SCtkH/flC3saGj+X5xmFojCH8otB+4RmF7sVuIAGNkU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F2fxHWZr; arc=none smtp.client-ip=74.125.228.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F2fxHWZr"
Received: by mail-ej2-f10.google.com with SMTP id a640c23a62f3a-c219353e5bbso87121566b.0
        for <linux-kselftest@vger.kernel.org>; Fri, 21 Aug 2026 12:38:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787341113; x=1787945913; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=xA4Ufzhn7RgFBDdlpRY4ipCaqygjEyBt0gBKZ9kn2Z4=;
        b=F2fxHWZr0NXb/LCo5DdM+HzzUkbJvYaeRck9v5p0v2IKJDpaLjfjtYuIQurTnyJArS
         1MfMZmqnpbTVdGXQDBTwRgmiRaqc3riaqXmzeW9IWTsKuSV0TSXFVEXNioC0AJ+jTGfm
         RyUvT/YUgRnNeWVqqIvB8pRFs619P6KZ2rvvZx1XVHndI9Uuw+dGbXgqsA42JM7+Wlaj
         cj7Rs4nNBuOXFPu3q+o+qxvF5Ux/R9p9akAYWzCsyn1jTL0YsX11OTIi6hTKCoyvg/kN
         qzLTVMJglA/j+bnVcQhdJmHs8c4CNmwKguo+Ygy8AJYupvMwuH34yFM9AD6dPGjDiVrq
         h/sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787341113; x=1787945913;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xA4Ufzhn7RgFBDdlpRY4ipCaqygjEyBt0gBKZ9kn2Z4=;
        b=lAM9hX6xrroPhMcrW6Efy0H5LtczeBUaM4Y9UAfaTEbyjhSxwKmdZXiFNkfwnwNl9A
         tQe8Umj2lQv89p9Fls0yikf0tRnhmBui+UD6cwMCHwRKDy24UsTPKpxtiuGk127mdMsq
         im8ukFEPmDMvyt3Bz4r/EmaHFQkc/2ljjzo8Bol2EzyuKLB0av3LksV2Oa5gL7UGg647
         gfJ1zoLOw8yF5f0nsNP/dTwbW5BPVQE5HeXohWjvymxUQiYfh1AgGw2cIdsVtlA+CFIB
         vAErF5aqlYN5v4FJrfdKosA/lmfzipCwZXOU6WE+PtohD3DedM1F3b2J+VSieYc23oRA
         y81w==
X-Forwarded-Encrypted: i=1; AHgh+RqH1/BwPnKSYCThnFx1+gDoe5u+HWM9ixbRvRYu/shEoqsgJCA9UzDpEspGt7CAVo6BRRNUGgU8HLKXxPXE5ds=@vger.kernel.org
X-Gm-Message-State: AFuF++nRpM6HQnBgNtTjLAsONBXkFvXKZS7vKg82mWYXrQMDLXrZF/GH
	5lT2LCojbaJNoiGkXYKOUf7F/QAVJidhwcsI/6EXJd+fMmSU0cCyA87z
X-Gm-Gg: AR+sD104VUZXpg28uUMspcG2m46G7Q0O7GfnHZbK6DzHpsDIhKS2Dnf0+YgyTepn3qc
	yg3zWiMXKSXDJlRLoBXkB2yjtluKhfMfLxyCmXVBnzgdabRAAdy+f0gyT1nTQ6lY6UvL16wN5qL
	XLafzPXytpNpUwL4OiB2wvi0Doby7kO7g69pxExaKkli5+rLhu1ssQHuZTvu7TqP+/kU2ecFxqp
	ZGZD9PP9jy5bLTG4iaJkBuPg93Gmlig4RXYi553JISpYVVeQllCTme2Tj8z/w5992kHDe6gyclV
	HR5LgRoQ1C0QOD7A6EMSI0VYbmg9dp4ZBqryWSEBCtKPAsouW8zKMU25aLNhAYs1mVLQ7EWk2GI
	Zil4jg80RYE8KP8LoPltGIqqAKB+KdGxeD8K+PcIZk7tZqifZxtM4F8uIhD09xl6mADoX20nCs4
	ztBpZ8qTarJAOKv5Dxxm+mXs9925r5CJdUjmzrsLZdPglaoP+vmhiL4CAE6oeFH9GCY8S7pNS4o
	TzefsL1GZwyPl+tEsXtbEsFzydxeDWUxQq4Fb6FR9vQED0AiP+LgXpWqOMRNyusK9wTrrZhWhaf
	tW0HKMCrc4Jj9lHyJ9Ofv5tdfR0=
X-Received: by 2002:a17:907:930a:b0:c24:680b:3944 with SMTP id a640c23a62f3a-c24925e416dmr54569566b.13.1787341112895;
        Fri, 21 Aug 2026 12:38:32 -0700 (PDT)
Received: from localhost (nat-icclus-192-26-29-3.epfl.ch. [192.26.29.3])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c245919888dsm586894466b.29.2026.08.21.12.38.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Aug 2026 12:38:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 21 Aug 2026 21:38:31 +0200
Message-Id: <DKUVJN7NQMAI.2JXLSBOGJTI1W@gmail.com>
Cc: "Roman Gushchin" <roman.gushchin@linux.dev>, "JP Kobryn"
 <inwardvessel@gmail.com>, "Shakeel Butt" <shakeel.butt@linux.dev>, "Andrew
 Morton" <akpm@linux-foundation.org>, "Andrii Nakryiko" <andrii@kernel.org>,
 "Eduard Zingerman" <eddyz87@gmail.com>, "Ihor Solodrai"
 <ihor.solodrai@linux.dev>, "Alexei Starovoitov" <ast@kernel.org>, "Daniel
 Borkmann" <daniel@iogearbox.net>, "Martin KaFai Lau"
 <martin.lau@linux.dev>, "Song Liu" <song@kernel.org>, "Yonghong Song"
 <yonghong.song@linux.dev>, "Jiri Olsa" <jolsa@kernel.org>, "Emil
 Tsalapatis" <emil@etsalapatis.com>, "Shuah Khan" <shuah@kernel.org>, "Barry
 Song" <baohua@kernel.org>, "Geliang Tang" <geliang@kernel.org>,
 <linux-kernel@vger.kernel.org>, <bpf@vger.kernel.org>,
 <linux-mm@kvack.org>, <linux-kselftest@vger.kernel.org>, "Hui Zhu"
 <zhuhui@kylinos.cn>
Subject: Re: [PATCH bpf-next v4 1/2] mm/bpf: Add bpf_proactive_reclaim
 kfuncs
From: "Kumar Kartikeya Dwivedi" <memxor@gmail.com>
To: "Andrii Nakryiko" <andrii.nakryiko@gmail.com>, "Hui Zhu"
 <hui.zhu@linux.dev>
X-Mailer: aerc 0.21.0
References: <cover.1787205002.git.zhuhui@kylinos.cn>
 <e9b2a34418919f5c3ee2b80bcb4f9d80ce6ec422.1787205002.git.zhuhui@kylinos.cn>
 <CAEf4Bza0KYB+OHpa89K16+ptUQuQDJKyxxNCyDPcgQaO1mtxjg@mail.gmail.com>
In-Reply-To: <CAEf4Bza0KYB+OHpa89K16+ptUQuQDJKyxxNCyDPcgQaO1mtxjg@mail.gmail.com>

On Fri Aug 21, 2026 at 9:12 PM CEST, Andrii Nakryiko wrote:
> On Wed, Aug 19, 2026 at 11:12=E2=80=AFPM Hui Zhu <hui.zhu@linux.dev> wrot=
e:
>>
>> From: Hui Zhu <zhuhui@kylinos.cn>
>>
>> Expose memcg proactive reclaim to sleepable BPF programs:
>> unsigned long bpf_proactive_reclaim(memcg, size);
>> unsigned long bpf_proactive_reclaim_swappiness(memcg, size, swappiness);
>>
>> They perform one reclaim pass on @memcg, like a write to memory.reclaim:
>> swap is allowed, and the anon/file balance follows the cgroup's
>> swappiness or an explicit override in [MIN_SWAPPINESS, MAX_SWAPPINESS]
>> plus SWAPPINESS_ANON_ONLY. Both go through a shared helper,
>> bpf_proactive_reclaim_pages(), which guards against reclaim recursion
>> and calls try_to_free_mem_cgroup_pages() with GFP_KERNEL and
>> MEMCG_RECLAIM_MAY_SWAP | MEMCG_RECLAIM_PROACTIVE, the same parameters
>> user_proactive_reclaim() uses, and unlike memory.reclaim they do not
>> retry until @size is reached.
>>
>> Reclaim must not recurse: try_to_free_mem_cgroup_pages() overwrites
>> current->reclaim_state on entry and NULLs it on exit, so a nested call
>> from an in-flight reclaim would corrupt the outer reclaim state (e.g.
>> MGLRU dereferences current->reclaim_state->mm_walk). Both kfuncs
>> therefore refuse to reclaim when PF_MEMALLOC is set or
>> current->reclaim_state is non-NULL. The latter check also closes the
>> window in try_to_free_mem_cgroup_pages() where reclaim_state is already
>> installed but PF_MEMALLOC is not: only a tracepoint call sits in
>> between, and while a sleepable BPF program cannot attach to the
>> tracepoint itself, it can attach to the generated trace iterator
>> function (__traceiter_mm_vmscan_memcg_reclaim_begin) via fentry.
>>
>> The kfuncs take @size in bytes; the return value is normalized to bytes
>> as well, matching the byte-based unit of bpf_mem_cgroup_usage() and
>> bpf_mem_cgroup_page_state(), so callers can mix them without manual
>> page/byte conversions.
>>
>> An out-of-range @swappiness is reported with (unsigned long)-1 instead
>> of 0, following the convention of bpf_mem_cgroup_vm_events() and
>> bpf_mem_cgroup_page_state(), as 0 cannot be told apart from a
>> successful pass that reclaimed nothing.
>>
>> Signed-off-by: Hui Zhu <zhuhui@kylinos.cn>
>> ---
>>  mm/bpf_memcontrol.c | 118 ++++++++++++++++++++++++++++++++++++++++++++
>>  1 file changed, 118 insertions(+)
>>
>> diff --git a/mm/bpf_memcontrol.c b/mm/bpf_memcontrol.c
>> index 716df49d7647..dc51868b3acf 100644
>> --- a/mm/bpf_memcontrol.c
>> +++ b/mm/bpf_memcontrol.c
>> @@ -6,6 +6,7 @@
>>   */
>>
>>  #include <linux/memcontrol.h>
>> +#include <linux/swap.h>
>>  #include <linux/bpf.h>
>>
>>  __bpf_kfunc_start_defs();
>> @@ -159,6 +160,120 @@ __bpf_kfunc void bpf_mem_cgroup_flush_stats(struct=
 mem_cgroup *memcg)
>>         mem_cgroup_flush_stats(memcg);
>>  }
>>
>> +/*
>> + * Reclaim must not recurse. try_to_free_mem_cgroup_pages() uncondition=
ally
>> + * overwrites current->reclaim_state on entry and resets it to NULL on =
exit.
>> + * So invoking it from an in-flight reclaim would clobber the outer rec=
laim
>> + * state and corrupt its accounting.
>> + *
>> + * The guards are PF_MEMALLOC and current->reclaim_state. Every reclaim
>> + * entry point marks the current task with PF_MEMALLOC for the whole
>> + * reclaim window: try_to_free_mem_cgroup_pages() and __perform_reclaim=
()
>> + * do so via memalloc_noreclaim_save(), and kswapd keeps it set for its
>> + * entire lifetime. A hook inside the reclaim path (shrink_node,
>> + * shrink_slab, ...) executes in the context of the reclaiming task, wh=
ere
>> + * current->flags already carries the flag. The page allocator, the mem=
cg
>> + * charging path and node_reclaim() rely on the same flag to avoid recl=
aim
>> + * recursion.
>> + *
>> + * reclaim_state is checked in addition because it is set slightly befo=
re
>> + * PF_MEMALLOC in try_to_free_mem_cgroup_pages(), with only a tracepoin=
t
>> + * call in between. A sleepable BPF program cannot attach to the tracep=
oint
>> + * itself, but it can attach to the generated trace iterator function
>> + * (__traceiter_mm_vmscan_memcg_reclaim_begin) via fentry, so PF_MEMALL=
OC
>> + * alone would leave that window open.
>> + *
>> + * Also, PF_MEMALLOC is set in some non-reclaim contexts (e.g. direct c=
ompaction
>> + * and vmalloc), where the kfunc conservatively refuses to reclaim as w=
ell.
>> + */
>> +static bool bpf_in_reclaim_context(void)
>> +{
>> +       return (current->flags & PF_MEMALLOC) || current->reclaim_state;
>> +}
>> +
>> +/*
>> + * Shared implementation of the proactive reclaim kfuncs: performs one
>> + * reclaim pass on @memcg with @nr_pages as the goal, allowing swap, an=
d
>> + * @swappiness as the anon/file balance override (NULL to follow the
>> + * cgroup's own swappiness setting). Returns the reclaimed amount in
>> + * bytes, keeping the byte-based unit of the kfuncs' @size argument.
>> + */
>> +static unsigned long
>> +bpf_proactive_reclaim_pages(struct mem_cgroup *memcg, unsigned long nr_=
pages,
>> +                           int *swappiness)
>> +{
>> +       unsigned long nr_reclaimed;
>> +
>> +       if (!nr_pages || unlikely(bpf_in_reclaim_context()))
>> +               return 0;
>> +
>> +       nr_reclaimed =3D try_to_free_mem_cgroup_pages(memcg, nr_pages, G=
FP_KERNEL,
>> +                                                   MEMCG_RECLAIM_MAY_SW=
AP |
>> +                                                   MEMCG_RECLAIM_PROACT=
IVE,
>> +                                                   swappiness);
>> +
>> +       return nr_reclaimed * PAGE_SIZE;
>> +}
>> +
>> +/**
>> + * bpf_proactive_reclaim - proactively reclaim memory from a memory
>> + *                         cgroup
>> + * @memcg: the target memory cgroup to reclaim from
>> + * @size:  the amount of memory to reclaim, in bytes
>> + *
>> + * Trigger one proactive reclaim pass on @memcg, similar to a write to
>> + * the memory.reclaim cgroup file: pages are reclaimed according to the
>> + * cgroup's own swappiness setting and swap is allowed. Note that,
>> + * unlike memory.reclaim, this does not retry until @size is reached;
>> + * callers can invoke it again if needed.
>> + *
>> + * The reclaim runs with GFP_KERNEL, so this function must not be calle=
d
>> + * from a context that holds a filesystem lock (e.g. an LSM hook invoke=
d
>> + * with inode_lock held): the reclaim path may enter filesystem shrinke=
rs
>> + * and deadlock trying to reacquire the lock. Contexts that set
>> + * PF_MEMALLOC_NOFS/NOIO are handled by the gfp context inheritance.
>> + *
>> + * Return:
>> + *   The amount of memory actually reclaimed, in bytes (rounded to full
>> + *   pages), or 0 if @size is smaller than a page or the calling task i=
s
>> + *   already in a reclaim/freeing context (PF_MEMALLOC).
>> + */
>> +__bpf_kfunc unsigned long bpf_proactive_reclaim(struct mem_cgroup *memc=
g,
>> +                                               unsigned long size)
>> +{
>> +       return bpf_proactive_reclaim_pages(memcg, size / PAGE_SIZE, NULL=
);
>> +}
>> +
>> +/**
>> + * bpf_proactive_reclaim_swappiness - proactively reclaim memory from a
>> + *                                    memory cgroup with an explicit
>> + *                                    swappiness
>> + * @memcg:      the target memory cgroup to reclaim from
>> + * @size:       the amount of memory to reclaim, in bytes
>> + * @swappiness: swappiness override for this reclaim pass
>> + *
>> + * Same as bpf_proactive_reclaim(), except that the anon/file reclaim
>> + * balance is controlled by @swappiness instead of the cgroup's
>> + * swappiness setting. Valid values are [MIN_SWAPPINESS, MAX_SWAPPINESS=
]
>> + * and SWAPPINESS_ANON_ONLY, which restricts reclaim to anon folios.
>> + *
>> + * Return:
>> + *   The amount of memory actually reclaimed, in bytes (rounded to full
>> + *   pages), (unsigned long)-1 if @swappiness is out of range, or 0 if
>> + *   @size is smaller than a page or the calling task is already in a
>> + *   reclaim/freeing context (PF_MEMALLOC).
>> + */
>> +__bpf_kfunc unsigned long
>> +bpf_proactive_reclaim_swappiness(struct mem_cgroup *memcg, unsigned lon=
g size,
>> +                                int swappiness)
>> +{
>> +       if (swappiness < MIN_SWAPPINESS || swappiness > SWAPPINESS_ANON_=
ONLY)
>> +               return (unsigned long)-1;
>> +
>> +       return bpf_proactive_reclaim_pages(memcg, size / PAGE_SIZE,
>> +                                          &swappiness);
>> +}
>
> I haven't followed previous discussion, so I apologize if this was
> discussed, but if not, isn't it a bit an overkill to have second
> variant just to provide optional swappiness? Valid range of swappinees
> seems to be non-negative [0, 200], that special ANON is 201, so why
> can't we defined that <0 swappiness just means no swappiness was
> provided and get away with just one kfunc?
>

I think my understanding of Shakeel's suggestion was that we only add one
bpf_proactive_reclaim() for now, if swappiness parameter is necessary we ca=
n
introduce the second API later. But given it seems Hui wants to add both, I
think it would make sense to do what Andrii said and just introduce one kfu=
nc
with the swappiness parameter now.

But Hui, please wait for Shakeel to comment before respinning again.

>> +
>>  __bpf_kfunc_end_defs();
>>
>>  BTF_KFUNCS_START(bpf_memcontrol_kfuncs)
>> @@ -172,6 +287,9 @@ BTF_ID_FLAGS(func, bpf_mem_cgroup_usage)
>>  BTF_ID_FLAGS(func, bpf_mem_cgroup_page_state)
>>  BTF_ID_FLAGS(func, bpf_mem_cgroup_flush_stats, KF_SLEEPABLE)
>>
>> +BTF_ID_FLAGS(func, bpf_proactive_reclaim, KF_SLEEPABLE)
>> +BTF_ID_FLAGS(func, bpf_proactive_reclaim_swappiness, KF_SLEEPABLE)
>> +
>>  BTF_KFUNCS_END(bpf_memcontrol_kfuncs)
>>
>>  static const struct btf_kfunc_id_set bpf_memcontrol_kfunc_set =3D {
>> --
>> 2.53.0
>>

