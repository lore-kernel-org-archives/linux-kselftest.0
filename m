Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01F1F4192FC
	for <linux-kselftest@vger.kernel.org>; Thu, 30 Jul 2026 19:56:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785441382; cv=pass; b=l/WOz0hfdBzTPaR2IpafouXFHOOhAZ8EG5LlIcQeNtk9bOYG85M43IWzm6bKQ6IuUCN1EyN5rWv5bpyxNzj1jwEmsoWo5oa8lqTW8KJ0DssPruk3s/ybLuqnNVssfCjthcsQgAg1vf+geNvO22FHf0zUwppU2OuvPLvqE8KUi0U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785441382; c=relaxed/simple;
	bh=8h9uuvioLmMzyjoC2PDlkvIO7nOSrqldyopjlTG22tQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ptycYzUrqcg8BZyZcUiSGRB0PvA88uLI1ef4RxSRVihTwNpHoaB6D4TDg/eiWyrMuuMhdMmPCnfwZu9JO2qrGFq8eR9mscsmE4RffZtUB0YPFb8wxdrGWnvtormcm2pnMlGoe8cHwEEVYs0t5nnpCmAwV18Tk8Wimtugw5WiVJ4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kFAuRFFM; arc=pass smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kFAuRFFM"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-84e84a6c4bfso63361b3a.1
        for <linux-kselftest@vger.kernel.org>; Thu, 30 Jul 2026 12:56:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785441380; cv=none;
        d=google.com; s=arc-20260327;
        b=H3HSlUjM7Xoi9zl+chNTZqCphE1J0tS+Hzyzy/QNzpicMETVWk/5aLxpb8S2BG14H2
         9ItWQLCl3AH9Uyfy+txtxlkUioyvUNcEcoaHZ7U1MH/Ltzl4a2BR8aR8u+nwA00jgW+2
         tNx8kGhK7X062iaZgljgMHfXu07nQVBtdCAflbjjX4p+SwkzxrmzbWnMnwVbRMN1t3Dq
         III9w1b8riuCXuzYlLnFwlcV0C45INbvUrdXDIjsrKNTcmyGMrnRuT3NfQ08CZa8XUGw
         5HwM02UsSgO+fetIgNKFOKW3VXbSQpIqeqs0QUxCgiVd+iMFA2kaDi6nmF0kfG4PDXAu
         1Kvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=A3+RQo/HppHWztT11zWZQCBoviyZeuu95fXLxqIvMec=;
        fh=TfjAIbGcgb0wSXzp9JT0GnqXVKJNq/bW8wa1TXU0toU=;
        b=FFuu+rDdB3cgdvvZF4U/t4JbdGK8tFzaye0nc6pou4WF/zo1giKgxxCpdM7BzLj9Lf
         DWyYKkommeJmy4nhx8K5feaGwno01KTmD64L8UbXx6H/b/ahXYQdBXL2Nsp0w1JSIy2o
         gj6Zt+TqFwCb4pTpLte6yHc+uvBJiAXhLKxuO1zrsc9MTGtanBMsSr10H5aR6tYrcxCC
         gEPorbf46LLC8TYGGYIpQiF5HguLfYEyRlCfqsRiWtZbbxC6GZcQN07QNdEzPsh84a2r
         /MJ8pT8vNQrn9QnpFTXH3Zb4jtd7NUVWsYs84CpmuY0Mh2P/tn4sFA9KzTPF1CC0bajP
         kBUw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785441380; x=1786046180; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=A3+RQo/HppHWztT11zWZQCBoviyZeuu95fXLxqIvMec=;
        b=kFAuRFFMcGTtFSWlDoDw0YcOhlQeFMimBQU3AS0Lton5OG62fk3rksWzL6pIUGaesX
         d8K50qteJAawQXSX7rbD0eDnRHawW+cgKH+OuHHNnQy0uI6SBeHKWrjZbs5QyURzdZpJ
         cxaE6bzzXL9nYzTvNTFPRu6+2iX/Q2LeHWT7lIJ0I5RmGp36B4wzH0/li7HnDCtb5Dc2
         xtNyDX1x509QApVd5YpFwXwr5vDHWardXnKvTFNtwG6tFd6p32VWe+ZMilk59GgNbsI8
         UZTLTINsFtpLDxKnXWOpqNrW3CS4hA1oQ603vgqY8U95eCVv/cI8hmag3NeZut43ECU0
         nYaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785441380; x=1786046180;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=A3+RQo/HppHWztT11zWZQCBoviyZeuu95fXLxqIvMec=;
        b=I8yd6ssvnf+oNMijeRl871OcshwNURtVTxHxuzLTHGiBHyCOaH8yrAUhSZBc/pbjEm
         OnC0D/HSbeb72m50H0pi5vc+84IWHrNgbHB/4cc2PPEp1UdIG+MKngReKFTG3HPL1CG4
         FVQB2Nv0pNj6HIf0lX/gK/2m7n7v7BbXIhFm2DxuSb8x8fk8WEj2K4H5SSWHUSNNxH3n
         E0ZY11dgvIAHnrEEpn4zFuVsc8kjiOW9y1XhOWFszmqz9MhMPOKbtB+CvA1XdvxCXbah
         ITei3AiQJJEqoK9KBNxue03xDTgXqeedF1SBJAj6w7oakfvNRZz6umeWk0S+1rvRoNrM
         TaEQ==
X-Forwarded-Encrypted: i=1; AHgh+Rotf0J0KTKyY7UFDXQVWU0p0R5Gg9SAciIwgiCUqe7YmimuEmxLp+sdQFNyB3Tr0NV8WITIvyYzTPEr3g9aC1M=@vger.kernel.org
X-Gm-Message-State: AOJu0YyM4hOUuLl/P3Wy9zVlO9xD/NWK68IpupswFH7DXzDltZCANm3X
	pr5h+8ThzZqjH2+5o6Yrtzsfi4Wdf0URb4XwSRDEFbTBlNt0cgGD3Mr/iko+6heiWQ2QXwONgZt
	D/Bq2z9qxahmzroq4K+HjveAYHoS/6a8=
X-Gm-Gg: AR+sD139zHUrGBubA3pcr+PoAU2jYdbm06Zyc5pIbhFxTs0K4tYkKJ0df0rJ+Gt/Rvf
	vwvGjPrklU92w9BKoZQKaARXyECGr2BYptgWM5ACIJAibgaZQu5UBtWkdqCNaqCTSEWBCOuF8cz
	FwgHj0MlGcJhSWeYlunABHzKBbRhI9yExLzVG1rehFeSWeoPASXgudHj6cuQqA3KAeljCSRt7eW
	3Mn2Dnfg6N5vbCn15/pEWYg3AF71L5tGSjbKkGygOzY8Q+yQIL1hKqIZA7fZyEB4dLKewbKMWTm
	uMw5nwsT0IIvebplvN/yPa7IOSUepe82om6bMl/cMB9uIgjQ2Hgg2O0WJkiv3E2vuCLNhVwU2/q
	oYI8+Z6AvztC5SMvtenRwjiE9JgK67sO+p5H3Ms+l9g==
X-Received: by 2002:a05:6a00:b53:b0:845:df5c:2567 with SMTP id
 d2e1a72fcca58-84eca755270mr1251616b3a.25.1785441380230; Thu, 30 Jul 2026
 12:56:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260616155716.2631508-1-puranjay@kernel.org> <20260616155716.2631508-2-puranjay@kernel.org>
In-Reply-To: <20260616155716.2631508-2-puranjay@kernel.org>
From: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Date: Thu, 30 Jul 2026 12:56:03 -0700
X-Gm-Features: AUfX_myauPf-9BUS4q5KaEKx2Sh46ySRXTd0ms5asoEI3-_AoZYC3_ia32CZLHo
Message-ID: <CAEf4BzakTaTr16F4xRF4wti46Gfq7Csky=drai=aE_aUSOFbTQ@mail.gmail.com>
Subject: Re: [PATCH v5 1/4] perf/core: Fix sched_task callbacks for CPU-wide
 branch stack events
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>
Cc: bpf@vger.kernel.org, Puranjay Mohan <puranjay@kernel.org>, 
	Puranjay Mohan <puranjay12@gmail.com>, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, John Fastabend <john.fastabend@gmail.com>, 
	Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>, 
	Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Leo Yan <leo.yan@arm.com>, Rob Herring <robh@kernel.org>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	James Clark <james.clark@linaro.org>, Ian Rogers <irogers@google.com>, 
	Adrian Hunter <adrian.hunter@intel.com>, Shuah Khan <shuah@kernel.org>, 
	Breno Leitao <leitao@debian.org>, Ravi Bangoria <ravi.bangoria@amd.com>, 
	Stephane Eranian <eranian@google.com>, Kumar Kartikeya Dwivedi <memxor@gmail.com>, Usama Arif <usama.arif@linux.dev>, 
	linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
	kernel-team@meta.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 16, 2026 at 8:57=E2=80=AFAM Puranjay Mohan <puranjay@kernel.org=
> wrote:
>
> perf_pmu_sched_task() returns early when cpuctx->task_ctx is non-NULL,
> deferring to perf_ctx_sched_task_cb() in the context sched_in/out
> paths. But perf_ctx_sched_task_cb() only walks the task context's
> pmu_ctx_list -- PMUs that have only CPU-wide events are not on that
> list and their sched_task callback is silently skipped.
>
> On ARM64 with CPU-wide branch recording:
>
>   perf record -b -e cycles -a -- ls
>
> armv8pmu_sched_task() is skipped whenever the scheduled task has an
> unrelated perf event (e.g. a software event), and branch records leak
> across task boundaries.
>
> A second problem exists in __perf_pmu_sched_task(): it passes
> cpc->task_epc directly to pmu->sched_task(), but task_epc is NULL for
> PMUs with only CPU-wide events. When perf_pmu_sched_task() does reach
> the loop (because cpuctx->task_ctx is NULL), this causes a NULL
> pointer dereference:
>
>   Unable to handle kernel NULL pointer dereference at virtual address 00[=
.]
>   PC is at armv8pmu_sched_task+0x14/0x50
>   Call trace:
>     armv8pmu_sched_task+0x14/0x50 (P)
>     perf_pmu_sched_task+0xac/0x108
>     __perf_event_task_sched_out+0x6c/0xe0
>
> Fix both:
>
>  - Remove the blanket early return in perf_pmu_sched_task() when
>    cpuctx->task_ctx is set. Instead, skip individual CPCs that have a
>    task_epc (those are handled by perf_ctx_sched_task_cb()). CPCs
>    without a task_epc are CPU-only and must be handled here.
>
>  - Fall back to &cpc->epc in __perf_pmu_sched_task() when task_epc is
>    NULL, so the callback always gets a valid pmu_ctx.
>
> Fixes: bd2756811766 ("perf: Rewrite core context handling")
> Signed-off-by: Puranjay Mohan <puranjay@kernel.org>
> ---
>  kernel/events/core.c | 17 +++++++++++++----
>  1 file changed, 13 insertions(+), 4 deletions(-)
>

This looks like perf core bug fix, Peter/Ingo, would you like to take
this directly into your tip/perf/urgent tree?


> diff --git a/kernel/events/core.c b/kernel/events/core.c
> index 6d1f8bad7e1c..6604f6e8f352 100644
> --- a/kernel/events/core.c
> +++ b/kernel/events/core.c
> @@ -3906,7 +3906,8 @@ static void __perf_pmu_sched_task(struct perf_cpu_p=
mu_context *cpc,
>         perf_ctx_lock(cpuctx, cpuctx->task_ctx);
>         perf_pmu_disable(pmu);
>
> -       pmu->sched_task(cpc->task_epc, task, sched_in);
> +       pmu->sched_task(cpc->task_epc ? cpc->task_epc : &cpc->epc,
> +                       task, sched_in);
>
>         perf_pmu_enable(pmu);
>         perf_ctx_unlock(cpuctx, cpuctx->task_ctx);
> @@ -3919,12 +3920,20 @@ static void perf_pmu_sched_task(struct task_struc=
t *prev,
>         struct perf_cpu_context *cpuctx =3D this_cpu_ptr(&perf_cpu_contex=
t);
>         struct perf_cpu_pmu_context *cpc;
>
> -       /* cpuctx->task_ctx will be handled in perf_event_context_sched_i=
n/out */
> -       if (prev =3D=3D next || cpuctx->task_ctx)
> +       if (prev =3D=3D next)
>                 return;
>
> -       list_for_each_entry(cpc, this_cpu_ptr(&sched_cb_list), sched_cb_e=
ntry)
> +       list_for_each_entry(cpc, this_cpu_ptr(&sched_cb_list), sched_cb_e=
ntry) {
> +               /*
> +                * PMUs with per-task events are handled by
> +                * perf_ctx_sched_task_cb() via perf_event_context_sched_=
in/out
> +                * when a task context is active.
> +                */
> +               if (cpuctx->task_ctx && cpc->task_epc)
> +                       continue;
> +
>                 __perf_pmu_sched_task(cpc, sched_in ? next : prev, sched_=
in);
> +       }
>  }
>
>  static void perf_event_switch(struct task_struct *task,
> --
> 2.53.0-Meta
>
