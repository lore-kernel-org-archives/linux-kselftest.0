Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792445978;
	b=uZMnn4JiH8DrOQKv9Q2eVGYHSBBJfKzNluxPF1+av88cgHYhvhJcF62GB7ATQIbuC7P/
	 s2q0LLzqNYzkFXk6q1LIRP9hfZ0bNzewctrGPqCpUUIWMSez0tkoPFnM0G9zsFtrkiBAF
	 EF5QIVmWSK7iMu2Z0RIawOjN2CW58Qea+GmRsdGvDRI5TisSJJrwuQEvdGmQhddxrCkH7
	 enqc2qo42LS98wgUhqr0nSjRj5PdoaMvBhFDzpJVDyr/43V0WaY0b8qnqSpQCZQmldJDE
	 3tBRhkZxi2rTK9eHgswYlZJuC653FV0F7BZaPj1soP+wFVapJsrdGtI8ZngD0J9naEg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792445978;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=UPFqQstS2ZI9d/LmUXF4gupNyOv5vMnDf08wB9sGsfU=;
	b=XT+lmm38+NwhHhqVKR7C74wdDqF7hTCTMpA2tC4Ogada5YvOvBZUUEOlWHTUu0EdmCjr
	 LWqSpN3tA1AZkGN8qPhPyhf+lQhNEXv80L2sAlz2Td8OZjaRbkv+hIKK4Q8iF2GVEFOWC
	 pHfHRTTFTQxdTcMHnGT7Ogz92wfVQQ/lExZODIig2bq6wP23pwHQ75lXv6PD4isG+5xoT
	 4pq1oqz4xzhHkZl3DZ2qoNEEzfRIUPsS5+NiD8A9zhP1XvPeTJBK6kEUXUwUPIHga9qZT
	 An71T2lOEhM8A0E8iZZFFX4KmUOmIEvBcX4CJ/uJHh/WKzIw+U3sEc8OrmjzvFFmy3g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TcVWhDaD;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3D66606A31B;
	Mon, 19 Oct 2026 21:39:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TcVWhDaD
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9BCD71F000C4;
	Mon, 19 Oct 2026 21:39:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792445977;
	bh=UPFqQstS2ZI9d/LmUXF4gupNyOv5vMnDf08wB9sGsfU=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=TcVWhDaD3NrwY1P9KNGAIaRWOWeX4Rcdo8u0+Z/rL1zMv88ym24PjgZtnQePxx6Eu
	 WpEn/4DGjQr+KcH/eziB6N8ggHvNSOyoZf7jnj3+UvmU/MCXgX4Az5WeuEcqRZqezv
	 mfvOydcn4Sv8xuwcXdlrvFzYkjNXh71ambSt9kzWgZAri9v18DGNj02/XHtkl8RGSA
	 yw5gRpHkQVx7YO+J8BI5bYiGMrnxqPrcDupIV2nhoMHS2d+iIfpJdIjgwTy1Q+8CkI
	 PzNQIRvN0m7z8tz7vTI5hzWSvbB5PKtrSh1bFkFYbf+WCodSh7tM61RfYMGOrx18Ff
	 R5Ror8bemtS0Q==
Subject: Re: [PATCH net-next v2 1/3] net/sched: drr, ets, sfq: skip empty
 rounds in the deficit-refill dequeue loop
From: netdev-bot+sashiko@kernel.org
To: victor@mojatatu.com
Cc: davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org,
 pabeni@redhat.com, jhs@mojatatu.com, jiri@resnulli.us, netdev@vger.kernel.org,
 horms@kernel.org, sashiko-bot@kernel.org, shuah@kernel.org,
 linux-kselftest@vger.kernel.org
Date: Mon, 19 Oct 2026 21:39:36 +0000
Message-ID: <179244597608.3135.14866688728455017187@kernel.org>
In-Reply-To: <QDISC-TIAE.v2.r0.20261015163454-1@mojatatu.com>
References: <QDISC-TIAE.v2.r0.20261015163454-1@mojatatu.com>
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

- [Medium] drr_dequeue() and ets_qdisc_dequeue() allow only one bulk
  refill per dequeue: `scanned = true` is set at sch_drr.c:414 /…
- [Medium] The new two-pass bulk refill in drr_dequeue() and
  ets_qdisc_dequeue() reads each class's quantum separately in the scan…
- [Low] The commit fixes a user-triggerable long busy loop under the
  qdisc lock with BH disabled (the commit itself says ~1 s per drain,…

Pre-existing issues:
- [High] This problem wasn't introduced by this patch, but the sibling-
  site audit in this series is incomplete.

--

net/sched: drr, ets, sfq: skip empty rounds in the deficit-refill dequeue loop

This patch changes the DRR, ETS and SFQ dequeue loops. After a full round
in which no class could dequeue, they now compute how many more rounds are
needed and add that many quanta to every class in one pass, instead of
refilling one quantum per iteration. It follows commit 8f735d64382d to bound
the dequeue cost when a size table inflates packet lengths to 1 MiB.

Closes: https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20260819143213.57401-1-jhs@mojatatu.com

> sfq has the same loop and is fixed the same way. ETS has at most 16
> bands, so it was never that slow; it is changed to match DRR.

[Severity: High]
This is a pre-existing issue and was not introduced by this patch.
cake_dequeue() in net/sched/sch_cake.c seems to have the same
one-quantum-per-visit refill, and no patch in the series changes it.

The later patch "net/sched: fq, fq_codel, fq_pie: skip empty rounds in the
deficit-refill dequeue loop" covers fq, fq_codel and fq_pie. That leaves
cake:

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

cake_overhead() starts from qdisc_pkt_len(skb). With a root stab of
overhead 1048576, each flow can therefore be left about 1 MiB in deficit
after a single dequeue.

The per-visit quantum is also much smaller than DRR's minimum of 256:

net/sched/sch_cake.c:cake_get_flow_quantum() {
    ...
	return (q->flow_quantum * quantum_div[host_load] +
		get_random_u16()) >> 16;
}

Take the default triple-isolate mode with 1024 bulk flows from one host.
That averages about 1.46 bytes per visit, or about 0.29 bytes with
flow_quantum 300.

Could one cake_dequeue() over 1024 flows at -1 MiB then need roughly 7e8
to 3.7e9 iterations under the root lock with BH disabled? That is well
past the 16384-class DRR case that the commit message describes as a ~1s
stall.

> Reported-by: Sashiko (nipa) <sashiko-bot@kernel.org>
> Closes: https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20260819143213.57401-1-jhs@mojatatu.com
> Reviewed-by: Jamal Hadi Salim <jhs@mojatatu.com>
> Signed-off-by: Victor Nogueira <victor@mojatatu.com>

[Severity: Low]
Should this have a Fixes: tag? The commit message says this follows
commit 8f735d64382d ("net/sched: bound qdisc_pkt_len to prevent qdisc
soft lockup"), and that commit carries:

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")

Without a matching tag, stable may take 8f735d64382d without this patch.
8f735d64382d on its own still allows N * 4096 iterations per dequeue.

> diff --git a/net/sched/sch_drr.c b/net/sched/sch_drr.c
> index 8621d057edd9f..d6cb389a55f03 100644
> --- a/net/sched/sch_drr.c
> +++ b/net/sched/sch_drr.c

[ ... ]

> @@ -402,6 +403,45 @@ static struct sk_buff *drr_dequeue(struct Qdisc *sch)
>  			return skb;
>  		}
>  
> +		/* No class could dequeue in the last full round. Add the
> +		 * quanta for the rounds still needed in one pass.
> +		 */
> +		if (!scanned && cl == first) {
> +			unsigned int rounds = UINT_MAX;
> +			struct drr_class *iter;
> +			bool skip = true;
> +
> +			scanned = true;

[Severity: Medium]
scanned is never cleared, so each dequeue gets at most one bulk refill.
Can a child's peeked head change between this scan and the loop's next
visit to that class?

prio_peek() polls every band again on each call:

net/sched/sch_prio.c:prio_peek() {
    ...
	for (prio = 0; prio < q->bands; prio++) {
		struct Qdisc *qdisc = q->queues[prio];
		struct sk_buff *skb = qdisc->ops->peek(qdisc);
		if (skb)
			return skb;
	}
    ...
}

A netem band also decides readiness from a fresh ktime_get_ns() in
netem_dequeue().

Here is an example setup. One DRR class has a PRIO child with a delayed
netem band 0 and a pfifo band 1 that holds a small packet. Every other
class has a 1 MiB head and quantum 256. The scan sees the small packet,
picks rounds=2 and raises every deficit to 1024.

Suppose the netem deadline passes before the loop gets back to the PRIO
class. prio_peek() then returns the 1 MiB netem packet and no class is
eligible. Because scanned is already true, the loop falls back to the
one-quantum path:

		WRITE_ONCE(cl->deficit, cl->deficit + READ_ONCE(cl->quantum));
		list_move_tail(&cl->alist, &q->active);

That costs roughly N * 4091 more iterations.

The commit message says "a dequeue costs O(N)" for DRR/ETS without a
caveat. The follow-up fq patch documents a similar limitation, but this
one does not.

Would clearing scanned and first after a bulk pass avoid this?
ets_qdisc_dequeue() has the same one-shot guard, although there it is
bounded by 16 bands.

> +			list_for_each_entry(iter, &q->active, alist) {
> +				unsigned int pkt_len;
> +				struct sk_buff *peek;
> +
> +				/* An empty child unlinks iter; stop here. */
> +				peek = iter->qdisc->ops->peek(iter->qdisc);
> +				if (!peek) {
> +					skip = false;
> +					break;
> +				}
> +				pkt_len = qdisc_pkt_len(peek);
> +				if (pkt_len <= iter->deficit) {
> +					skip = false;
> +					break;
> +				}
> +				rounds = min(rounds,
> +					     DIV_ROUND_UP(pkt_len - iter->deficit,
> +							  READ_ONCE(iter->quantum)));
> +			}
> +			if (skip && rounds != UINT_MAX) {
> +				list_for_each_entry(iter, &q->active, alist)
> +					WRITE_ONCE(iter->deficit,
> +						   iter->deficit + rounds *
> +						   READ_ONCE(iter->quantum));

[Severity: Medium]
quantum is read once in the scan to compute rounds, then read again here
when the refill is applied. Can it change between the two reads?

drr_change_class() updates an existing class without sch_tree_lock():

net/sched/sch_drr.c:drr_change_class() {
    ...
	if (cl != NULL) {
		...
		if (tb[TCA_DRR_QUANTUM])
			WRITE_ONCE(cl->quantum, quantum);

		return 0;
	}
    ...
}

tc_ctl_tclass() calls cops->change() under RTNL only. It does not take
the qdisc root lock that dequeue holds.

As an example, say the scan computes rounds=1 from a class with quantum
524288, deficit 524288 and a 1 MiB head. A concurrent change then sets
that quantum to 256 before this pass, so the refill adds only 256 and no
class becomes eligible.

Since scanned is already true, would the loop then fall back to about
2047 one-quantum rounds over all N classes?

ets_qdisc_dequeue() and ets_class_change() have the same pattern.
Snapshotting each class's quantum, or taking sch_tree_lock() around the
quantum update, would close this.

> +				continue;
> +			}
> +		}
> +
> +		if (!first)
> +			first = cl;
>  		WRITE_ONCE(cl->deficit, cl->deficit + READ_ONCE(cl->quantum));
>  		list_move_tail(&cl->alist, &q->active);
>  	}

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/QDISC-TIAE.v2.r0.20261015163454%40mojatatu.com
