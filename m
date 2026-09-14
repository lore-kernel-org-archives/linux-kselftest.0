Received: from mail-ed2-f0.google.com (mail-ed2-f0.google.com [74.125.228.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A05F937F32F
	for <linux-kselftest@vger.kernel.org>; Mon, 14 Sep 2026 18:17:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789409837; cv=none; b=XA9aATZmAttvB/DuVLtBOHeDYW5qp/XKKhrYyPork7P+o3fW939STDyq2dafskaqJLVw1oDJYYXk49YvadVdl4Pb+XC5oCf3a+ztrPLYTnBdGNo5NvIuNvLx3qV7+xerkNbnAZpWlAD1yjV7rHduHUYHtYhpGLi29eDHOXAbxbk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789409837; c=relaxed/simple;
	bh=Z6tnLZmfbZY9KJukSWtadBsrV3bxYzT97i5mms5gBBU=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=hho4vdf+lb5lk7/5ezeE56n6L5ky0d3wJW2SOxMvoN3t+WU3mO4AAgs6pY6kUcdyBFCnajS/0R6Ysmrh3dE+EUkhUSQP4XNHNMqV+osFzCiNzTuFICU3D8a58Qr4Q/wUpTVuM5pFYLfoM1w1t2W1lmMwAigTFc6Ifx/em8XCp5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ljEN20HE; arc=none smtp.client-ip=74.125.228.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ljEN20HE"
Received: by mail-ed2-f0.google.com with SMTP id 4fb4d7f45d1cf-6a8a84cf27eso2297407a12.1
        for <linux-kselftest@vger.kernel.org>; Mon, 14 Sep 2026 11:17:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789409831; x=1790014631; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=MhwZKQH3naP48pBWrsTvWrJs+Fp5fgGMTIobqvnavu8=;
        b=ljEN20HElxd9H8T1EKn4LuHkQus18lX3szBzvlm9slxRPtKIOPJ6rNRFfKffuaxnyU
         ybyDiR/1RIl6QqA1UbElBeVpnOLpYOwuH9yrBPJW6XbA/VUw8sa3ewplFAAqkZ0hLOpj
         eQpJPwQk2mikEFr5Oczfyd+l0sRywPHnFKqnN+4RjTiE48ARLt5oGtr/gkMdsfMVRfAg
         Q3FWQ0M9uSBaYcNUIV0xzMfJzECrpVQNz3ZrTtzDCcQnuWD63zeiXmrGAycM+9+QFVrv
         iPyXrlURabFvZxNgzVxQLMKF623pvmIaAsMZxbaobJlqKYikJfdKbiKTr0hfMSXBAa+m
         UlZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789409831; x=1790014631;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MhwZKQH3naP48pBWrsTvWrJs+Fp5fgGMTIobqvnavu8=;
        b=sORSFonEWeKPMNztJNJcloq/NSDtDlVG+1F+kC3QJCuNVI4BS9WYCzOZ9zog9YaEHN
         ZJ1YgogFDu+y58iT9qcTockaADWPZ2BUU4HeirZ14LkuZpZ/jlqzNYuwmhiPGQ2cPQfA
         s8/+whvgsp560zXGTqRZ6tv9xZRQryMbAXeqviay3S8rCHeudeT1UOUCz4WQGpPPel7y
         EaSpSm+SxgcrOLoHH1d4890oD9rJ93E0ZJHEqKaqJebCLNO2uzgpCxWHpgIfOomDGFEr
         NUVag2aJeDZIso2waKU+3MpdRoxckZ1gbTS/Znch5uBUvo62gm3Pych+C7Pgdmkp4PaR
         ygYg==
X-Forwarded-Encrypted: i=1; AKwUvBz4OAFFuSRaZ9rpG3iWarBzgtx9nMB8XBFcinY4k6W0qD+UbtTv3F9M+AXZZlHqOr01uLXQhm2nL9jRZ9ChtJM=@vger.kernel.org
X-Gm-Message-State: AFuF++loPbaS/UMNjVu1McehXdxEQWIYfanw7dhfv2lq3iazezFH8/kJ
	pftePj/x4s041ZvNdYxqtsyaHCejaq+qOxIpYti9fTWncK6//3k8RGBn
X-Gm-Gg: AYBFou378VII5tUKiiy+pZyBh2rOvRBtiGUEfLlRPTKKASbVSjlvrGlXDPXXgbefrGn
	N8fKFGZeNsq+G3njzeCltwVM8n5hLTPBYIh363AL9AvjBJhe0OfHI3xjS0Y8CXgsLBiK4RhmsE6
	T2KsWPOIfHONiB+hw09cd2PwIyUo95VrX/w3z4MjPv2J9CTrjrD6bmGjE0H//H2x+h6CB3guFEW
	NZmsIylImLMrBy3c8dfKsJRnw1ZQoMW9wW1wdSyEE/TVXj8yGLTuZR7RerA6OFzEaCYKo+JpDiU
	5S/KZDljOqdzDKeR/sLzPvhqJPv9ZTxO7H3V4VYdO00nl30wHhZOdg94gR/sDQ9cBnpELgU6P/L
	n0AhoLHVfqjuScUjVgfoVXMsPyU1brMkeVHx0+OegY0CyFaY8EzRch0I/URZW5yyzI84gFfnBex
	qShKPQfeeGJWD6pcUIVZDxCp3XmB0/GJOr53lPTuOCBf3E8qXKYmUoz3d7rGnHZfdgqLAiyrETj
	cd9yEwKjn5gDvtuzNror+DQYCQQK2N9BNBkzrjKWxeMz7ZSphNoTsb5f0r5CuUlJFn1NMJnLGeF
	D5vNvdHrMmP/V1RlTbGuCwaCLILtT8ZPpoNCew==
X-Received: by 2002:a05:6402:4149:b0:6a6:c4b:c92f with SMTP id 4fb4d7f45d1cf-6a9f6227feamr2295917a12.9.1789409830894;
        Mon, 14 Sep 2026 11:17:10 -0700 (PDT)
Received: from localhost (nat-icclus-192-26-29-3.epfl.ch. [192.26.29.3])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a9ba8f3ab9sm4370429a12.15.2026.09.14.11.17.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2026 11:17:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 14 Sep 2026 20:17:09 +0200
Message-Id: <DLF8UFBL6NEL.MAD9F5418DIG@gmail.com>
Cc: "Hui Zhu" <zhuhui@kylinos.cn>
Subject: Re: [PATCH bpf-next v10 1/2] mm/bpf: Add bpf_proactive_reclaim
 kfunc
From: "Kumar Kartikeya Dwivedi" <memxor@gmail.com>
To: "Hui Zhu" <hui.zhu@linux.dev>, "Roman Gushchin"
 <roman.gushchin@linux.dev>, "JP Kobryn" <inwardvessel@gmail.com>, "Shakeel
 Butt" <shakeel.butt@linux.dev>, "Andrew Morton"
 <akpm@linux-foundation.org>, "Andrii Nakryiko" <andrii@kernel.org>, "Eduard
 Zingerman" <eddyz87@gmail.com>, "Ihor Solodrai" <ihor.solodrai@linux.dev>,
 "Alexei Starovoitov" <ast@kernel.org>, "Daniel Borkmann"
 <daniel@iogearbox.net>, "Martin KaFai Lau" <martin.lau@linux.dev>, "Song
 Liu" <song@kernel.org>, "Yonghong Song" <yonghong.song@linux.dev>, "Jiri
 Olsa" <jolsa@kernel.org>, "Emil Tsalapatis" <emil@etsalapatis.com>, "Shuah
 Khan" <shuah@kernel.org>, "Barry Song" <baohua@kernel.org>, "Geliang Tang"
 <geliang@kernel.org>, <linux-kernel@vger.kernel.org>,
 <bpf@vger.kernel.org>, <linux-mm@kvack.org>,
 <linux-kselftest@vger.kernel.org>
X-Mailer: aerc 0.21.0
References: <cover.1789091855.git.zhuhui@kylinos.cn>
 <e00910f328c129fea716e9fd031dada328e60313.1789091855.git.zhuhui@kylinos.cn>
In-Reply-To: <e00910f328c129fea716e9fd031dada328e60313.1789091855.git.zhuhui@kylinos.cn>

On Fri Sep 11, 2026 at 4:20 AM CEST, Hui Zhu wrote:
> From: Hui Zhu <zhuhui@kylinos.cn>
>
> BPF programs can observe memory pressure on a cgroup (e.g. refault
> stats via bpf_mem_cgroup_page_state()), but cannot act on it:
> triggering reclaim on a chosen cgroup requires writing to
> memory.reclaim, which BPF cannot do. Add bpf_proactive_reclaim(),
> a sleepable kfunc which performs one proactive reclaim pass on a
> given memory cgroup, similar to a write to memory.reclaim but
> without retrying until the target is reached, so that when and how
> hard to reclaim is BPF policy rather than hard-coded thresholds.
>
> Since some bpf program types may be invoked while holding fs locks,
> limit the kfunc to BPF_PROG_TYPE_SYSCALL only, to avoid deadlocking
> in filesystem shrinkers on the reclaim path. A SYSCALL program can
> invoke the kfunc directly, or asynchronously from its bpf_wq or
> task_work callbacks, which run in process context and keep the
> SYSCALL program type.
>
> The reclaim target of a single call is capped at MEMCG_CHARGE_BATCH,
> following the precedent of high_work_func(), the memory.high
> workqueue fallback. Note that only the reclaim target is capped: the
> actual scanning work and its duration are not bounded. Reclaiming more
> than one batch is left to the BPF program rather than enforced by the
> kfunc: with one call per bpf_wq callback and the same work item
> requeued for the next batch, the program can also stop submitting
> batches in between, e.g. once the target cgroup is dying.
>
> Signed-off-by: Hui Zhu <zhuhui@kylinos.cn>
> ---
>  mm/bpf_memcontrol.c | 88 ++++++++++++++++++++++++++++++++++++++++++++-
>  mm/internal.h       | 10 +++---
>  2 files changed, 93 insertions(+), 5 deletions(-)
>
> diff --git a/mm/bpf_memcontrol.c b/mm/bpf_memcontrol.c
> index 716df49d7647..d8827bc388ef 100644
> --- a/mm/bpf_memcontrol.c
> +++ b/mm/bpf_memcontrol.c
> @@ -8,6 +8,8 @@
>  #include <linux/memcontrol.h>
>  #include <linux/bpf.h>
>
> +#include "internal.h"
> +
>  __bpf_kfunc_start_defs();
>
>  /**
> @@ -159,6 +161,74 @@ __bpf_kfunc void bpf_mem_cgroup_flush_stats(struct m=
em_cgroup *memcg)
>  	mem_cgroup_flush_stats(memcg);
>  }
>
> +/**
> + * bpf_proactive_reclaim - proactively reclaim memory from a memory
> + *                         cgroup
> + * @memcg: the target memory cgroup to reclaim from
> + * @size:  the amount of memory to reclaim, in bytes, clamped to
> + *         MEMCG_CHARGE_BATCH (64 pages)
> + * @swappiness: the reclaim swappiness, in the range
> + *         [MIN_SWAPPINESS, SWAPPINESS_ANON_ONLY], where
> + *         SWAPPINESS_ANON_ONLY means anon-only reclaim, or -1 to use
> + *         the memcg's own swappiness
> + *
> + * Trigger one proactive reclaim pass on @memcg, similar to a write to
> + * memory.reclaim, but without retrying until @size is reached.
> + *
> + * Only the reclaim target is capped: @size is clamped to
> + * MEMCG_CHARGE_BATCH, following the precedent of high_work_func(),
> + * the memory.high workqueue fallback, which bounds each reclaim
> + * request the same way. The actual scanning work and its duration
> + * are not bounded. To reclaim more, call this kfunc repeatedly
> + * instead of passing a larger @size.
> + *
> + * The kfunc can be called directly from a BPF_PROG_TYPE_SYSCALL
> + * program, synchronously in the context of the thread running the
> + * program, or from the bpf_wq and task_work callbacks of a SYSCALL
> + * program, which run in process context and keep the SYSCALL program
> + * type. It is registered for BPF_PROG_TYPE_SYSCALL only, because
> + * generic sleepable programs may run with filesystem locks held or
> + * in NOFS/NOIO contexts, where the reclaim path could deadlock on
> + * those locks via filesystem shrinkers.
> + *
> + * For asynchronous reclaim of more than one batch, driving the
> + * reclaim from a bpf_wq callback is recommended: call this kfunc
> + * once per callback and requeue the same work item for the next
> + * batch, instead of looping inside the callback and monopolizing a
> + * workqueue worker, and give each target memcg its own work item,
> + * as high_work_func() does with one work item per memcg. Whether
> + * to submit the next batch is up to the BPF program, which can stop
> + * at any point, e.g. once the target cgroup is dying.
> + *
> + * Return: The amount of memory reclaimed, in bytes, or 0 if @size is
> + * smaller than a page, or (unsigned long)-1 if @swappiness is out of
> + * range.
> + */
> +__bpf_kfunc unsigned long bpf_proactive_reclaim(struct mem_cgroup *memcg=
,
> +						unsigned long size,
> +						int swappiness)

I'm going to have to request one final change, sorry.

I think long is more meaningful as return value than unsigned long. It's al=
ready
restricted to MEMCG_CHARGE_BATCH. We return error for various arguments, we
should probably change to -EINVAL.

Apart from that it looks ok to me, but please, also wait for Shakeel to rev=
iew
the set before you respin v11.

> [...]
