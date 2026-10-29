Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.43
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793243207;
	b=0rMgfB5Ypct3O/RJ0841YtiaCEMTp57/tJpPcf3g7yN/evGQsj2JEqR9e1PCnQeAJwDv
	 5Ii+B8LosS8aXJopzNzW/a+yDu9K3fWzn6t1O26ey0+dgyGZjK4kpH9//hyr3HqVyET+o
	 amY9hG/pgvb6LM/GnkaXVjabzCYYtK3HFxL6isIUy5UoMRYD+n3oiS6a+BbWNotpe80U8
	 NWIjsLj0zosKPnd4ruDBjBTO4t0ph2hefm+nSGO1ZU1z74afR5SmU552sCz1s31CbKyaZ
	 RissU6SC0ZKMfEaPcB9QAvLz6wyYecJysylpstcVeEny5qlk7ZdziezEHXKRhT2JZGg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793243207;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:User-Agent:X-Original-From:References:From:Mime-Version:
	 In-Reply-To:Date:X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type;
	bh=21fFFSCtjvZ+BnQkCcGT5s2MmdQCNwbulDZga2Yp1YU=;
	b=1mc6iOWIRnHySDpcdo57nH/5h8LRY2IOJd0Q1VJtQkBzBYP0QnVaDAKXSzI2q15CimNj
	 3Zk2q14gyqiNoF57EB50EzZR3zxjWYI7UeRpJzBeOLLltAjZGe27rq68/jI+ZCiIJNG+W
	 /SALu4R7eGvxe9qhNpEBjdL4rz97nDN4B5FH4FrJJUmrtepEx8f8vt7wt5GZUkW8zTM9Q
	 w44/0/GcLRErLiKJUUsxA+PF0+AXwQ/Dd9blGH8U7wMeVKmwPUTJcnfKHaP3frEk7ktBJ
	 Xb/5BjQJYhuNPXcSUP80vfDy0YChUQFhTGuGufyGVEec2Rjj/UuhnJEQ8EMQqP+tnVQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bytedance.com;
	spf=pass smtp.mailfrom=bytedance.com;
	dkim=pass header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=h6ziHXdx;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.43
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 101B9606A31A
	for <linux-kselftest@vger.kernel.org>; Thu, 29 Oct 2026 03:06:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 101B9606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=h6ziHXdx
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5be53e5fce1so1675260e87.1
        for <linux-kselftest@vger.kernel.org>; Wed, 28 Oct 2026 20:06:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793243205; cv=none;
        d=google.com; s=arc-20260327;
        b=J+IZ8utbLeoTPoPaiDfUpxzihzTe/PwmI2MhCbnyrhWN/2T03OZ8dlcHE45PfqwePT
         Eg9B1W5r3PqJ95lh6uRTeZB309jdRcJ1pQYzI9042mOPHD2AMdn9qlm5MOyxehKTMhYe
         R5I22OhfYkIIxCHgJeNP7JBrovBZNlrvCM7XpwXd0Z3BObh172LxYfo34xGqlZDOpF2l
         9nywZDmLKWn2J8k4daiGDB/kfsXjr/tK4U568BSabMFTA04wKjSHDaJU7pPxs9hwjh9T
         zZb1aIOrrVNBFmb2kX2rFRjlQ4rvMByj5RcpWNuLuRA/exbdl0IyRApzaCnMFcgEDd09
         Hhhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:in-reply-to:mime-version:from
         :references:user-agent:dkim-signature;
        bh=21fFFSCtjvZ+BnQkCcGT5s2MmdQCNwbulDZga2Yp1YU=;
        fh=C/Z8q/iAPszGkY3kqQUtOw+LL3drThPJXbFueNHJO5Y=;
        b=Gh0GxvakxjT8CI/+cMOQquo97xSPkPUQ9JZ+UCX+hKTdp1ETc/34+YTKylxTzrd0So
         fAoKi4eOgspVCme/ERklSkQsdy9vojUfysTmfeFhjA7d5LgiQXclcUWh+eUGaKTO5x5k
         Iu6o0ahK8NZArvDMWcyMj2pWI6MpJicB2+rHU7rOpBfr542KLTTtu5wU8j5FPoFWzJnN
         wSYF8uUG+zuqK8TB47DNiefFYlslzyEC3TwbhDtG3pVT0JIYdo5qPmKT8IFag2sj2q8r
         h+hJnGZTbOcjqQo9XCoupJkPDFllLBHC/rM4piNQlzI+88SGaToAyvpmxCucuI7X32J8
         8iBw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1793243205; x=1793848005; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:in-reply-to:mime-version
         :from:references:user-agent:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=21fFFSCtjvZ+BnQkCcGT5s2MmdQCNwbulDZga2Yp1YU=;
        b=h6ziHXdxperKw0FMhtwDYC/nSyqfN66VH9iz1mtw8jkUEvdOawkjO1VfElLR2jSpP+
         jqqjO8GakTohp8gam+tBwY1/eCqNz745YmdHtDmysTJhQXVQk1KHkqHBuCjAG80VMoKr
         UsPvcHWdqdCDP6IdasdeBSbB9R/wSwCgEerazu4r+/iYkH4qZfT3rDsaZKzZ4RWfMayf
         CQDQBq60IHafmR+XVjCAYc9Aa0nv2+nvmQ2rc7Vfblp0ZCQcn3mnB361DJv5d9I8chlY
         w+bLmgtYklxeK9Yg/5NDZrStW1Ky6qVVfdEvSOpUq9D9p/9XftRnMGkcVdvm01gl2an0
         OvKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793243205; x=1793848005;
        h=content-type:cc:to:subject:message-id:date:in-reply-to:mime-version
         :from:references:user-agent:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=21fFFSCtjvZ+BnQkCcGT5s2MmdQCNwbulDZga2Yp1YU=;
        b=I8sK9lPp3hnNM0iMvgps18VVM6rsmfXqnMJDK0jOlVYP6ReUQj4RiA+axvlEkL8NgN
         G2ruup+Z6pj1lMGWSctogxLYJ2jtFfOVluDVcl0MoP23RLfooaloeWNRmMIm+eYmkkYe
         nQS1/piGzZTvXVKv2q2WsxXMF+N7eUoUa31VSbd3yO6wfncl7agBo533+hp8GsxBZkMR
         eqUnZqvkAal6uOmQzh33XRX8e2qr6yPdd7J1XBhoorjzThB2Sld4hd6Sh8jP3CYlJ+3E
         WehxFtRNKkIU4Ft+9dFEgDCoTUdFIKupNUK4tuzI/l6gyeW7x5tjgLo97ZiKe2VLyEV/
         5mOQ==
X-Forwarded-Encrypted: i=1; AKwUvByqUOX+GY0svzsbaIjDgLY50zMK33BxHDZ+X+vha3MDQjFjFMx7lUiHGnka66SU/UNFwlwkILS+ITyZzdu6UTo=@vger.kernel.org
X-Gm-Message-State: AFq9FYJZDB+G/ImZt6HOTYq74J/5Th/jfFvtbHwVCkEtqdM5s4fKNeXp
	SoxMommfOi3PEXFTewK/4T46+MFtHg0GQKUjhQKkFWVZIM6bPYRGQm6TH1oQt6ePlzUmABV/SIu
	/fPWkzizQRnztn2BkIwtHH6CCHz37pia9wF9uEZmqCQ==
X-Gm-Gg: AYBFou2GpHIL44cWZ9RkJ7ULfN9QzwjcthMxTr/0NAqkv7XZITfZdoThcm7GG6XvoDe
	Mn2QL8fQGiRe7c7L2FpmU5NVXYm484+zA+90yEm5/PJuT+UPBrr43vC7nYqMGIS000l+TrD96yk
	65L3KwkTxiIuTRUTEUZZ94H9fK4HkdGc0qmEgioFl7pP0ppth9bA+wem6y2zRZVJFepjbOdYSFd
	y+GS1xzRsXmG82lpiIDJnnrGGwrq0UOrqdiatNP90V13FbkEFmyUycQ09b5sHbZ0QqiTkPDyPHq
	f7Jr6p95yqCqw3EawQ9Z7KlmoqqJgeu5h9JhKm6iiubbyHyjc1SR72nVoUEpxAiIJDvMo7VMLpa
	S0gyBUWzZLEYl+N/b7F9UY6PvJJsEaxQCgELFkw==
X-Received: by 2002:a05:6512:1250:b0:5b8:997b:c606 with SMTP id
 2adb3069b0e04-5bfcad9e1a6mr1490725e87.41.1793243205235; Wed, 28 Oct 2026
 20:06:45 -0700 (PDT)
Received: from 44278815321 named unknown by gmailapi.google.com with HTTPREST;
 Wed, 28 Oct 2026 22:06:44 -0500
Received: from 44278815321 named unknown by gmailapi.google.com with HTTPREST;
 Wed, 28 Oct 2026 22:06:44 -0500
User-Agent: Mozilla Thunderbird
X-Original-From: Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
References: <20261028165531.940336-1-anup.patel@oss.qualcomm.com>
From: Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
In-Reply-To: <20261028165531.940336-1-anup.patel@oss.qualcomm.com>
Date: Wed, 28 Oct 2026 22:06:44 -0500
X-Gm-Features: AclHuK_OONCiZpFhomM73vca1DSs-MUlsV-8C6gmVeQhDkNqE4BPqIm0xCP39ic
Message-ID: <CACnXVncwzQiUN9CO8_Ds7UQJEKzEF29vagsTFrC0WbRZXt7aLw@mail.gmail.com>
Subject: Re: [PATCH v11 0/9] riscv: add SBI Supervisor Software Events support
To: Anup Patel <anup.patel@oss.qualcomm.com>, Paul Walmsley <pjw@kernel.org>, 
	Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
Cc: Yunhui Cui <cuiyunhui@bytedance.com>, Peter Zijlstra <peterz@infradead.org>, 
	Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	James Clark <james.clark@linaro.org>, Will Deacon <will@kernel.org>, 
	Thomas Gleixner <tglx@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Alexandre Ghiti <alex@ghiti.fr>, 
	Randy Dunlap <rdunlap@infradead.org>, Shuah Khan <shuah@kernel.org>, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	Conor Dooley <conor@kernel.org>, Anup Patel <anup@brainfault.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Atish Patra <atish.patra@linux.dev>, 
	Yuanzhu <yuanzhu@bytedance.com>
Content-Type: text/plain; charset="UTF-8"

Hi Anup, Paul, Himanshu,

On 10/29/26 12:55 AM, Anup Patel wrote:

> [...]
>
> Changes in v11
> ==============
>
> Rebased on latest for-next branch of linux-riscv tree (commit a5ae1bf65cee).
> Also, tested PMU driver with both PMU irqs and PMU SSE events.
>

Thanks for rebasing and testing the series. I was a little surprised
to see v11 posted, as I am still working through Himanshu's v10 review
and validating the fixes on hardware. It would have been helpful to
coordinate before reposting so that those changes could be included.

I guess this follows Paul's request to rebase onto riscv/for-next.
However, there is one change beyond the rebase that I would like to
clarify: why does patch 4 remove the scoped_guard(preempt) sections
from the CPU hotplug paths? These were present in v10 RESEND, and
the local helpers still retain their preemption-disabled assertions.
Is there a reason this protection is no longer needed?

The changes discussed on the v10 threads are still outstanding in
this posting:

- Preserve TASK_TI_A0/A1/A2 across nested exceptions.
- Replace the temporary GUP-based perf user-stack copy with nofault
   uaccess, following the x86 approach.
- Address the per-CPU initialization/preemption concern.
- Split the MAINTAINERS updates into a separate patch.

Additional fixes from Sashiko review, the kernel test robot report,
and our follow-up debugging are also being consolidated:

- NMI-safe entry and lockdep irqflags tracking.
- The unused-function warning reported by the kernel test robot.
- RV32 vmalloc synchronization before nofault fixup.
- Faulting-PC validation in the kprobe single-step fault path.
- Per-counter STOP handling in SSE error paths.
- Ordinary IRQ CPU-PM notifier ordering and IRQ cleanup tracking.

In particular, Himanshu identified the missing preservation of
TASK_TI_A0/A1/A2 across nested exceptions [1]. Following his review,
I validated the fix with hardware A/B testing: removing it reproduced
corruption, while the fixed kernel completed the same test sequence.
This also gives us a solid basis for replacing the temporary GUP
workaround with nofault uaccess.

Paul, please hold off on taking this version into for-next until
these fixes are included. The rebase and PMU testing are useful, but
there are still outstanding correctness issues.

I will consolidate the changes and post v12 against riscv/for-next,
with an updated changelog and validation results. Let's coordinate
the next posting to keep everything together.

Thanks,
Zhanpeng

[1] https://lore.kernel.org/r/as79MHtNYd-VbUug@hu-himchau-blr.qualcomm.com/
