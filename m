Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6634375AC4
	for <linux-kselftest@vger.kernel.org>; Thu, 12 Mar 2026 17:09:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773335366; cv=pass; b=m8+UzCMfGOWj2vph9Cp4ylKNqjQ1QlFjWl24pd3zjQ2hXAlms+w+1ZCRYrFfqPIFt+MxeQEeu9VlCC5Hp1isnVgZAzrLtEAf/LPkw3VoMu72rumxyj27bTFBn1ybfK5IxjyEhWo+805rWNrD7/xjhjigqTdkdC5hHCo8MIGrnbA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773335366; c=relaxed/simple;
	bh=ZRzJY2ObgcTB7nGTVYTG2VYI3uro3EmTYW29Zx/ZnbQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BxYTfEt0VHnCd5rO8dBkWqZdF6S61Wul49FUtCVcHzuPKCF9iBoGjPlLq8hKFAnng912GMCrjlxrh3teLISS/5LlcX9C2gRdsIr5uxAhECR3AmYaAFV/Yo304io6o/M4wxeIaT5cctPYlx1BgXPkq0Ji4dUzGTRqMJBxkAE8rCY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bCyp+KV7; arc=pass smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bCyp+KV7"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-439b94a19fdso1238643f8f.0
        for <linux-kselftest@vger.kernel.org>; Thu, 12 Mar 2026 10:09:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773335362; cv=none;
        d=google.com; s=arc-20240605;
        b=fcmZPosZyGDnaG+AU8fzJivRDLiQbNgoAFmXNaEcByhKcvt3s8fRsIXw+9nVoal25X
         titMrweyeRMvgwH3WqY7Q/bIyrSoIlO2N2/44UFGBVA/7/zBYGEFt3FuSwAy7hi7VI+6
         33wYnjsVtK584I4ViPf7OxJmcqje291CDJUiGSlJ0cWdPMlAc1s4Q4K/syjg8gTpSn6f
         gzkfTIURxhv7esBgEJE4Gj6Hl41izWgjvFrpJIYiG6oAsEBfQt3K7KbNbuCNhmeeVz9f
         TkgzJauUTTjjHIYcaUKnzslVtvN42U/fnxjleo0GxM8Ya++hlDwW8DKQhlnb0/S4vs2O
         pNyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ca7e/nulN7+L0c5qx1XkBQ2nSRx248vt+mBctdgT14A=;
        fh=Hj424uOUwvgvut9jBsvOiGyOloEeIh3+v/6s/VydCVg=;
        b=cniVFhE6dWPgTG1AqRXUvo5zHkRe+oPBHsk0Y3DUZZVukOWxeSHjVeJ24uyPZuWnVl
         g8UfmoANVRB2VAtigrcjHZTF9iRzj/gH52H/vXqf8VOKfLRQ0CzabuSf5LCRwHe+L4Pr
         /4pjnFzOgXW2wI5WqFd61MwJ/zCR9S0rvc1W1UR2hq1IlqlqWpaWimtMbGhL6YmZ0zym
         UKh/aPLgzBlWCg9V2tag5uDKYOqzOxrdA7F4E8lg64ELNtqxfFso8gcPkzP1SzTRCuSM
         jXrBlqT24wSbc63dTSCY1oTPzpsO5Q+KZdplR21UNFSurFCALUjg4sosciKLtbefNb4b
         xvuA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773335362; x=1773940162; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ca7e/nulN7+L0c5qx1XkBQ2nSRx248vt+mBctdgT14A=;
        b=bCyp+KV7oS+R9cfykWj3jq3HF9jTT0jJhVit5/EAfvfjz2LQKBrOPpMG9xv5BtC0pT
         6LnJYtutYuN5sZ7vLu7WpAlJKhifCSkD//OZ98fhmbTwXLl6et9i8eLEWKMciwmvWpxJ
         S2s30qKa8Wcek9Ed1dPjhHMsyxPP6KocKRX3aOjXK34IqCJUPpqX73rYr8k7GISxdREL
         yoLIGTgDBVt+hN9wdT+CwiBaiwFlWh+kE4PblUWFShj5MeT3EZvoIv1j0pcSflp2YYQ2
         GNwR4dSBIEY89EyajmL6PMUbMf+dso3P3OUxXBjS7FwWG8JYGGgvft276qoN3+m81d0z
         feJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773335362; x=1773940162;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ca7e/nulN7+L0c5qx1XkBQ2nSRx248vt+mBctdgT14A=;
        b=i6wS33PU8aYEa+lz+6hUREBoPn5vaYzrp2lo5uL+cX+fiMT7TG3CydCYl+9W7MEP+Z
         4n4v2ZblJFseDFnscKncdAbpT1UNJfk95KosP9VcdQYrM7VreciMamy73rsABrgiwnMz
         6MUfBzESwC6F15Z25OeaY9VaKuKQa5B2R2WlQjgAYOFpiwur1QN0nFP0ZcINqJ/VEgOA
         vXmFFHM2zs/Usl0ypuBHtPK1491Aj1sQyhozUb0X3sQ3SMn/7vmGynZRk4mi297oi6PH
         IwqZqupfVNjAadBjrLgNpeCSqX0UtLMa13SVwrIziru6UMmaA66sstnu7lxKWSSsVUYE
         M+Vg==
X-Forwarded-Encrypted: i=1; AJvYcCV1G26YQP3+oIKNPGOayTtn+zVTHQIGy2JzsF0DtGUkhHNelXqwNUmxcXOcz0MeygEfmLEJTymIzIR26QNyD4s=@vger.kernel.org
X-Gm-Message-State: AOJu0YwpN68+sLYahqTkWTissxnwqf6UnNcXAEIejnrQ24hrucX1ryj8
	0x+9now+EWTyjx7+Ql6LbZB9cl8S8tR9ob5uSm0okhdtldpOgVkD0wQfLxapxLL9tEsHSggcRhA
	yjwV4Pt2/D9uyC9d6Y73jEFEyHXEyYXR0LoYYcbU=
X-Gm-Gg: ATEYQzwPABJkfKqeuhM2Yg2+NU0sEfIS81Dzfwt7rH3dnrusZr6H9w077uJCqfQY8fD
	gLJBkLLNiTOMrlXsTARwcz+i7f4eqxNKDPSlE6XsQ6FlziMOeaEk/N44b6vyX3GjRMY+qmgpaWJ
	TXpC2WujV7MRy1vk39TofFrnv195q1v7ZIfLyB7v4xFseXq6d3AdfcRGnKEU/SOtPpHZi5aj+xR
	+FjtdLn3z8LvH/pKfi9Ytcc45n6Rg/5EBz1sO9u5NLKbdvXoOQoaiyX0iCNPSfzp4Xr/XitZThU
	MUZJtSHIuKa5xmuBEZXlouKdQqTcdrPaKUS0HUY=
X-Received: by 2002:a05:6000:230e:b0:439:cb23:9108 with SMTP id
 ffacd0b85a97d-43a04d79e04mr927872f8f.4.1773335361546; Thu, 12 Mar 2026
 10:09:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260311110523.26624-1-liwang@redhat.com> <20260311110523.26624-2-liwang@redhat.com>
 <CAJD7tkZn0LupDzCX61oQWbVvVmoMYmsnxBcHZYMjVvB58BqVqA@mail.gmail.com> <abI6jydN-XnagHmt@redhat.com>
In-Reply-To: <abI6jydN-XnagHmt@redhat.com>
From: Nhat Pham <nphamcs@gmail.com>
Date: Thu, 12 Mar 2026 10:09:10 -0700
X-Gm-Features: AaiRm51kjrVQqPg27yQDZoVwRMFondJK6sEWrnOc9MbMJI8C4UQRCAJ2TWq3o6s
Message-ID: <CAKEwX=O69LepTsB1tJO1otDziyE4Oi3PAW=jShiTxQ=Hg7dB-Q@mail.gmail.com>
Subject: Re: [PATCH 2/5] selftests/cgroup: avoid OOM in test_swapin_nozswap
To: Li Wang <liwang@redhat.com>
Cc: Yosry Ahmed <yosryahmed@google.com>, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org, akpm@linux-foundation.org, 
	Johannes Weiner <hannes@cmpxchg.org>, Michal Hocko <mhocko@kernel.org>, 
	=?UTF-8?Q?Michal_Koutn=C3=BD?= <mkoutny@suse.com>, 
	Muchun Song <muchun.song@linux.dev>, Tejun Heo <tj@kernel.org>, 
	Roman Gushchin <roman.gushchin@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 11, 2026 at 9:01=E2=80=AFPM Li Wang <liwang@redhat.com> wrote:
>
> On Wed, Mar 11, 2026 at 11:50:05AM -0700, Yosry Ahmed wrote:
> > On Wed, Mar 11, 2026 at 4:05=E2=80=AFAM Li Wang <liwang@redhat.com> wro=
te:
> > >
> > > test_swapin_nozswap can hit OOM before reaching its assertions on som=
e
> > > setups. The test currently sets memory.max=3D8M and then allocates/re=
ads
> > > 32M with memory.zswap.max=3D0, which may over-constrain reclaim and k=
ill
> > > the workload process.
> > >
> > > Raise memory.max to 24M so the workload can make forward progress, an=
d
> > > lower the swap_peak expectation from 24M to 8M to keep the check robu=
st
> > > across environments.
> > >
> > > The test intent is unchanged: verify that swapping happens while zswa=
p
> > > remains unused when memory.zswap.max=3D0.
> > >
> > > =3D=3D=3D Error Logs =3D=3D=3D
> > >
> > >   # ./test_zswap
> > >   TAP version 13
> > >   1..7
> > >   ok 1 test_zswap_usage
> > >   not ok 2 test_swapin_nozswap
> > >   ...
> > >
> > >   # dmesg
> > >   [271641.879153] test_zswap invoked oom-killer: gfp_mask=3D0xcc0(GFP=
_KERNEL), order=3D0, oom_score_adj=3D0
> > >   [271641.879168] CPU: 1 UID: 0 PID: 177372 Comm: test_zswap Kdump: l=
oaded Not tainted 6.12.0-211.el10.ppc64le #1 VOLUNTARY
> > >   [271641.879171] Hardware name: IBM,9009-41A POWER9 (architected) 0x=
4e0202 0xf000005 of:IBM,FW940.02 (UL940_041) hv:phyp pSeries
> > >   [271641.879173] Call Trace:
> > >   [271641.879174] [c00000037540f730] [c00000000127ec44] dump_stack_lv=
l+0x88/0xc4 (unreliable)
> > >   [271641.879184] [c00000037540f760] [c0000000005cc594] dump_header+0=
x5c/0x1e4
> > >   [271641.879188] [c00000037540f7e0] [c0000000005cb464] oom_kill_proc=
ess+0x324/0x3b0
> > >   [271641.879192] [c00000037540f860] [c0000000005cbe48] out_of_memory=
+0x118/0x420
> > >   [271641.879196] [c00000037540f8f0] [c00000000070d8ec] mem_cgroup_ou=
t_of_memory+0x18c/0x1b0
> > >   [271641.879200] [c00000037540f990] [c000000000713888] try_charge_me=
mcg+0x598/0x890
> > >   [271641.879204] [c00000037540fa70] [c000000000713dbc] charge_memcg+=
0x5c/0x110
> > >   [271641.879207] [c00000037540faa0] [c0000000007159f8] __mem_cgroup_=
charge+0x48/0x120
> > >   [271641.879211] [c00000037540fae0] [c000000000641914] alloc_anon_fo=
lio+0x2b4/0x5a0
> > >   [271641.879215] [c00000037540fb60] [c000000000641d58] do_anonymous_=
page+0x158/0x6b0
> > >   [271641.879218] [c00000037540fbd0] [c000000000642f8c] __handle_mm_f=
ault+0x4bc/0x910
> > >   [271641.879221] [c00000037540fcf0] [c000000000643500] handle_mm_fau=
lt+0x120/0x3c0
> > >   [271641.879224] [c00000037540fd40] [c00000000014bba0] ___do_page_fa=
ult+0x1c0/0x980
> > >   [271641.879228] [c00000037540fdf0] [c00000000014c44c] hash__do_page=
_fault+0x2c/0xc0
> > >   [271641.879232] [c00000037540fe20] [c0000000001565d8] do_hash_fault=
+0x128/0x1d0
> > >   [271641.879236] [c00000037540fe50] [c000000000008be0] data_access_c=
ommon_virt+0x210/0x220
> > >   [271641.879548] Tasks state (memory values in pages):
> > >   ...
> > >   [271641.879550] [  pid  ]   uid  tgid total_vm      rss rss_anon rs=
s_file rss_shmem pgtables_bytes swapents oom_score_adj name
> > >   [271641.879555] [ 177372]     0 177372      571        0        0  =
      0         0    51200       96             0 test_zswap
> > >   [271641.879562] oom-kill:constraint=3DCONSTRAINT_MEMCG,nodemask=3D(=
null),cpuset=3D/,mems_allowed=3D0,oom_memcg=3D/no_zswap_test,task_memcg=3D/=
no_zswap_test,task=3Dtest_zswap,pid=3D177372,uid=3D0
> > >   [271641.879578] Memory cgroup out of memory: Killed process 177372 =
(test_zswap) total-vm:36544kB, anon-rss:0kB, file-rss:0kB, shmem-rss:0kB, U=
ID:0 pgtables:50kB oom_score_adj:0
> >
> > Why are we getting an OOM kill when there's a swap device? Is the
> > device slow / not keeping up with reclaim pace?
>
> This is a good question. The OOM is triggered very likely because memcg
> reclaim can't make forward progress fast enough within the retry budget
> of try_charge_memcg.
>
> Looking at the OOM info, the system has 64K pages, so memory.max=3D8M giv=
es
> only 128 pages. At OOM time, RSS is 0 and swapents is only 96. Swap space
> itself isn't full, the charge path simply gave up trying to reclaim.
>
> The core issue, I guess, is that with memory.zswap.max=3D0, every page
> reclaimed must go through the real block device. The charge path works
> like this: a page fault fires, charge_memcg tries to charge 64K to the
> cgroup, the cgroup is at its limit, so try_charge_memcg attempts direct
> reclaim to free space. If the swap device can't drain pages fast enough,
> the reclaim attempts within the retry loop fail to bring usage below
> memory.max, and the kernel invokes OOM, even though swap space is
> technically available.
>
> Raising memory.max to 24M gives reclaim a much larger pool to work with,
> so it can absorb I/O latency without exhausting its retry budget.

Hmmm, perhaps we should change all these constants to multiples of
base page size of a system?
