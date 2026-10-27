Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=90.155.50.34
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793095740;
	b=TowVwlzT4OjJINJqUD+Gn2u51q8xaGe+8uzUzPxEKEjQy2zuETEWfhYWRQ1PK0lpK1b2
	 EPX02hEn4uOcp5GLa7ytgJJpiUrX0SuHiMM+nq88AJUF4jgVVG+rZXnorXHZc2mPtxD+d
	 9SZ2WtIpVOfy5tCvKBSLNJzfigwvDFi3xIjtsscuhlLo8JxqdclFk30Gbl/mSDWrNUepE
	 6QpV9IK/OecoiSod7nYn2PNK+M/RU6w1McUazw9Zf6IeelDyPpQldq680X5W5bUNgApn3
	 HIL8B0z/3R+FsrNFTE2m8PfoFPLzpUWOIcPB7nEbm3oX593h0xE+YmZBDUPYHxB7kcg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793095740;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=qiaO6NvHT131FFl120scy8yJd6FUUFlCG1Hv9v54ahE=;
	b=y9bSdBHj/6kLqvwctfZ4SnSUNbDhMM+/C2OxRwZFpEI6EFg3WC2e0CAMLkRoqv/tRsGo
	 AD45YR/lrnBaY1LshbR0RO7O0DWBeUbHZKxj2bpqaY6wK96tzqueUiHId4RwPuhtjcC+a
	 WOZZH8wn68wqA3XFRphJq83wLZRwVz8RIHBP2+IDLE9SL6tULEpZw08ne1Cjx5+FWbl3R
	 KDecdEhJiGMx3Odc+TElKMK5oR/HnBmnTfR8XElibypgs+1lolLKc4EA2VVvVP03+H2DK
	 vflYtTRubzDP6JtEwXp+O2L6Cb70kN/xi1UNTokTEa17c1vTZeDfxk6KroXMTvCPLwA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=infradead.org;
	spf=pass smtp.mailfrom=infradead.org;
	dkim=pass header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=NGCBUMdX;
	arc=none smtp.remote-ip=90.155.50.34
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26514606A31E;
	Tue, 27 Oct 2026 10:08:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 26514606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=NGCBUMdX
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=qiaO6NvHT131FFl120scy8yJd6FUUFlCG1Hv9v54ahE=; b=NGCBUMdXdJFVTJj/z7nivuoX+x
	CSbKmBIGQqxpLcFazgufw9fMYp0JyrILLrWQDML7QuHtBndH792b+RdtE3kRq9V6oT2HgvEso/rad
	JYDY8nBxqwqzCP5uDMP88K/QyIf1xMX38sEUkKKWpEpcHPOe1ZYVEoaIoyM4RxKwd+rXOdDhKw9JB
	w5W3VXGbtLBDiS3xEhiiLGnyvycGD/C8FQOgfy+JyKc+Oh0fVP6DNAKuwICnx9RGFlU+M28hW+hE7
	CU48hgn6IuCXWODpk2UPqQtPHcKrWwzqOso/g5h3RX/7JsDBEIWEGbm6yW/c0q/k5lFCQBzEl60Ng
	ITd03XIA==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLe6m-0000000CuBU-48NO;
	Tue, 27 Oct 2026 10:08:45 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 08E3A300DB9; Tue, 27 Oct 2026 11:08:44 +0100 (CET)
Date: Tue, 27 Oct 2026 11:08:43 +0100
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
Subject: Re: [PATCH 1/3] sched/core: Skip the shadow stack end check when SCS
 is disabled
Message-ID: <20261027100843.GA2668564@noisy.programming.kicks-ass.net>
References: <cover.1793082868.git.chris@chrisdown.name>
 <0e607d3aa7c2c4cc1b5b8ba7b0e25ebdb55726af.1793082868.git.chris@chrisdown.name>
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
In-Reply-To: <0e607d3aa7c2c4cc1b5b8ba7b0e25ebdb55726af.1793082868.git.chris@chrisdown.name>

On Tue, Oct 27, 2026 at 02:36:09PM +0800, Chris Down wrote:
> With CONFIG_DYNAMIC_SCS, shadow call stacks are only used when the boot
> CPU lacks pointer authentication. scs_release() already checks
> scs_is_enabled() before it looks at the shadow stack since commit
> 9beccca09840 ("scs: add support for dynamic shadow call stacks"), but
> schedule_debug() does not.
> 
> With CONFIG_SCHED_STACK_END_CHECK=y it therefore checks init_task's
> unused shadow stack on every context switch. That is harmless right now,
> but the check is redundant and costs a load from an unrelated cache line
> in __schedule().
> 
> So, let's guard on scs_is_enabled(). It is a static branch, and it folds
> to true when CONFIG_DYNAMIC_SCS is not set.
> 
> Signed-off-by: Chris Down <chris@chrisdown.name>
> ---
>  kernel/sched/core.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/kernel/sched/core.c b/kernel/sched/core.c
> index d7c3b43158de..fc269fd10192 100644
> --- a/kernel/sched/core.c
> +++ b/kernel/sched/core.c
> @@ -6152,7 +6152,7 @@ static inline void schedule_debug(struct task_struct *prev, bool preempt)
>  	if (task_stack_end_corrupted(prev))
>  		panic("corrupted stack end detected inside scheduler\n");
>  
> -	if (task_scs_end_corrupted(prev))
> +	if (scs_is_enabled() && task_scs_end_corrupted(prev))
>  		panic("corrupted shadow stack detected inside scheduler\n");

How about you push that scs_is_enabled() into task_scs_end_corrupted(),
this makes less noise here, and also keeps the next patch saner, no?
