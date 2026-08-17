Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 046CE18A6D4
	for <linux-kselftest@vger.kernel.org>; Mon, 17 Aug 2026 02:57:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786935444; cv=pass; b=QDMqJ7kO6OJpC9avsOHFsdh+be00XFqRlZv1Q2ES/L1nCdRyN0Og6MBTMYHPdykvWPvGb3VhnYp+6k0mjTzDQahmiOJ5QLCSVpYA60yBa8PGoN2WOwvQIbptLjWBVpYshcSoDziKOJgwslauYgdPRKdYifQ96akKQqLNURTTVY0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786935444; c=relaxed/simple;
	bh=vmgaJ2oHIS6H0NlQkGJmiNI7EQuyKaNPclzqHGoDO5U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SSu8pQq583p6IyGgHjadcTa7VWoHni7aGOmip/EtQrDiH9Pfg9m1RSRJ2i8kq/fmDH2DR/d6pyRn3duCRpxza7mKwGCZPo7Px61sfoi7vN8XBhm4YewWfbyHQWTZXF/2bKMOtMPx52T/08SvZJraC+eV30m1AHKcSNxtOhF4Gmw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PwhP3eaW; arc=pass smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PwhP3eaW"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-496bb7cdf51so36134315e9.2
        for <linux-kselftest@vger.kernel.org>; Sun, 16 Aug 2026 19:57:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786935441; cv=none;
        d=google.com; s=arc-20260327;
        b=XT/PfWUEoO1X+1D1uhj2IJrzs0tAH6b1MtrXqwKmX+yDzY8U2cBkO63stCssyaUiL6
         TVODM+9hkDnCSD/HfJ1f2P77bsLdGKa0Fejw00ExAWld4ZVXvOW+9JOGfeAvP9qn4vzG
         h4XlfCXhDMIiKv7Yrofb9QJ6MedpcTn/E1wk/9pV/ZtRt8TzVDh7BpfjyYTp7e8u7k/Z
         3GabhkehoYZNbRG9LGf/HqSaNDBSCOmAD4/d/IvExzNwbFg3OM9BwyuK+m1iWBIdRA/u
         juAA9V6selSoiyoIiJRUtSrQ59WzjTvFhwfENkeH6Klom1B/TDzMKEziZhCPfqKYiR4F
         YA1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=3E9pfv5IoCCsu+3HPCYQctwF4eS0EkJccI7K/G2Hrfc=;
        fh=liOs9obYHvdpN+7T1t1N5CapC7rhjKA6qxIeuyDIx+Q=;
        b=HBYqaaC5vgddlHHf0D8LWasGiy0FZyIu/BdKMT6ES62EJkmbGj5GYjkqvM8li2IKtE
         fMrNGy1c85rewsD+KuFZYuKDG8H0lSZSYCsxE8sZU95dp2rrQQy6BwBwZDydK3c3KtQx
         P/YvLwJNkTM1mRuJDEBngXeZWX38qHmN3chFPT2rPk35w1+Q+h2UmDGfaUXYtrwjBAeR
         H4caRfxVsM7a0L6hEd7ELKi0+3xD2ilj3G0MtvIT7MZLCpdaGvKhLJWfKMgQ2B544sTu
         TjbYEEdEG9ABaNJTFNN+r+c02796FfiPZwp8d+uLoEp/VVZIq2LzscGAq9NzgADqDYlc
         FDOA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786935441; x=1787540241; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3E9pfv5IoCCsu+3HPCYQctwF4eS0EkJccI7K/G2Hrfc=;
        b=PwhP3eaW/CT3/s6iZWAUqWd39gwB3IvRRQlTpowUlQFqVJGqWATe35Ruq+5yps8ia8
         aJB6m++qE5VuqniGmClr+LHRipHztRdbCVFjhFHye/itPHbsL3P1CUa/lMGSQ9HClM8O
         0sAGEsvO1o5xHM4IGNbprpbDNQTAWPzRR+6BvbNB6Lx4o6HK4zvJTiFLpIiUxJXuJYLx
         Xe4Ppg9H7g0RQIL2rh5yMxtn+cp/puqfexCRU2g4KT/Vbtv+EpiEf9ilJ5KTVLIbw4DN
         1wTdJK/AwJZSmosrkY//XrRiV12E/6jDd/wug0Bjnn7VXZcOxXCmB/UpmhS++mYKnp1q
         dJ1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786935441; x=1787540241;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3E9pfv5IoCCsu+3HPCYQctwF4eS0EkJccI7K/G2Hrfc=;
        b=GLzG1CT4C2tsWLP1vAhPMDLt3j3+zElDUzqvz8SBzjNjlY7Olwr0pcwC+AebEc4tcl
         eOyXUTcCaAks2lk6/uSk6rro4uRupvE/H3ZtbyD9tX0PJ+0ZdtDnpjPKzKUSiqcxTBXG
         Qvsbm3wE9w7TYC53ICj89ATC6Sf7x6CfTy7ruE5eTgYRq+7uuAFfxvVoLICYPvNTmnE8
         D+9SvhthXw37/MFuiVWsCbptNMXrUUAt65/So6GwOR5oiuv6l5w+CZ2Y0YY+w2Sl7Xyf
         13uQ19icsWXjaTOzGPvHozBzeqHoNHRjXYugLhgfRPIYYbbCijke77mjccHiwmwFZen0
         XHdw==
X-Forwarded-Encrypted: i=1; AHgh+Rqi13LXOel8VMWpeq5k1b8sUYnkQ0ROVAEZ5UpC/+sgK/hAO8M2WYcqA4h0Y8jNS54kdG6P/wDC0ROSmVSXBIA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxGegWR7T/tqvC1Zvz4swom/PWIhl0bLpgss9mstm5/L+7gMc7j
	vA6GV0giD+q3Vl/Ii+QyHouL4qnlJCVuapBa4g5pKsXVZUfRuBXwGU9jwj/64K878gvVrpuXCtY
	fCJFXDPbdjrIY7cEcdfRNhtHM3ZZ5QBc=
X-Gm-Gg: AR+sD11HtTPtwhoYg9RQRH9poQbBLevr+s9hIG9+7Iejx2BXzlP8hoVGnaBFhZ4wgYx
	ZASrsrRGbSuDbb94CkoNJjFW0t8q+3Oj70u3aBxEdijWcFLUKk1Xx3RrEAhpNfmGdBV2v5ZNeW0
	JnUUMTyI9FajWLYEpaUidQo2zzChR2E1e7g3HmaAkLKVvEzuF9T5NVnK0ZSpBF0enLHVBVfmp+8
	GAKHta45fvByVhIKW5SMti94VX9Gvdtt3DLbemuFviuoSGHPxebdC+0sFLLtSzVuavJJkQfjjHX
	esJh9E4tBspBmauVWkQd1Q8GiUf41NLGFaKDfgad0C0HEUly3mpequyCDoD16m6n1WiPUxFeMjJ
	dtg==
X-Received: by 2002:a05:600c:4e13:b0:498:11b5:3ff7 with SMTP id
 5b1f17b1804b1-499879bd2e1mr332951265e9.18.1786935440695; Sun, 16 Aug 2026
 19:57:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260816142222.689624-1-kunwu.chan@linux.dev> <20260816165630.84808-1-sj@kernel.org>
In-Reply-To: <20260816165630.84808-1-sj@kernel.org>
From: KunWu Chan <kunwu.chan@gmail.com>
Date: Mon, 17 Aug 2026 10:57:09 +0800
X-Gm-Features: AcwNN1Wv4FilngBM7zb7KtysHXMyaR6NdUjrcCRsxZOtSQWQVLsk7gEZuLi0ywA
Message-ID: <CAN_Opa-aEvmx7Y0xPXHvhaOurt2-nnDMxLjGaHCdMXDsQC=2Xw@mail.gmail.com>
Subject: Re: [RFC PATCH 0/4] mm/damon/perf: add ARM SPE AUX backend
To: SJ Park <sj@kernel.org>
Cc: will@kernel.org, mark.rutland@arm.com, akpm@linux-foundation.org, 
	shuah@kernel.org, kunwu.chan@linux.dev, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org, 
	damon@lists.linux.dev, linux-mm@kvack.org, linux-kselftest@vger.kernel.org, 
	lianux.mm@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello SJ,

On Mon, Aug 17, 2026 at 12:56=E2=80=AFAM SJ Park <sj@kernel.org> wrote:
>
> Hello Kunwu,
>
> On Sun, 16 Aug 2026 22:22:17 +0800 Kunwu Chan <kunwu.chan@gmail.com> wrot=
e:
>
> > From: Kunwu Chan <kunwu.chan@gmail.com>
> >
> > This series adds an AUX trace-buffer backend to the DAMON perf
> > observability framework, enabling ARM SPE (Statistical Profiling
> > Extension) to deliver hardware-sampled access reports into DAMON's
> > existing SPSC report ring.
>
> Awesome.  Thank you for making this.  This will make DAMON be more useful=
 on
> ARM machines.

Thanks for the feedback.

>
> >
> > Patch 2 touches drivers/perf/arm_spe_pmu.c to expose the PMU matcher.
> > This change is tightly coupled with the DAMON AUX backend.  ARM SPE
> > PMU driver maintainers only need to review patch 2.
> >
> > This series is based on the Ravi's hardware-sampled access reports
> > branch [1], and depends on the perf AUX kernel-consumer RFC series [2].
> > The dependencies is not upstream yet, so this series remains RFC.
>
> Unfortunately I haven't had a time to thoroughly read the dependent patch=
es.  I
> believe the basic idea of this patch series is aligned with the ongoing D=
AMON
> extension roadmap [1], though.  That is, this series is supposed to be a =
part
> of the milestone 3.  We are currently at the near end of milestone 1, and=
 aim
> to complete milestone 2 by the time around next year's LSFMMBPF.

One clarification on the architecture: the AUX backend is intended as a
transport/front-end for damon_report_access(), rather than a separate
reporting path. spe_submit() ultimately calls
damon_report_access(&report), and the AUX path shares the same SPSC
report ring and kdamond_check_reported_accesses() consumer with the
existing overflow-callback path. The main difference is the producer
context: the overflow path enqueues from NMI context, while the AUX path
enqueues from kdamond process context.

The perf AUX kernel-consumer API is still an upstream dependency, so there
is no specific part that needs your review right now. The implementation is
already functional and tested on Kunpeng 920, and I can rebase and resend
once the dependency chain is ready and the relevant DAMON infrastructure
has landed.

Separately, the DAMON perf observability framework
(CONFIG_DAMON_PERF_OBSERVE) was developed in parallel with the AUX backend
and is already implemented. It provides the observability infrastructure
used by both the existing overflow path and the new AUX path, including
per-CPU pipeline counters, debugfs statistics, and tracepoints. This work i=
s
independent of the AUX transport, and I will post it shortly as a standalon=
e
series.

Thanks,
Kunwu

>
> I will hold review of this series for now, and take more time on making
> milestones 1 and 2 for thier planned delivery timeline.  Sorry for being =
a
> bottleneck of your work, and thanks in advance for your patience.
>
> Please feel free to let me know if you have specific parts that need my r=
eview
> right now, though.  Otherwise, please make sure this is aligned with the
> roadmap until we finish the milestone 2.  I do want ARM SPE support of DA=
MON.
>
> [1] https://lore.kernel.org/all/20260525225208.1179-1-sj@kernel.org/
>
>
> Thanks,
> SJ
>
> [...]
