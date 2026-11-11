Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794424312;
	b=bRC6jl0fUk04Pki1+gr3fbE9uvWoYIdN3AAAYxmfWPUQdcG3vEOnsED8MweX/cjToWz8
	 9B5xXZ1qaHbVvxClcs3Jod5KDpuJGCxvZUcKYk2xGdbi2g6tDDIiKG0k9oxg0MdtYJb5Z
	 MdsbiyFsSl/5fnFBKwF5GvLFWMmhuxxsncC1rB27h6zrrBEn0lWezya433Z+RmV6sVSDQ
	 LF6U/U9XZ7pjE6XJX0KBfzO+kF/bqUOiI5PIGiaUeuujDBX/LdmemhlpR/xg31JssC4xD
	 uEiJem3Royd5XikXVZ3Bj+BDUGn3tUq9uTMEAh8270QQjR7Z7/ku1PJS4h1xnbK4f4Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794424312;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=z3Tad0xYElBxCFHtO8obKkkc8QipjCycJHubLpMEJ2A=;
	b=3T+mo0zQ9ynaCaOMesC/ZKEbBrL51SAmhMfzyP5iTg80WopeVva4YNYPfozo/HcY642c
	 ZKR2+lBOH0GU/WJp0QPu0rGRZBjZy5W+AU6mybhbeH898lk9XawegSolJEYh8vaK2Y7d2
	 704zPjxwvqPhtcrQw1PWxoO6s5LYhIQ1saJB7sHQLnc0/ddxyVjErchkupkmKT9KApkVG
	 uq/hLLGFCTzOEEcQkNXNGrLU2l6hdMkf3CoIl/Gn80RvJXtAoISDSkIb7KLPc9h6/7g1T
	 Pcn/NJsoh9lALoHc9NbbdW4RwLNhX6eZMTeFg1Lso1YkFPpD8pyhy4i8h4GqGJM3dvQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=P1CiJu6h;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 076FC606A321;
	Wed, 11 Nov 2026 19:11:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=P1CiJu6h
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CEEE91F00A05;
	Wed, 11 Nov 2026 19:11:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794424311;
	bh=z3Tad0xYElBxCFHtO8obKkkc8QipjCycJHubLpMEJ2A=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=P1CiJu6h1s62LGw6hg5Yv9yLh5D4UieRJsXKdbezMTc+lduNEycJ+v1uNyfkoNiz0
	 IgUyH7fFIdzsb11/OFSev/p95jegPyg4PuidJZa+SwzOgOIcyarYKas9zqwdYVBc/K
	 ccjAX5UUFN6YuLOxZXTo5nEvfJwAw7UEOWV1EURXHrJXMY0zW32IwmAF91mIkSUn4l
	 RUP9vmBDcafBwZzNNp+4bLlOjK8g3GEfk4rIhfxhV9odjFLTT5sh+zV3PhHQGqt7fA
	 3nCyMVGMYfBsIswbE/oDXo00OYOyTiJh9V3U/brUwnRyguaehbp4+1G9fXfrCpVefE
	 29TRWDPOb1H6Q==
Subject: Re: [PATCH net-next v10 1/4] net/sched: sch_fq_pie: add per-flow
 statistics via class ops
From: netdev-bot+sashiko@kernel.org
To: hemendranaik@gmail.com
Cc: netdev@vger.kernel.org, davem@davemloft.net, edumazet@kernel.org,
 kuba@kernel.org, pabeni@redhat.com, horms@kernel.org, jiri@resnulli.us,
 jhs@mojatatu.com, shuah@kernel.org, donald.hunter@gmail.com, ast@fiberby.net,
 toke@redhat.com, liuhangbin@kylinos.cn, j.koeppeler@tu-berlin.de,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 vishy0777@gmail.com, tahiliani@nitk.edu.in
Date: Wed, 11 Nov 2026 19:11:50 +0000
Message-ID: <179442431035.2199510.1711014291081822930@kernel.org>
In-Reply-To: <20261109071017.438478-2-hemendranaik@gmail.com>
References: <20261109071017.438478-2-hemendranaik@gmail.com>
X-sashiko-severity: Medium
Content-Type: text/plain; charset="utf-8"
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

Thank you for your contribution! Sashiko AI review found 5 potential
issue(s) to consider.

Critical: 0 · High: 0 · Medium: 2 · Low: 3

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] The new uAPI field `tc_fq_pie_cl_stats.avg_dq_rate` is
  declared `__u32` and documented as "current average dq_rate in…
- [Medium] fq_pie_dump_class_stats() reads flow->deficit, flow->qlen and
  flow->backlog with READ_ONCE() and no qdisc lock: tc_fill_tclass()…
- [Low] The commit message says the patch makes 'tc -s class show' report
  per-flow prob, delay, deficit, avg_dq_rate and dq_rate_estimating.
- [Low] fq_pie_change() accepts flows_cnt values from 1 to 65536.
- [Low] Setting `.cl_ops` makes the tc core treat fq_pie as classful,
  which changes user-visible behaviour that the commit message does not…

--

net/sched: sch_fq_pie: add per-flow statistics via class ops

This patch adds a type discriminator and a tc_fq_pie_cl_stats member to
tc_fq_pie_xstats, which grows the struct from 36 to 64 bytes. It also wires
up fq_pie_class_ops so that each active flow is dumped as a class with its
PIE state.

> diff --git a/include/uapi/linux/pkt_sched.h b/include/uapi/linux/pkt_sched.h
> index 490efd2885267..fef848eaaab23 100644
> --- a/include/uapi/linux/pkt_sched.h
> +++ b/include/uapi/linux/pkt_sched.h
> @@ -953,6 +953,21 @@ enum {
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

[Severity: Medium]
Can avg_dq_rate overflow? It is a __u32 documented in bytes/second, but
fq_pie_dump_class_stats() computes it as a u64:

    xstats.class_stats.avg_dq_rate =
        ((u64)READ_ONCE(flow->vars.avg_dq_rate)
        * PSCHED_TICKS_PER_SEC) >> PIE_SCALE;

The result is stored without saturation.

pie_process_dequeue() sets vars.avg_dq_rate to
(dq_count << PIE_SCALE) / dtime. That can represent rates above 2^32
bytes/s (about 4.29 GB/s, or roughly 34 Gbit/s). If dq_rate_estimator is
enabled and one flow drains faster than that, the reported value would
wrap.

This is a new uAPI field and can't be widened later. Would __u64 be a better
fit? tc_pie_xstats uses the same width, but the netlink guidelines prefer
wider types for new values.

> +	__u32 dq_rate_estimating;	/* is avg_dq_rate being calculated? */
> +};
> +
>  struct tc_fq_pie_xstats {
>  	__u32 packets_in;	/* total number of packets enqueued */
>  	__u32 dropped;		/* packets dropped due to fq_pie_action */
> @@ -963,6 +978,8 @@ struct tc_fq_pie_xstats {
>  	__u32 new_flows_len;	/* count of flows in new list */
>  	__u32 old_flows_len;	/* count of flows in old list */
>  	__u32 memory_usage;	/* total memory across all queues */
> +	__u32 type;
> +	struct tc_fq_pie_cl_stats class_stats;
>  };

[Severity: Low]
The commit message says:

  Wire up fq_pie_class_ops with walk, dump, and dump_stats only so that
  'tc -s class show' reports per-flow state (prob, delay, deficit,
  avg_dq_rate, dq_rate_estimating).

Since type is appended at offset 36, the first 36 bytes of a class record
look exactly like a qdisc record. fq_pie_dump_class_stats() zeroes the whole
struct and fills only type and class_stats. It then sends the result as
TCA_STATS_APP.

The current tc fq_pie xstats printer handles both qdisc and class dumps, and
it only knows the 36-byte layout. With an unmodified tc, would every
per-flow class line print "pkts_in 0 overlimit 0 ... memory_used 0" and
none of the per-flow values?

The iproute2 dependency is only mentioned in the later commit "selftests:
tc-testing: add fq_pie per-flow class stats test". Could this commit message
say that a companion iproute2 change is needed? It could also note that
older tools can't tell class records from qdisc records.

> diff --git a/net/sched/sch_fq_pie.c b/net/sched/sch_fq_pie.c
> index 5982847df8f85..c834c8f45898b 100644
> --- a/net/sched/sch_fq_pie.c
> +++ b/net/sched/sch_fq_pie.c

[ ... ]

> @@ -563,7 +567,89 @@ static void fq_pie_destroy(struct Qdisc *sch)
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
What happens to the handle when flows_cnt is 65536? fq_pie_change()
accepts that value:

    if (!q->flows_cnt || q->flows_cnt > 65536) {

fq_pie_walk() calls tc_qdisc_stats_dump(sch, i + 1, arg), so cl can reach
65536. TC_H_MIN(65536) is 0, and tc_fill_tclass() has already set
tcm->tcm_handle = q->handle, whose minor is 0.

Wouldn't the class for flow index 65535 then be reported as maj:0, the same
handle as the qdisc itself?

fq_codel has the same pattern, but this patch brings it to fq_pie.

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
> +		xstats.class_stats.delay =
> +			div_u64(PSCHED_TICKS2NS(READ_ONCE(flow->vars.qdelay)),
> +				NSEC_PER_USEC);
> +		xstats.class_stats.deficit = READ_ONCE(flow->deficit);
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

[Severity: Medium]
Are the writers of deficit, qlen and backlog annotated to match these reads?
tc_fill_tclass() calls gnet_stats_start_copy_compat() with a NULL lock. That
means this function runs under RTNL only, without the qdisc lock.

The fast path still uses plain stores under the qdisc root lock. In
fq_pie_qdisc_enqueue():

    sel_flow->deficit = q->quantum;
    sel_flow->qlen = 0;
    sel_flow->backlog = 0;
    ...
    sel_flow->qlen++;
    sel_flow->backlog += pkt_len;

In fq_pie_qdisc_dequeue():

    flow->deficit += q->quantum;
    ...
    flow->qlen--;
    flow->deficit -= pkt_len;
    flow->backlog -= pkt_len;

With READ_ONCE() on the reader side only, won't KCSAN report these as data
races? qlen and backlog are also read as two separate lockless loads, so the
two values might not match each other.

The PIE vars fields read here (prob, qdelay, avg_dq_rate) do use
WRITE_ONCE() in sch_pie.c. fq_codel uses WRITE_ONCE() for flow->deficit and
q->backlogs[], and it takes sch_tree_lock() for its qlen snapshot. Should
fq_pie do the same?

> +	}

[ ... ]

> +static const struct Qdisc_class_ops fq_pie_class_ops = {
> +	.leaf		=	fq_pie_leaf,
> +	.find		=	fq_pie_find,
> +	.dump		=	fq_pie_dump_class,
> +	.dump_stats	=	fq_pie_dump_class_stats,
> +	.walk		=	fq_pie_walk,
> +};
> +
>  static struct Qdisc_ops fq_pie_qdisc_ops __read_mostly = {
> +	.cl_ops		= &fq_pie_class_ops,

[Severity: Low]
Setting .cl_ops makes the tc core treat fq_pie as classful. That changes
some user-visible behaviour the commit message doesn't mention. The message
also says only walk, dump and dump_stats are wired up, but the patch adds
.leaf and .find stubs as well.

Before this patch, adding a filter with an fq_pie parent failed in
__tcf_qdisc_find() with -EINVAL and "Qdisc not classful". Now it reaches:

    if (!cops->tcf_block) {
        NL_SET_ERR_MSG(extack, "Class doesn't support blocks");
        err = -EOPNOTSUPP;

Grafting a child qdisc under an fq_pie class used to fail in qdisc_leaf()
with -EOPNOTSUPP and "Parent qdisc is not classful". Now fq_pie_find()
returns 0, so it fails with -ENOENT and "Specified class not found".

Because fq_pie_find() always returns 0, a classid listed by 'tc class show'
also can't be fetched with RTM_GETTCLASS.

fq_codel uses the same pattern. Is this change in errno and extack intended,
and could the commit message mention it?

The commit message also describes dq_rate_estimating as per-flow state.
However, fq_pie_dump_class_stats() copies the qdisc-wide
q->p_params.dq_rate_estimator into every class record. Could that wording be
adjusted?

>  	.id		= "fq_pie",
>  	.priv_size	= sizeof(struct fq_pie_sched_data),
>  	.enqueue	= fq_pie_qdisc_enqueue,

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261109071017.438478-1-hemendranaik%40gmail.com
