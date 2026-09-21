Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DD8F43C047;
	Mon, 21 Sep 2026 20:43:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790023412; cv=none; b=WIbDo3mSM8UwsmknemiIqD3cMR1xuL2nPxjS0IGFh9XgSGztio/y5eqtfi+5c86pG1VwGtxiLNFd6GsHuIImGiJ/jPeKJbLbJAfAEPcPwOPNpbZ0p7ZXnFpz7eJNt684wJO+dNOJSlCarDkcBF7OanxZq1wbv4lLRMo0hcKPeZw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790023412; c=relaxed/simple;
	bh=gBxi2T/vMKU+BiSo+Ui+FI+d4NVmYjCst2Kn/5uJ2NQ=;
	h=Subject:From:To:Cc:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=SLLos8V5ZoszwT0EWloZ/csOLU6Pil6UcOpPZMxNXv8gDsSxZU8vucxwsm1E+rM2ZPjvc9i0Wk8RCOcBwM7VFOeLhDJgVRO5rwYyYU/aWhj4gkWxdsxFCcrh3q4wP3WGdTv9J/hoHNeDw01P/3qTxY2Tq2sMC73L5SJ0fQXEWY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F8eVZ6V4; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F8eVZ6V4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 034B51F000FF;
	Mon, 21 Sep 2026 20:43:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790023408;
	bh=OkORoPydzjHLVUfBfNGOGfURmMERuXsqtjYqBb6oYHc=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=F8eVZ6V4LCAhCEXk+vOIZb9SC7Aew0oYHe4HnKqeguKIj6NF7NktUMTfcSAUsoSJw
	 Os+L/YMo2h86s0xj11SW9hQSuBwUu0GlRA42tlU0GW/I54mbaQR5602gr45rja24Wr
	 q08y+Sn7ZsaW2Be4rLjRcAlPmMmVWMbsaXwaEdNKh1j2VOrcmNrgrWfJrB0mn+MoNN
	 +DyFU6+4KlOwRKlZIRJklWKZwbvU4XWzIB4QRiLBogi9mszimv1uq+GvGnHBjnewB2
	 VBEJyoou2UwCZiQ63Uzxwz+SgKdIDBs5UaEq+yW1FCordJBZkaxL/BvB8Np6kVM74N
	 s68AW/p3JEyow==
Subject: Re: [PATCH net-next v6 1/3] net/sched: sch_fq_pie: add per-flow
 statistics via class ops
From: netdev-bot+sashiko@kernel.org
To: hemendranaik@gmail.com
Cc: netdev@vger.kernel.org, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, horms@kernel.org, jiri@resnulli.us,
 jhs@mojatatu.com, shuah@kernel.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, vishy0777@gmail.com, tahiliani@nitk.edu.in
Date: Mon, 21 Sep 2026 20:43:27 +0000
Message-ID: <179002340755.2160803.3742716999091408861@kernel.org>
In-Reply-To: <20260917204225.275251-2-hemendranaik@gmail.com>
References: <20260917204225.275251-2-hemendranaik@gmail.com>
X-sashiko-severity: Medium
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Thank you for your contribution! Sashiko AI review found 6 potential
issue(s) to consider.

Critical: 0 · High: 0 · Medium: 2 · Low: 4 (1)

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] The fourth paragraph of the commit message is written as a bug
  fix ("Derive delay with div_u64() ... rather than truncating to u32…
- [Medium] net/sched: UAPI backward compatibility broken for
  tc_fq_pie_xstats size
- [Low] The new ABI field `tc_fq_pie_cl_stats.avg_dq_rate` is `__u32`
  documented as bytes/second, but fq_pie_dump_class_stats() computes the…
- [Low] The new class enumeration numbers flows 1..flows_cnt and encodes
  the number into the 16-bit minor field of tcm_handle.
- [Low] fq_pie_dump_class_stats() exports the per-flow probability as
  `READ_ONCE(flow->vars.prob) << BITS_PER_BYTE` with no bound check.
- [Low] Claim: fq_pie_dump_class_stats() samples per-flow PIE state
  (flow->vars.prob, flow->vars.qdelay, flow->vars.avg_dq_rate,…

Pre-existing issues:
- [Low] fq_pie_class_ops omits .tcf_block/.bind_tcf/.unbind_tcf while
  sch_fq_pie.c still allocates a tcf_block in fq_pie_init()…

--

net/sched: sch_fq_pie: add per-flow statistics via class ops

This adds a Qdisc_class_ops table to sch_fq_pie with walk, dump and
dump_stats so that per-flow PIE state can be read with 'tc -s class show'.
It extends tc_fq_pie_xstats with a type discriminator plus an embedded
tc_fq_pie_cl_stats, growing the structure from 36 to 64 bytes.

A few questions below.

First, about the last paragraph of the changelog:

    Derive delay with div_u64() from the full 64-bit nanosecond value rather
    than truncating to u32 before dividing, which wrapped for sojourn times
    above ~4.295 s, and widen avg_dq_rate to u64 before scaling it by
    PSCHED_TICKS_PER_SEC.

[Severity: Medium]
Is this paragraph describing a change made by this patch?  The diff is
purely additive and net/sched/sch_fq_pie.c had no delay or avg_dq_rate
conversion before it, so the new fq_pie_dump_class_stats() is not replacing
any truncating computation.

The code that actually contains both of the described defects is
pie_dump_stats() in net/sched/sch_pie.c, which this patch does not touch and
does not mention, and there is no Fixes: tag:

net/sched/sch_pie.c:pie_dump_stats() {
	...
	.delay		= ((u32)PSCHED_TICKS2NS(READ_ONCE(q->vars.qdelay))) /
			   NSEC_PER_USEC,
	...
	if (st.dq_rate_estimating)
		st.avg_dq_rate = READ_ONCE(q->vars.avg_dq_rate) *
				 (PSCHED_TICKS_PER_SEC) >> PIE_SCALE;
	...
}

Could the paragraph either be reworded as a deliberate difference from the
pie qdisc, or the series extended to fix pie_dump_stats() as well?  The
later patch in the series that re-documents tc_pie_xstats.delay as
microseconds leaves the wrapping conversion in place.

> diff --git a/include/uapi/linux/pkt_sched.h b/include/uapi/linux/pkt_sched.h
> index 490efd2885267..9c0c9787f0c32 100644
> --- a/include/uapi/linux/pkt_sched.h
> +++ b/include/uapi/linux/pkt_sched.h
> @@ -953,6 +953,20 @@ enum {
>  };
>  #define TCA_FQ_PIE_MAX   (__TCA_FQ_PIE_MAX - 1)
>  
> +enum {
> +	TCA_FQ_PIE_XSTATS_QDISC,
> +	TCA_FQ_PIE_XSTATS_CLASS,
> +};
> +
> +struct tc_fq_pie_cl_stats {
> +	__u64 prob;			/* current probability */
> +	__u32 delay;			/* current delay in microseconds */
> +	__s32 deficit;			/* number of remaining byte credits */
> +	__u32 avg_dq_rate;		/* current average dq_rate in
> +					 * bytes/second
> +					 */

[Severity: Low]
Since this is a new ABI field, is __u32 wide enough for avg_dq_rate?
fq_pie_dump_class_stats() computes the value in u64 and then stores it into
this 32-bit member with no saturation:

	xstats.class_stats.avg_dq_rate =
		((u64)READ_ONCE(flow->vars.avg_dq_rate)
		* PSCHED_TICKS_PER_SEC) >> PIE_SCALE;

With PSCHED_TICKS_PER_SEC == 15625000 and PIE_SCALE == 8 the internal
estimator value is scaled by 61035.15625, so a per-flow rate above
U32_MAX bytes/second (about 34.36 Gbit/s) wraps: an internal avg_dq_rate of
81920 (5,000,000,000 B/s) is reported as 705,032,704.

Widening the member to __u64 or clamping with min_t() is still possible
before the layout is frozen.  It does mirror the existing
tc_pie_xstats.avg_dq_rate width, so if matching that is intentional it
would be worth saying so.

> +	__u32 dq_rate_estimating;	/* is avg_dq_rate being calculated? */
> +};

[ ... ]

> diff --git a/net/sched/sch_fq_pie.c b/net/sched/sch_fq_pie.c
> index 5982847df8f85..3a3ef83f328b2 100644
> --- a/net/sched/sch_fq_pie.c
> +++ b/net/sched/sch_fq_pie.c

[ ... ]

> @@ -563,7 +565,89 @@ static void fq_pie_destroy(struct Qdisc *sch)
>  	kvfree(q->flows);
>  }
>  

[ ... ]

> +static int fq_pie_dump_class(struct Qdisc *sch, unsigned long cl,
> +			     struct sk_buff *skb, struct tcmsg *tcm)
> +{
> +	tcm->tcm_handle |= TC_H_MIN(cl);
> +	return 0;
> +}

[Severity: Low]
Can the class id for the last flow collide with the qdisc handle when
flows_cnt is at its maximum?  fq_pie_change() accepts 65536 flows:

net/sched/sch_fq_pie.c:fq_pie_change() {
	...
	if (!q->flows_cnt || q->flows_cnt > 65536) {
		NL_SET_ERR_MSG_MOD(extack,
				   "Number of flows must range in [1..65536]");
	...
}

and fq_pie_walk() numbers classes one-based with tc_qdisc_stats_dump(sch,
i + 1, arg), so the last bucket arrives here as cl == 0x10000.  TC_H_MIN
masks with 0xffff, so minor becomes 0 and the RTM_NEWTCLASS message keeps
the tcm_handle that tc_fill_tclass() already set from the qdisc, i.e. X:0.

That handle cannot be used to address the flow afterwards: fq_pie_find()
always returns 0 and fq_pie_classify() only honours minors in
[1, flows_cnt]:

	if (TC_H_MAJ(skb->priority) == sch->handle &&
	    TC_H_MIN(skb->priority) > 0 &&
	    TC_H_MIN(skb->priority) <= q->flows_cnt)

The same encoding exists in net/sched/sch_fq_codel.c with the same 65536
limit, so this is a faithful copy of existing behaviour, but capping the
emitted ids at 65535 would avoid it here.

> +
> +static int fq_pie_dump_class_stats(struct Qdisc *sch, unsigned long cl,
> +				   struct gnet_dump *d)
> +{
> +	struct fq_pie_sched_data *q = qdisc_priv(sch);
> +	struct gnet_stats_queue qs = { 0 };
> +	struct tc_fq_pie_xstats xstats;
> +	u32 idx = cl - 1;
> +
> +	if (idx < q->flows_cnt) {
> +		const struct fq_pie_flow *flow = &q->flows[idx];
> +
> +		memset(&xstats, 0, sizeof(xstats));
> +		xstats.type = TCA_FQ_PIE_XSTATS_CLASS;
> +		xstats.class_stats.prob =
> +			READ_ONCE(flow->vars.prob) << BITS_PER_BYTE;

[Severity: Low]
Can this shift discard the high bits of prob?  pie_calculate_probability()
in net/sched/sch_pie.c does not clamp vars->prob to MAX_PROB
(U64_MAX >> 8) on the increase path; its only guard is the full u64 wrap:

net/sched/sch_pie.c:pie_calculate_probability() {
	...
	WRITE_ONCE(vars->prob, vars->prob + delta);

	if (delta > 0) {
		/* prevent overflow */
		if (vars->prob < oldprob) {
			WRITE_ONCE(vars->prob, MAX_PROB);
	...
}

Sustained congestion can add up to roughly 4% of MAX_PROB per tupdate
(the 2% cap plus MAX_PROB/50 when qdelay exceeds 250 ms), so vars.prob can
grow past MAX_PROB.  The shift by 8 then drops the top bits and a flow that
pie_drop_early() is dropping unconditionally is reported with a near-zero
probability.

Would min_t(u64, READ_ONCE(flow->vars.prob), MAX_PROB) before scaling be
reasonable?  The same expression already exists in pie_dump_stats(), so
fixing both would keep them consistent.

> +		xstats.class_stats.delay =
> +			div_u64(PSCHED_TICKS2NS(READ_ONCE(flow->vars.qdelay)),
> +				NSEC_PER_USEC);
> +		xstats.class_stats.deficit = READ_ONCE(flow->deficit);

[Severity: Low]
This isn't a bug, but a note for anyone reading the sampling here: the
64-bit flow->vars.prob and flow->vars.qdelay are read without the qdisc
lock, since tc_fill_tclass() passes NULL as the lock to
gnet_stats_start_copy_compat(), so the snapshot is not internally
consistent and can tear on 32-bit kernels.

That matches the direction set by commit 5154561d9b119f ("net/sched:
sch_pie: annotate data-races in pie_dump_stats()") and commit
6d4106e8df94c0, and fq_codel_dump_class_stats() samples flow->cvars.* and
flow->deficit the same way, so no change seems needed.

> +		xstats.class_stats.dq_rate_estimating =
> +			READ_ONCE(q->p_params.dq_rate_estimator);
> +
> +		if (xstats.class_stats.dq_rate_estimating) {
> +			xstats.class_stats.avg_dq_rate =
> +				((u64)READ_ONCE(flow->vars.avg_dq_rate)
> +				* PSCHED_TICKS_PER_SEC) >> PIE_SCALE;
> +		}
> +
> +		qs.qlen    = READ_ONCE(flow->qlen);
> +		qs.backlog = READ_ONCE(flow->backlog);
> +	}
> +	if (gnet_stats_copy_queue(d, NULL, &qs, qs.qlen) < 0)
> +		return -1;
> +	if (idx < q->flows_cnt)
> +		return gnet_stats_copy_app(d, &xstats, sizeof(xstats));
> +	return 0;
> +}
> +
> +static void fq_pie_walk(struct Qdisc *sch, struct qdisc_walker *arg)
> +{
> +	struct fq_pie_sched_data *q = qdisc_priv(sch);
> +	unsigned int i;
> +
> +	if (arg->stop)
> +		return;
> +
> +	for (i = 0; i < q->flows_cnt; i++) {
> +		if (list_empty(&q->flows[i].flowchain)) {
> +			arg->count++;
> +			continue;
> +		}
> +		if (!tc_qdisc_stats_dump(sch, i + 1, arg))
> +			break;
> +	}
> +}
> +
> +static const struct Qdisc_class_ops fq_pie_class_ops = {
> +	.leaf		=	fq_pie_leaf,
> +	.find		=	fq_pie_find,
> +	.dump		=	fq_pie_dump_class,
> +	.dump_stats	=	fq_pie_dump_class_stats,
> +	.walk		=	fq_pie_walk,
> +};

[Severity: Low]
This is a pre-existing gap and is not introduced by this patch, but since
the new ops table is the natural place to address it: sch_fq_pie.c still
allocates a block in fq_pie_init() with
tcf_block_get(&q->block, &q->filter_list, sch, extack) and classifies every
packet through q->filter_list in fq_pie_classify(), yet no filter can ever
be attached.

net/sched/cls_api.c:__tcf_qdisc_find() {
	...
	if (!cops->tcf_block) {
		NL_SET_ERR_MSG(extack, "Class doesn't support blocks");
		err = -EOPNOTSUPP;
		goto errout_qdisc;
	}
	...
}

So rcu_dereference_bh(q->filter_list) in fq_pie_classify() is always NULL
and the "optional external classifier" path stays dead code.  Would it make
sense to either wire up a root-only .tcf_block plus .bind_tcf/.unbind_tcf
the way fq_codel_class_ops does, or drop the unused block and filter_list?

> +
>  static struct Qdisc_ops fq_pie_qdisc_ops __read_mostly = {
> +	.cl_ops		= &fq_pie_class_ops,
>  	.id		= "fq_pie",

[ ... ]

> @@ -963,6 +977,8 @@ struct tc_fq_pie_xstats {
>  	__u32 new_flows_len;	/* count of flows in new list */
>  	__u32 old_flows_len;	/* count of flows in old list */
>  	__u32 memory_usage;	/* total memory across all queues */
> +	__u32 type;
> +	struct tc_fq_pie_cl_stats class_stats;
>  };
>  
>  /* CBS */

[Severity: Medium]
Growing struct tc_fq_pie_xstats from 36 to 64 bytes is visible to
userspace in both directions, and the changelog only argues the one
direction - that the nine existing __u32 counters keep their offsets, so
an old tc still parses a new kernel's payload.  The other direction is a
new tc on an old kernel: iproute2's fq_pie_print_xstats() rejects the
attribute outright if RTA_PAYLOAD(xstats) is smaller than
sizeof(struct tc_fq_pie_xstats), so a tc rebuilt against this header
(sizeof == 64) silently stops printing anything for 'tc -s qdisc show
dev ... fq_pie' on every kernel that still emits the 36-byte payload
from fq_pie_dump_stats().

That is not a kernel regression as such, but it does mean a distro tc
update loses fq_pie statistics on older kernels, so it would be good to
have it spelled out.  Does the accompanying iproute2 change parse
defensively, e.g. copying min(RTA_PAYLOAD(xstats), sizeof(st)) bytes
into a zeroed local struct rather than bailing out?  The enum values
help here: TCA_FQ_PIE_XSTATS_QDISC is 0, so a short read that is
zero-filled still resolves to the qdisc variant, and a length-tolerant
parse needs no extra magic.  Could that reasoning be added to the
changelog?

The alternative would be to leave tc_fq_pie_xstats at 36 bytes
entirely and emit a separate struct (just tc_fq_pie_cl_stats, with its
own discriminator if one is needed) from fq_pie_dump_class_stats(), so
the qdisc path's payload length never changes.  fq_codel could put the
type first and union the two variants in tc_fq_codel_xstats because the
discriminator was there from day one; fq_pie cannot do that without
moving offsets, which is exactly why appending here perturbs the qdisc
path as well.  Was that option considered and rejected?

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20260917204225.275251-1-hemendranaik%40gmail.com
