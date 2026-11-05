Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793855930;
	b=OoHeY5xMo73KYxfDB9Tl/jz2Ig15giJ/UzioFg4Zd72nv2bRnluuCeavMBZRZJ81lPiP
	 gnBPPZ6F28LY0hyD+vBG5p6UGcHmMzMD3FI4I4rg81oxHPVyD09U6sp5k9mlR+pQmi+Tw
	 XfKbRCqTZDvuBGQS5ZTYMThXsw3FWcYMw4thPSeGnKKI8Ve/UlCmF8ehWHwqUyH7VThnp
	 NlAS/HbphX12n+N9IPIB37ei2ZCfOTYY9fOXjw9hoHxJfi+leHjx44+58hpIdMKgiPM5n
	 oSsbI11eNNtkJoWrpiZcUH2JJFlI3u2poM5NnS0FFJ0eFzMZ9/E90gjXPewF1bo/Xyg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793855930;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Message-Id:
	 To:Cc:Subject:From:X-Mailer:References:In-Reply-To;
	bh=rlYQXXtVW/GHUXiTSX/d/W1MLwKEaP5IBpluVfBfScQ=;
	b=eurs8H5f8vCZsnxuArVSR0GKA2lisgl4lTdN4hWUl3o7JR+3rePoSqzGOAwRAuUw9S+g
	 LpFWbz1iXHdwF5KVm9nNs8cbPC2pLvl1TJNmVJmrZde9FHkHqQ/B0e9lGBfo05eRpNZrt
	 WSEqQoK4t6B5l7pfLtGxZ603X110cyW6Fol/BCPFW94tJ1c/w3bRDbx8LPZrTgeuwxGWY
	 MjCGWsvyMKfu4+gn3zS9vZgeUdysKz8XMp9S2PKDWibAx9dkuBYAxr9wG6miCOMHuKuRU
	 nmoJBFyI/CU/pxbF9+iEjWCJpgbkVd8GLT94oSuptET0WfvoDSQGXhxdIIZR5idAe3A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WKwtpAuH;
	arc=none smtp.remote-ip=209.85.215.174
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A7DE606A326
	for <linux-kselftest@vger.kernel.org>; Thu,  5 Nov 2026 05:18:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6A7DE606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WKwtpAuH
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-cc147d86bebso158759a12.0
        for <linux-kselftest@vger.kernel.org>; Wed, 04 Nov 2026 21:18:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793855930; x=1794460730; darn=vger.kernel.org;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=rlYQXXtVW/GHUXiTSX/d/W1MLwKEaP5IBpluVfBfScQ=;
        b=WKwtpAuHMlpIAChAw/SfvJ1rdirTSs7Egq4NIjvP3WY6cZvURIgJ1OMFcIvwdKdRHD
         c2Y8Vn5y5roQZoW8I5a1hwPq1y7tCh7BD0vIODJE7M7B3n02amaXravnjDNXPcIXPdRg
         Bu2WGOKR8nuUWmvT45WkB1T1vEsSSwawTUPAuXcW7H5vEIXpL+EH1VaHIhfuWWCYh3Nq
         koAxaMwSPycrkl/cZyOX7SRtRZlizo9BzIAXZ7kDPmq3mPW2ouVyJGVvAXDwjUiKm93v
         iBEA8PxNL2bH82y+lOt/y1q7e5e32OSGHrKeefK4grz7+SeRJkkyhgQvLzM0NaG09R8m
         mL/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793855930; x=1794460730;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rlYQXXtVW/GHUXiTSX/d/W1MLwKEaP5IBpluVfBfScQ=;
        b=EU5rCYXj4DcaGQu3u9gS6cj2on5JxC/ess3cdIVNl+wNa3BOmMNPWyD9g0JeFQtn5i
         1Hc4aWgc4OD6pQPWDl/9gyiUJbmfuThcwZed5dzB0KfEvWVRv/peHrdwEKGjvpZ1TbMW
         I/ES9cTEaUgh8pmyz+WMRI2ZNF8OJttkj6ZWG6vTjbfOAOqQcUsXQmf2iIVKlfekExnM
         7P1Khnp72arSwGcnga8fnZU+nJGqC5d4a8Fy97630MuSgFyphq7+DZ+mCVqC8yvRoAUf
         EGbZCptUhXO82tFJt1c4yqhftxZruO2Q9m4cNmlTtAatYJchcoIyjk+IR4xN/q7ds2l5
         h0yg==
X-Forwarded-Encrypted: i=1; AKwUvBz+sxKmGYLsbfrbN7xCu0ErezH921IR02pltuoBrf18rCZs+LyiG1xGQgw91PzeQGOxt1r3kbatIobR3oxRLx0=@vger.kernel.org
X-Gm-Message-State: APuU4Z92n+rzhLAhHp2MuGJ92N3QpD58wmsfT+t8lLho5FXzeTVvgen1
	xEtwY61chUk0SxaWmDa/4tTmU6Riqu+eHT3TcO8PMzKoN7l3InJJV6Vg
X-Gm-Gg: AYBFou33EB5afhw9S27K0ED167XQqvTN5q0nCyAHKfhBt/W/9ba/WuauHbpGThbjrAO
	VDqF8xLq+6NrJD1DOmtFwfGbP2KNBfor/IAgLLgFQnqh1NWTyixDkoSpVEzCnayqlDPdCo4YIyR
	Ds+nGBoN8VWvQvF6RhodvuT0ar4XgYz3WH/EMM7Aqb9Dm+V2lrqBPjuhWJiFqWRij3DSYFvYm/E
	QHVp53qbWojfAQPeg6hZ0v3n1LWees76MmU73LYNITyXCLzIQVYj9E/nXSpgGhRyHQLVay4mzsy
	6w+z/owH/UMEqbH0JmgTaOpG3PGhKBVeBE+RM1qVd2NPo4StrWzgClesbBAtIGpQ3zTMzBtFZxT
	mY6nEK9m5UbOZGMx99isJwIFIf1Q1rGvvsuhT9K5d0IeUTvtH75iEN31cMZJb231MTCTZ0N+DgG
	S2ulxZi1OU1rJU+kGkw12JSBETpZFtWGkPvkU+5xUtpjZ/93EeyP7WNiBWRihrlks8WPgBw/47t
	bE0p10ztLIvI6lK/tS2ags64SpCkv9GJsoIKmGlqbyMtAvRv1gL9WuVv+7u/PqmDOwFS5zkrdfn
	kRwdkzG0dlDutOP5KqWwHTpBDVWsPrUQD96VeX5DMT8Ox5syMizzTl5K2btEV8GjABnKZJZWqq5
	JWr48OaJmbE2t2J02C5TwrVSo6ztHLg3RykWhc5p16kY92dOzLT8BMDI=
X-Received: by 2002:a17:90b:56c8:b0:3ad:dc36:c3d7 with SMTP id 98e67ed59e1d1-3b0afdf2b12mr1020541a91.24.1793855929364;
        Wed, 04 Nov 2026 21:18:49 -0800 (PST)
Received: from localhost ([153.61.198.241])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0b2cf80c9sm2002505a91.0.2026.11.04.21.18.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Nov 2026 21:18:48 -0800 (PST)
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 05 Nov 2026 05:18:48 +0000
Message-Id: <DMN0USP1E59A.34N710IJOO0PJ@gmail.com>
To: "Martin Kelly" <martin.kelly@crowdstrike.com>
Cc: "Mike Bazov" <mikeba@sentinelone.com>, "Daniel Borkmann"
 <daniel@iogearbox.net>, "Andrii Nakryiko" <andrii@kernel.org>, "Martin
 KaFai Lau" <martin.lau@linux.dev>, "Eduard Zingerman" <eddyz87@gmail.com>,
 "Kumar Kartikeya Dwivedi" <memxor@gmail.com>, "Song Liu" <song@kernel.org>,
 "Yonghong Song" <yonghong.song@linux.dev>, "Jiri Olsa" <jolsa@kernel.org>,
 "John Fastabend" <john.fastabend@gmail.com>, "Shuah Khan"
 <shuah@kernel.org>, <bpf@vger.kernel.org>,
 <linux-kselftest@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Peter
 Zijlstra" <peterz@infradead.org>, "Steven Rostedt" <rostedt@goodmis.org>,
 "Andrey Grodzovsky" <andrey.grodzovsky@crowdstrike.com>
Subject: Re: [EXT.MSG] Re: [PATCH RFC bpf-next 0/2] bpf: Do not let
 preemption cause false recursion drops in trampoline progs
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
X-Mailer: aerc 0.20.1-355-gf870624f6c37
References: <20261025-b4-bpf-trampoline-preempt-v1-0-198dcdc0c6ac@sentinelone.com> <DMIIV9CE0PN4.309YUGIXQUZNF@gmail.com> <CAPnbwjrB_je6jXt3BGD-1q1yFs_wFd-Yh9KzixKzLK_X3Stuag@mail.gmail.com> <DML75890DWIX.EYB690LPBM1O@gmail.com> <CAPnbwjpv3bkGAKVjc7Eywgo-H4X6uDLYPJWFuSakGs_sBdgr3w@mail.gmail.com> <DMM2FJ2SNYYO.24TEJ05OOR08E@gmail.com> <CAH=2mMABxvf+GNr7vUKNkGvyU-gmaXKMGNJHg4URUCW_eyuxGg@mail.gmail.com>
In-Reply-To: <CAH=2mMABxvf+GNr7vUKNkGvyU-gmaXKMGNJHg4URUCW_eyuxGg@mail.gmail.com>

On Thu Nov 5, 2026 at 1:12 AM UTC, Martin Kelly wrote:
> We have noticed this issue independently in testing of our own security
> agent and have hit the same false recursion skips on 7.0 and 7.1
> kernels. More details and measurements below.
>
> On Tue, Nov 3, 2026 at 6:24=E2=80=AFPM Alexei Starovoitov
> <alexei.starovoitov@gmail.com> wrote:
>> Today a fentry prog never runs twice at the same time on one cpu.
>> Existing progs rely on that for their per-cpu maps.
>>
>>   task A, cpu 0                     task B, cpu 0
>>   buf =3D lookup(&percpu_scratch)
>>   fill buf
>>   <preempted>
>>                                     buf =3D lookup(&percpu_scratch)
>>                                     fill buf
>>                                     output(buf)
>>   output(buf)   <- data of B
>>
>> A plain (*cnt)++ in a per-cpu map loses updates the same way.
>> Today B is skipped and recursion_misses counts it.
>> With the per-task check A sends a corrupted event and nothing counts it.
>
> Our programs avoid writing to per-CPU arrays because of corruption on
> PREEMPT_RT kernels, where trampolines have always been preemptible and
> thus can corrupt these structures.=20

what do you mean? the reentrance prevention counter works on PREEMPT_RT too=
.
per-cpu array are not corrupted there.

> So for us, an opt-in flag that allows
> preemption (instead of skipping) would work well and not regress current
> programs that don't opt in. A verifier scan for per-CPU arrays could
> also work, but it would need to distinguish read-only vs write access to
> those maps.
>
>> Add bpf_preempt_disable().
>> Your test forces the preemption in the middle of the prog.
>> Explicit bpf_preempt_disable() will fix it.
>> And you'll have an easy way to see why disabling preemtion
>> for the whole program might hurt your own production.
>
> We tried bpf_preempt_disable()/bpf_preempt_enable() around our hooks on
> a 2-vCPU 7.1.5 VM with HRTICK under an open/close stress test load.
> recursion_misses for the locks_remove_file fentry actually increased
> slightly 29M to 31M (this may be within noise). As far as we can tell
> from the code, the trampoline takes prog->active before the program's
> first instruction and releases it in __bpf_prog_exit_recur() after the
> program finishes. bpf_preempt_enable() calls preempt_enable(), which is
> a reschedule point. That reschedule happens with prog->active still
> held.

pls try _no_resched() as I suggested in the other reply.

> In a process-heavy workload on a 2-vCPU VM (~1M fork+exec of
> short-lived processes, ~606/second) we recorded the following number of
> recursion_misses on a 7.0.9 and a 7.1.5 kernel. Both kernels use lazy
> preemption with PREEMPT_RCU enabled. The miss rate has increased
> significantly, which we suspect is due to the HRTICK change.
>
>                                   7.0.9 (HRTICK off) 7.1.5 (HRTICK on)
>                                   =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> security_file_permission fentry   1 in 61,580        1 in 1,568
> security_inode_getattr fentry     1 in 59,242        1 in 1,707
> do_file_open fexit                1 in 813,983       1 in 2,503
> sched_process_exec raw_tracepoint 1 in 1,000,816     1 in 500,408

Thanks for the numbers.
Are you saying turning off HRTICK is not an option for your production?

> We don't have a preferred mechanism and are generally open to any
> approach that would help reduce these recursion_misses. Whatever the
> mechanism, it would be ideal to cover raw_tp programs too, since
> a46023d5616e made those preemptible.

agree. let's come up with a design then.

