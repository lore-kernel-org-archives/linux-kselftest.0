Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792540957;
	b=Ws7IWwVEJIuyJPj0yB7T8pczCoEtzglUY05LS5Jc4Sd/Zvx0OUMrMA82UP831MTzNCkk
	 9PjOnY1p4jWBy2KGbSELe8SPZaV0zoroZ/b6rApC3pkw5tCbKk0l5/zGfPWKj0Qti7FPD
	 9S6HEUbEvr+pRpy4dod62bgEJYy7EAl24OVBNe+c3JEDfLXrIq71/I4n3xVavwp/oiz0F
	 +6zjsoY4SG3bt5lWFnvJp0vsJv9HUN8jz9RV/+gXehtx0LUsD38LXR7wqflTiXrkg1xoN
	 X04EgaMKREdZFSC372wok2oxEVAFXrqtFhCcxQZNq/0xKh9I0vQ0f8UFW9KyE00oY6w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792540957;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Content-Type:Date:Message-Id:From:To:Cc:Subject:In-Reply-To:
	 References:X-Mailer:Content-Transfer-Encoding:MIME-Version;
	bh=hZI2ljhmwoJ1V0BWfNbx3ZiTpuPjJL0odwQu02UU2Cg=;
	b=UWq2X6CWj0IGH+2Wfa6VmG4AM32Fza4RlIAZs2qQRYLUB7Ze6ojC7ocsbZ2L3DnqAC1C
	 44NHi8vmXZH4sEEZyVrt/34NsVEpb26gOKjxeHiFNBsh3KJvqgl6m6aUGbm/lANl02m/l
	 CBfuIOejxNfLppdnN50fc950jd20lRvUcVxL7JTmEv3NlxhCiAba9/ItXKwZddZyeYdun
	 +1saVO1eq6C4wveVIrkL2ARsuFMCl+lbwU8yZH9FKUyr18yaZR++xMaJa9MXW4Rb4hYSZ
	 uNRrQfvAjCBzjs3+Z2Q2DSWs6mw5YQw2IqpXV4XfQJgSY6c2seLX2c6Zzpx/rMe/WTA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=s6j2cGoj;
	arc=none smtp.remote-ip=209.85.215.177
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10C49606A323
	for <linux-kselftest@vger.kernel.org>; Wed, 21 Oct 2026 00:02:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 10C49606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=s6j2cGoj
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-cc4aa0246b7so26389a12.3
        for <linux-kselftest@vger.kernel.org>; Tue, 20 Oct 2026 17:02:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792540956; x=1793145756; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:references:in-reply-to
         :subject:cc:to:from:message-id:date:content-type:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hZI2ljhmwoJ1V0BWfNbx3ZiTpuPjJL0odwQu02UU2Cg=;
        b=s6j2cGojYGSaduWgRZnY74y1Mj7EaQAS2MUqAPbrCO81gc8UTnFk6EjOfGEN3H7r3Z
         4TwnXQqIrX4MlWzuOxgktI19j8uLAvX5Uxrww16C44hZHTkikR81UVcRGXtjjYUf71/l
         CMigxG0Rx0SlEjMYji7Ka/Iu3IKAzLsXV6YHrXZ0oGnl2mm+pMELJr8ENEIKM1TpEquJ
         1Ug4O3bKF5amZKyggPnan6da/B7WSHi+GpXzLLZL6dHTOSCf7llHmJXrcKlfHZsOpLrS
         IUA1yQqWtE5Vz+w5FvQhPq2oVS9DK1rI3IEZyOp8tIUbPc9bYvkW7uSvJ29zHKfE/NG9
         cidQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792540956; x=1793145756;
        h=mime-version:content-transfer-encoding:references:in-reply-to
         :subject:cc:to:from:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hZI2ljhmwoJ1V0BWfNbx3ZiTpuPjJL0odwQu02UU2Cg=;
        b=bxeJ06foryZNOMIzFvKoAx/Tk3Z5CDlcrwCslWf2lpKz40kUrkFuCUEtsAc/4OfpcX
         wl0gT3v8eDEopShM0OqMgIzOFwQntXs5GTH201k1SdC2cOoYeauy5EpAffe5vtBJxNq7
         wyBgU0f+KtfDIucjiQ9GU2GuQ3gpdGU7g9z103L9ds2aqfh6Ep5PMOzdE5H//1sDo+h4
         c3IDEeCH6qm+8EjFoBA9aFHDtdID5aCSYAob9DhJupiME5iFCLE4E7w1QqiAjTksM+g/
         csMPnjSXfZjw9qGX1sSTnSp4E7Iw2GKFm9rw+87X9I7No634ng7aFaiqfdHZ1PIUPPTH
         h51A==
X-Forwarded-Encrypted: i=1; AKwUvBw1m7oJzdIz9lVhcRav7SYuT+S6Jfkiq9GM5BXumRCzX3czRxP6jGy8VAyYccpEWuAkpJZJFQIk+J1uIMJh/Yw=@vger.kernel.org
X-Gm-Message-State: AFq9FYIN2RiAXP8/r3PPFeFjFhMXx0QtlyhiMObwbxHfjOAXp722ila1
	X5pu8FWrdQPuAks1Gh0tJ5Xb7iLxCE5khpngFXDTXJpZyOZ4KHwrOhqG
X-Gm-Gg: AYBFou2SFZaXHoYiSIYUa9E6X9RjLeFjQ6qRFykzhH+YXWhzyd4+0Dp+lbRnVdrDgmK
	SIli4Rsl0YKjX4WQoRBBesMBzUnzKexnfvTkBFsHvbpHNFgk7jL5pevYoQSqJC/Y1KsKFNbwaQs
	zBpHMRxI5jI60Axe5BOaUyT4RlecxC7UBk4xGGo0wE0xzBJ61zc9w3hc34wh3Ntv4e2hRdwxHoM
	OX0W/D3fajTlJojrnhPr0MnLYA6PfOQhs2Zmmv2bmaWJwljkxjPXsHODVeKwRDA/+KuDGMkBoTy
	DTQnXnA4IDQ+BiVxEtpF1bBjUpiHlVkLYrWe18+9mfXxASZvFiaHbwXLYQIKuH9mINczx4Hh57A
	Wf1WHPEUY6qNK+OehKnHryVFWhLPnaO+yuNG1g2aYshXPG6fdflQ2oyD/0NrSlIKrlj3/I3/9Ls
	wsgXZJYNVHelEihkcOE8LBDZ5+QsXRsZJUagQKr6pXR3dnpuu+yJOHb0LGVD+0K/tYC+uTJ39Wm
	W9Ijk/6B2/rZkbdULN/EQwYCH0wEhK2qgLtWCvlGAPUfU1dvEAVeUkZTiXlaB/6nvtc4cWyUPv4
	B5mG
X-Received: by 2002:a17:90b:4b03:b0:3ab:be66:ddb6 with SMTP id 98e67ed59e1d1-3ad86e97e7cmr305334a91.20.1792540956165;
        Tue, 20 Oct 2026 17:02:36 -0700 (PDT)
Received: from localhost ([153.61.198.252])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ad813eb9casm1388667a91.15.2026.10.20.17.02.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 17:02:31 -0700 (PDT)
Content-Type: text/plain; charset=UTF-8
Date: Wed, 21 Oct 2026 00:02:27 +0000
Message-Id: <DMA2QEUR2QCK.TYMC6ONTPOZB@gmail.com>
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: "Qiliang Yuan" <odys.yuan@gmail.com>, "Andrii Nakryiko"
 <andrii@kernel.org>, "Eduard Zingerman" <eddyz87@gmail.com>, "Ihor
 Solodrai" <ihor.solodrai@linux.dev>, "Daniel Borkmann"
 <daniel@iogearbox.net>, "Kumar Kartikeya Dwivedi" <memxor@gmail.com>,
 "Martin KaFai Lau" <martin.lau@linux.dev>, "Song Liu" <song@kernel.org>,
 "Yonghong Song" <yonghong.song@linux.dev>, "Jiri Olsa" <jolsa@kernel.org>,
 "Emil Tsalapatis" <emil@etsalapatis.com>, "Shuah Khan" <shuah@kernel.org>
Cc: <bpf@vger.kernel.org>, <linux-kselftest@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH bpf-next] selftests/bpf: Drop the on_enter recursion
 check of task_local_storage
In-Reply-To: <20261009-selftests-bpf-task-ls-recursion-v1-1-c3a3e3c41f8c@gmail.com>
References: <20261009-selftests-bpf-task-ls-recursion-v1-1-c3a3e3c41f8c@gmail.com>
X-Mailer: mkdraft (claude review draft; edit before sending)
Content-Transfer-Encoding: 8bit
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

On Thu, Oct 08, 2026 at 06:49 PM Qiliang Yuan <odys.yuan@gmail.com> wrote:
> other tasks. On a preemptible kernel, a task can be preempted while it
> runs on_enter, and a task entering a syscall on the same CPU then misses
> the program. With other tests running in parallel, on_enter ends up
> with recursion misses that have nothing to do with the test task, and
> the check expecting none fails.

Show the log of the failed run.
How many workers and how often does it fail?

> Drop the check. map_a holding 200, which only on_enter of the test task
> writes, already shows that on_enter ran for it.

The race works the other way too.
When another task is preempted inside on_enter and the test task calls
sys_gettid() on that cpu it's the test task that misses on_enter.
Nothing is created and "lookup map_a" fails with ENOENT.
enter_cnt == 2 in test_sys_enter_exit() has the same problem.

sys_enter is only a trigger here.
Make on_enter SEC("raw_tp") and run it with bpf_prog_test_run_opts()
like you did in enable_stats ?
Then no other task runs it and the check can stay.

> Fixes: 387b532138ee ("selftests/bpf: Tracing prog can still do lookup under busy lock")

Wrong tag. In 2022 the check was fine.
Progs attached to sys_enter were running with preemption disabled until
commit 439ebd5b5708 ("bpf: Add sleepable support for raw tracepoint programs").
Say that in the commit log.

pw-bot: cr
