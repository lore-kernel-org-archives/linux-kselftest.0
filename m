Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B25621CA02;
	Thu, 24 Sep 2026 21:00:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790283643; cv=none; b=FPUUlGroR4p/mcyNGxIy6mruQO1LoC19DpX/bbSY6rvLvo+eHy78CJhGwXFlFPK30vaAt9vY5Bwi8bWhUYFpkAKEPWvQB7qC3p5+KUPjj+CkwNAyKVh5iaUJ9u4ev4lbUk9n7rcjaTwJDItXLrw09BWFFJD8k5zlDSNAZqNndD0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790283643; c=relaxed/simple;
	bh=qfA1zaQtyT5ZwSdCYwDK+iZaokxN+3OdHPVY3rEX81I=;
	h=Subject:From:To:Cc:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=CpRavJ3xPMEgwkCJPcLqXu4T/0te9NVxDCfgSeorJC5DYj3KYvapgH7xHuhghmJvk0GkXkQOlSBxROw2B03qndYOEURvk6FnncypRYp1JkzNOXGqcBH+UCY+e+LOmxOltcJrHJuQRI+CYcmhgp3ne0riT49JhciswIJ/kihNX40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=L/VA8R3V; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="L/VA8R3V"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6BFEF1F000FF;
	Thu, 24 Sep 2026 21:00:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790283641;
	bh=3E7rlo9HHIJMZSRsLzapPK8euprc7tVpbqeL6sleGg8=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=L/VA8R3V9PsH6GwKf5u0NXDW3CCSgq543SzK2ofCM35gwlZp/awWWCiHiYtyifrFr
	 0mF+gQzDtLIQ7kBtPorRK0Bbn6sXOPJiSXO50UucajFCp86o2WxTuuP5tnlLxteK8b
	 ON1NxyUCGLQAC6L5j3a3AE8S4PXw2Ao9ug68giCk4oTTdxMXTepgpTFhEFleJdE8w/
	 mUWGu4E/zbmajdG039vTwUNiLpemOQoy98jH9dREIdGby10UO4Ga5jogLuUUXx2kBo
	 4MCO8BXnlXhV4m3LLhvCY39reJNJLXeQtTjBJJnjvYhv79BKGBzUMsSNlOPvsR9P/E
	 SOL5wsIPurk8A==
Subject: Re: [PATCH net-next v8 1/3] net/sched: sch_fq_pie: add per-flow
 statistics via class ops
From: netdev-bot+sashiko@kernel.org
To: hemendranaik@gmail.com
Cc: netdev@vger.kernel.org, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, horms@kernel.org, jiri@resnulli.us,
 jhs@mojatatu.com, shuah@kernel.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, vishy0777@gmail.com, tahiliani@nitk.edu.in
Date: Thu, 24 Sep 2026 21:00:39 +0000
Message-ID: <179028363994.2160803.3084881967142411218@kernel.org>
In-Reply-To: <20260922205924.32173-2-hemendranaik@gmail.com>
References: <20260922205924.32173-2-hemendranaik@gmail.com>
X-sashiko-severity: Medium
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Thank you for your contribution! Sashiko AI review found 8 potential
issue(s) to consider.

Critical: 0 · High: 0 · Medium: 2 · Low: 6

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] In include/uapi/linux/pkt_sched.h, the patch appends `__u32
  type` at offset 36 and then a whole `struct tc_fq_pie_cl_stats…
- [Medium] fq_pie_dump_class_stats() computes
  `((u64)READ_ONCE(flow->vars.avg_dq_rate) * PSCHED_TICKS_PER_SEC) >>…
- [Low] The commit message says the class ops are wired up "so that 'tc
  -s class show' reports per-flow state (prob, delay, deficit,…
- [Low] Setting `.cl_ops = &fq_pie_class_ops` makes the TC core treat
  fq_pie as classful.
- [Low] The patch grows `struct tc_fq_pie_xstats` in
  include/uapi/linux/pkt_sched.h from 36 to 64 bytes.
- [Low] fq_pie_walk() and fq_pie_dump_class() list classes
  `<major>:<i+1>` for every active flow, but fq_pie_find() always…
- [Low] fq_pie_change() accepts `flows_cnt` up to 65536
  (sch_fq_pie.c:313: `if (!q->flows_cnt || q->flows_cnt > 65536)`).
- [Low] fq_pie_dump_class_stats() reads per-flow state with READ_ONCE()
  only and holds no qdisc lock.

--

net/sched: sch_fq_pie: add per-flow statistics via class ops

This commit adds a type discriminator and an embedded struct
tc_fq_pie_cl_stats to struct tc_fq_pie_xstats. The struct grows from 36 to
64 bytes. It also adds a minimal Qdisc_class_ops table to fq_pie so that
each active flow is reported as a pseudo-class with its per-flow PIE state.

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
> +	__u32 dq_rate_estimating;	/* is avg_dq_rate being calculated? */
> +};

[Severity: Low]
Should Documentation/netlink/specs/tc.yaml be updated along with this?

In the spec, tc-fq-pie-xstats still lists only the nine original u32
members. The tca-stats-app-msg sub-message still binds fq_pie to it:

      -
        value: fq_pie
        fixed-header: tc-fq-pie-xstats

The spec has no type member, no class-stats member, no tc-fq-pie-cl-stats
struct and no enum for TCA_FQ_PIE_XSTATS_QDISC/CLASS.

A spec-driven (YNL) decoder will only decode the first 36 bytes of the new
64-byte payload. It cannot tell class records from qdisc records, and it
never shows prob, delay, deficit, avg_dq_rate or dq_rate_estimating.

tc.yaml is still unchanged at the end of the series (after "net/sched: pie:
correct tc_pie_xstats field documentation").

>  struct tc_fq_pie_xstats {
>  	__u32 packets_in;	/* total number of packets enqueued */
>  	__u32 dropped;		/* packets dropped due to fq_pie_action */
> @@ -963,6 +977,8 @@ struct tc_fq_pie_xstats {
>  	__u32 new_flows_len;	/* count of flows in new list */
>  	__u32 old_flows_len;	/* count of flows in old list */
>  	__u32 memory_usage;	/* total memory across all queues */
> +	__u32 type;
> +	struct tc_fq_pie_cl_stats class_stats;
>  };

[Severity: Medium]
Will this layout limit how both views can be extended later?

type sits at offset 36 and class_stats at offset 40, so the struct is 64
bytes. Once this is released:

  - a new qdisc-level counter can only be appended after class_stats
  - after that, struct tc_fq_pie_cl_stats can never grow again

Every message also carries both views. fq_pie_dump_stats() sends 24 zero
bytes of class stats, and fq_pie_dump_class_stats() sends nine zeroed qdisc
counters.

The sibling struct in the same header avoids this with a union:

struct tc_fq_codel_xstats {
	__u32	type;
	union {
		struct tc_fq_codel_qd_stats qdisc_stats;
		struct tc_fq_codel_cl_stats class_stats;
	};
};

Keeping the existing offsets means type cannot go first here. Would a union
after the discriminator still let the two views grow independently?

	__u32 type;
	union {
		struct tc_fq_pie_cl_stats class_stats;
		/* future qdisc extension */
	};

The commit message gives the new size and offsets but does not mention this
constraint.

>  
>  /* CBS */
> diff --git a/net/sched/sch_fq_pie.c b/net/sched/sch_fq_pie.c
> index 5982847df8f85..3a3ef83f328b2 100644
> --- a/net/sched/sch_fq_pie.c
> +++ b/net/sched/sch_fq_pie.c

[ ... ]

> @@ -563,7 +565,89 @@ static void fq_pie_destroy(struct Qdisc *sch)
>  	kvfree(q->flows);
>  }
>  
> +static struct Qdisc *fq_pie_leaf(struct Qdisc *sch, unsigned long arg)
> +{
> +	return NULL;
> +}
> +
> +static unsigned long fq_pie_find(struct Qdisc *sch, u32 classid)
> +{
> +	return 0;
> +}

[Severity: Low]
fq_pie_walk() lists a class <major>:<i+1> for every active flow, but
fq_pie_find() always returns 0. Is it intended that a class shown by
'tc class show' gets -ENOENT from a targeted RTM_GETTCLASS, such as
'tc class get dev X classid <major>:N' going through __tc_ctl_tclass()?

fq_codel_find(), sfq_find() and cake_find() also return 0 for their
pseudo-classes. A non-zero return would also send qdisc_leaf() and the
RTM_DELTCLASS paths into ops that fq_pie does not implement. So this may
well be the intended convention. It does mean per-flow stats can only be
read through a full dump.

> +
> +static int fq_pie_dump_class(struct Qdisc *sch, unsigned long cl,
> +			     struct sk_buff *skb, struct tcmsg *tcm)
> +{
> +	tcm->tcm_handle |= TC_H_MIN(cl);

[Severity: Low]
Can the last flow be reported under the qdisc's own handle?

fq_pie_change() accepts up to 65536 flows:

	if (!q->flows_cnt || q->flows_cnt > 65536) {

fq_pie_walk() passes i + 1 as the class id. With flows_cnt == 65536, the
flow at index 65535 is dumped with cl == 65536. TC_H_MIN() masks that to
minor 0, which gives a handle of <major>:0, the same as the qdisc itself.

fq_pie_dump_class_stats() still uses the unmasked cl, so the stats are
correct but userspace sees them under the qdisc handle.

fq_codel has the same latent issue. This patch brings it into fq_pie.

> +	return 0;
> +}
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

[Severity: Low]
The commit message says the class ops are wired up:

  so that 'tc -s class show' reports per-flow state (prob, delay, deficit,
  avg_dq_rate, dq_rate_estimating).

Does that hold with an existing tc binary?

Here the nine qdisc counters are zeroed and the per-flow data is in
class_stats at offset 40. A tc that predates the type field treats every
fq_pie xstats blob as qdisc stats. It would likely print a row of zero qdisc
counters for each active flow class and none of the per-flow values. Before
this patch fq_pie had no cl_ops, so 'tc class show' printed nothing for it.

The companion iproute2 change is only mentioned in the follow-up commit
"selftests: tc-testing: add fq_pie per-flow class stats test" ("printed
with the companion iproute2 change"). Could this commit mention it as well?

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

[Severity: Medium]
Does this silently truncate the rate?

The product is computed in 64 bits and then assigned to the __u32
tc_fq_pie_cl_stats.avg_dq_rate, so the high bits are lost.

pie_vars.avg_dq_rate holds bytes per psched tick scaled by 2^8.
pie_process_dequeue() fills it from (dq_count << PIE_SCALE) / dtime, and
dtime can be only a few ticks during back-to-back GSO dequeues.

PSCHED_TICKS_PER_SEC is 15625000 and PIE_SCALE is 8. Any internal value
above about 70369 (roughly 4.29e9 B/s, about 34.4 Gbit/s) wraps. For
example, 81920 converts to 5,000,000,000 B/s but is exported as 705,032,704.

The commit message says:

  Widen avg_dq_rate to u64 before scaling it by PSCHED_TICKS_PER_SEC.

That moves the overflow to the narrowing assignment instead of avoiding it.
This is a new uAPI field. Could it be made __u64, or saturated at U32_MAX,
before it is released?

> +
> +		qs.qlen    = READ_ONCE(flow->qlen);
> +		qs.backlog = READ_ONCE(flow->backlog);
> +	}

[Severity: Low]
Are these lockless reads safe against the datapath writers?

tc_fill_tclass() passes a NULL lock to gnet_stats_start_copy_compat(), so
this function runs under RTNL only. Meanwhile enqueue, dequeue and
fq_pie_timer() update the same fields under the qdisc root lock on other
CPUs.

The writers of deficit, qlen and backlog use plain stores with no
WRITE_ONCE(). In fq_pie_qdisc_enqueue():

		if (list_empty(&sel_flow->flowchain)) {
			...
			sel_flow->deficit = q->quantum;
			sel_flow->qlen = 0;
			sel_flow->backlog = 0;
		}
		sel_flow->qlen++;
		sel_flow->backlog += pkt_len;

And in fq_pie_qdisc_dequeue():

	flow->qlen--;
	flow->deficit -= pkt_len;
	flow->backlog -= pkt_len;

KCSAN_ASSUME_PLAIN_WRITES_ATOMIC does not cover compound writes like these,
so KCSAN will likely report them. The reader can also see intermediate
values, such as qlen == 0 on a flow that was just activated. fq_codel
annotates the equivalent writers, for example WRITE_ONCE(flow->deficit,
...).

vars.prob and vars.qdelay are u64, so READ_ONCE() can tear on 32-bit
kernels.

pie_calculate_probability() also publishes an unclamped value before it
applies the overflow fix-up:

	WRITE_ONCE(vars->prob, vars->prob + delta);

	if (delta > 0) {
		/* prevent overflow */
		if (vars->prob < oldprob) {
			WRITE_ONCE(vars->prob, MAX_PROB);

A lockless reader here could therefore export a wrapped probability.

fq_pie_dump_stats() in the same file takes sch_tree_lock(). Should the
class dump take it too, or should the fq_pie writers be annotated?

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
Setting .cl_ops makes the TC core treat fq_pie as classful. Is the change
in user-visible errors intended?

Filter add on parent <fq_pie>: used to fail in __tcf_qdisc_find() with
-EINVAL "Qdisc not classful". It now reaches this check instead:

	if (!cops->tcf_block) {
		NL_SET_ERR_MSG(extack, "Class doesn't support blocks");
		err = -EOPNOTSUPP;
		goto errout_qdisc;
	}

Grafting or getting a child on parent <fq_pie>:N through qdisc_leaf() used
to return -EOPNOTSUPP "Parent qdisc is not classful". Because fq_pie_find()
always returns 0, it now returns -ENOENT "Specified class not found".

RTM_GETTCLASS and RTM_DELTCLASS in __tc_ctl_tclass() also change from
-EINVAL to -ENOENT.

fq_pie_init() still calls tcf_block_get(), and fq_pie_classify() still
reads q->filter_list and maps tcf results to flow ids 1..flows_cnt. That is
the class id space this patch exposes. With .tcf_block, .bind_tcf and
.unbind_tcf left out, the classifier path stays unreachable, as it was
before this patch.

The commit message says these callbacks are "omitted on purpose". Could it
give the reason and mention the errno changes?

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20260922205924.32173-1-hemendranaik%40gmail.com
