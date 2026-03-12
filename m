Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D43183B0AE3
	for <linux-kselftest@vger.kernel.org>; Thu, 12 Mar 2026 22:42:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773355324; cv=none; b=SsVELi/3TakAD6LBouZN8qX+f4hVRy62lFw8K7/n6zYeRPE+J05C9No4CuMuCVcYWaAj9Ru0gyhSjDwECdqkRk2xKJAFmVPO0Z0xRDz1KBqHLLmiqcZR5itiOa8xBFiFRc9ICcmX7z1aQAM5GvDCTB91vR5Oy7th16U1sjTbj2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773355324; c=relaxed/simple;
	bh=HHV+jtL/hjU1db8zdC4zMLkvl9PbzMDoy2kQU0Dx+tM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nB5GwRgD9h0/eSUnu9x3pZv6OgJM3R1A45TEiv/EGSHssE9IpoE3RG/rAJTLuRf7TTWOdeVWxZEhhCbqAD1GfUS7U9nWne333eO5p19I9LDnsbMYmOYU8tmWLYyGd6Kbp8wfYGRKeMEVzZPPHWZRv5Zm6mkt8c0b+9I9x80dzTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mdT6dHHc; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mdT6dHHc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60355C2BC87
	for <linux-kselftest@vger.kernel.org>; Thu, 12 Mar 2026 22:42:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773355324;
	bh=HHV+jtL/hjU1db8zdC4zMLkvl9PbzMDoy2kQU0Dx+tM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=mdT6dHHcAt6V/CpqpRZaVALOF95EOcrXXZ784JAFN/5vX8mb8wbvdAj2GsxZ6cb0F
	 0BXeyXrEGp74j9yFwVVyz56cXYOQKCdRNuvWoODPBUdBJFFBgJ54LMDcgtGIAW5OEP
	 ZUv2Xuoah7em2JMErw7xsVJrtH5YFiQ2+9vFhtLrnlfjPKizcwBJCYVAQhVH8sa6Wr
	 v1RTI9b1UFbAJdkynr9U4lvc/CMujwmDzDDomsR9GzSV/TZPnFAyfL13nC9f5nWnQD
	 7Dpu476sZjNOlQkt7Hk3KqMwX7zC+M1qJ6zbGPxb9ccdLsJ8x13Qyv9jf+yrC4Q/4r
	 r2Xr5Bhn7ySeQ==
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-65c4152313fso2140902a12.1
        for <linux-kselftest@vger.kernel.org>; Thu, 12 Mar 2026 15:42:04 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXzbkPNWaNaV+kLSGMHv70FkowQU+AnIZ9iQWv8VCt6Qb/9lpbTSeWD67q2EMk20xZa67Kfxj7er6dkA+v0wYE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzZRmK21ZKam8qdR1UFJ7oJnzIeGEPLmzMrYJaMpVK+CIQd5C2/
	Lm/LyBHW0GN0wsuzxAksAuo5n+fkzQ3pPf6BqMTSQQ3TmVptyRpvuv4h802TmgpYZ4ZR/jwW1M2
	I6oA+U60rXvRIYNct+VO1Jpf7/QA/PmQ=
X-Received: by 2002:a17:907:94d3:b0:b94:1771:5296 with SMTP id
 a640c23a62f3a-b97651433b9mr58650466b.23.1773355323156; Thu, 12 Mar 2026
 15:42:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260312040627.55257-1-liwang@redhat.com> <20260312040627.55257-2-liwang@redhat.com>
In-Reply-To: <20260312040627.55257-2-liwang@redhat.com>
From: Yosry Ahmed <yosry@kernel.org>
Date: Thu, 12 Mar 2026 15:41:51 -0700
X-Gmail-Original-Message-ID: <CAO9r8zMzR_buk+fqJ_r6pgtdV6H=m__BDZJ3TMrVhUotghf4+w@mail.gmail.com>
X-Gm-Features: AaiRm50EiwfxZTHpWfQGcASFk7zY7F3P-3cUk_qRomA1oNgqKm5k_mkkpcGbFG8
Message-ID: <CAO9r8zMzR_buk+fqJ_r6pgtdV6H=m__BDZJ3TMrVhUotghf4+w@mail.gmail.com>
Subject: Re: [PATCH v2 2/7] selftests/cgroup: avoid OOM in test_swapin_nozswap
To: Li Wang <liwang@redhat.com>
Cc: mkoutny@suse.com, yosryahmed@google.com, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	Johannes Weiner <hannes@cmpxchg.org>, Michal Hocko <mhocko@kernel.org>, 
	Muchun Song <muchun.song@linux.dev>, Nhat Pham <nphamcs@gmail.com>, Tejun Heo <tj@kernel.org>, 
	Roman Gushchin <roman.gushchin@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 11, 2026 at 9:06=E2=80=AFPM Li Wang <liwang@redhat.com> wrote:
>
> test_swapin_nozswap can hit OOM before reaching its assertions on some
> setups. The test currently sets memory.max=3D8M and then allocates/reads
> 32M with memory.zswap.max=3D0, which may over-constrain reclaim and kill
> the workload process.
>
> Raise memory.max to 24M so the workload can make forward progress, and
> lower the swap_peak expectation from 24M to 8M to keep the check robust
> across environments.
>
> The test intent is unchanged: verify that swapping happens while zswap
> remains unused when memory.zswap.max=3D0.
>
> =3D=3D=3D Error Logs =3D=3D=3D
>
>   # ./test_zswap
>   TAP version 13
>   1..7
>   ok 1 test_zswap_usage
>   not ok 2 test_swapin_nozswap
>   ...
>
>   # dmesg
>   [271641.879153] test_zswap invoked oom-killer: gfp_mask=3D0xcc0(GFP_KER=
NEL), order=3D0, oom_score_adj=3D0
>   [271641.879168] CPU: 1 UID: 0 PID: 177372 Comm: test_zswap Kdump: loade=
d Not tainted 6.12.0-211.el10.ppc64le #1 VOLUNTARY
>   [271641.879171] Hardware name: IBM,9009-41A POWER9 (architected) 0x4e02=
02 0xf000005 of:IBM,FW940.02 (UL940_041) hv:phyp pSeries
>   [271641.879173] Call Trace:
>   [271641.879174] [c00000037540f730] [c00000000127ec44] dump_stack_lvl+0x=
88/0xc4 (unreliable)
>   [271641.879184] [c00000037540f760] [c0000000005cc594] dump_header+0x5c/=
0x1e4
>   [271641.879188] [c00000037540f7e0] [c0000000005cb464] oom_kill_process+=
0x324/0x3b0
>   [271641.879192] [c00000037540f860] [c0000000005cbe48] out_of_memory+0x1=
18/0x420
>   [271641.879196] [c00000037540f8f0] [c00000000070d8ec] mem_cgroup_out_of=
_memory+0x18c/0x1b0
>   [271641.879200] [c00000037540f990] [c000000000713888] try_charge_memcg+=
0x598/0x890
>   [271641.879204] [c00000037540fa70] [c000000000713dbc] charge_memcg+0x5c=
/0x110
>   [271641.879207] [c00000037540faa0] [c0000000007159f8] __mem_cgroup_char=
ge+0x48/0x120
>   [271641.879211] [c00000037540fae0] [c000000000641914] alloc_anon_folio+=
0x2b4/0x5a0
>   [271641.879215] [c00000037540fb60] [c000000000641d58] do_anonymous_page=
+0x158/0x6b0
>   [271641.879218] [c00000037540fbd0] [c000000000642f8c] __handle_mm_fault=
+0x4bc/0x910
>   [271641.879221] [c00000037540fcf0] [c000000000643500] handle_mm_fault+0=
x120/0x3c0
>   [271641.879224] [c00000037540fd40] [c00000000014bba0] ___do_page_fault+=
0x1c0/0x980
>   [271641.879228] [c00000037540fdf0] [c00000000014c44c] hash__do_page_fau=
lt+0x2c/0xc0
>   [271641.879232] [c00000037540fe20] [c0000000001565d8] do_hash_fault+0x1=
28/0x1d0
>   [271641.879236] [c00000037540fe50] [c000000000008be0] data_access_commo=
n_virt+0x210/0x220
>   [271641.879548] Tasks state (memory values in pages):
>   ...
>   [271641.879550] [  pid  ]   uid  tgid total_vm      rss rss_anon rss_fi=
le rss_shmem pgtables_bytes swapents oom_score_adj name
>   [271641.879555] [ 177372]     0 177372      571        0        0      =
  0         0    51200       96             0 test_zswap
>   [271641.879562] oom-kill:constraint=3DCONSTRAINT_MEMCG,nodemask=3D(null=
),cpuset=3D/,mems_allowed=3D0,oom_memcg=3D/no_zswap_test,task_memcg=3D/no_z=
swap_test,task=3Dtest_zswap,pid=3D177372,uid=3D0
>   [271641.879578] Memory cgroup out of memory: Killed process 177372 (tes=
t_zswap) total-vm:36544kB, anon-rss:0kB, file-rss:0kB, shmem-rss:0kB, UID:0=
 pgtables:50kB oom_score_adj:0
>
> Signed-off-by: Li Wang <liwang@redhat.com>
> Cc: Johannes Weiner <hannes@cmpxchg.org>
> Cc: Michal Hocko <mhocko@kernel.org>
> Cc: Michal Koutn=C3=BD <mkoutny@suse.com>
> Cc: Muchun Song <muchun.song@linux.dev>
> Cc: Nhat Pham <nphamcs@gmail.com>
> Cc: Tejun Heo <tj@kernel.org>
> Cc: Roman Gushchin <roman.gushchin@linux.dev>
> Cc: Shakeel Butt <shakeel.butt@linux.dev>
> Cc: Yosry Ahmed <yosryahmed@google.com>

Acked-by: Yosry Ahmed <yosry@kernel.org>
