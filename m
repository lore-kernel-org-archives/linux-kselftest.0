Received: from mail-wm2-f6.google.com (mail-wm2-f6.google.com [74.125.225.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E888C48989F
	for <linux-kselftest@vger.kernel.org>; Sat,  5 Sep 2026 11:24:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.134
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788607502; cv=none; b=PlEWMwiHltH7ADOQKq7Opn+au0U6Dzf0MEWEdFfo4bGTp4lCLJagVKVDI9ALVMBovno1Cj60lRR4SjuFZDmlclotTzP74MXlCRHWtHJTMqL5nI9y4V+EkDY9Fwu0Y69lwAv2cy9AnUyFV5psO6Avhr9k/IYaCp5mnAI8GlyUiGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788607502; c=relaxed/simple;
	bh=B91bvzotjFUcMw1qyxQVrgtsCG6I0XEyZUoF6bsDVB0=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Cc:Subject:
	 References:In-Reply-To; b=OJa3UoAOetoaQ6tJCdTCf4R31c4KJs4XO5zPuKx20a7ml7NvgS+6eu9Kh6ESk8zlwn4w7SdEOfNatyICzuOsJ2zkH76DRdT/MAtwwNDKLZ8C5xqiIN4aIrCVXpflECyI5NNpHeL37c+6UjgfiXja2+KT/BX2St3WMehGfUrc5aU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cVRCJsT+; arc=none smtp.client-ip=74.125.225.134
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cVRCJsT+"
Received: by mail-wm2-f6.google.com with SMTP id 5b1f17b1804b1-499aaf0a723so6788515e9.1
        for <linux-kselftest@vger.kernel.org>; Sat, 05 Sep 2026 04:24:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788607495; x=1789212295; darn=vger.kernel.org;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=B91bvzotjFUcMw1qyxQVrgtsCG6I0XEyZUoF6bsDVB0=;
        b=cVRCJsT++DQEbybF00xzEUg9Q0yr/sAMl1n/W539qWwn+qjurUIB7QCXrxOjx7ezQI
         NiXTCINcAkpG44PbtbUVZ3fU1CuKM8ydHT4XlD859WRrxk61i6dwzN5S4lql+zWTFGPs
         7KBv0FnOo6wQoiuRBxuzSpyfv6MjKYg/+tHPji/4SNSkjkzBfZXIsNiFukzxyg+QlB8S
         9MLak73a4Zh+5AT2vrfCJ7HwWEYHQKYCDvUNdTOT5V7hIzUx5xtrI2I8W2fuiMtI+hey
         rFQ2O2bDUOIvCAxyyahvLmJSwFWhn2SsY9M1tpdWB3sLRbxff2PNbN9R66Tq1OixxEIC
         fhiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788607495; x=1789212295;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=B91bvzotjFUcMw1qyxQVrgtsCG6I0XEyZUoF6bsDVB0=;
        b=RI/bHVcsMWt2rtwvlmARkL4BvK57nslmJnOSWgMGJ8OGdSMSadroOFZNeVXY/HxflN
         OJ/GOzpJEBXIhzCWG+ZlNVrcanZ6pau37/59fDRBkdOYekTNqW52Z2CSE2lOI5h0zFPN
         TsuBBilSH+bjtr561/26CahwZXl9V72JQbnxVbTOkBka3/pYQEWCGndLb4cN4Z6G/XOI
         WJPxMJ0epFDBBa8z1GJxEUpZGHZQYUl+nZXqJ/fwbOhNRyTm0vMJEywGJBMgJfwk0Lqm
         i8n3LRW1BUnIZOuT5UF6jSXvC7mAEewo5itVq+7wGPQy6TZtBDNmNNkDFbdrHdaj81TB
         eGFA==
X-Forwarded-Encrypted: i=1; AKwUvBwVOiHLAkhwVwvymcsnrwjmOTsCZpYyG0I1suksH6g2MUCJHtiVvAmwE6UKSXB6j6HJCp0da11wYe0D1zynofY=@vger.kernel.org
X-Gm-Message-State: AFuF++k5fneGXaNQ7KR/dTRU1ZxPSFLuHvfS+NXo7gEjsmwLnjcYVkpd
	Q+40E66RVw6pSEEVU2LnBK9A3CpI8bKOzOZbM09el4BA1hINyDzeWUcF
X-Gm-Gg: AYBFou318RQqYMX5Y7jEKk70GVThj+HFCIGNB/1sDnMwWxD39quDsBSLPF1yO9+gYdr
	XD91iWg20BFNxmVXFOSyqGB13EiZHRQZYTlQSwyLkuDzQ4d/6/hrJk/TNgcHbalsnlz0qNI1F27
	SmkTnTahsb+vq9TChBCXHtBVHs0hmNlWOjepHmt1fnc/+yVpEDbhlwx+LNokIK36sFi11tv2f6/
	OyaQ2zTNF2cPqnCMmFFBzukksLIShUtqM7MChoFXnsxbdC/jGQww+UOaihLTL9ynJUSuQwq9uuC
	4RUiHRybHynJOJIW65TJh6qauDNtYsXB32KTqjbPCfZd5Yte5oBxtTWKQIuc5C6BI5m1X8yINHJ
	yNGLKtvhGZWZ0Z7T0LVbHT5M34L1skh5lWSAOIo06fxQjdGefZKWlfZXKJ5SG0eZjQpZL9vwUzL
	0QPZitFXOR/dbOT4iMH+3ZlbOnzOqd3cVS6W7qI/5BZ71U4wobpsT8DXYAOXvHP4tSGIRa1wHm+
	0eGYbcQVQiuFeajrNvUWge7V6yFSG2NfHzjhgPhFFq7PMNpc0pJu/87vsTb6/BEo0+NNREpJeHo
	h+6ErU0Z1EKU26nYOfKcv8TrSAA=
X-Received: by 2002:a05:600c:6306:b0:49c:f5c0:aa76 with SMTP id 5b1f17b1804b1-49cf81e366amr268925475e9.5.1788607495209;
        Sat, 05 Sep 2026 04:24:55 -0700 (PDT)
Received: from localhost (nat-icclus-192-26-29-3.epfl.ch. [192.26.29.3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cee6023d6sm225255635e9.8.2026.09.05.04.24.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 05 Sep 2026 04:24:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 05 Sep 2026 13:24:53 +0200
Message-Id: <DL7CFVDSDV92.1VPGNHDCKVVIV@gmail.com>
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
Cc: "Hui Zhu" <zhuhui@kylinos.cn>
Subject: Re: [PATCH bpf-next v7 0/2] bpf: BPF-driven proactive memcg reclaim
X-Mailer: aerc 0.21.0
References: <cover.1788516769.git.zhuhui@kylinos.cn>
In-Reply-To: <cover.1788516769.git.zhuhui@kylinos.cn>

On Fri Sep 4, 2026 at 12:20 PM CEST, Hui Zhu wrote:
> From: Hui Zhu <zhuhui@kylinos.cn>
>
> BPF programs can observe memory pressure on a cgroup (e.g. refault
> stats via bpf_mem_cgroup_page_state()), but cannot act on it:
> triggering reclaim on a chosen cgroup requires writing to
> memory.reclaim, which BPF cannot do. This series adds
> bpf_proactive_reclaim(), a sleepable kfunc performing one proactive
> reclaim pass on a target memcg, so when and how hard to reclaim is
> BPF policy rather than hard-coded thresholds.
>
> The kfunc is restricted to BPF_PROG_TYPE_SYSCALL so that reclaim
> always runs in a clean process context: generic sleepable programs
> may execute with filesystem locks held or in NOFS/NOIO contexts,
> where the reclaim path could deadlock in filesystem shrinkers. The
> bpf_wq and task_work callbacks of a SYSCALL program keep its program
> type and run in process context, so reclaim work can still be queued
> asynchronously through them, as the selftest does with bpf_wq.
>
> The use case we are looking at is protecting high-priority workloads:
> a BPF program monitors the state of a high-priority cgroup and, when
> it degrades (e.g. PSI rises or refaults increase, as in the
> selftest), asynchronously reclaims memory from low-priority cgroups
> via bpf_wq and bpf_proactive_reclaim(), giving the pressured cgroup
> more free pages.
>
> Another use case: several vendor-maintained kernels carry private
> implementations that trigger asynchronous reclaim when a memcg enters
> a certain state. These exist for historical and partly psychological
> reasons, but the underlying demand is real. We expect BPF-driven
> proactive reclaim, combined with the BPF hooks for the memory
> controller currently under discussion and development, to serve these
> needs in mainline, reducing kernel fragmentation and improving kernel
> maintainability.

From BPF perspective this looks ok to me. I saw you dropped the swappiness
argument, what happened there? I thought we agreed to just include it in th=
e
kfunc now. Did something change?
