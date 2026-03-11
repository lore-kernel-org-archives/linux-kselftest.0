Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com [209.85.222.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D68E2E88BD
	for <linux-kselftest@vger.kernel.org>; Wed, 11 Mar 2026 18:50:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773255044; cv=pass; b=YOcbULM2oZpiNO+7nFtjzVbhwUGIhfavkwNZYjn0+n+dXvKcu15u5q6zvOhYaA0p1BYvmw0LLOx/5UzK9S46Z08pOvta0g+W2ABWY2hoXMemL0cxcqFdJNB+W7Sadyi0Pow4fp2YsD2SoAS3PQ1rrZJ0336RqAbjjXW4R+ScEX0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773255044; c=relaxed/simple;
	bh=/um7rb8avWhoQq5AXYVNrgXU0PEt09pHPVXIVeI3j2Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=g4/+QIsmQioYJBbxx4WdPuCGv09bWL9VA7w+9S5YnLFudCuaIX+UhMERy8quxUuayfUbiCmC4hElK9fqGE2WZ6NL0El1cAlkgi4D+3sJpR2T8HvwQ4BjF6KtWIuC1xotZr0y4PujIRYf1JvXc+WHZtRh5gxHr0rNpNrI+Daf/nU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=oRHah9/4; arc=pass smtp.client-ip=209.85.222.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="oRHah9/4"
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-94aca174532so38549241.3
        for <linux-kselftest@vger.kernel.org>; Wed, 11 Mar 2026 11:50:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773255042; cv=none;
        d=google.com; s=arc-20240605;
        b=dd53beyYJWGe4xVD11C1yd2wO3I79dKR4NnoExiS1XKbpl1J2fvOv8NGWRR6mVVB5L
         5tfP3XIs72T1kgueq14MKS0O+kj8KTRt9mRMmHWr9kgDYoRPV+q5MNBPD7TFMOW0IEDc
         7devVZgc8KJ0S9lWqW9QfNZZBOYT2x4+mO2VH3S7qPuGZ9/zLKkO79WarOH4iLMmN27v
         uWFlO3ya2ZgIuV0a9jvceFWyJqADJXaecOAMIYzeNkoRHQcmvCIjJqPvSjTNc98OLAKS
         6a3R2wCXC4D24ILfxjqDzQJ3ozxSidScVjl+V/qh1ov/KT6MT2mdc2ihproP+R0gclwz
         frQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=r66mIKYG+KbnwaEShJpYN2fEBuSfoBa37wSopjM/Nn0=;
        fh=y9AwH/+rDfvEJUaHCSu1emqoSC0AhfY0AzO5q+VFeTA=;
        b=WtGHyHxmdiUBwIQIQTCjVN75YtGQiqRbhC9uccxSb8pvr1putZ0kEboHuEd0qlud4z
         0a1+psPnUsfqsBtF3EGJ8dGL2wuMZx0cnJcUgdvjvohysHS7fMsOzn7IMjkFoY/VU5ax
         p7HKlI2fIvOUbffc+STs4LzFgXGF8ns/+jHpGpARchjPqV+wjRF3roD3IYIpsR4tnXts
         fAhzRrEgw1hsXDpcmmLctAZIQDXzPPguf8ZeEi6PRWRBL2pFOyL6CgLo4PV4GXdxX5iq
         WJPe73SXimwGykwRYfbKay/omgSelVlsIdiFWG1JFCdaIhdkasKK5KSOhkAmMGRcLdCy
         lUfA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1773255042; x=1773859842; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r66mIKYG+KbnwaEShJpYN2fEBuSfoBa37wSopjM/Nn0=;
        b=oRHah9/4MHuSeAfx18dLWnD9bJErIkhAq7cpvJ63wtXZOfKVPDgoDSA4kdOD717LtG
         cg0frCk5m+j2m1/phOjeHbGRl8Np1Tzdv+EETCqWx62A/vfo971d1pEQpPwViwfm8wSR
         1D4WrvUf6lAgUVszbHPYy5riKu66UnbXaM2Phrbz4cfTLyHq1FF+m4Bs6GT6xVXl8GPA
         xIMMHrOYlsYrQgeALsNqG/uc+8+NvBEa/6dXiD3FwgKWVoCUU3u0d3DRCaJ8Dpmjd6E4
         bNKToY4Euj3aDJQDC1y4wg8xYbFkQEbr5x543TMq22eoXbP4YWlLZC4aE4xeXesoZeY/
         RWpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773255042; x=1773859842;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=r66mIKYG+KbnwaEShJpYN2fEBuSfoBa37wSopjM/Nn0=;
        b=Q2i0rfjkukom0iTKXPDWTVjL27LsGKuPmzq/vc5VVzD9AfO4YRSJQH9CJzgB0gGZdW
         Dmot9iELRPRq7gXrgemdz5SuBIr5xRHqueTRUT9ZEHjAMuh+GaUjXKB/SAjsx3e0wOfS
         /JRTJ9/VRAXmnIZ07ofelx5S/y5SmMMbwzF+qdh2VnoJqb3m17ae3gc+DX8+imIdqf0F
         nPAtu0N7I/FqUBELl1OpRWGoHOrGcORwgLp6nvSNMv3raT3QLfk8AU60QEtPBocmsbk5
         JYIvmLPvqOcaXbYu8O7utRk0Um4aJc7G9oBHYigLj+74PA8UH4IiBTxtImZFElJw1JH9
         7Tuw==
X-Gm-Message-State: AOJu0YxK9GjwZYJQBdlcFLJRYGRvjDBUMdEnzEqzsHIgtcRX84ZPhg59
	Hhz8aWqQIY/gd9Gbg92TX8GjLBau6Nz6jjiP2R3MPGuwPxay36a27oIwTKaJ7sbs5g9MUTQgxGA
	rPZcl5HJuz0JBz+nhTp6xXd3VKIv33mbzvlgiQ9tu
X-Gm-Gg: ATEYQzz80+nt2g//2YHrjFgr+vsz4Cwq1B6lrEWigo10p654LBPpiiRQAhGv9H5BeCy
	LYsTiVSC9u0ECkfXhPEuKoGxbwWp8otMqZLnczJQlA9k+XWXLL12kYA5TapciydkqOKqqE3h2wF
	viouGhlGhv7k3oXrTdehiO9xVSOjXYDoANzNh2brSb0u9hUqL7DbksuF40AiyPmppCMbMRMH13D
	Cfh/lINpjRdaTK13y4T59vWKAcEcvk/puwxH7w357iAJLNHgwnqDj94erV8trsWBwevwSlb4VzH
	thJa+w==
X-Received: by 2002:a05:6102:f08:b0:5ff:17bd:9e83 with SMTP id
 ada2fe7eead31-601ded47673mr1251146137.14.1773255041868; Wed, 11 Mar 2026
 11:50:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260311110523.26624-1-liwang@redhat.com> <20260311110523.26624-2-liwang@redhat.com>
In-Reply-To: <20260311110523.26624-2-liwang@redhat.com>
From: Yosry Ahmed <yosryahmed@google.com>
Date: Wed, 11 Mar 2026 11:50:05 -0700
X-Gm-Features: AaiRm53dnrbfrZ4CkFWwS9NbtEFIxlMTuazwixrF_XuGFjV87aDVkL9GjuTutnA
Message-ID: <CAJD7tkZn0LupDzCX61oQWbVvVmoMYmsnxBcHZYMjVvB58BqVqA@mail.gmail.com>
Subject: Re: [PATCH 2/5] selftests/cgroup: avoid OOM in test_swapin_nozswap
To: Li Wang <liwang@redhat.com>
Cc: linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
	akpm@linux-foundation.org, Johannes Weiner <hannes@cmpxchg.org>, 
	Michal Hocko <mhocko@kernel.org>, =?UTF-8?Q?Michal_Koutn=C3=BD?= <mkoutny@suse.com>, 
	Muchun Song <muchun.song@linux.dev>, Nhat Pham <nphamcs@gmail.com>, Tejun Heo <tj@kernel.org>, 
	Roman Gushchin <roman.gushchin@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 11, 2026 at 4:05=E2=80=AFAM Li Wang <liwang@redhat.com> wrote:
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

Why are we getting an OOM kill when there's a swap device? Is the
device slow / not keeping up with reclaim pace?
