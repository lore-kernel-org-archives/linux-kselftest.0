Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794676193;
	b=okBEihn/mLhB+EXZ+sCZbQERNgAvvZHHp2yJp/ugBViQh7niT1sMCEYBkVqsHr+4e7gG
	 K02NIYuV4SZxolPI3WDQMj3NIqDKyK42aw/N+TFI0sOFrv8GhO9qagmRvMflDs900Tvxm
	 DTU9d1ZzjWrAuHg32rvOiAakCA2uShDZTblSmsjPTWKuFiT6Mm3p67dkoXlUKnZlTIDYP
	 rCX6VeWbSndGC5Pfk7Foz/exAO+GjWX6zdmbsWPgN55G1Ap+TSd1q7jCeBRizallPdaje
	 W5G0WP8AlhD+MjozF9PSH8Mu9o+DnVDkrE5ZXEFEVWbKrh57r3n+ejN5Vi36b/QzR/g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794676193;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=Ako3KP9iF8f2dzDuNLnMay3yDlimcTa4jk9cf80I3xE=;
	b=ID+kfoo9Rfmw0Z/HEtj5MgkIus+HB9Y2/XHL6cuePIkIrchOahWn2M2rBK3gs9KHmhWz
	 VjUch/rjp/SOJf/Cx8eAV+DlqIKtObe1lC25KzoKlFFg6YncGWSd+LCNka2pv8wazuL6U
	 gghqQgCXAB0prqLGyZvyogvVTUan+zBM1VYlW//KAnXnd7xQYoaAU3uguzOkazLCwGdfM
	 JjFRn4rlz9ectITP0bQex5qso2ppRAlmIfJ0/9BbVEBR/xTQTtqf2vydVhFgTv9/MrnLs
	 GjecYsDcKQqYx3AY5g7NuFq1Kp6s4yJX6RnckUn7WGwmdLx8DSiNxVYCsEoIxJ3hWfg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UPocnQe8;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86330606A881;
	Sat, 14 Nov 2026 17:09:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UPocnQe8
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F9AB1F000C4;
	Sat, 14 Nov 2026 17:09:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794676193;
	bh=Ako3KP9iF8f2dzDuNLnMay3yDlimcTa4jk9cf80I3xE=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=UPocnQe8OfxbsMscSd49AYam4wggk6YxKthBgX54I2wBy2RU7qVWqm6esAmV3f5o6
	 HCDXuMPffxjlRC6W2ebdaeA501HO70EP83CWAcIb6oFtZVvXXCbOzl0PKVCBZHgWqb
	 yvrr1p+IFpPW6wM8NRBpboc7hq4X50GZebauyD+mq0xMUG2UhoJrxVLz5JZz3oVAxb
	 ZbATwVmJ0BCHAkii6C4DAAiqBM/1LJEZVu2ISD84jBTnJmRLxWhAvf8DO70ZifYWTr
	 bYo7JuuGxfkPl91Wti8RBEf9SK2z9Sg5GCCCQfBuHeSaLD6LOIlTFISzUFxRkaLmwA
	 +8YfSsi5LyJqA==
Subject: Re: [PATCH net-next v3 2/3] net/sched: fq, fq_codel, fq_pie: skip
 empty rounds in the deficit-refill dequeue loop
From: netdev-bot+sashiko@kernel.org
To: victor@mojatatu.com
Cc: netdev@vger.kernel.org, jiri@resnulli.us, davem@davemloft.net,
 edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com, horms@kernel.org,
 jhs@mojatatu.com, sashiko-bot@kernel.org, shuah@kernel.org,
 linux-kselftest@vger.kernel.org
Date: Sat, 14 Nov 2026 17:09:52 +0000
Message-ID: <179467619215.2199510.960010901115312228@kernel.org>
In-Reply-To: <QDISC-TIAE.v3.r0.20261109173518-2@mojatatu.com>
References: <QDISC-TIAE.v3.r0.20261109173518-2@mojatatu.com>
X-sashiko-severity: High
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

Thank you for your contribution! Sashiko AI review found 4 potential
issue(s) to consider.

Critical: 0 · High: 1 (1) · Medium: 1 · Low: 2

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [High] The skip-ahead can be turned off for the rest of a dequeue call,
  so the N * rounds spin the patch says it removes is still reachable.
- [Medium] In __fq_codel_dequeue() (net/sched/sch_fq_codel.c), the bulk-
  skip loop removes empty flows with k < rounds by calling…
- [Low] The commit message and the new comments give reasons for the
  repeated scan that do not match the code.
- [Low] The patch is written as a bug fix ("The issue" / "The Fix", a
  reproducer, a Reported-by from the netdev bot) for a user-triggerable…

Pre-existing issues:
- [High] This problem wasn't introduced by this patch, but sch_cake has
  the same unbounded deficit-refill loop, and the series leaves it as is.

--

net/sched: fq, fq_codel, fq_pie: skip empty rounds in the deficit-refill dequeue loop

This patch adds a skip-ahead to the deficit-refill loops in fq_dequeue(),
__fq_codel_dequeue() and fq_pie_qdisc_dequeue(). After a full round in
which no flow could dequeue, the quanta for the remaining rounds are added
to every flow in one pass. Empty flows that the old loop would have removed
during those rounds are removed in the same pass, and the skip is retried
after every bulk refill.

Link: https://lore.kernel.org/netdev/179182028153.434549.4854377793269282267@kernel.org/
Link: https://lore.kernel.org/netdev/3ab59725-e34c-4243-bc72-d93f837bcad1@redhat.com/

> Reported-by: Sashiko (nipa) <sashiko-bot@kernel.org>
> Link: https://lore.kernel.org/netdev/179182028153.434549.4854377793269282267@kernel.org/
> Link: https://lore.kernel.org/netdev/3ab59725-e34c-4243-bc72-d93f837bcad1@redhat.com/
> Reviewed-by: Jamal Hadi Salim <jhs@mojatatu.com>
> Signed-off-by: Victor Nogueira <victor@mojatatu.com>

[Severity: Low]
This isn't a bug, but the patch is written as a fix for a stall that users
can trigger under the qdisc lock. Should it carry Fixes: tags for the
commits that added the one-quantum refill loops in sch_fq.c,
sch_fq_codel.c and sch_fq_pie.c? If a stable backport isn't intended, a
note saying so would also help.

The sibling patch "net/sched: drr, ets, sfq: skip empty rounds in the
deficit-refill dequeue loop" doesn't have Fixes: tags either.

> diff --git a/net/sched/sch_fq.c b/net/sched/sch_fq.c
> index a282812c192ee..4229065e48094 100644
> --- a/net/sched/sch_fq.c
> +++ b/net/sched/sch_fq.c

[ ... ]

> @@ -782,9 +788,82 @@ static struct sk_buff *fq_dequeue(struct Qdisc *sch)
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

> @@ -796,6 +875,9 @@ static struct sk_buff *fq_dequeue(struct Qdisc *sch)
>  		if (now + offload_horizon < time_next_packet) {
>  			head->first = f->next;
>  			f->time_next_packet = time_next_packet;
> +			/* The round's first flow left; the next one takes over. */
> +			if (f == first)
> +				first = scanned ? NULL : head->first;
>  			fq_flow_set_throttled(q, f);
>  			goto begin;
>  		}

[Severity: High]
Can the skip-ahead be turned off for the rest of this fq_dequeue() call?
scanned is set to true before every scan. It is only cleared again after
a successful bulk refill or on a band switch.

Suppose the scan finds a non-empty flow P with credit > 0, so skip is
false. P can have picked up that credit from its own one-quantum refill
in the round that just ended. If P's head packet has an EDT (SO_TXTIME)
or pacing time in the future, P is throttled here, and only first is
adjusted:

	if (f == first)
		first = scanned ? NULL : head->first;
	fq_flow_set_throttled(q, f);

>From then on "!scanned && f == first" is always false, so the remaining
flows go back to one-quantum refills. With the 1 MiB stab setup that is
about 4096 iterations per flow, under the qdisc lock with BH disabled.

__fq_codel_dequeue() looks like it has the same problem. If codel_dequeue()
drops all of P's packets and returns NULL, P is removed with
list_del_init() and scanned stays true.

The commit message says:

  "a flow that changes state (throttled in fq, dropped by the AQM in
  fq_codel and fq_pie, or a new packet at the head) does not leave the
  loop on the one-quantum path for the rest of the dequeue"

Does that still hold when the state change follows a failed scan rather
than a bulk refill? Should scanned also be reset on these paths?

fq_pie doesn't seem to be affected, because a non-empty flow with positive
deficit always returns an skb there.

> diff --git a/net/sched/sch_fq_codel.c b/net/sched/sch_fq_codel.c
> index e6c87a32950f9..25d7bc9b6414b 100644
> --- a/net/sched/sch_fq_codel.c
> +++ b/net/sched/sch_fq_codel.c

[ ... ]

> @@ -298,6 +300,73 @@ static struct sk_buff *__fq_codel_dequeue(struct Qdisc *sch)

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
Does this bulk removal skip the CoDel state reset that the old path did?
In the old one-quantum loop, an empty flow only left old_flows after
codel_dequeue() had run on it. When dequeue_func() returns NULL,
codel_dequeue() does:

include/net/codel_impl.h:codel_dequeue() {
    ...
	if (!skb) {
		vars->first_above_time = 0;
		WRITE_ONCE(vars->dropping, false);
		return skb;
	}
    ...
}

Here the flow is removed with list_del_init() without going through
codel_dequeue(). first_above_time, dropping, drop_next and count keep
whatever values they had.

When fq_codel_enqueue() re-attaches the flow, it only resets the deficit:

	if (list_empty(&flow->flowchain)) {
		list_add_tail(&flow->flowchain, &q->new_flows);
		q->new_flow_count++;
		WRITE_ONCE(flow->deficit, q->quantum);
	}

Could a returning flow, or a new connection that hashes to the same
bucket, then be dropped or ECN marked right away? codel_should_drop()
would see a stale first_above_time that is already in the past, or
dropping would still be true.

This path runs in normal operation whenever quantum is smaller than the
packet length, for example quantum 300 with 1514 byte packets, not only
with an inflated stab.

The commit message says "credits and list order match the old loop", but
it doesn't mention this per-flow AQM reset.

> diff --git a/net/sched/sch_fq_pie.c b/net/sched/sch_fq_pie.c
> index 5982847df8f85..15ae977101207 100644
> --- a/net/sched/sch_fq_pie.c
> +++ b/net/sched/sch_fq_pie.c

[ ... ]

> @@ -254,6 +256,67 @@ static struct sk_buff *fq_pie_qdisc_dequeue(struct Qdisc *sch)

[ ... ]

> +					iter->deficit += rounds * q->quantum;
> +				}
> +				/* A flow may show a non-empty queue or a
> +				 * dropped packet now; scan again if the loop
> +				 * still cannot dequeue.
> +				 */
> +				first = NULL;
> +				scanned = false;
> +				goto begin;
> +			}
> +		}

[Severity: Low]
Is this comment accurate for fq_pie? fq_pie_qdisc_dequeue() never drops
on dequeue. It calls dequeue_head() and then pie_process_dequeue(), which
returns void and only updates qdelay, avg_dq_rate and burst_time.

A non-empty flow with positive deficit always returns an skb here, so the
repeated scan can never find a stalled round in fq_pie.

The commit message makes the same claim:

  "dropped by the AQM in fq_codel and fq_pie"

The matching comments in __fq_codel_dequeue() ("a non-empty queue") and
fq_dequeue() ("a non-empty queue, a new packet") also list state changes
that can't happen inside one dequeue call. Nothing is enqueued while the
qdisc lock is held, and fq_check_throttled() only runs before the begin
label. The only real changes seem to be CoDel drops in fq_codel and
throttling in fq.

Could the comments and the commit message be updated to match?

> +
> +		/* Remember which flow started this round. */
> +		if (!first)
> +			first = flow;
>  		flow->deficit += q->quantum;
>  		list_move_tail(&flow->flowchain, &q->old_flows);
>  		goto begin;

[Severity: High]
This isn't a bug introduced by this patch, but sch_cake seems to have the
same unbounded refill loop, and the series leaves it unchanged:

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

Deficits are charged with adjusted_len, which is derived from
qdisc_pkt_len(), so a root stab can inflate it to 1 MiB. The refill is
flow_quantum (300..1514) scaled by host load:

	return (q->flow_quantum * quantum_div[host_load] +
		get_random_u16()) >> 16;

With the default triple-isolate mode and many bulk flows from one host,
each refill can add well under one byte on average, about 0.29 bytes at
1024 flows.

Even without host scaling, 1024 flows at about -1 MiB need about 3500
refills each. That is roughly 3.6M iterations per stalled dequeue under
the qdisc lock with BH disabled.

Should cake get the same skip-ahead, or could the commit messages say why
it is left out? hhf has the same loop, but with only two buckets it stays
bounded.

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/QDISC-TIAE.v3.r0.20261109173518%40mojatatu.com
