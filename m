Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C7523DB63D;
	Fri,  4 Sep 2026 23:18:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788563881; cv=none; b=fN1y6r03e9ePA9/1B5ycj0f7Cn8eibCH/c/hFDWFGcQqkGZ95VQd1KyXgAxa0V/gLLTPsuy/URs5g73ImWhjphoxMbGt3NOPCCpjtNzYCU0LzH9YCLxD1c/KNgqqRmEDb9LLjGnhejLTkECs2FA/Hl+0FRO2av4hwWHJXfj1Kvo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788563881; c=relaxed/simple;
	bh=zT75j2GXH5jNxRc8qHBSckmGlvotDQQjM4jlGImV5Xc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=A6tOO60ZgChzHpAfvfpNaQV26VREZnDbx8Jd37Zt8SVpPCnaWy6Rl5bXl7OoG9FEu7UtZy7+8/P5RMR9rsNkIz08gsGOXqAgb+I2Q8MiUsLJup+Ogi0/ptKftGSAElXGA+22LNjfPLL0C7dQQK7zvka51OekjjU7kXio8V3rXpE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=f9VyTXjE; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="f9VyTXjE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1AA21F00A3E;
	Fri,  4 Sep 2026 23:17:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788563880;
	bh=P5tLENWTBClt5WkRURAtLRHuwoSyuKPVDByJOsd0n90=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=f9VyTXjE9iLzXdi3MD966JvStcDqs4r1rs+BvAhcrDLPFHdFLGQ7XS0lnNqiKNoEj
	 OpB6pPPEQ9WgS0+lz2p+Sz8RCG3BtzKn27SUVw3WHPIeycY9wrDJzQaBYVJpnA0zUJ
	 UAHDZHl5zlBe4KXQAqPQbb1m/bY8VQzEQ99WqxsZG9Gwehu3c9b0SFkyRAIY04NCRd
	 2TDpCUZK5JYgHAfrpRdWCfULnWrTcTb0c95R5F3YcZ1dq+2XHu0OcVAJsgEheA4/CM
	 ZUJw5ijRpzBUBWmDnxZA31xf7UQDkj6L/NzsfHJ+qYv6gTgNeZW9CyVLBvN/Gyg4+I
	 qAnKMnI97JYOg==
From: Jakub Kicinski <kuba@kernel.org>
To: hemendranaik@gmail.com
Cc: Jakub Kicinski <kuba@kernel.org>,
	netdev@vger.kernel.org,
	davem@davemloft.net,
	edumazet@google.com,
	pabeni@redhat.com,
	horms@kernel.org,
	jiri@resnulli.us,
	jhs@mojatatu.com,
	shuah@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	vishy0777@gmail.com,
	tahiliani@nitk.edu.in
Subject: Re: [PATCH net-next v5 3/3] net/sched: pie: correct tc_pie_xstats field documentation
Date: Fri,  4 Sep 2026 16:17:58 -0700
Message-ID: <20260904231758.4082471-1-kuba@kernel.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260902035231.81866-4-hemendranaik@gmail.com>
References: <20260902035231.81866-4-hemendranaik@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is an AI-generated review of your patch. The human sending this
email has considered the AI review valid, or at least plausible.
---
net/sched: pie: correct tc_pie_xstats field documentation

This updates the comments in struct tc_pie_xstats so the delay field is
described in microseconds and avg_dq_rate in bytes/second. The change is
described as documentation-only, touching include/uapi/linux/pkt_sched.h.

> diff --git a/include/uapi/linux/pkt_sched.h b/include/uapi/linux/pkt_sched.h
> index 89d825bac4bee..c1f7bde472fb2 100644
> --- a/include/uapi/linux/pkt_sched.h
> +++ b/include/uapi/linux/pkt_sched.h
> @@ -920,9 +920,9 @@ enum {
>  
>  struct tc_pie_xstats {
>  	__u64 prob;			/* current probability */
> -	__u32 delay;			/* current delay in ms */
> +	__u32 delay;			/* current delay in microseconds */

[Severity: Low]
Should the vendored copy in tools/include/uapi/linux/pkt_sched.h be updated
in the same patch?  Its struct tc_pie_xstats still carries exactly the
wording being removed here:

tools/include/uapi/linux/pkt_sched.h:
struct tc_pie_xstats {
	__u32 prob;             /* current probability */
	__u32 delay;            /* current delay in ms */
	__u32 avg_dq_rate;      /* current average dq_rate in bits/pie_time */
	__u32 packets_in;       /* total number of packets enqueued */
	...
};

So after this change the two in-tree copies of the same structure describe
the same field with different units.

That copy also looks stale in other ways: it declares __u32 prob and has no
dq_rate_estimating member, while pie_dump_stats() in net/sched/sch_pie.c
fills a __u64 prob and always sets st.dq_rate_estimating before
gnet_stats_copy_app(), and its TCA_PIE_* enum lacks
TCA_PIE_DQ_RATE_ESTIMATOR.  The FQ-PIE additions exported by
fq_pie_dump_class_stats() (TCA_FQ_PIE_XSTATS_QDISC/CLASS and
struct tc_fq_pie_cl_stats) are missing there as well.

The layout drift predates this series, but the unit-comment mismatch between
the two copies is introduced by touching only one of them.  Would a resync of
tools/include/uapi/linux/pkt_sched.h, or at least of the tc_pie_xstats
comments, be appropriate so the stale documentation the commit message aims
to eliminate is actually gone from the tree?

[Severity: Medium]
This isn't a bug introduced by this patch, but does the exported value always
match the newly documented microsecond unit?  pie_dump_stats() in
net/sched/sch_pie.c computes:

	.delay		= ((u32)PSCHED_TICKS2NS(READ_ONCE(q->vars.qdelay))) /
			   NSEC_PER_USEC,

PSCHED_TICKS2NS() is a 64-bit shift, and the (u32) cast is applied to the
nanosecond intermediate before the division, so a qdelay whose nanosecond
value exceeds 2^32-1 (roughly 4.295 s) wraps modulo 2^32 ns and then gets
divided, reporting a small microsecond number for a large delay.  The __u32
field itself can hold about 71 minutes worth of microseconds, so the
truncation comes only from where the cast sits.

The same expression is used for the per-flow delay in
fq_pie_dump_class_stats() in net/sched/sch_fq_pie.c:

	xstats.class_stats.delay =
			((u32)PSCHED_TICKS2NS(READ_ONCE(flow->vars.qdelay))) /
			NSEC_PER_USEC;

This is reachable with a deep queue on a very slow link, where tc -s qdisc
show would print a wrong (small) delay.

Would moving the cast after the division in both sch_pie.c and sch_fq_pie.c
be worth a follow-up, so the code matches the microsecond contract this
comment now states?

>  	__u32 avg_dq_rate;		/* current average dq_rate in
> -					 * bits/pie_time
> +					 * bytes/second
>  					 */
>  	__u32 dq_rate_estimating;	/* is avg_dq_rate being calculated? */
>  	__u32 packets_in;		/* total number of packets enqueued */
