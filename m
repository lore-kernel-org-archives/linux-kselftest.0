Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95CAA2931F7;
	Wed, 30 Sep 2026 04:34:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790742895; cv=none; b=dMbPwROFh+DN0Bs9D/xLYVTIm4zdk99paO/EL2YqKeYbo/4i01d/kd8/GYf0ei/1fYY04FsIqE0NXjYZ2ndzZ6iZgpCA+SdT4pCTKx2nuvFmZ/C1a1ZLTpQOq2f5yFRnUWtDB4F3puieHmwM89oQKWPw2e3YwtL+2Nk6Rza74pA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790742895; c=relaxed/simple;
	bh=TB/hBj2K0KgOEJOAxHtq/zac8FhG6YFfsArbfivNTcg=;
	h=Subject:From:To:Cc:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=EL3fh6CuDiI9cpA8/c9tNxC8c4jHJiUXnklrVFQQ2vk5B0PFTBO9sJonQVvl1BeGV4vKEaOlMf+EHW62ZaxdPuiUm37LChEFw+7JsjLyZGDMwHIdHd7oe+870cfXXT3gFQH807cQBL55CtPOlNxXL7PS9Xp6+BdhT4qukDSk/yI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WBR/83JQ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WBR/83JQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 627E81F00893;
	Wed, 30 Sep 2026 04:34:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790742893;
	bh=RgQrNDgwKvqngDqQ5rtEzrRJjl4rWmc50CydSaUopvM=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=WBR/83JQRiguZ8IxLEGEM7HHnZXvlDRzYkynqnPxoItjYv2gUVomyywJeT+1ts68k
	 EwcsP/c8/4Ho+L+bluj3XqUkfwEB8gzAdMBjWr6+/RjouH4k7BaGvoQoLHE22yeRYL
	 TFSMa/zuW4ibZR0oDYiEHLitD0eulTdal1jlVgpfMJ1mTZjH9XyV92YP3GSxp+0zNR
	 lOr77fL7DCmQ0Lf2sebARxL25VRvXCVB7KzagOZhzBD5Xgt6Y8O/HkQVznn3y/ID6o
	 aVPmbDAyI1KHgzpdsSQvqVMM45vWGQQSRsB7Iyxr1Sz0EdrExmtn1PHgX86wyz2We6
	 qgNfKJdmvWZ8A==
Subject: Re: [PATCH net-next v9 1/3] net/sched: sch_fq_pie: add per-flow
 statistics via class ops
From: netdev-bot+sashiko@kernel.org
To: hemendranaik@gmail.com
Cc: netdev@vger.kernel.org, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, horms@kernel.org, jiri@resnulli.us,
 jhs@mojatatu.com, shuah@kernel.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, vishy0777@gmail.com, tahiliani@nitk.edu.in
Date: Wed, 30 Sep 2026 04:34:51 +0000
Message-ID: <179074289189.434549.503389315893206268@kernel.org>
In-Reply-To: <20260928043358.6866-2-hemendranaik@gmail.com>
References: <20260928043358.6866-2-hemendranaik@gmail.com>
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

Critical: 0 · High: 0 · Medium: 4 · Low: 4

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] When fq_pie is created with 'flows 65536', the last flow is
  dumped with the qdisc's own handle instead of a class ID.
- [Medium] The new uAPI field tc_fq_pie_cl_stats.avg_dq_rate is '__u32'
  and documented as bytes/second.
- [Medium] Once the PIE controller's probability goes above MAX_PROB, the
  exported per-flow drop probability wraps to a small value.
- [Medium] fq_pie_dump_class_stats() reads per-flow state without holding
  the qdisc lock or having matching writer annotations.
- [Low] The patch adds a new binary struct (struct tc_fq_pie_cl_stats) to
  the netlink uAPI and grows the existing struct tc_fq_pie_xstats blob…
- [Low] The discriminator 'type' is placed at offset 36, after the nine
  qdisc counters, instead of first in a union as sch_fq_codel does.
- [Low] fq_pie now has cl_ops, but .tcf_block, .bind_tcf and .unbind_tcf
  are left out, and the commit message only says this is 'on purpose'…
- [Low] The in-tree netlink YAML spec was not updated for the new uAPI
  layout, and none of the three patches in the series touches it.

--

net/sched: sch_fq_pie: add per-flow statistics via class ops

This commit extends struct tc_fq_pie_xstats with a type discriminator and
a new struct tc_fq_pie_cl_stats, which grows it from 36 to 64 bytes. It
also adds fq_pie_class_ops with walk, dump and dump_stats, so that
'tc -s class show' reports per-flow PIE state.

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
Is __u32 wide enough for a rate in bytes/second?

fq_pie_dump_class_stats() computes the value in 64 bits and then assigns
it to this field:

		xstats.class_stats.avg_dq_rate =
			((u64)READ_ONCE(flow->vars.avg_dq_rate)
			* PSCHED_TICKS_PER_SEC) >> PIE_SCALE;

Any rate above U32_MAX bytes/s (about 4.29 GB/s, or roughly 34 Gbit/s)
loses its high bits without any warning.

pie_process_dequeue() computes (dq_count << PIE_SCALE) / dtime at tick
granularity. With a dtime of 1 tick and a 64KB GSO skb, the internal
estimator can already go past that limit.

tc_pie_xstats has the same narrow type, but this is a new uAPI field.
Would __u64 fit better here? Another option is to saturate the value and
document that.

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

[Severity: Low]
This isn't a bug, but would separate attributes work better than a binary
struct here? The netlink guidelines discourage binary structures inside
attributes, and sch_cake uses nested attributes inside TCA_STATS_APP.

With this layout:

- Every qdisc dump from fq_pie_dump_stats() carries 28 bytes of class
  fields that are always zero.
- Every class dump from fq_pie_dump_class_stats() carries the nine qdisc
  counters (36 bytes), which are always zero.
- Any future qdisc or class counter can only go after class_stats, so
  the payload grows for both message types.

The layout itself looks right: type at offset 36, class_stats at 40, 64
bytes in total. Could the commit message explain why this design was
chosen?

[Severity: Low]
How does existing userspace handle the class payloads? sch_fq_codel puts
type first, followed by a union. Here type comes after the nine qdisc
counters, so a tool built before this field existed cannot tell a class
payload from a qdisc payload.

Setting .cl_ops also means tc_dump_tclass_qdisc() now walks fq_pie
classes. Before this patch it reported none. An unmodified iproute2 would
call its fq_pie print_xstats() for each active flow in
'tc -s class show' and print a line of zeros:

    pkts_in 0 overlimit 0 dropped 0 ...

It also goes the other way. Userspace rebuilt against the 64-byte header
gets 36-byte payloads from older kernels. That only works if the tool
zero-fills its buffer and copies min(payload, sizeof). A tool that
rejects short payloads would drop the output.

Should the commit message mention both of these?

[Severity: Low]
Should Documentation/netlink/specs/tc.yaml be updated along with this?
The tc-fq-pie-xstats struct there still lists only the nine original u32
members. It has no type or class-stats member, and there is no
tc-fq-pie-cl-stats struct.

The fq_pie entry of the TCA_STATS_APP sub-message still says:

        value: fq_pie
        fixed-header: tc-fq-pie-xstats

YNL and other spec-driven tools would decode only the first 36 bytes.
They would never see the discriminator or the per-flow fields.
tc-fq-codel-xstats in the same spec does model its type member.

tc.yaml is still unchanged at the end of the series, after
'net/sched: pie: correct tc_pie_xstats field documentation'.

>  };
>  
>  /* CBS */
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

[Severity: Medium]
What class handle does the last flow get when fq_pie is configured with
flows 65536?

fq_pie_change() accepts that value:

	if (!q->flows_cnt || q->flows_cnt > 65536) {

fq_pie_walk() passes cl = i + 1, so flow index 65535 is dumped with
cl = 0x10000. TC_H_MIN() masks that to 0. tc_fill_tclass() has already
set tcm_handle to q->handle, so this flow is reported as maj:0. That is
the qdisc's own handle, not a class ID.

fq_pie_hash() + 1 can be 65536, so traffic does reach that flow. The
existing tc-testing case also creates 'fq_pie flows 65536'. sch_fq_codel
has the same pattern.

Should the walk handle this flow differently? If not, could the commit
message mention the limitation?

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

[Severity: Medium]
Can this report a small probability for a flow that is actually being
dropped 100% of the time?

MAX_PROB is U64_MAX >> 8. pie_calculate_probability() does not cap
positive updates at MAX_PROB:

net/sched/sch_pie.c:pie_calculate_probability() {
    ...
	if (qdelay > (PSCHED_NS2TICKS(250 * NSEC_PER_MSEC)))
		delta += MAX_PROB / (100 / 2);

	WRITE_ONCE(vars->prob, vars->prob + delta);

	if (delta > 0) {
		/* prevent overflow */
		if (vars->prob < oldprob) {
    ...
}

This check only catches a full u64 wrap. Under sustained delay, prob can
reach about 1.03 * MAX_PROB, and pie_drop_early() then drops every
eligible packet. The shift by BITS_PER_BYTE throws away the upper eight
bits, so the exported value would be about 3%.

Would it make sense to clamp to MAX_PROB before the shift? sch_pie's
pie_dump_stats() uses the same conversion.

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
Are these reads safe without the qdisc lock?

tc_fill_tclass() calls gnet_stats_start_copy_compat() with a NULL lock,
so this callback runs under RTNL only.

The writers hold the root qdisc lock and use plain compound updates. In
fq_pie_qdisc_enqueue():

		sel_flow->qlen++;
		sel_flow->backlog += pkt_len;

In fq_pie_qdisc_dequeue():

	flow->qlen--;
	flow->deficit -= pkt_len;
	flow->backlog -= pkt_len;

None of these writers use WRITE_ONCE(), so KCSAN would flag these races.
sch_fq_codel uses WRITE_ONCE() for the equivalent fields.

The unlocked reads cause a few more problems:

- vars.prob and vars.qdelay are 64 bits wide, so READ_ONCE() can tear on
  32-bit kernels.
- pie_calculate_probability() stores vars->prob + delta before it
  corrects an underflow to 0. A reader could see a wrapped value close
  to 100% instead of 0.
- qlen and backlog are read separately and can disagree.

fq_pie_dump_stats() in the same file takes sch_tree_lock() around its
reads. Could fq_pie_dump_class_stats() snapshot the flow under
sch_tree_lock() as well? d->lock is NULL here, so that should not
deadlock. Alternatively, the writers could use WRITE_ONCE() as fq_codel
does.

> +	}

[ ... ]

> +static const struct Qdisc_class_ops fq_pie_class_ops = {
> +	.leaf		=	fq_pie_leaf,
> +	.find		=	fq_pie_find,
> +	.dump		=	fq_pie_dump_class,
> +	.dump_stats	=	fq_pie_dump_class_stats,
> +	.walk		=	fq_pie_walk,
> +};

[Severity: Low]
The commit message says the filter callbacks are "omitted on purpose".
What is the reason?

Now that cl_ops is non-NULL but has no .tcf_block, two things change.

First, 'tc filter add ... parent <fq_pie handle>:' now fails in
__tcf_qdisc_find() with a different errno and extack:

	if (!cops->tcf_block) {
		NL_SET_ERR_MSG(extack, "Class doesn't support blocks");
		err = -EOPNOTSUPP;
		goto errout_qdisc;
	}

Before this patch it failed with -EINVAL and "Qdisc not classful".

Second, fq_pie_init() already allocates a block with
tcf_block_get(&q->block, &q->filter_list, ...). fq_pie_classify() maps
filter results onto the same 1..flows_cnt range that fq_pie_walk() now
publishes:

		if (TC_H_MIN(res.classid) <= q->flows_cnt)
			return TC_H_MIN(res.classid);

Without cl_ops->tcf_block, nothing can reach that block, so this path is
dead code. sch_fq_codel, sch_sfq and sch_cake all provide tcf_block,
bind_tcf and unbind_tcf.

Should these callbacks be wired up, or should the unreachable
filter_list/block code be removed? Either way, could the commit message
explain the choice?

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20260928043358.6866-1-hemendranaik%40gmail.com
