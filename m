Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 889194503EB;
	Fri,  4 Sep 2026 09:42:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788514973; cv=none; b=bv4qLy2X7vmOE/YZApC8Ccl37wfuR0HIocS2FX5WMp2lCyZjggJjiudiK5frTy0T7Udha2M4ZKMFfGWXbg7cKjhhRHQaY9gKg0Cg9BWD+jI8k/PTTJzZYEcqi7jSY8XQXoHTcpEoBX0UDaaHdPhOyqPfzYNq2uePaXgSgi36RwU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788514973; c=relaxed/simple;
	bh=sS46chUozbP1V8GVI2K+vE7fpVTQ3RngQ6MbOjMZllQ=;
	h=Subject:From:To:Cc:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=GeQbTjRJoE4dLNNDNawEeVTsClcpJPLanSLOgjU7Ffo+TpvAOEqKsgQsQv3ne2tD5McbuBtHdHj/lLxlvhjWNDEBs9FoLF9QJrxnXdJ3NJO/z2HX7Z5xBWNSG7Ci+AdTUydCFzuGpgF2UCIvqH0EPoCpUiEI0ec+pcZj3ma2GiE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QncNJp4Y; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QncNJp4Y"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82EAC1F00A3E;
	Fri,  4 Sep 2026 09:42:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788514971;
	bh=h09D6vv1EI71tzCmcAb4hLGU8RdqRSCmlGYrzBOrxwE=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=QncNJp4Y3BpwjlZa0AQL1j+bZSHm5EqBWzjfJ2coknTFgC+Sz+duEWXYnI4N2lIXN
	 auJn+qVxj2r4ec9C7I7oOFQeg3G82VabdNM9oDFlX2LK+mw1Mo48hAaCdWiib/QtDB
	 OLdR6yygyHLqeXBw3BW7HZpnDoM0ZjbdQp+nHbxwjPFvm670tYWtHanSeea2mgcLsM
	 OUy87bAiHIaR39x0n0YwqSxsyzcBnvCdMpgsoglcy6QsMYAmlU8QNw78w4N9NY2t5j
	 7FjjvIWKBQZJXjlGBRBQiCx6LlZOdeEgYwhIW+udN3dIyg45XfNavzmVibO+EpAxd7
	 qPtVaNbNVib/Q==
Subject: Re: [PATCH net v3 8/9] net/sched: ets: clamp quantum in parse and
 fallback paths
From: netdev-bot+sashiko@kernel.org
To: jhs@mojatatu.com
Cc: netdev@vger.kernel.org, jiri@resnulli.us, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, horms@kernel.org,
 victor@mojatatu.com, vega@nebusec.ai, shuah@kernel.org,
 linux-kselftest@vger.kernel.org, toke@redhat.com
Date: Fri, 04 Sep 2026 09:42:50 +0000
Message-ID: <178851497008.4131868.6834762541956235085@kernel.org>
In-Reply-To: <QDISC-0CFC.v3.20260901204856@mojatatu.com.9>
References: <QDISC-0CFC.v3.20260901204856@mojatatu.com.9>
X-sashiko-severity: High
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Thank you for your contribution! Sashiko AI review found 5 potential
issue(s) to consider:

Critical: 0 · High: 1 · Medium: 3 · Low: 1

- [High] ets_quantum_parse() (net/sched/sch_ets.c:82-88) no longer
  validates user input at all: the explicit rejection of a zero quantum…
- [Medium] The clamping added to ets_quantum_parse() contradicts in-tree
  tdc test cases that are NOT updated anywhere in this series.
- [Medium] The commit message's "Conditions to recreate the bug" command,
  `tc qdisc add dev dummy0 root ets bands 3 strict 2 quanta 1 1`, cannot…
- [Medium] The changelog's causal premise — "With a crafted size table
  qdisc_pkt_len reaches ~2 GiB" — is stale for this tree.
- [Low] The comment introduced in ets_qdisc_change() states the fallback
  bands get a "quantum of max(MTU, 256)", but the code immediately below…

--

net/sched: ets: clamp quantum in parse and fallback paths

This moves the quantum floor from the psched_mtu() fallback in
ets_qdisc_change() into ets_quantum_parse(), so that both explicitly
configured quanta and the MTU-derived fallback are clamped to the range
[256, 1<<20].

A few questions about the changelog and about the parse path below.

> net/sched: ets: clamp quantum in parse and fallback paths
>
> ets_qdisc_change() falls back to psched_mtu() with no floor for bands
> without an explicit quantum. With a crafted size table qdisc_pkt_len
> reaches ~2 GiB, so a zero psched_mtu on a headerless device makes the
> deficit-refill loop spin under the qdisc lock.

[Severity: Medium]
Is the "~2 GiB" premise still accurate for this tree?  The baseline already
carries a 1 MiB cap on qdisc_pkt_len:

include/net/pkt_sched.h:
    #define QDISC_PKT_LEN_MAX	(1 << 20)	/* 1 MiB */

net/sched/sch_api.c:__qdisc_calculate_pkt_len() {
    ...
	pkt_len = clamp_t(int, pkt_len, 1, QDISC_PKT_LEN_MAX);
	qdisc_skb_cb(skb)->pkt_len = pkt_len;
}

with the comment there saying the value is capped so that deficit
schedulers such as DRR/ETS terminate their refill loops.

If qdisc_pkt_len cannot exceed 1 MiB, then the only non-terminating case
left in ets_qdisc_dequeue() is quantum == 0, where

	cl->deficit += READ_ONCE(cl->quantum);

never grows and the while (1) loop spins under the qdisc lock.  That case
comes purely from the unfloored psched_mtu() fallback on a device whose
MTU + hard_header_len is 0.  With the 1 MiB packet-length cap plus the new
floor of 256 the loop is bounded to 4096 refill passes, so the fix looks
adequate; could the changelog describe the actual current failure mode
instead?

> Conditions to recreate the bug:
>   CONFIG_NET_SCH_ETS=y. Requires CAP_NET_ADMIN (namespace-local via
>   unshare -Urn suffices).
>
>   tc qdisc add dev dummy0 root ets bands 3 strict 2 quanta 1 1

[Severity: Medium]
Does this command actually install a qdisc?  ets_qdisc_quanta_parse()
starts assignment at the first non-strict band:

net/sched/sch_ets.c:ets_qdisc_quanta_parse() {
	int band = nstrict;
    ...
		case TCA_ETS_QUANTA_BAND:
			if (band >= nbands) {
				NL_SET_ERR_MSG_MOD(extack, "ETS quanta has more values than bands");
				return -EINVAL;
			}
    ...
}

With bands 3 and strict 2, the first quantum lands in quanta[2] and band
becomes 3, so the second quantum hits band >= nbands and the whole add
fails with -EINVAL.  The tdc case fe3c (bands 4 strict 2 quanta 1000 2000
3000, expExitCode 1) encodes that same kernel-side rejection.

The quoted command also has neither of the two ingredients the message
says are needed: there is no size table (stab ...) to inflate
qdisc_pkt_len, and dummy0 has psched_mtu() of 1500 + 14 rather than 0.
Could a reproducer be given that reaches the psched_mtu() == 0 fallback,
so the Fixes: tag can be evaluated by stable backporters?

> diff --git a/net/sched/sch_ets.c b/net/sched/sch_ets.c
> index 25fcf4079fece..6cc902a038387 100644
> --- a/net/sched/sch_ets.c
> +++ b/net/sched/sch_ets.c
> @@ -83,11 +83,7 @@ static int ets_quantum_parse(struct Qdisc *sch, const struct nlattr *attr,
>  			     unsigned int *quantum,
>  			     struct netlink_ext_ack *extack)
>  {
> -	*quantum = nla_get_u32(attr);
> -	if (!*quantum) {
> -		NL_SET_ERR_MSG(extack, "ETS quantum cannot be zero");
> -		return -EINVAL;
> -	}
> +	*quantum = clamp_t(u32, nla_get_u32(attr), 256, 1 << 20);
>  	return 0;
>  }

[Severity: High]
Does this change user visible behaviour in two ways that the changelog
does not mention?  The changelog only says the floor is moved into
ets_quantum_parse().

First, the -EINVAL for a zero quantum disappears.  ets_quantum_parse() is
the sole validation point for TCA_ETS_QUANTA_BAND, reached from both
ets_qdisc_quanta_parse() and ets_class_change(), and it can no longer
fail:

	tc qdisc add ... ets quanta 1000 0 800 700
	tc class change ... ets quantum 0

Both used to return -EINVAL with an extack; now they succeed with quantum
silently set to 256.  The extack argument and the int return of
ets_quantum_parse() are both dead now, and the if (err) branch in
ets_class_change() is unreachable.

Second, a new 1 MiB ceiling is applied to explicitly configured quanta, so
quanta 4194304 1048576 (a 4:1 ratio) becomes 1:1, and quanta 1 1000000
becomes 256:1000000.  The installed band ratios and the weights handed to
hardware in ets_offload_change() then differ from what was asked for.

The mutated value is stored in cl->quantum and echoed back by
ets_qdisc_dump():

	if (nla_put_u32(skb, TCA_ETS_QUANTA_BAND,
			READ_ONCE(q->classes[band].quantum)))

so user space can only discover the change by re-reading and diffing its
own configuration.  The declared policies still advertise the full u32
range:

	static const struct nla_policy ets_quanta_policy[TCA_ETS_MAX + 1] = {
		[TCA_ETS_QUANTA_BAND] = { .type = NLA_U32 },
	};

Would it be better to follow the sibling patch in this series,
"net/sched: drr: clamp quantum in change class", which keeps the explicit
rejection and clamps afterwards?

net/sched/sch_drr.c:drr_change_class() {
    ...
		if (quantum == 0) {
			NL_SET_ERR_MSG(extack, "Specified DRR quantum cannot be zero");
			return -EINVAL;
		}
		quantum = clamp_t(u32, quantum, 256, 1 << 20);
    ...
}

Only the internal psched_mtu()-derived fallback needs the floor for
ets_qdisc_dequeue()'s refill loop to terminate.

[Severity: Medium]
Do two in-tree tdc cases still assert the removed rejection?  In
tools/testing/selftests/tc-testing/tc-tests/qdiscs/ets.json, case e51a
("Zero element in quanta"):

    "cmdUnderTest": "$TC qdisc add dev $DUMMY handle 1: root ets quanta 1000 0 800 700",
    "expExitCode": "1",
    "matchPattern": "qdisc ets",
    "matchCount": "0",

and case e7f2 ("Sole zero element in quanta"):

    "cmdUnderTest": "$TC qdisc add dev $DUMMY handle 1: root ets quanta 0",
    "expExitCode": "1",
    "matchPattern": "qdisc ets",
    "matchCount": "0",

After the clamp, 0 becomes 256, the add succeeds, tc exits 0 and the qdisc
is present, so both cases fail on expExitCode and on matchCount.  Exit
code 1 in this file is the kernel-rejection code (cf. f7c8 and fe3c),
versus 2 for tc-side rejection in 65b6 and 9877.

Diffing ets.json between this commit and the end of the series
(2ebfd9fc19fbc4d4615473751bf847fc57e820fa) shows only case 41f5 changed by
"selftests: tc-testing: update ETS test 41f5 for clamped quanta", so e51a
and e7f2 are still broken at the tip of the series.  Could they be updated
in the same series, or the zero rejection kept so they keep passing?

For completeness, the related 41f5 concern (the dump no longer echoing
quanta 4294967294 1 1) is resolved later in the series by that same
commit, which rewrites the pattern to "quanta 1048576 256 256".

>  
> @@ -632,11 +628,13 @@ static int ets_qdisc_change(struct Qdisc *sch, struct nlattr *opt,
>  			return err;
>  	}
>  	/* If there are more bands than strict + quanta provided, the remaining
> -	 * ones are ETS with quantum of MTU. Initialize the missing values here.
> +	 * ones are ETS with quantum of max(MTU, 256). Initialize the missing
> +	 * values here.
>  	 */
>  	for (i = nstrict; i < nbands; i++) {
>  		if (!quanta[i])
> -			quanta[i] = psched_mtu(qdisc_dev(sch));
> +			quanta[i] = clamp_t(u32, (u32)psched_mtu(qdisc_dev(sch)),
> +					    256, 1 << 20);
>  	}

[Severity: Low]
This isn't a bug, but the comment says max(MTU, 256) while the code below
it computes min(max(MTU, 256), 1 MiB).  The upper bound is missing from
the comment, so on a device where psched_mtu() exceeds 1 MiB the described
behaviour and the actual behaviour differ.

>  
>  	/* Before commit, make sure we can allocate all new qdiscs */

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/QDISC-0CFC.v3.20260901204856%40mojatatu.com
