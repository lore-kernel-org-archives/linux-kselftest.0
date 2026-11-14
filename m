Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794676194;
	b=gAJGbMLyImWhDLTun45/KYNuXVY0LnSHHIxPK0uW7LT/CR765qXVeNlGhvGPnHF7WFfF
	 nD3yUZqIoXEngMZRa8bZ1YCmjiJC1falqqAVl8MxigTe8VMERbcik1QiwLAAcfMr3H5xU
	 VkbpXdLW/OjLFrkTsdNt3kQxymza0n+/nSfpIW/BGoSplzqeRoYP4yQWjLSltTUesU30n
	 0cCi2JdQpAAmeXEgk7DaP9JQbH+lIBIM6eEgDBvCy2bh0c7baan63zURir0uIc/QaKPtU
	 jdjEHoYf9lBQ3h05RT/mtnex5jtASlg9KSs+lNfHgvdtTHg0dXMWidm7RP26rdK2gbA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794676194;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=FqN4KDJIxmU9Q0izWI8VvuQ7FOMtenlG/mu/G5wNfQI=;
	b=xcirxJN+3arySARqW9Fk5QGClqz8DYNZbECJjW8rzU0rWpTJUbPYhF3ccfIt8nhWZqck
	 daLrbB4GxnqKIhWw6DAYzooj0tNdnrtDCaCROBHfpqNmQBZBsHqAVdROZ2bPwdgjcyk1s
	 bZ65YYfT/YKPMieCF5UGt0Fd57GaYFIQU3NFTomViYva+2V/ARrSCe7U/QdOEN2NQnFnZ
	 5dzumnbw7VmIRurMFQjPHJFe7g87+lZ5CSKuBOZU4W7JoqhjCdVij1ewUXc3m/baYFfP/
	 ppLF5rNnHr340NoxqAzJ/x6l8JThV9CaufwL/5X6h69J1JIdb0NdTPSSKqAB59r69kA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oJ0KiTP1;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6421606A330;
	Sat, 14 Nov 2026 17:09:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oJ0KiTP1
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D06A91F000C5;
	Sat, 14 Nov 2026 17:09:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794676194;
	bh=FqN4KDJIxmU9Q0izWI8VvuQ7FOMtenlG/mu/G5wNfQI=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=oJ0KiTP1QWhKE07HqLIv9lKb2Y9MR0hJK8ZIAvVeJKfiZ9mLuZClbjotW7YAezHwE
	 sONCvmSf7v1mc9EougkcF9GC/oGQnyCLnsbCxdDBJn6naBvBpo3G8CtY1CUFPjLTy7
	 ptEGoQGBo36HrEmClqaSZsSS4RUSqzPOpuW3BsUQcK6o3voe7qcUX1hfv5vvL3QaWq
	 TARg4vevZrTcHbUWppcEqOhgVcESiZ6Akz6HAN6hKhHLJezBuSCjR73/YOayPj+Rbt
	 jDShlTJBNVUQs+Wk18uHOxXwgDweuBjOsJOx2jTY5z2pQ2JvgjvriV2IQqZiMN4BPo
	 SOPOBUjTgNM3Q==
Subject: Re: [PATCH net-next v3 3/3] selftests: tc-testing: pin DRR and ETS
 deficit refill semantics
From: netdev-bot+sashiko@kernel.org
To: victor@mojatatu.com
Cc: netdev@vger.kernel.org, jiri@resnulli.us, davem@davemloft.net,
 edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com, horms@kernel.org,
 jhs@mojatatu.com, sashiko-bot@kernel.org, shuah@kernel.org,
 linux-kselftest@vger.kernel.org
Date: Sat, 14 Nov 2026 17:09:53 +0000
Message-ID: <179467619339.2199510.6248385322007095412@kernel.org>
In-Reply-To: <QDISC-TIAE.v3.r0.20261109173518-3@mojatatu.com>
References: <QDISC-TIAE.v3.r0.20261109173518-3@mojatatu.com>
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

Thank you for your contribution! Sashiko AI review found 4 potential
issue(s) to consider.

Critical: 0 · High: 0 · Medium: 1 · Low: 3

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] All three new tests pass or fail based on wall-clock timing,
  with roughly ±0.5 s of margin, and nothing synchronises them with when…
- [Low] The commit message says only 57a1 and 2177 put netem under the
  classful qdisc and log the "non-work-conserving?" warning.
- [Low] In ETS test 2177, band 1:1 is expected to show "bytes": 1514,
  "packets": 1, although the band was never served (backlog 3028, qlen…
- [Low] The commit says it pins the DRR/ETS deficit refill 'so a change
  to the refill loop can't silently alter the result'.

--

selftests: tc-testing: pin DRR and ETS deficit refill semantics

This commit adds three tc-testing cases. 3f3e checks the DRR deficit after
a 1514-byte packet at quantum 256. 57a1 and 2177 check that DRR and ETS
serve a 514-byte packet before a 1514-byte one, using netem delay under the
classful qdisc to hold packets while stats are inspected.

> diff --git a/tools/testing/selftests/tc-testing/tc-tests/qdiscs/drr.json b/tools/testing/selftests/tc-testing/tc-tests/qdiscs/drr.json
> index 2b61d8d79bde8..d7ac32294738e 100644
> --- a/tools/testing/selftests/tc-testing/tc-tests/qdiscs/drr.json
> +++ b/tools/testing/selftests/tc-testing/tc-tests/qdiscs/drr.json
> @@ -86,5 +86,87 @@

[ ... ]

> +        "setup": [
> +            "$IP addr add 10.10.11.10/24 dev $DUMMY",
> +            "$TC qdisc add dev $DUMMY root handle 1: drr",
> +            "$TC class add dev $DUMMY parent 1: classid 1:1 drr quantum 256",
> +            "$TC qdisc add dev $DUMMY parent 1:1 handle 10: netem delay 2s limit 10",

[Severity: Low]
The commit message says:

    57a1 and 2177 put netem under the classful qdisc, so they log the usual
    "non-work-conserving?" warning.

3f3e also puts netem under DRR class 1:1 here, so doesn't it log the same
warning? The first ping packet is enqueued and qdisc_run() calls
drr_dequeue(). netem's peek, qdisc_peek_dequeued()->netem_dequeue(),
returns NULL because the packet is not due for 2s:

net/sched/sch_drr.c:drr_dequeue() {
    ...
		skb = cl->qdisc->ops->peek(cl->qdisc);
		if (skb == NULL) {
			qdisc_warn_nonwc(__func__, cl->qdisc);
			goto out;
		}
    ...
}

Each test creates a new netem qdisc with TCQ_F_WARN_NONWC clear, so it
looks like all three tests print the warning, not two.

Should the commit message say that all three tests log it?

> +            "$TC filter add dev $DUMMY parent 1: protocol ip prio 1 u32 match u32 0 0 flowid 1:1",
> +            "ping -c 2 -s 1472 -i 1 10.10.11.11 -I $DUMMY -W 0.01 >/dev/null 2>&1 &"
> +        ],
> +        "cmdUnderTest": "sleep 2.5",
> +        "expExitCode": "0",
> +        "verifyCmd": "$TC -s class show dev $DUMMY",
> +        "matchPattern": "deficit 22b",

[Severity: Medium]
Can these tests fail intermittently because of scheduling latency?

nsPlugin runs the traffic generators in the background with & through ip
netns exec. The verify step then runs after a fixed sleep 2.5. Nothing
ties the verify step to the time the packets are actually enqueued.

In 3f3e, ping sends at T+d1 and T+d1+1, and netem releases each packet 2s
later. drr_dump_class_stats() reports the deficit only while the class is
backlogged:

net/sched/sch_drr.c:drr_dump_class_stats() {
    ...
	if (qlen)
		xstats.deficit = READ_ONCE(cl->deficit);
    ...
}

So "deficit 22b" only matches while the first packet has been dequeued and
the second is still held by netem. If ping start-up or tdc overhead moves
things by more than about 0.5s, tc prints either deficit 256b (nothing
released yet) or deficit 0b (class drained).

57a1 and 2177 have the same problem. Batch 1 is released at about T0+p1+3,
and verify runs at about T0+1+2.5 plus overhead:

- If starting ip netns exec plus python3 takes more than about 0.5s,
  batch 1 is still held at verify time. Class 1:2 then shows bytes 0 with
  backlog 1028 / qlen 2 instead of 514 / 1.
- If tdc overhead between setup and verify is too large, batch 2 is
  released and backlog/qlen change.

tdc.sh runs tdc.py -J"$(nproc)", which adds CPU contention. Debug kernels
such as KASAN or lockdep slow start-up further.

Could the tests wait for the packets to appear in the qdisc backlog before
the timed window starts? Alternatively, could the margin between the netem
delay and the verify time be made wider?

[ ... ]

> +        "cmdUnderTest": "sleep 2.5",
> +        "expExitCode": "0",
> +        "verifyCmd": "$TC -j -s class show dev $DUMMY",
> +        "matchJSON": [
> +            {
> +                "class": "drr",
> +                "handle": "1:1",
> +                "root": true,
> +                "stats": {
> +                    "bytes": 0,
> +                    "packets": 0,
> +                    "backlog": 3028,
> +                    "qlen": 2
> +                }
> +            },

[Severity: Low]
The commit message says the tests ensure "a change to the refill loop
can't silently alter the result". Does 57a1 actually pin the multi-class
refill?

This matchJSON only checks bytes, packets, backlog and qlen, which only
shows the service order. The batched refill in drr_dequeue() adds
rounds * quantum to every active class:

net/sched/sch_drr.c:drr_dequeue() {
    ...
			if (skip && rounds != UINT_MAX) {
				list_for_each_entry(iter, &q->active, alist)
					WRITE_ONCE(iter->deficit,
						   iter->deficit + rounds *
						   READ_ONCE(iter->quantum));
    ...
}

Suppose that loop were changed to refill only the first class. B would
still be dequeued first, and the asserted stats would match exactly.
Class 1:1's deficit, though, would end at 1280 (or 768) instead of 1024.
Class 1:2 ends at 254 in both cases. 3f3e has only one class, so it can't
tell these cases apart either.

Class 1:1 still has qlen 2 at verify time, so drr_dump_class_stats()
exports its deficit. Could 57a1 also check the per-class deficits (1024
and 254)? ETS does not export a deficit, so 2177 can only check the order.

[ ... ]

> diff --git a/tools/testing/selftests/tc-testing/tc-tests/qdiscs/ets.json b/tools/testing/selftests/tc-testing/tc-tests/qdiscs/ets.json
> index d2eab61c099a8..ea3adba2f06c7 100644
> --- a/tools/testing/selftests/tc-testing/tc-tests/qdiscs/ets.json
> +++ b/tools/testing/selftests/tc-testing/tc-tests/qdiscs/ets.json
> @@ -1007,5 +1007,59 @@

[ ... ]

> +        "verifyCmd": "$TC -j -s class show dev $DUMMY",
> +        "matchJSON": [
> +            {
> +                "class": "ets",
> +                "handle": "1:1",
> +                "root": true,
> +                "stats": {
> +                    "bytes": 1514,
> +                    "packets": 1,
> +                    "backlog": 3028,
> +                    "qlen": 2
> +                }
> +            },

[Severity: Low]
Is "bytes": 1514, "packets": 1 the intended expectation for band 1:1?

Band 1:1 still has backlog 3028 and qlen 2. Both 1514-byte packets are
still queued, so the band was never served. The count seems to come from
netem's accounting at peek time. ets_class_dump_stats() reports the
child's bstats:

net/sched/sch_ets.c:ets_class_dump_stats() {
    ...
	if (gnet_stats_copy_basic(d, NULL, &cl_q->bstats, true) < 0 ||
    ...
}

netem's peek is qdisc_peek_dequeued(), which calls netem_dequeue(). That
updates bstats before the skb is stashed back in gso_skb:

net/sched/sch_netem.c:netem_dequeue() {
    ...
deliver:
		qdisc_qstats_backlog_dec(sch, skb);
		qdisc_bstats_update(sch, skb);
		return skb;
    ...
}

So a single ETS peek of the first A packet sets band 1:1 to 1514/1.

The DRR version, 57a1, runs the same scenario and expects bytes 0 /
packets 0. That is because drr_dump_class_stats() reports cl->bstats,
which is only updated on a real dequeue.

The expectation here depends on how netem accounts a peek. Could band 1:1
check only backlog/qlen, so the test does not break if that accounting
changes while ETS scheduling stays the same?

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/QDISC-TIAE.v3.r0.20261109173518%40mojatatu.com
