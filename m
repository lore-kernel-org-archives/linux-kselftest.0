Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE54A4503EB;
	Fri,  4 Sep 2026 09:42:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788514969; cv=none; b=fS3F8MwbvUxjNn0CVFUywgPnCcoGjeqMt5mAt2kEJOpcNS+z7+Cub2MiYXEaF18marCY2rKuXYcG4nh3ahyHKaLNy8g7eCl/25pQPZMtOk6EbFrnLiTtngd0e7PmmlVGWYG4NPQFkXmmqlw/hzeVui+j0r2rD9I1wtfP0s/L+oY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788514969; c=relaxed/simple;
	bh=OYcjxb5pdSLwsdBF7nwj06n41YLKOlE53+KpV3mei2Q=;
	h=Subject:From:To:Cc:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=EVgelvIFRHBQekW9ZTE8LDrtFzTjhWcou8dkRoybZP6h3MIztcuhVGJoI3/9geuBrCjVJfxhW2h8yJEdLcO61uImztc3mw/zZaM6m9aWC5lLXlZxLoCp66it1tTgzVM7R5ZZj25nt3EvbSGk6+ikFSqha8heMJBlC1AQQl8RWAE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FCW6h3Zo; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FCW6h3Zo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E46701F00A3E;
	Fri,  4 Sep 2026 09:42:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788514968;
	bh=88EYUIu9clgWW4TE2RbXJ0pGJ7mM44ke71Aoddbe2lk=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=FCW6h3ZoO1C6I9lMjp4IbRphc4WWuA0Udvw0BS39ANM001nAC4f9bx3eWH+RxLdQj
	 rGrOI1WkZQ19jX8mVR8VM4vFay7+mQBifYCDjG7jZpgkpt/W1xFX1EooyggML6/GmV
	 09k/9NLLYXj2eeBsFtdvQ9fXi5Jfl8c8NxU/LaEVvlr/4glcrYKsaFQWNwQHXqgbbj
	 1cB7IHbC35GRatTzzE3YZo2zKfcfMjSkhnjY28otdWflAu4hB+6OHEv+m/f14JFSh5
	 OfQEJKlcu/NAhLr53C+Vv+JmEMzxcG35NzVMh0JK0KUyueWyNkeete7WkbfcA0Jdoq
	 gyjACahdAohUw==
Subject:
 Re: [PATCH net v3 6/9] net/sched: pie: clamp psched_mtu in pie_drop_early
From: netdev-bot+sashiko@kernel.org
To: jhs@mojatatu.com
Cc: netdev@vger.kernel.org, jiri@resnulli.us, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, horms@kernel.org,
 victor@mojatatu.com, vega@nebusec.ai, shuah@kernel.org,
 linux-kselftest@vger.kernel.org, toke@redhat.com
Date: Fri, 04 Sep 2026 09:42:47 +0000
Message-ID: <178851496747.4131868.17944512399699900309@kernel.org>
In-Reply-To: <QDISC-0CFC.v3.20260901204856@mojatatu.com.7>
References: <QDISC-0CFC.v3.20260901204856@mojatatu.com.7>
X-sashiko-severity: Medium
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Thank you for your contribution! Sashiko AI review found 1 potential
issue(s) to consider:

Critical: 0 · High: 0 · Medium: 1 · Low: 0

- [Medium] The commit message's "Conditions to recreate the bug" section
  does not reproduce the described bug.

--

net/sched: pie: clamp psched_mtu in pie_drop_early

The patch clamps the value returned by psched_mtu() in pie_drop_early() to
the range [1, 1<<20], with the stated aim of preventing a very large device
MTU from zeroing the bytemode drop probability. The change itself is a
one-line clamp_t() in net/sched/sch_pie.c.

>     pie_drop_early() calls psched_mtu() with no clamp. With mtu=0x80000000
>     the bytemode divide silently zeroes the drop probability, disabling AQM.
>     Clamp to [1, 1<<20].
>
>     Conditions to recreate the bug:
>       CONFIG_NET_SCH_PIE=y. Requires CAP_NET_ADMIN (namespace-local via
>       unshare -Urn suffices).
>
>       tc qdisc add dev dummy0 root pie
>       tc qdisc change dev dummy0 root pie stab data 32768 size_log 15 cell_log 0

[Severity: Medium]
Do these two commands actually reproduce the described condition?

The clamped quantity comes only from the netdevice:

include/net/pkt_sched.h:psched_mtu() {
	return READ_ONCE(dev->mtu) + dev->hard_header_len;
}

Neither "tc qdisc add ... root pie" nor "tc qdisc change ... stab data 32768
size_log 15 cell_log 0" changes dev->mtu or dev->hard_header_len, so dummy0
keeps its ether_setup() defaults of 1500 + 14 = 1514.  That is already inside
[1, 1<<20], so clamp_t() returns the same value and the reproducer sees no
difference before or after the patch.  Shouldn't the steps include something
like "ip link set dev dummy0 mtu 2147483634" (which dummy allows, since
dummy_setup() leaves dev->min_mtu = 0 and dev->max_mtu = 0)?

Also, does the size table have any bearing here?  A TCA_STAB table only
affects qdisc_skb_cb(skb)->pkt_len via __qdisc_calculate_pkt_len(), which is
already capped:

net/sched/sch_api.c:__qdisc_calculate_pkt_len() {
	...
	pkt_len = clamp_t(int, pkt_len, 1, QDISC_PKT_LEN_MAX);
	...
}

and pie_qdisc_enqueue() does not use it as packet_size:

net/sched/sch_pie.c:pie_qdisc_enqueue() {
	...
	if (!pie_drop_early(sch, &q->params, &q->vars, sch->qstats.backlog,
			    skb->len)) {
	...
}

Finally, the divide the message blames is gated on bytemode:

net/sched/sch_pie.c:pie_drop_early() {
	...
	if (params->bytemode && packet_size <= mtu)
		local_prob = (u64)packet_size * div_u64(local_prob, mtu);
	...
}

and bytemode is off by default:

include/net/pie.h:pie_params_init() {
	...
	params->bytemode = false;
	...
}

Since the listed commands never pass bytemode, is that branch ever reached in
the reproducer?  Could the "Conditions to recreate the bug" section be updated
to raise the MTU and enable bytemode, so that the Tested-by tag corresponds to
a sequence that exercises the clamped value and the divide?

>  {
>  	u64 rnd;
>  	u64 local_prob = vars->prob;
> -	u32 mtu = psched_mtu(qdisc_dev(sch));
> +	u32 mtu = clamp_t(u32, psched_mtu(qdisc_dev(sch)), 1, 1 << 20);

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/QDISC-0CFC.v3.20260901204856%40mojatatu.com
