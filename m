Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=90.155.92.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793096246;
	b=0ak9bKgH7dYuQRezjOYu3M92W3vidhTel9rESCETe1JBF/ZnuNTIz0j4I+xUuvYqMwch
	 CZmkKUI/b3gBgbvsyZVvtXvyuD7l6vweXoyQJJ6Hky409W8Cc7rAA22wC9+XPHnn70hcn
	 dP5sZv3oFGa/4qmogRTmEBvluZHNuoRUL7VCJNYEJLEJWG5ZPL+o0CrXY5RLFv9K1ycAi
	 z857WUe8g72miTjOUJ8AWsNryhezkmBSVldoTJ1GYBToD7VVL0p78UiaLMSTthJR70X36
	 e3uW26tVppCc5eTMKCLKkRqeI95dPQbcU29E2lFDj8y858Awn3pJ/MIT9uTKvsF7Mkw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793096246;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=z0ECnIZcfjaHWvnEWv9CS9AUxde5/Sd5zctaZmB4Mes=;
	b=u4oqBGKdV2iHrj1AkdgjsjUHKkLmnIRlpicmIGXtimWXDPE3tWi65zFbKosStDKzL1UF
	 HdHI7UehxtG+3Frv/PstVMJOvayVpPpwQqLHugJBesYEazEmLJ6Z7WNdox5mxUENkhUPi
	 /JBNdndDiNGeLgkvaPBQ5LuxePQqvP2bok5DGzZnqhe0L8w786xu5sqCMwvNkMvXfpj9G
	 Wp0GIsd47gF+ysZbcQWqrObCn2UTrQ6I6+cUtC9he9Xdo4wJHZ1zSbne86tiiUprL3SKg
	 TAhdiBLeYw+HSAxoJXIw6qiXfgVDBppmZdgbMYOvGpJnsOQ+0VGP5sVkTeZ+IJilYmw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=infradead.org;
	spf=pass smtp.mailfrom=infradead.org;
	dkim=pass header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b="J/OytH94";
	arc=none smtp.remote-ip=90.155.92.199
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C751606A320;
	Tue, 27 Oct 2026 10:17:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0C751606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=J/OytH94
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=z0ECnIZcfjaHWvnEWv9CS9AUxde5/Sd5zctaZmB4Mes=; b=J/OytH94niERjjNnCyanm0sACp
	9oX+BES4yTwe9x2jTflF5mZJPoPoMgWl7AyswlY+/XigL1zHv7gzrmgxbJoxhzi59XbOn7Y73QLow
	Y4sIGVdAJUT5JxFbPHfXn+lQbax9Arcc6UZGhPH0VU1XhL3zRyxtEfmaS0pAQ8qiJpq7J2b/ODrV5
	akhmUwaPYmpHCamFXp9CHTcqKNHP3CsXi/p3gjhKglmmoVY2LEFbkdElG7ZU87lQCf7h45VJfDBcB
	pWlqfSt0JfTW3llPsaCZkQFda+FNuN3lJhb4IpbDQc08bZnSxUo5M2rAqIwfKfeICScQYhn9Ndg7M
	0UlDbFlw==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLeEq-0000000EiPL-3Sv6;
	Tue, 27 Oct 2026 10:17:06 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 75DE43014C0; Tue, 27 Oct 2026 11:17:03 +0100 (CET)
Date: Tue, 27 Oct 2026 11:17:03 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Chris Down <chris@chrisdown.name>
Cc: Ingo Molnar <mingo@redhat.com>, Kees Cook <kees@kernel.org>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	Ard Biesheuvel <ardb@kernel.org>, Will Deacon <will@kernel.org>,
	Sami Tolvanen <samitolvanen@google.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>, Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org, linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-team@meta.com
Subject: Re: [PATCH 2/3] sched/core: Add sched_stack_end_check= boot parameter
Message-ID: <20261027101703.GB2668564@noisy.programming.kicks-ass.net>
References: <cover.1793082868.git.chris@chrisdown.name>
 <3d2bb6a8508b9d801878bb82c88165a1b1ff5f40.1793082868.git.chris@chrisdown.name>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3d2bb6a8508b9d801878bb82c88165a1b1ff5f40.1793082868.git.chris@chrisdown.name>

On Tue, Oct 27, 2026 at 02:36:21PM +0800, Chris Down wrote:
> CONFIG_SCHED_STACK_END_CHECK makes schedule_debug() check the magic at
> the end of the outgoing task's stack and panic if it has been
> overwritten.
> 
> Right now this can only be configured by setting the Kconfig option at
> build time. At Meta we have it on for some hosts and off for others,
> since it is helpful but adds cost on context switching. That means today
> we have to build separate kernels for each, which is less than ideal.
> 
> So let's make this configurable at boot time. In benchmarking sched pipe
> and sched messaging performance is unaffected.
> 
> Signed-off-by: Chris Down <chris@chrisdown.name>
> ---
>  .../admin-guide/kernel-parameters.txt         |  8 +++++
>  kernel/sched/core.c                           | 33 +++++++++++++++----
>  2 files changed, 35 insertions(+), 6 deletions(-)
> 
> diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
> index fbee7b544903..95911d33c0fe 100644
> --- a/Documentation/admin-guide/kernel-parameters.txt
> +++ b/Documentation/admin-guide/kernel-parameters.txt
> @@ -6811,6 +6811,14 @@ Kernel parameters
>  			core priority to both SMT siblings, so this option
>  			does not favor either sibling.
>  
> +	sched_stack_end_check= [KNL]
> +			Format: <bool>
> +			Check the magic value at the end of the outgoing
> +			task's stack (and its shadow call stack, if any) on
> +			every call to schedule(), and panic if it has been
> +			overwritten.
> +			Default set by CONFIG_SCHED_STACK_END_CHECK.
> +
>  	sched_verbose	[KNL,EARLY] Enables verbose scheduler debug messages.
>  
>  	schedstats=	[KNL,X86] Enable or disable scheduled statistics.
> diff --git a/kernel/sched/core.c b/kernel/sched/core.c
> index fc269fd10192..c1fb86b813bb 100644
> --- a/kernel/sched/core.c
> +++ b/kernel/sched/core.c
> @@ -6143,18 +6143,39 @@ static noinline void __schedule_bug(struct task_struct *prev)
>  	add_taint(TAINT_WARN, LOCKDEP_STILL_OK);
>  }
>  
> +static DEFINE_STATIC_KEY_MAYBE_RO(CONFIG_SCHED_STACK_END_CHECK, sched_stack_end_check);
> +
> +static int __init setup_sched_stack_end_check(char *str)
> +{
> +	bool enable;
> +
> +	if (kstrtobool(str, &enable)) {
> +		pr_warn("Unable to parse sched_stack_end_check=\n");
> +		return 0;
> +	}
> +
> +	if (enable)
> +		static_branch_enable(&sched_stack_end_check);
> +	else
> +		static_branch_disable(&sched_stack_end_check);
> +
> +	return 1;
> +}
> +__setup("sched_stack_end_check=", setup_sched_stack_end_check);
> +
>  /*
>   * Various schedule()-time debugging checks and statistics:
>   */
>  static inline void schedule_debug(struct task_struct *prev, bool preempt)
>  {
> -#ifdef CONFIG_SCHED_STACK_END_CHECK
> -	if (task_stack_end_corrupted(prev))
> -		panic("corrupted stack end detected inside scheduler\n");
> +	if (static_branch_maybe(CONFIG_SCHED_STACK_END_CHECK,
> +				&sched_stack_end_check)) {
> +		if (task_stack_end_corrupted(prev))
> +			panic("corrupted stack end detected inside scheduler\n");
>  
> -	if (scs_is_enabled() && task_scs_end_corrupted(prev))
> -		panic("corrupted shadow stack detected inside scheduler\n");
> -#endif
> +		if (scs_is_enabled() && task_scs_end_corrupted(prev))
> +			panic("corrupted shadow stack detected inside scheduler\n");
> +	}

I just noticed that there's a number of task_stack_end_corrupted()
checks that:

 - do not also do task_scs_end_corrupted(); should
   task_scs_end_corrupted() be put inside task_stack_end_corrupted() to
   make sure they're always done in tandem and the shadow stack check
   isn't lost?

 - should these other sites also respect this switch? It seems weird to
   only have this one site affected.
