Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A8B7450906;
	Fri,  4 Sep 2026 09:42:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788514971; cv=none; b=Sua35fnhB6RegPQjWUcV53/zuk9yTWekZ0CouYE+cADNYoUhIRvyXnIXGlLmfaWBaXRx79lVF5z63SQTFVk2KE5L42WziiI9gtnP7FwubkUB3f/JIw0Xhu9oq79g1Fw2yoWdjwEqirtM3z6ny3jKyAZ2JdNhnctSs8WyiICCsr4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788514971; c=relaxed/simple;
	bh=DiyzrhOEe+Y2J2RomX+PHtvbModkvj1m1hWIvO909aw=;
	h=Subject:From:To:Cc:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=jAZtbwThR61qJ+hPbPBYFXtU4me6Nj9/5yPUuo0CjPSsgRMk4e71EHpVddFuzxhYdoAmuvV5RHIHCIsOjxoU2YyQ1yZmJk3Qac9faTbtbkQ8c7A5piksUzD7HSH0GzT/3WgpxWOHRZA4w/mIgIGmg+BXsPLvCXuWDHsalrfzO/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F0hI75m3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F0hI75m3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A2551F00A3D;
	Fri,  4 Sep 2026 09:42:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788514969;
	bh=RRkn4+N80NrusinoQblB8ee/mB7YhAndfjhMY2DyOVs=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=F0hI75m3BwOR9un7w/uFYRBmyqaFKqR0LnXeAO48D9IzQWgrRxRCxhafc4Q/2D0VJ
	 A9qyO3/hX6NBjMOMT2diwcmGATZ/+yRaomAWYFyeSdXmR7ccufZJT37jYhuZc6w+qC
	 Db71UBnmbpt+hJW05nW/wx7UCWdZyQqExBMkuWDEGgLcrj8B5hSvpWGcXZc6EP6+1G
	 juCqYvtY+DerTgHGxNHA6CWrRl6dMWAohxIMrPFRktyPkromzVHI63R4aS+xOErpR1
	 GxC3LBNIvMC7rV6TSJi0qybsN91XxErY8WxfUAapURgrf1DEHOQfYW/i0Ragg4LdMp
	 EPeIwj4TKvYrQ==
Subject: Re: [PATCH net v3 7/9] net/sched: drr: clamp quantum in change class
From: netdev-bot+sashiko@kernel.org
To: jhs@mojatatu.com
Cc: netdev@vger.kernel.org, jiri@resnulli.us, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, horms@kernel.org,
 victor@mojatatu.com, vega@nebusec.ai, shuah@kernel.org,
 linux-kselftest@vger.kernel.org, toke@redhat.com
Date: Fri, 04 Sep 2026 09:42:48 +0000
Message-ID: <178851496878.4131868.2069895170229482350@kernel.org>
In-Reply-To: <QDISC-0CFC.v3.20260901204856@mojatatu.com.8>
References: <QDISC-0CFC.v3.20260901204856@mojatatu.com.8>
X-sashiko-severity: High
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Thank you for your contribution! Sashiko AI review found 2 potential
issue(s) to consider:

Critical: 0 · High: 1 · Medium: 1 · Low: 0

- [High] net/sched/sch_drr.c:85 and :87 (drr_change_class) silently
  rewrite an administrator-supplied TCA_DRR_QUANTUM instead of honouring…
- [Medium] Commit message premise and reproduction recipe do not match
  the tree the patch applies to, and an undeclared stable-backport…

--

net/sched: drr: clamp quantum in change class

This adds a clamp_t(u32, quantum, 256, 1 << 20) in drr_change_class(),
applied both to an explicitly supplied TCA_DRR_QUANTUM and to the
psched_mtu() fallback, so that the deficit-refill loop in drr_dequeue()
cannot iterate on a very small quantum.  The existing rejection of an
explicit quantum of zero is kept.

Two questions below, one about the changelog and one about the new
clamping behaviour.

> drr_change_class() rejects explicit quantum==0 but falls back to
> psched_mtu() with no floor. With a crafted size table qdisc_pkt_len
> reaches ~2 GiB, so quantum=1 (or a zero psched_mtu on a headerless
> device) makes the deficit-refill loop spin under the qdisc lock.

[Severity: Medium]

Is the "~2 GiB" figure still accurate for this tree?  The baseline
already ends __qdisc_calculate_pkt_len() in net/sched/sch_api.c with:

	/* A size table can inflate qdisc_pkt_len() beyond any real packet
	 * (via overhead, the data table, or size_log); cap it so deficit
	 * schedulers such as DRR/ETS terminate their refill loops.
	 */
	pkt_len = clamp_t(int, pkt_len, 1, QDISC_PKT_LEN_MAX);
	qdisc_skb_cb(skb)->pkt_len = pkt_len;

with QDISC_PKT_LEN_MAX defined as (1 << 20) in include/net/pkt_sched.h.

Since drr_dequeue() advances the deficit by one quantum per round:

	WRITE_ONCE(cl->deficit, cl->deficit + READ_ONCE(cl->quantum));

wouldn't the worst case with quantum=1 be around 1M rounds rather than
~2^31?  The loop bound seems tied to that packet-length cap, not to a
2 GiB length.

Related to that, the recipe given:

>   tc qdisc add dev dummy0 root drr
>   tc class add dev dummy0 parent 1: classid 1:1 drr quantum 1

installs no size table and sends no traffic, so it does not appear to
exercise the refill loop at all.  Could the reproducer be extended to
include the size table and a transmit step?

There is also a backport angle.  With the new floor at 256 the effective
iteration bound (~4096 rounds) comes from QDISC_PKT_LEN_MAX rather than
from this change.  Trees matching "Fixes: 13d2a1d2b032" have no such cap,
so this hunk on its own still allows roughly 8.4M refill iterations per
dequeue there.  Should the QDISC_PKT_LEN_MAX commit be named as a
backport prerequisite?

> diff --git a/net/sched/sch_drr.c b/net/sched/sch_drr.c
> index 91b1ef824afaf..8621d057edd9f 100644
> --- a/net/sched/sch_drr.c
> +++ b/net/sched/sch_drr.c
> @@ -82,8 +82,9 @@ static int drr_change_class(struct Qdisc *sch, u32 classid, u32 parentid,
>  			NL_SET_ERR_MSG(extack, "Specified DRR quantum cannot be zero");
>  			return -EINVAL;
>  		}
> +		quantum = clamp_t(u32, quantum, 256, 1 << 20);

[Severity: High]

Should an out-of-range quantum be rewritten rather than rejected here?
Only the exact value 0 returns -EINVAL; every other value now falls
through this clamp and is committed, either via the existing-class path
in drr_change_class():

		if (tb[TCA_DRR_QUANTUM])
			WRITE_ONCE(cl->quantum, quantum);

or via cl->quantum = quantum on the create path.  Netlink then returns
success for a configuration that was not applied.

Does this create a set/get asymmetry?  drr_dump_class() reports the
stored value:

	if (nla_put_u32(skb, TCA_DRR_QUANTUM, READ_ONCE(cl->quantum)))

so "tc class add ... drr quantum 1" succeeds and reads back 256.

Does this also change service ratios silently?  drr_dequeue() refills by
cl->quantum each round, so relative shares are the ratio of class
quanta.  A 10:100 weighting would become 256:256, and 4 MiB:1 MiB would
become 1 MiB:1 MiB, on any later "tc class change ... quantum <n>"
against a class that worked before.

The declared policy still advertises the whole u32 range:

	[TCA_DRR_QUANTUM]	= { .type = NLA_U32 },

The sibling implementation of the same bounded-quantum idea rejects
instead of mutating, in net/sched/sch_qfq.c:

	static const struct netlink_range_validation lmax_range = {
		.min = QFQ_MIN_LMAX,
		.max = QFQ_MAX_LMAX,
	};

	static const struct nla_policy qfq_policy[TCA_QFQ_MAX + 1] = {
		[TCA_QFQ_WEIGHT] = NLA_POLICY_RANGE(NLA_U32, 1, QFQ_MAX_WEIGHT),
		[TCA_QFQ_LMAX] = NLA_POLICY_FULL_RANGE(NLA_U32, &lmax_range),
	};

and the sfq patch in this same series rejects the identical upper bound
in sfq_change():

	if (ctl->quantum > 1 << 20) {
		NL_SET_ERR_MSG_MOD(extack, "quantum too large");
		return -EINVAL;
	}

Would a declared NLA_POLICY_FULL_RANGE (or an explicit -EINVAL plus
extack) be preferable, which would also subsume the zero check?

One more on the upper bound: a quantum larger than qdisc_pkt_len() cannot
add refill rounds, so the 1 << 20 maximum does not seem related to the
loop described in the changelog.  Is the narrowing of the accepted range
intentional, and if so should it be spelled out in the commit message?
The message currently reads:

> Add clamp_t(u32, quantum, 256, 1<<20) after the zero reject and on the
> fallback path. The explicit-zero reject is preserved.

which reads as a hardening change with no behaviour change, and does not
mention that previously accepted values are now altered.  That seems
worth stating given the Fixes: tag implies a stable backport.

>  	} else
> -		quantum = psched_mtu(qdisc_dev(sch));
> +		quantum = clamp_t(u32, (u32)psched_mtu(qdisc_dev(sch)), 256, 1 << 20);
>  
>  	if (cl != NULL) {
>  		if (tca[TCA_RATE]) {

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/QDISC-0CFC.v3.20260901204856%40mojatatu.com
