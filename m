Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14E7D37FF7A;
	Fri,  4 Sep 2026 23:17:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788563879; cv=none; b=XWN91Tk5fN5EiOsAtZRT+9A9X6UFv5FoYif2UQhuG8lQQKCW4bbsG10OI63woYpvtGkkGZz15O+Cm6BwNjk/o7bis6aXAnMt6Fhh580E015Sw5nlqRGU/3kbBpEjWZtp13GW+o1qdXX26jskbC5iW7dZOTgJKqSEgeCirwDKgHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788563879; c=relaxed/simple;
	bh=DOD9nKVPJGtP+zC+U/9sgVJAG4iDWj8ZhzvGK1KdYT8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=agH41cXGiYJ1UeYNsGoxiRFxHFC6BvcYiSfLBdPH9Edirob9Y5e3wT+tY0K/nznkbN8/V1l+nYDcsIJbmArHEuggZBIWPa0F/Pl+8xP/acJaSYeoSYgAXhahOAZqDBaG+bKQn5H5ulj/3TtCMGcL1oVYgFPiWqzAvSl70xGzFXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=P2mXTX7b; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="P2mXTX7b"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E01351F00A3D;
	Fri,  4 Sep 2026 23:17:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788563877;
	bh=5+Ee0hUWWTMq68Jf92FClpr6IOWRhmXIoLHXGdvda5s=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=P2mXTX7bB9plOgRbxzrB1/iEFoo3VL5Cko68CExn811Fe8+UAxFJ5K3o4S0itI8Jv
	 iCe6R1d7/BBX9uuK6mGnd0ABpgzLA+lcUT/lpQ5qwVx/OPJiG3dwibpAPZ71kIGroi
	 K/ln1Vgwd/FMe56ckb6A58eWb2gg7UIoD6PmjKrIT4MqLQpsGlp8GLoGibsnMIli3a
	 G5mV6wt6AcBUdOERMIHSp+hjUtph5+RJmIoHVQhmd9bQphAlp0lKnRcvBmcgeUMt+K
	 oNuHz/1ll2IgjX0FZQXkx4pgL2ScJajwu3ADl03SlrkPTPOm3ze+/xF3V4kRXQZp5g
	 lRyxSRLUNU43Q==
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
Subject: Re: [PATCH net-next v5 1/3] net/sched: sch_fq_pie: add per-flow statistics via class ops
Date: Fri,  4 Sep 2026 16:17:56 -0700
Message-ID: <20260904231756.4082402-1-kuba@kernel.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260902035231.81866-2-hemendranaik@gmail.com>
References: <20260902035231.81866-2-hemendranaik@gmail.com>
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
net/sched: sch_fq_pie: add per-flow statistics via class ops

This adds a Qdisc_class_ops table to sch_fq_pie with walk, dump and
dump_stats so that per-flow PIE state can be reported via 'tc -s class
show'.  struct tc_fq_pie_xstats gains a type discriminator plus an
embedded struct tc_fq_pie_cl_stats, and the accepted flow count is
narrowed to [1..65535].

> diff --git a/include/uapi/linux/pkt_sched.h b/include/uapi/linux/pkt_sched.h
> index 490efd2885267..89d825bac4bee 100644
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
> +	__u32 dq_rate_estimating;	/* is avg_dq_rate being calculated? */
> +};
> +
>  struct tc_fq_pie_xstats {
>  	__u32 packets_in;	/* total number of packets enqueued */
>  	__u32 dropped;		/* packets dropped due to fq_pie_action */
> @@ -963,6 +978,9 @@ struct tc_fq_pie_xstats {
>  	__u32 new_flows_len;	/* count of flows in new list */
>  	__u32 old_flows_len;	/* count of flows in old list */
>  	__u32 memory_usage;	/* total memory across all queues */
> +	__u32 type;
> +	struct tc_fq_pie_cl_stats class_stats;
> +
>  };

[Severity: Medium]
The changelog says the new members are appended so that "qdisc xstats
offsets stay compatible with the flat struct fq_pie already shipped".
That is true for the offsets, but does it also change the size of an
already shipped struct?

  nine __u32 counters          = 36 bytes
  + __u32 type                 = 40 bytes
  + struct tc_fq_pie_cl_stats  = 64 bytes

A consumer that validates the TCA_STATS_APP payload with the usual
iproute2 idiom:

  if (RTA_PAYLOAD(xstats) < sizeof(*st))
	  return -1;

would stop printing fq_pie xstats altogether once rebuilt against this
header and run on an older kernel that still emits 36 bytes.  sch_fq
handled this by having userspace copy min(payload, sizeof(*st)).  Should
the changelog mention the size change so this is a conscious decision?

Related: since fq_pie_dump_class_stats() reuses the same struct, an
iproute2 that does not know about the new type field will decode the
per-class blob using the qdisc layout and print nine all-zero qdisc
counters per flow.  Does that mean the stated goal ("'tc -s class show'
reports per-flow state") depends on an iproute2 change that the changelog
does not mention?  The selftest added later in the series matches
"class fq_pie 2:[0-9]+ .*prob .*delay .*deficit", which only a patched
iproute2 can produce.

[Severity: Low]
Documentation/netlink/specs/tc.yaml still describes tc-fq-pie-xstats as a
struct with only the nine original u32 members, and it is referenced as
the fixed-header for the fq_pie entry of tca-stats-app-msg:

  Documentation/netlink/specs/tc.yaml
      value: fq_pie
      fixed-header: tc-fq-pie-xstats

Should the spec be extended in the same patch so ynl-based decoders can
see the new type discriminator and the per-flow fields?  Note YAML structs
are implicitly packed, so the nested tc_fq_pie_cl_stats members would need
to be spelled out explicitly.

> diff --git a/net/sched/sch_fq_pie.c b/net/sched/sch_fq_pie.c
> index b27d95418707a..32c76d2bb74bf 100644
> --- a/net/sched/sch_fq_pie.c
> +++ b/net/sched/sch_fq_pie.c
> @@ -310,9 +310,9 @@ static int fq_pie_change(struct Qdisc *sch, struct nlattr *opt,
>  			goto flow_error;
>  		}
>  		q->flows_cnt = nla_get_u32(tb[TCA_FQ_PIE_FLOWS]);
> -		if (!q->flows_cnt || q->flows_cnt > 65536) {
> +		if (!q->flows_cnt || q->flows_cnt > 65535) {
>  			NL_SET_ERR_MSG_MOD(extack,
> -					   "Number of flows must range in [1..65536]");
> +					   "Number of flows must range in [1..65535]");
>  			goto flow_error;
>  		}
>  	}

[Severity: High]
Is this a uAPI regression?  fq_pie_change() has accepted flows == 65536
since sch_fq_pie was merged, and after this change the same netlink
request fails with -EINVAL:

  tc qdisc add dev dummy0 handle 1: root fq_pie flows 65536

There is an in-tree consumer of exactly that command:

  tools/testing/selftests/tc-testing/tc-tests/qdiscs/fq_pie.json, id 83be
      "cmdUnderTest": "$TC qdisc add dev $DUMMY handle 1: root fq_pie flows 65536",
      "expExitCode": "0",

and the later selftest patch in this series flips that case to expect exit
code 2 with matchCount 0.  Does that mean the series records the behaviour
change rather than avoiding it?

The stated reason is that TC_H_MIN(65536) == 0 would give the 65536th flow
a class handle of major:0 in fq_pie_dump_class():

  tcm->tcm_handle |= TC_H_MIN(cl);

Nothing kernel-side truncates - fq_pie_walk() passes i + 1 as an unsigned
long straight into fq_pie_dump_class_stats().  Could the class enumeration
simply stop at 65535 flows (or the handle be computed differently) so that
existing configurations using 65536 flows keep working?  The changelog
does not mention that a previously valid configuration is now refused.

> @@ -510,7 +510,9 @@ static int fq_pie_dump(struct Qdisc *sch, struct sk_buff *skb)
>  static int fq_pie_dump_stats(struct Qdisc *sch, struct gnet_dump *d)
>  {
>  	struct fq_pie_sched_data *q = qdisc_priv(sch);
> -	struct tc_fq_pie_xstats st = { 0 };
> +	struct tc_fq_pie_xstats st = {
> +		.type	= TCA_FQ_PIE_XSTATS_QDISC,
> +	};
>  	struct list_head *pos;
>  
>  	sch_tree_lock(sch);

[ ... ]

> @@ -562,7 +564,89 @@ static void fq_pie_destroy(struct Qdisc *sch)
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
> +
> +static int fq_pie_dump_class(struct Qdisc *sch, unsigned long cl,
> +			     struct sk_buff *skb, struct tcmsg *tcm)
> +{
> +	tcm->tcm_handle |= TC_H_MIN(cl);
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
> +		xstats.class_stats.prob =
> +			READ_ONCE(flow->vars.prob) << BITS_PER_BYTE;
> +		xstats.class_stats.delay =
> +			((u32)PSCHED_TICKS2NS(READ_ONCE(flow->vars.qdelay))) /
> +			NSEC_PER_USEC;

[Severity: Medium]
Does the exported delay wrap here?  PSCHED_TICKS2NS() yields an s64
nanosecond value, but the cast to u32 happens before the division by
NSEC_PER_USEC, so anything above 2^32 ns (about 4.295 s) folds over - a
5 s sojourn time is reported as roughly 705032 us, while the __u32 field
could carry about 4295 s.

With dq_rate_estimator off (the default) flow->vars.qdelay is the packet
sojourn time, and multi-second sojourn times are easy to produce behind a
slow shaper; the selftest added later in this series stacks fq_pie under
'tbf rate 8bit'.  Would keeping the value 64-bit until after the division
be preferable?

  delay = div_u64(PSCHED_TICKS2NS(READ_ONCE(flow->vars.qdelay)),
		  NSEC_PER_USEC);

The same expressions already exist in pie_dump_stats() in
net/sched/sch_pie.c, so the pattern is inherited, but this adds new
instances per flow.

> +		xstats.class_stats.deficit = READ_ONCE(flow->deficit);
> +		xstats.class_stats.dq_rate_estimating =
> +			READ_ONCE(q->p_params.dq_rate_estimator);
> +
> +		if (xstats.class_stats.dq_rate_estimating) {
> +			xstats.class_stats.avg_dq_rate =
> +				READ_ONCE(flow->vars.avg_dq_rate) *
> +				(PSCHED_TICKS_PER_SEC) >> PIE_SCALE;
> +		}

[Severity: Medium]
Can this multiplication overflow on 32-bit builds?  PSCHED_TICKS_PER_SEC
derives from the long constant NSEC_PER_SEC:

  include/net/pkt_sched.h
  #define PSCHED_TICKS_PER_SEC	(NSEC_PER_SEC >> PSCHED_SHIFT)

so on ILP32 the product stays 32-bit and wraps once avg_dq_rate exceeds
about 4396, i.e. rates above roughly 16.7 MB/s, even though the final
bytes/second result would still fit in the __u32 field.  Would a u64
intermediate (or an explicit saturation) be better here?

> +
> +		qs.qlen    = READ_ONCE(flow->qlen);
> +		qs.backlog = READ_ONCE(flow->backlog);
> +	}

[Severity: Medium]
Are these READ_ONCE()s paired with anything on the writer side?

All six fields read here are updated with plain stores under the qdisc
root lock:

  fq_pie_qdisc_enqueue()
	sel_flow->deficit = q->quantum;
	sel_flow->qlen = 0;
	sel_flow->backlog = 0;
	...
	sel_flow->qlen++;
	sel_flow->backlog += pkt_len;

  fq_pie_qdisc_dequeue()
	flow->qlen--;
	flow->deficit -= pkt_len;
	flow->backlog -= pkt_len;
	pie_process_dequeue(skb, &q->p_params, &flow->vars, flow->backlog);

  fq_pie_timer()
	spin_lock(root_lock);
	...
	pie_calculate_probability(&q->p_params,
				  &q->flows[q->flows_cursor].vars,
				  q->flows[q->flows_cursor].backlog);

and this new reader takes no lock at all.  vars.prob is u64 and
vars.qdelay is psched_time_t (u64), so on 32-bit builds can a concurrent
read return a torn value?  On all builds, can userspace observe an
inconsistent snapshot, for example qlen == 0 together with a non-zero
backlog while enqueue is in its reset window, or prob and delay from two
different tupdate rounds?

Taking the lock appears to be allowed here - tc_fill_tclass() passes NULL
as the lock to gnet_stats_start_copy_compat() before calling
cl_ops->dump_stats, and fq_pie_dump_stats() in this same file already
brackets its counters with sch_tree_lock()/sch_tree_unlock().

Note sch_fq_codel, whose class-stats reader this mirrors, converted its
writers to WRITE_ONCE() (flow->deficit, flow->head, flow->cvars.count)
precisely to pair with the lockless reader.  Should fq_pie either do the
same or hold sch_tree_lock() over the snapshot?

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
This isn't a bug introduced by this patch, but with cl_ops now present the
missing .tcf_block becomes more visible.  sch_fq_pie already carries the
full external classifier plumbing:

  fq_pie_init()    -> tcf_block_get(&q->block, &q->filter_list, sch, extack)
  fq_pie_classify() -> filter = rcu_dereference_bh(q->filter_list);
  fq_pie_destroy() -> tcf_block_put(q->block)

but __tcf_qdisc_find() in net/sched/cls_api.c rejects every filter
operation when the class ops table has no .tcf_block:

	if (!cops->tcf_block) {
		NL_SET_ERR_MSG(extack, "Class doesn't support blocks");
		err = -EOPNOTSUPP;

so q->filter_list can never become non-NULL and the classifier path in
fq_pie_classify() stays unreachable, as it was before this patch.  The
changelog states the omission is deliberate; would adding the trivial
.tcf_block that sch_fq_codel provides be cheap enough to make that dead
code live?

>  static struct Qdisc_ops fq_pie_qdisc_ops __read_mostly = {
> +	.cl_ops		= &fq_pie_class_ops,
>  	.id		= "fq_pie",

[ ... ]

Also, minor: there is a stray blank line before the closing brace of
struct tc_fq_pie_xstats in include/uapi/linux/pkt_sched.h.
-- 
pw-bot: cr
