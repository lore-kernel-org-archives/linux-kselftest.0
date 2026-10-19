Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792445979;
	b=i0LQB4VGYyi0IcQBfXSK00xdE3BaBf5/W2LubwvtIQbc1JzS5mJlY2x7DDDgwh2lWuM2
	 c1jpvzeOZ86tJcBBbM4a/316OZI8qdHN8N+5Er7ulwOx9g2m2MfNyMocCT3ld0AeaGRFM
	 vwnw70mWL3YtwSx2rSt1qX3xEmc+4ZGxzwz4iPHS/1NUIQBKVfBhG0YvhjQd7uQ1YB2aJ
	 VyiwYhk9JS6GgZ2A1lcIhjfsmve5qsdCzoNBnvpTv2ZZAG69khvasgPKvjUWfQBeS8SGr
	 yo+2RfFykXaGm354EsutMmVO7Yu+sWLPOFsTyT9iAYPfguoCicT6Rr+L1/OJHfW3+2w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792445979;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=lUOLr3+IgRNwYlYuXupDD20VzjhzLRu2KMPBlhhL/0Y=;
	b=bDNPGM53oLn0umOdg34tAfEAq7bO53NOb2jDMhK73CRq/FGrDZTjpRbG33738yyf1PNr
	 Gn47plXfIrX8y/EvLtSRNeJVANP2Y9Y+xcRf/A1jcKWYZbNlzshxwet7VveMR42brUsaO
	 2edHCddXImpH+7mWqVuBfegMyCDOPxG/sdX/Syk3KH6prjFPeYRG4oYJcSU12e3XZh33n
	 sRD5CIc1jumsAGgV2OWbquDrkitibjcEUfDxgMNQ8rkEbvpg5m9V5EZIZeL0EBpDvtkd6
	 gYCrFJsKrvxfglKWkZwqlHKjW2bV+1anl1jKmd2fkAUZNR1m+iY/1vvqgH9WJ9Pl6YA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Cjey8ZvT;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FF51606A322;
	Mon, 19 Oct 2026 21:39:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Cjey8ZvT
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04DDB1F000C5;
	Mon, 19 Oct 2026 21:39:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792445978;
	bh=lUOLr3+IgRNwYlYuXupDD20VzjhzLRu2KMPBlhhL/0Y=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=Cjey8ZvT1hmBHCe2wXyiib8n3V7MCuXYgVC8Dgkk+SfLIj4jJkFSawJ458Gvc+QIa
	 +Lvu1HQVI/6uKPSKs7tZfdO/K0lnIC+A2XNTRUTIPXUcNwN8DCxoa4SS18DOdmuXB4
	 YV4848iQdT/Om+Io0ZPTEzNm7QRO/S51v5WRMrKSHyNVI1JfT/DKAIVJXB9m4n5vnG
	 o9pIrKatVStmWvZmVz4F7yrXHUSwrK4pfuysVO31uT7JXEt4LpNHDMp0ai5QxBvaeq
	 Bk9OVjFn6xe6cqL/LfW7NejoQO+y2bSQQEy5WtV4QpM50lFND/o9AhaCORalsRrOsF
	 c2AgCBQNWCNJQ==
Subject: Re: [PATCH net-next v2 2/3] net/sched: fq, fq_codel, fq_pie: skip
 empty rounds in the deficit-refill dequeue loop
From: netdev-bot+sashiko@kernel.org
To: victor@mojatatu.com
Cc: davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org,
 pabeni@redhat.com, jhs@mojatatu.com, jiri@resnulli.us, netdev@vger.kernel.org,
 horms@kernel.org, sashiko-bot@kernel.org, shuah@kernel.org,
 linux-kselftest@vger.kernel.org
Date: Mon, 19 Oct 2026 21:39:37 +0000
Message-ID: <179244597754.3135.16063712933346709195@kernel.org>
In-Reply-To: <QDISC-TIAE.v2.r0.20261015163454-2@mojatatu.com>
References: <QDISC-TIAE.v2.r0.20261015163454-2@mojatatu.com>
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

Thank you for your contribution! Sashiko AI review found 3 potential
issue(s) to consider.

Critical: 0 · High: 0 (1) · Medium: 2 · Low: 1

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] In __fq_codel_dequeue() (net/sched/sch_fq_codel.c), the new
  skip pass unlinks empty flows with k < rounds by calling…
- [Medium] The skip-ahead can run only once per dequeue call, and one
  trap flow per dequeue is enough to undo it.
- [Low] The commit message is missing the tags a bug fix needs.

Pre-existing issues:
- [High] This problem wasn't introduced by this patch, but the series
  leaves the same bug class open in sch_cake.

--

net/sched: fq, fq_codel, fq_pie: skip empty rounds in the deficit-refill dequeue loop

This patch adds a skip-ahead to the deficit-refill dequeue loops of fq,
fq_codel and fq_pie. After a full round in which no flow could dequeue, it
gives every flow the quanta for the remaining rounds in one pass. In the
same pass it removes the empty flows the old one-quantum loop would have
removed.

Link: https://lore.kernel.org/netdev/179182028153.434549.4854377793269282267@kernel.org/

> Reported-by: Sashiko (nipa) <sashiko-bot@kernel.org>
> Link: https://lore.kernel.org/netdev/179182028153.434549.4854377793269282267@kernel.org/
> Reviewed-by: Jamal Hadi Salim <jhs@mojatatu.com>
> Signed-off-by: Victor Nogueira <victor@mojatatu.com>

[Severity: Low]
This isn't a bug in the code, but should this have a Fixes: tag and a
Cc: stable? The dequeue spin has been in fq, fq_codel and fq_pie since they
were merged. Without those tags, stable maintainers have nothing to act on.

The companion commit "net/sched: drr, ets, sfq: skip empty rounds in the
deficit-refill dequeue loop" says the trigger only needs CAP_NET_ADMIN
("unshare -Urn is enough"). Could this commit message say the same?

Using Link: rather than Closes: after Reported-by: is fine as it is, since
checkpatch accepts either.

> diff --git a/net/sched/sch_fq.c b/net/sched/sch_fq.c
> index a282812c192ee..5c724ec04d903 100644
> --- a/net/sched/sch_fq.c
> +++ b/net/sched/sch_fq.c

[ ... ]

> @@ -782,9 +788,76 @@ static struct sk_buff *fq_dequeue(struct Qdisc *sch)
>  	f = head->first;
>  	retry = 0;
>  	if (f->credit <= 0) {
> +		/* No flow could dequeue in the last full round. Add the
> +		 * quanta for the rounds still needed in one pass.
> +		 */
> +		if (!scanned && f == first) {
> +			unsigned int rounds = UINT_MAX;
> +			struct fq_flow *iter, *prev;
> +			bool skip = true;
> +
> +			scanned = true;
> +			/* new_flows is empty after a full round. */
> +			for (iter = pband->old_flows.first; iter;
> +			     iter = iter->next) {
> +				/* Empty flows don't limit the rounds. */
> +				if (!fq_peek(iter))
> +					continue;
> +				if (iter->credit > 0) {
> +					skip = false;
> +					break;
> +				}

[ ... ]

> @@ -796,6 +869,9 @@ static struct sk_buff *fq_dequeue(struct Qdisc *sch)
>  		if (now + offload_horizon < time_next_packet) {
>  			head->first = f->next;
>  			f->time_next_packet = time_next_packet;
> +			/* The round's first flow left; the next one takes over. */
> +			if (f == first)
> +				first = scanned ? NULL : head->first;
>  			fq_flow_set_throttled(q, f);
>  			goto begin;
>  		}

[Severity: Medium]
Can one trap flow per dequeue bring back the full cost here?

In fq_dequeue(), scanned is set to true as soon as the scan starts. That
includes the case where the scan stops early because a non-empty flow
already has credit > 0 (skip = false; break;). After that, the
!scanned && f == first check cannot pass again in this call. fq clears
scanned only when the band changes.

If the flow that became eligible is then throttled, the code above sets
first to NULL. The remaining flows then go back to one quantum per
iteration. With the 1 MiB stab inflation and quantum 256, that is about
N * 4096 iterations again.

__fq_codel_dequeue() has the same latch and never clears scanned. There the
trap is an eligible flow whose packets codel_dequeue() all drops, which hits
the !skb path:

	list_del_init(&flow->flowchain);
	if (flow == first)
		first = scanned ? NULL : ...;

The commit message mentions this ("A setup built to make that happen every
time is as slow as before"). In fq, though, one paced or EDT flow with a
small deficit (SO_TXTIME, SO_MAX_PACING_RATE, maxrate or
low_rate_threshold) per dequeue looks like enough. The message also doesn't
cover the early-stop case.

Would it make sense to allow the scan to run again after the round's first
flow leaves, instead of once per dequeue?

Also, fq_pie_qdisc_dequeue() never drops at dequeue, so an eligible
non-empty flow always dequeues. Is the "all its packets are dropped by the
AQM (fq_codel, fq_pie)" wording accurate for fq_pie?

> diff --git a/net/sched/sch_fq_codel.c b/net/sched/sch_fq_codel.c
> index e6c87a32950f9..bc74690e23236 100644
> --- a/net/sched/sch_fq_codel.c
> +++ b/net/sched/sch_fq_codel.c

[ ... ]

> @@ -298,6 +300,67 @@ static struct sk_buff *__fq_codel_dequeue(struct Qdisc *sch)
>  	flow = list_first_entry(head, struct fq_codel_flow, flowchain);
>  
>  	if (flow->deficit <= 0) {

[ ... ]

> +			if (skip) {
> +				struct fq_codel_flow *tmp;
> +
> +				list_for_each_entry_safe(iter, tmp, &q->old_flows,
> +							 flowchain) {
> +					unsigned int k = 0;
> +
> +					/* An empty flow leaves the list after
> +					 * k more refills. If that falls within
> +					 * the skipped rounds, remove it now.
> +					 */
> +					if (iter->head) {
> +						WRITE_ONCE(iter->deficit,
> +							   iter->deficit +
> +							   rounds * q->quantum);
> +						continue;
> +					}
> +					if (iter->deficit <= 0)
> +						k = DIV_ROUND_UP(1 - iter->deficit,
> +								 q->quantum);
> +					if (k < rounds) {
> +						WRITE_ONCE(iter->deficit,
> +							   iter->deficit +
> +							   k * q->quantum);
> +						list_del_init(&iter->flowchain);
> +						continue;
> +					}

[Severity: Medium]
Do flows removed here keep stale CoDel state?

The old one-quantum loop always reached such an empty flow with
deficit > 0 before any non-empty flow became eligible (k < rounds). It then
called codel_dequeue() on it. With no skb, that resets the CoDel vars
before the !skb path calls list_del_init():

include/net/codel_impl.h:codel_dequeue() {
	...
	if (!skb) {
		vars->first_above_time = 0;
		WRITE_ONCE(vars->dropping, false);
		return skb;
	}
	...
}

The skip pass unlinks the flow without that reset. When the flow comes
back, fq_codel_enqueue() only restores list membership and deficit:

	if (list_empty(&flow->flowchain)) {
		list_add_tail(&flow->flowchain, &q->new_flows);
		q->new_flow_count++;
		WRITE_ONCE(flow->deficit, q->quantum);
	}

Suppose the flow's last packet had sojourn >= target while the backlog was
above mtu. Then first_above_time stays non-zero and in the past. On the
first packet after the flow comes back, codel_should_drop() takes the
codel_time_after(now, vars->first_above_time) branch and returns
ok_to_drop.

If dropping is still true and drop_next has passed, codel_dequeue() goes
straight into its drop loop with the old count and rec_inv_sqrt. The old
code would have set first_above_time = now + interval and not dropped.

The commit message says the new pass matches the old loop, but the CoDel
state differs here. fq and fq_pie don't have this side effect when they
remove a flow, so only fq_codel seems to be affected.

[ ... ]

> +		/* Remember which flow started this round. */
> +		if (!first)
> +			first = flow;
>  		WRITE_ONCE(flow->deficit, flow->deficit + q->quantum);
>  		list_move_tail(&flow->flowchain, &q->old_flows);
>  		goto begin;

[Severity: High]
This is a pre-existing issue, not one introduced by this patch, but should
sch_cake get the same treatment? cake_dequeue() still has the DRR++ refill
loop this series replaces in fq_codel:

net/sched/sch_cake.c:cake_dequeue() {
	...
	if (flow->deficit <= 0) {
		...
		WRITE_ONCE(flow->deficit,
			   flow->deficit + cake_get_flow_quantum(b, flow, q->config->flow_mode));
		list_move_tail(&flow->flowchain, &b->old_flows);

		goto retry;
	}
	...
}

cake_overhead() starts from qdisc_pkt_len(), so the same 1 MiB stab
overhead applies to cake.

cake_set_rate() clamps b->flow_quantum to 300..1514. cake_get_flow_quantum()
then scales it by quantum_div[host_load], and host_load can reach
CAKE_QUEUES (1024). So the average refill can drop below one byte.

With up to 1024 bulk flows in a tin, that is roughly 1024 * (2^20 / 300),
about 3.6M iterations per dequeue without host scaling, and far more with
it. All of this runs under the root qdisc lock with BH disabled.

hhf_dequeue() in sch_hhf.c has the same loop. It only has two WDRR buckets
and quantum >= 256, though, so its cost doesn't grow with the number of
flows.

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/QDISC-TIAE.v2.r0.20261015163454%40mojatatu.com
