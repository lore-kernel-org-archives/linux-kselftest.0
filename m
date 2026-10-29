Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.46
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793243851;
	b=fqN9vuRSO34zEbEYBrCUZSkM7apFVTkZ9KJ78NYPuG/UmxzPeFiQeFSt3vee3X/RxDVV
	 Q88q1Wtox02iA2x/9bvAxjLkud5OVANifVuN6DfwYx5tZzhPu0ckd1TTXZr+WDBXkqyJX
	 4n1d4P8ODC/1uSxIDcInQJszAqw8q57iArJMa0bIcLMM74uI63YP+HvVQYnwXfVywiukX
	 1ku59x4kWMx73ZnEhVjU4aU2uMH6XehsBQuSwP5nP24WYI020/R37UhQPdWvjFa23Vsbg
	 S+aJL3PCT8ff4cnUfPxv4k2UUvjF4plNOw5qzegGOUWKceyI0I/p5XOpjmArv7ge1LQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793243851;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=T2HnLVO9Ia1aLW0RavN7xDKo4uNGTSoh79eBgSOlAqg=;
	b=5FL7m7bsGY2uhPn+12E3kU07Wq9pikWcKWw7B+MSLw7y+jPndln9kVUxXqSZ9viRxNEQ
	 EWWjMgYSDVZTDugZzTbt/oSUdm/9FDzKXf5LDoABAx/jzBGLr7jGtha5mBWeTN6x4jXIK
	 Vuktt625wH8E93iVcVGzSoTyVrOcXJOImsy3xIMnJuqCSwB719Q4080BPJj5EtpbSbp/v
	 S/ROSDJCb6d0KdnOS2nN9+jTRVrJITd/lpdUhv03WTiess1tC3gtM+p+9TwvwoispH1re
	 ozlhvjA1I+z8Iel/Yehmf8yp7P05MIY/PQEZh4e0UbXvfg5H0vocPUl6c1h4Qbf4Irg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=brainfault.org;
	spf=none smtp.mailfrom=brainfault.org;
	dkim=pass header.d=brainfault.org header.i=@brainfault.org header.a=rsa-sha256 header.s=google header.b=uAEPxiyG;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEB20606A31D
	for <linux-kselftest@vger.kernel.org>; Thu, 29 Oct 2026 03:17:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DEB20606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=brainfault.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=brainfault.org header.i=@brainfault.org header.a=rsa-sha256 header.s=google header.b=uAEPxiyG
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a2d6d01ecbso11121535e9.0
        for <linux-kselftest@vger.kernel.org>; Wed, 28 Oct 2026 20:17:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793243849; cv=none;
        d=google.com; s=arc-20260327;
        b=OZ1e7jcSnGLHYD84w9XgLn++kAKM3k6PSiC+bj/jlwQ1tDJXw93uaWWfYxtI43jIls
         8XDsIwy7LQPGWeI+zJVpscXvqpZdazeVe6wJhlKxeVWyCE+l6ozBuILo7g126sfNarkj
         19oKNspl6IJI5N7ZGRbBzLVoHNhFmXi6rxxKEZuJ3137z0A8oQUb0bbjpgtscnXWZAJO
         ZcLyAin5x9N4nzz2TWI9ghKDrq6S2NAHzsHQZRf9dqbRySh0vUgf69cUIMl9fQwVguWF
         4q2Q5/zdZaD7RQu0zBt/lMcCzzd+5Nqs7bqKzndgYZcyZFcqLxc1R6sE/I3FGxbDIS9s
         FYuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=T2HnLVO9Ia1aLW0RavN7xDKo4uNGTSoh79eBgSOlAqg=;
        fh=Kx/jS/xse3uqJEPSPHrMFI5vWJbHRbPm2eXhCkMQY3o=;
        b=EzuEG6CXPA5m6vxTjoYNkPMLTB9Gp+/RkRAnaukfu83yVHdWedCmNoMpz9Sc6cDjKv
         7NLINBKwPd3Ct2T/KfoZ+5etP4mGr6pdUv32XMCBKCQr/eqJYV1QMee+YQlDxVV9E248
         FpTtl9sJhoIyz1fjKY9l0iliayGn+6u7UAtmEX628AE28tolpCHDrggfTNDFOnghwttX
         CIj2vIeYdp+eGyKkgKDy60Wk/nDjTb2sqHjD9OXt06ddyCb2kEkAZKJvi7SPluflbvfw
         ZYDQOnCKCqtQ//Rq2xGtlQOUvu/H95z18neNM1Z1iDKfCiLWUDrbHGfAqLqJeMbD2+dV
         qlBg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault.org; s=google; t=1793243849; x=1793848649; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=T2HnLVO9Ia1aLW0RavN7xDKo4uNGTSoh79eBgSOlAqg=;
        b=uAEPxiyGlInTkE+Wmb5BaZ1pHuZp6REPd36Dg57wWZ4UVfl0fMJQPqa8Y4uG6d6lBf
         c9ufxPTbQthy0GpBCgqOrDbt3g/CyBlYJvzl0uNq7nIdKDIArZTJJA2sSRfGgzSM+XZe
         TBrD3ONoqr5J4c2Z8ai7bxRiibb0wTVPoo9eZfwISdO9M1MrpekBMVmRk2aSz4rjK+pU
         Jitq5kPI/m5o4XCjIYRAuhZc88oflH6JvUqwuNRDOwYkxPVDQOFdMiPk1bKAlj+laaSx
         swkFjm82uQp7jxr89pm8HnPGA8j/oPT6ri4h24NrOeNR+ZUhRe8uW3zu1ADZGKt+uZHl
         NYwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793243849; x=1793848649;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=T2HnLVO9Ia1aLW0RavN7xDKo4uNGTSoh79eBgSOlAqg=;
        b=cfipyk3PulEFRSp66SG1maiv07ounY37g9F+DsEnoIezLxDo5da92YowSEQOzeCHsC
         tS01VNe61VAFMV5xGirqtMMWj6VvkJQftVNBci2LXHEwNZq91N0qrcQGc32XJTQvqEzX
         BR5cUQ1WdqKwVNtk0HJphYAupobd6BWpxzZ2Ddm2lI+ipwrHjpwy0VAZnAdAEYQjmkmi
         UaBR6nlzcRCJuLS4iYKq3J+4EG27A7WBBhC1JDeNHbl7sTQ/VNPXAxMK4O23wgQRJnY4
         B+NPq55CRV09vJH8GgR3H5rQ/yMhaoKCd6GVVwXRQmoG+0uSn78wyffmJ2QfZoZChgbl
         gOhg==
X-Forwarded-Encrypted: i=1; AKwUvByboJ1tJXrQSokseAtz1W05md73zcx1dR2uHTMQmFByFkMHvCFGGpHMLQDV1gfKSUEMl6cCbL02evjD1Nzv9Qs=@vger.kernel.org
X-Gm-Message-State: AFq9FYIfFa4ECuMg+iN/UmhGDUxSB+A1LgP7VhlapcqHsC9usTtIXdXf
	tYeeI8eNfhAwgODO/xLP52tza+P5t3fxRzD/x5iE5sLMr8vQHG4XHphfX9+Kqrhjh6B0IKQFevl
	9FwJobuY2M2Jel5f36if1KVo84158Een7VWtSL2H0mQ==
X-Gm-Gg: AYBFou0zMFVT8C4aSHKmG5rda+TTk1wxnR0RPlW72E98336N21/Cfyo9sMYURFx8e/B
	kRM/oaxRz884r5+qtu7WJ8M5zZFlOTmcBYdfX5dbYqfoSe93IL3Agbf6HY/d1yfTPqMn+PX9LzC
	N/VHgbI8uXd4AePRewrtDv082K9O8CPj1dWPbsGJHQF0ty9xmUjqpa4jueF3dnrrm1gFcR5cDdm
	J4D3f9T3oEb6GNbj6cpJMdK4uHTDyGhOsIn5nqBIdTLgEicTfGbpAfdkJxXvNwCfcvvbRuAYIeZ
	kuAaQ3n4e0Fg2AD3qNiM/1UzOpmHtECPciWsvUqdAGw9chcOaYsHXeWUUHttCMLpcxC0msbIR+A
	N/tDCYAQY3seP0MwJHYMCb/0f4P1d4wHMghmbLo1yZAVJvk696I2CU+oqxvIRRa/jC4Rg/k9Z23
	9fX/shayBrECyZVqHh9B3mcbeAjcKifoeLtA9SkGQzTOvExxOaWIufIEkZNoC5w4gDD/19V/pMU
	iJA
X-Received: by 2002:a05:600c:354a:b0:4a2:74f:46c1 with SMTP id
 5b1f17b1804b1-4a96667c86dmr91055985e9.8.1793243848793; Wed, 28 Oct 2026
 20:17:28 -0700 (PDT)
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261028165531.940336-1-anup.patel@oss.qualcomm.com> <CACnXVncwzQiUN9CO8_Ds7UQJEKzEF29vagsTFrC0WbRZXt7aLw@mail.gmail.com>
In-Reply-To: <CACnXVncwzQiUN9CO8_Ds7UQJEKzEF29vagsTFrC0WbRZXt7aLw@mail.gmail.com>
From: Anup Patel <anup@brainfault.org>
Date: Thu, 29 Oct 2026 08:47:16 +0530
X-Gm-Features: AclHuK-lVk0iiJup6LpFGQOVP7LJYplmMO9EUMDts3fwzO894BeUhVnmdWTPpTA
Message-ID: <CAAhSdy1u4Tme=cv7pSyYeahh1BQhQOnsnWBn3D4yxTnfzrApPA@mail.gmail.com>
Subject: Re: [PATCH v11 0/9] riscv: add SBI Supervisor Software Events support
To: Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
Cc: Anup Patel <anup.patel@oss.qualcomm.com>, Paul Walmsley <pjw@kernel.org>, 
	Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>, Yunhui Cui <cuiyunhui@bytedance.com>, 
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	James Clark <james.clark@linaro.org>, Will Deacon <will@kernel.org>, 
	Thomas Gleixner <tglx@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Alexandre Ghiti <alex@ghiti.fr>, 
	Randy Dunlap <rdunlap@infradead.org>, Shuah Khan <shuah@kernel.org>, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	Conor Dooley <conor@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Atish Patra <atish.patra@linux.dev>, Yuanzhu <yuanzhu@bytedance.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 29, 2026 at 8:36=E2=80=AFAM Zhanpeng Zhang
<zhangzhanpeng.jasper@bytedance.com> wrote:
>
> Hi Anup, Paul, Himanshu,
>
> On 10/29/26 12:55 AM, Anup Patel wrote:
>
> > [...]
> >
> > Changes in v11
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >
> > Rebased on latest for-next branch of linux-riscv tree (commit a5ae1bf65=
cee).
> > Also, tested PMU driver with both PMU irqs and PMU SSE events.
> >
>
> Thanks for rebasing and testing the series. I was a little surprised
> to see v11 posted, as I am still working through Himanshu's v10 review
> and validating the fixes on hardware. It would have been helpful to
> coordinate before reposting so that those changes could be included.
>
> I guess this follows Paul's request to rebase onto riscv/for-next.
> However, there is one change beyond the rebase that I would like to
> clarify: why does patch 4 remove the scoped_guard(preempt) sections
> from the CPU hotplug paths? These were present in v10 RESEND, and
> the local helpers still retain their preemption-disabled assertions.
> Is there a reason this protection is no longer needed?

Yes, this is based on discussion with Paul yesterday.

This series is blocking the whole RAS ACPI support.

>
> The changes discussed on the v10 threads are still outstanding in
> this posting:
>
> - Preserve TASK_TI_A0/A1/A2 across nested exceptions.
> - Replace the temporary GUP-based perf user-stack copy with nofault
>    uaccess, following the x86 approach.
> - Address the per-CPU initialization/preemption concern.
> - Split the MAINTAINERS updates into a separate patch.

There is always going to be new updates since it will take
time to harden the SSE implementation. All these changes
can be done as separate follow-on patches.

>
> Additional fixes from Sashiko review, the kernel test robot report,
> and our follow-up debugging are also being consolidated:
>
> - NMI-safe entry and lockdep irqflags tracking.
> - The unused-function warning reported by the kernel test robot.
> - RV32 vmalloc synchronization before nofault fixup.
> - Faulting-PC validation in the kprobe single-step fault path.
> - Per-counter STOP handling in SSE error paths.
> - Ordinary IRQ CPU-PM notifier ordering and IRQ cleanup tracking.

Same comment as above, please do this as separate series.
No point in holding all other dependent work endlessly.

>
> In particular, Himanshu identified the missing preservation of
> TASK_TI_A0/A1/A2 across nested exceptions [1]. Following his review,
> I validated the fix with hardware A/B testing: removing it reproduced
> corruption, while the fixed kernel completed the same test sequence.
> This also gives us a solid basis for replacing the temporary GUP
> workaround with nofault uaccess.
>
> Paul, please hold off on taking this version into for-next until
> these fixes are included. The rebase and PMU testing are useful, but
> there are still outstanding correctness issues.
>
> I will consolidate the changes and post v12 against riscv/for-next,
> with an updated changelog and validation results. Let's coordinate
> the next posting to keep everything together.
>
> Thanks,
> Zhanpeng
>
> [1] https://lore.kernel.org/r/as79MHtNYd-VbUug@hu-himchau-blr.qualcomm.co=
m/

Regards,
Anup
