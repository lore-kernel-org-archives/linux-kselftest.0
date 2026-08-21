Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02C4130EF8F;
	Fri, 21 Aug 2026 13:18:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787318316; cv=none; b=Z6PikK6V1y47MVuohSS56spK3rgX1wkoXtFroH/SXY57chwwdmiOFuXHnX/NgeU7V51g/4kTqrXs7QqQt2qQ+Dcw0bvMGWC0NWeflSSgPs0XgNZfN8ovuq/1yyNb4R0c8UEJuq8Jvts+Yl/w5G+JHDYyvdMSAGAo+3Mgvqi/owI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787318316; c=relaxed/simple;
	bh=9eHOc4vaE30wSkddTrffw4rAvgYuKxtnfMsaKFqKC4M=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=nE+jZgaPqgotwUoi9wyMlCbhj5iut5608/TliBHKu2O5dXDFhl3H0W4CRzulvImN+vGUkbX1WVhTGJe6mzZyZCIjes+ROLiq0QajTRf7WXEjP1aSXh2AHel7KkAoAUIFzwekLwRzhKTVyUwuxP8fC9j31e7r3dEv8n8XY+Uucao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TVxQQuEP; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TVxQQuEP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8E771F00A3E;
	Fri, 21 Aug 2026 13:18:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787318305;
	bh=9pJl7gx6Gs5OIh+s/SwPEh4dWiwHOpWZiC/DOFWANg0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=TVxQQuEPmIvYZNsHO3YOnFPd/UVwEdBiZyaxnKTgx/tbkpGo1e0oacW5FpbrT1lUD
	 O1kn7xpDjZ5p/8OEOp0P9YAJlsibf8nwE09QZBoLrZvecTVhGpVZ2BXm0uzZmK5ODY
	 Cw9WQ+FQl77gkqlzT4keFN+/Kh3Kewr1wGQHZWIJvGJLXfYJE/WYFq4cJ/7fU59SdW
	 zMtVyt0FPwhbVZL+TKAA/QO7Bz6zXpUgmlSMyT7igHrpUzqxXZ8yHS9Gbek3zzIFsa
	 g5iBDKSvk26uNc0wRfYX0XjKymLzgHPd009zoXfCiE6JH60Meh86lHh5pAxvs+Zu9m
	 b4y1Zq+jyLlGw==
From: Thomas Gleixner <tglx@kernel.org>
To: Dmitry Ilvokhin <d@ilvokhin.com>
Cc: Usama Arif <usama.arif@linux.dev>, peterz@infradead.org,
 andrealmeid@igalia.com, dave@stgolabs.net, dvhart@infradead.org,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 mingo@redhat.com, shuah@kernel.org, shakeel.butt@linux.dev,
 hannes@cmpxchg.org, riel@surriel.com, kernel-team@meta.com
Subject: Re: [PATCH] futex: Avoid hash-bucket locking for mismatched waits
In-Reply-To: <aocn4kp5F_2Y2e5O@shell.ilvokhin.com>
References: <20260805132831.2852771-1-usama.arif@linux.dev>
 <87jyq2dji5.ffs@fw13> <f4eaec7c-39f7-4040-b668-946de9c70941@linux.dev>
 <87y0e8lmih.ffs@fw13> <87v79clmfu.ffs@fw13>
 <aocn4kp5F_2Y2e5O@shell.ilvokhin.com>
Date: Fri, 21 Aug 2026 15:18:22 +0200
Message-ID: <878q5zipcx.ffs@fw13>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Thu, Aug 20 2026 at 16:14, Dmitry Ilvokhin wrote:
> On Fri, Aug 14, 2026 at 06:02:45PM +0200, Thomas Gleixner wrote:
> I've built a benchmark to simulate this behaviour on the smaller scale
> and run it with two threads and `nproc` threads to simulate low and high
> contention cases. The benchmark is a bit on a extreme side, but I think
> it approximates the real world case quite well.
>
> The numbers below are averaged across 10 runs.
>
> SKYLAKE (2 NUMA NODES, 80 CPUS, Intel(R) Xeon(R) Gold 6138 CPU)
>
> Threads   Baseline (ops/sec)    Patched            95% CI        Diff
> -----------------------------------------------------------------------
> 2           5,917,777          6,441,061     [ -1.98%, +19.67%]   +8.84%
> 80            122,926             77,801     [-41.17%, -32.25%]  -36.71%
>
>
> BERGAMO (1 NUMA NODE, 176 CPUS, AMD EPYC 9D64)
>
> Threads   Baseline (ops/sec)    Patched            95% CI        Diff
> -----------------------------------------------------------------------
> 2            14,952,962        14,482,494     [ -4.62%, -1.68%]   -3.15%
> 176             161,294           127,563     [-21.72%, -20.11%] -20.91%
>
>
> Skylake two thread case seems in line with ~5% improvement you measured,
> but numbers are quite noisy. Other runs do not look encouraging.
>
> It looks like early bail out amplifies contention problem even more.
> Instead of letting thread spin on the hb->lock, early check returns just
> for userspace to retry again moment later. Ideally, it would be better
> to park spinning thread as fast as possible and with early bail out we
> do opposite of that.

Changing the timing even slightly either in user space or in kernel
space results in different outcomes depending on the micro architecture,
NUMA, contention scenario ...

While it is benefical for some scenarios to avoid the wait/wake, for
others especially those with high concurrency in trying to acquire the
futex the cache line bouncing just gets worse.

And yes, you are right that with your benchmark the early bail amplifies
exactly that problem. The hash bucket lock contention eases the cache
line contention for the price of wasting CPU cycles in the kernel.

There is no magic cure for this with the current implementations and I
doubt that any benchmark will give a satisfying answer which is
generally useful accross a wider range of application scenarios.

This needs quite some thought and investigations to get right.

Thanks,

        tglx




