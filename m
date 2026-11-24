Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.161
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795488997;
	b=kijf/0FxrWkXZVK9v92DjiKZSJNHqR33i3djgvAo48tMjvpvu5ESeccvVTbmVcYtVULl
	 0pyy0HNOtAYxEmZBvZjJWxSFdPc6vCs4d7CXx9wAD6zEvDSzqTUkr79UARERgdFHvoBLp
	 TPD4wJqvLDfqpPrC1lGF950c0zzEGHke/MShrtpqMgUnLY3b5Ob/ZmpdGkq9y1Ee/hMAI
	 kCHq4arRAdUuATT1J+29F989WPzA8GGYSkKzRSWuMTYUqAlBqQe8x9tTexGM1jZ/wv5U0
	 uyIzoeSGnPb1a/kLBbTkcNPtSV51B7fw1z4ZjYJHFIq0nqgQpTN485aoRD8272pdj/A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795488997;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=gj3mWd7IEmlkse+JIc71Ny4Xgi5IszpBxHEcAPjOENs=;
	b=cb8OZvrEO7brFeFDMSYou61ikOg1zR0/kLtjpMt6Fq2v/t/tfSnj3VSOsl00CuCRYuHF
	 mqMIT+vK1/+hw43HdRddnIoD1g64xLBHtbexF5obdakgfhnHBH4vD3OmubWT37pwejsQk
	 8d91nGRApfkIKkgRCdSqhfnH3BJRXurioQz058HP7VC1WrODQ1veIrMZ/wJPEAAM1IaRu
	 3z4N11pyuzaV454KrHVW8baJ5bbMjUAaarftD7C+mPDdRp5GtpixpHPMCELcxPv6xCVlD
	 5yrdJ6PUdOBvw7OdVPdSGSzjKyDEC8iaDnmFS2GBNj4WWx02riMqtht7bIyqGf6bfmQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=XhyEorU7;
	arc=none smtp.remote-ip=95.215.58.161
Received: from mta1.migadu.com (out-161.mta1.migadu.com [95.215.58.161])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52AAD606A321
	for <linux-kselftest@vger.kernel.org>; Tue, 24 Nov 2026 02:56:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 52AAD606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=XhyEorU7
X-Envelope-To: linux-kselftest@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=mKkb2mZRK5lklvuAHgrDd1wjTRpureI06NHVFMHRLZ8=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795488994; v=1; x=1796093794;
 b=XhyEorU7OxormgUPhsfQi9H7ClQ46SlXMNBub6Cr8k+ixIVboMbOo2resWxH/yKilRZ63Ssk
 ub4ZmFTfkRouCDord+KdGK60Ntc3k0c46VWcQ1cGphN1LeC1dCUWFiGIjXCCVbC87NF+Z30SaEC
 5lEm1ir8QNlmhGCF8jerNtHg=
X-Envelope-To: linux-kselftest@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id af43e80e9290c8f5;
	Tue, 24 Nov 2026 02:56:33 +0000
X-Mizu-Trace-ID: af43e80e9290c8f5
X-Migadu-Flow: FLOW_OUT
Message-ID: <d2de7f21-538e-4a91-9d87-3e1625bec2d8@linux.dev>
Date: Tue, 24 Nov 2026 10:56:22 +0800
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH-next v2 1/3] tick/sched: Make tick_nohz_full_mask and
 HK_TYPE_KERNEL_NOISE cpumask consistent
To: Waiman Long <longman@redhat.com>, Tejun Heo <tj@kernel.org>,
 Johannes Weiner <hannes@cmpxchg.org>, =?UTF-8?Q?Michal_Koutn=C3=BD?=
 <mkoutny@suse.com>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap
 <rdunlap@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 Peter Zijlstra <peterz@infradead.org>, Juri Lelli <juri.lelli@redhat.com>,
 Vincent Guittot <vincent.guittot@linaro.org>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>,
 Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>,
 Mel Gorman <mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>,
 K Prateek Nayak <kprateek.nayak@amd.com>,
 Anna-Maria Behnsen <anna-maria@linutronix.de>,
 Frederic Weisbecker <frederic@kernel.org>, Thomas Gleixner <tglx@kernel.org>
Cc: cgroups@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 Guopeng Zhang <guopeng.zhang@linux.dev>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
References: <20261123041209.382726-1-longman@redhat.com>
 <20261123041209.382726-2-longman@redhat.com>
From: Ridong Chen <ridong.chen@linux.dev>
In-Reply-To: <20261123041209.382726-2-longman@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 11/23/2026 12:12 PM, Waiman Long wrote:
> When the nohz_full boot parameter is first set, the cpu list parameter is
> passed directly to tick_nohz_full_setup() to set up tick_nohz_full_mask
> cpumask. Then the HK_TYPE_KERNEL_NOISE cpumask will be set up as the
> inverse of given cpu list parameter. Some of the timer code and RCU
> uses tick_nohz_full_mask directly while other timer code, scheduler
> and other subsystems use the HK_TYPE_KERNEL_NOISE cpumask.
> 
> With CONFIG_PM_SLEEP_SMP && !CONFIG_PM_SLEEP_SMP_NONZERO_CPU config
> options, the boot CPU will be cleared from tick_nohz_full_mask if set
> while the corresponding HK_TYPE_KERNEL_NOISE cpumask isn't touched.
> The nohz_full entry in kernel-parameters.txt does state that the boot
> CPU will be forced outside the range to maintain the timekeeping. So it
> makes sense that the HK_TYPE_KERNEL_NOISE should be modified accordingly.
> 
> Fix this inconsistency problem by adding a new cpumask_set_cpu() init
> function to be called by tick_nohz_init() when the boot CPU is cleared
> from tick_nohz_full_mask.
> 
> PM_SLEEP_SMP_NONZERO_CPU depends on ARCH_SUSPEND_NONZERO_CPU which can
> only be set for the PowerPC architecture. Moreover CONFIG_PM_SLEEP_SMP is
> on by default, it means most kernels will not allow CPU 0 to be set in
> the tick_nohz_full_mask and hence should be set in HK_TYPE_KERNEL_NOISE
> cpumask.
> 
> Fixes: 6f1982fedd59 ("sched/isolation: Handle the nohz_full= parameter")
> Signed-off-by: Waiman Long <longman@redhat.com>
> ---
>   include/linux/sched/isolation.h |  2 ++
>   kernel/sched/isolation.c        | 11 +++++++++++
>   kernel/time/tick-sched.c        |  2 ++
>   3 files changed, 15 insertions(+)
> 
> diff --git a/include/linux/sched/isolation.h b/include/linux/sched/isolation.h
> index cf0fd03dd7a2..ae5109450ac9 100644
> --- a/include/linux/sched/isolation.h
> +++ b/include/linux/sched/isolation.h
> @@ -44,6 +44,7 @@ extern bool housekeeping_enabled(enum hk_type type);
>   extern void housekeeping_affine(struct task_struct *t, enum hk_type type);
>   extern bool housekeeping_test_cpu(int cpu, enum hk_type type);
>   extern int housekeeping_update(struct cpumask *isol_mask);
> +extern void __init housekeeping_set_cpu(int cpu, enum hk_type type);
>   extern void __init housekeeping_init(void);
>   
>   #else
> @@ -72,6 +73,7 @@ static inline bool housekeeping_test_cpu(int cpu, enum hk_type type)
>   }
>   
>   static inline int housekeeping_update(struct cpumask *isol_mask) { return 0; }
> +static inline void housekeeping_set_cpu(int cpu, enum hk_type type) { }
>   static inline void housekeeping_init(void) { }
>   #endif /* CONFIG_CPU_ISOLATION */
>   
> diff --git a/kernel/sched/isolation.c b/kernel/sched/isolation.c
> index 156025ef81b7..c0c8b8862cbd 100644
> --- a/kernel/sched/isolation.c
> +++ b/kernel/sched/isolation.c
> @@ -120,6 +120,17 @@ bool housekeeping_test_cpu(int cpu, enum hk_type type)
>   }
>   EXPORT_SYMBOL_GPL(housekeeping_test_cpu);
>   
> +void __init housekeeping_set_cpu(int cpu, enum hk_type type)
> +{
> +	/* Only CPU setting of HK_TYPE_KERNEL_NOISE is currently supported */
> +	if (type != HK_TYPE_KERNEL_NOISE)
> +		return;
> +
> +	if (static_branch_unlikely(&housekeeping_overridden) &&
> +	    READ_ONCE(housekeeping.flags) & BIT(type))
> +		cpumask_set_cpu(cpu, housekeeping_cpumask_dereference(type));
> +}
> +
>   int housekeeping_update(struct cpumask *isol_mask)
>   {
>   	struct cpumask *trial, *old = NULL;
> diff --git a/kernel/time/tick-sched.c b/kernel/time/tick-sched.c
> index 255488366d7c..d9f45c9f9b89 100644
> --- a/kernel/time/tick-sched.c
> +++ b/kernel/time/tick-sched.c
> @@ -22,6 +22,7 @@
>   #include <linux/sched/stat.h>
>   #include <linux/sched/nohz.h>
>   #include <linux/sched/loadavg.h>
> +#include <linux/sched/isolation.h>
>   #include <linux/module.h>
>   #include <linux/irq_work.h>
>   #include <linux/posix-timers.h>
> @@ -683,6 +684,7 @@ void __init tick_nohz_init(void)
>   			pr_warn("NO_HZ: Clearing %d from nohz_full range "
>   				"for timekeeping\n", cpu);
>   			cpumask_clear_cpu(cpu, tick_nohz_full_mask);
> +			housekeeping_set_cpu(cpu, HK_TYPE_KERNEL_NOISE);
>   		}
>   	}
>   

Reviewed-by: Ridong Chen <ridong.chen@linux.dev>
Thanks.
-- 
Best regards
Ridong

