Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96AAA450906;
	Fri,  4 Sep 2026 09:42:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788514969; cv=none; b=NRrxRpuVzoLLpuBruD1ysGvn7oAadW34PZCO16nIUUMY4iBmTV3e65MmbDrFuGazRADK4x/0Ai5QZTOuE5T+flLffCii5nt/mHFSRtQTvDisI/t9o9JTtnE3E5fI2Mibuu3Ah3RoXPe/CnCNMvZHlhcsCtyAEZ+S7rVso4tqOdM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788514969; c=relaxed/simple;
	bh=YvFgK4CHN7XP5y+daIkBthQSQZFK5diIFeV8txpjGLk=;
	h=Subject:From:To:Cc:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=WiT2LKXBg4JRmMhDP9aD4cZrZNKa/zsdB03UA4svdbZH2hlu77VYy8oT6vTB3JXa0aNuB7VgDa+QXbX7u9MokMIJZpYK/mYmnHZbjv34ggLSMYegEkr/j8TtSSdRv7DEAs1kIfsPPJOyGJV7tfbl0aP94r2ctzifq0NPRC9U1OU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Z/0ONNgE; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Z/0ONNgE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97EBA1F00A3D;
	Fri,  4 Sep 2026 09:42:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788514967;
	bh=YwGgVvLkm9aHYzQ3g97tGtR/hpTy6t/JISQUEjiRWFs=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=Z/0ONNgEJkxFlb6uG4M/SoIqN/RmmvXqHq6LE4QBkWUfJTwxNGDsJVx9826aPEwOC
	 2cesRWjh8/I+NnLRnDBm3C6MDAPc7FjJ1YKHvFK4H4Axz53ZyomeVcVbfABr/HjLue
	 NxSnn1Stj08CwenlTWYJn7BNaESxY1ews/gxuL/HJhosAzRAEctkX08R7K8JHwIBWp
	 hdRRrUeQvsmJ6ryq1UbTftBGOg7hAtJgRl/S5LwevN1xHb6MQ4JhDQWRRkVtZklp8Z
	 LN7RDbYORhQ5fE0RFnm0VnAtraU0RpFK9NV3jNKG5lQu5MP/j9B0w3m2PLVYXjzVS1
	 Qr5RIqaYgHzYg==
Subject:
 Re: [PATCH net v3 5/9] net/sched: dualpi2: clamp psched_mtu at all call sites
From: netdev-bot+sashiko@kernel.org
To: jhs@mojatatu.com
Cc: netdev@vger.kernel.org, jiri@resnulli.us, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, horms@kernel.org,
 victor@mojatatu.com, vega@nebusec.ai, shuah@kernel.org,
 linux-kselftest@vger.kernel.org, toke@redhat.com
Date: Fri, 04 Sep 2026 09:42:46 +0000
Message-ID: <178851496617.4131868.17637386620065749703@kernel.org>
In-Reply-To: <QDISC-0CFC.v3.20260901204856@mojatatu.com.6>
References: <QDISC-0CFC.v3.20260901204856@mojatatu.com.6>
X-sashiko-severity: Medium
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

Critical: 0 · High: 0 · Medium: 1 · Low: 1

- [Medium] Changelog/reproducer mismatch in "net/sched: dualpi2: clamp
  psched_mtu at all call sites": the commit message blames "a crafted…
- [Low] netdev coding-style violation and triplicated open-coded clamp.

--

net/sched: dualpi2: clamp psched_mtu at all call sites

The patch clamps psched_mtu(qdisc_dev(sch)) into [1, 1 << 20] at the three
places sch_dualpi2.c uses it: dualpi2_calculate_c_protection(), must_drop()
and get_memory_limit().  The stated goal is to avoid overflow of the signed
multiply for c_protection_init and the wrap of 2 * psched_mtu().

A couple of questions about the changelog and the style of the new code.

[Severity: Medium]

> With a crafted size table qdisc_pkt_len reaches ~2 GiB, causing a soft
> lockup / denial of service.
>
>   tc qdisc add dev dummy0 root dualpi2
>   tc qdisc change dev dummy0 root dualpi2 stab data 32768 size_log 15 cell_log 0

Do these two commands actually exercise any of the three changed lines?

The patch only bounds psched_mtu(), which is derived from the netdevice:

include/net/pkt_sched.h:
	static inline unsigned int psched_mtu(const struct net_device *dev)
	{
		return READ_ONCE(dev->mtu) + dev->hard_header_len;
	}

A TCA_STAB only rewrites qdisc_skb_cb(skb)->pkt_len in
__qdisc_calculate_pkt_len(), so a size table cannot influence
psched_mtu().  With the quoted commands dummy0 keeps its default MTU, so
dualpi2_calculate_c_protection(), must_drop() and get_memory_limit()
compute the same values before and after this patch.

Is the "~2 GiB" qdisc_pkt_len reachable on this tree at all?
__qdisc_calculate_pkt_len() already caps it, and that clamp is present in
the baseline too:

net/sched/sch_api.c:__qdisc_calculate_pkt_len() {
	...
	pkt_len = clamp_t(int, pkt_len, 1, QDISC_PKT_LEN_MAX);
	qdisc_skb_cb(skb)->pkt_len = pkt_len;
}

with include/net/pkt_sched.h:

	#define QDISC_PKT_LEN_MAX	(1 << 20)	/* 1 MiB */

Would it be more accurate to describe the trigger as a large device MTU?
dummy leaves the upper bound unset:

drivers/net/dummy.c:dummy_setup() {
	...
	dev->min_mtu = 0;
	dev->max_mtu = 0;
}

and dev_validate_mtu() only enforces an upper limit when dev->max_mtu > 0,
so "ip link set dev dummy0 mtu 2147483647" is what makes
(s32)psched_mtu() * ((int)wc - (int)wl) overflow.  Note that
TCA_DUALPI2_C_PROTECTION is range-limited to [0, MAX_WC] with MAX_WC 100,
so the signed multiply only overflows above roughly 21.5 MiB of MTU, and
2 * psched_mtu() only wraps above 2 GiB.

One more thing on scope: the size-table path the message mentions is left
untouched in this file.  dequeue_packet() still does

	*credit_change *= qdisc_pkt_len(skb);

and drop_and_retry() still accumulates

	q->deferred_drops_len += qdisc_pkt_len(skb);

Those are fine here because of the generic 1 MiB pkt_len cap, but the
Fixes: tag points at trees that may not carry that cap.  Should the
changelog say so?

> diff --git a/net/sched/sch_dualpi2.c b/net/sched/sch_dualpi2.c
> index 4f678d4ff10ec..4947def7c49ef 100644
> --- a/net/sched/sch_dualpi2.c
> +++ b/net/sched/sch_dualpi2.c

[ ... ]

> @@ -285,8 +287,9 @@ static bool must_drop(struct Qdisc *sch, struct dualpi2_sched_data *q,
>  	u64 local_l_prob;
>  	bool overload;
>  	u32 prob;
> +	u32 mtu = clamp_t(u32, psched_mtu(qdisc_dev(sch)), 1, 1 << 20);

[Severity: Low]
This isn't a bug, but the new declaration in must_drop() is the longest
line of the block and is placed last, which breaks the netdev declaration
ordering rule in Documentation/process/maintainer-netdev.rst ("Order the
variable declaration lines longest to shortest").  Moving the
initialization out of line, or reordering the block, would match the rule.

>  
> -	if (sch->qstats.backlog < 2 * psched_mtu(qdisc_dev(sch)))
> +	if (sch->qstats.backlog < 2 * mtu)
>  		return false;
>  
>  	prob = READ_ONCE(q->pi2_prob);

[ ... ]

> @@ -712,7 +715,8 @@ static u32 get_memory_limit(struct Qdisc *sch, u32 limit)
>  	/* Apply rule of thumb, i.e., doubling the packet length,
>  	 * to further include per packet overhead in memory_limit.
>  	 */
> -	u64 memlim = mul_u32_u32(limit, 2 * psched_mtu(qdisc_dev(sch)));
> +	u64 memlim = mul_u32_u32(limit, 2 * clamp_t(u32, psched_mtu(qdisc_dev(sch)),
> +						     1, 1 << 20));

Would a small helper, e.g. dualpi2_psched_mtu(sch), be preferable here?
The same clamp_t(u32, psched_mtu(qdisc_dev(sch)), 1, 1 << 20) expression is
now open-coded three times, including this line-wrapped copy inside
mul_u32_u32(), so the "at all call sites" property has to be re-checked by
hand for any future psched_mtu() user or bound change.

>  
>  	if (upper_32_bits(memlim))
>  		return U32_MAX;

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/QDISC-0CFC.v3.20260901204856%40mojatatu.com
