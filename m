Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 647D844E64E;
	Fri,  4 Sep 2026 09:42:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788514967; cv=none; b=kVX4MLPMS6f1A0S0HyAkRRlpWqpvVIjmQSDhGFJcoGwCYZk6jlzRwdNrbBCQi6IBi0I2N90iS0PNIhllDuxIiDfeCG54honxXSpzoHAWc6Na5QcmTmgxFQWCAUP+HeCDGUbtxuAI5Gk7gxmSBqWbQsZeYcHV1nr+bjfTmJdh7Wc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788514967; c=relaxed/simple;
	bh=uZNLDdxKLwL9RTvGlzPrX4DJOdQ5ZPct7U25z7oH2vY=;
	h=Subject:From:To:Cc:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ZQWoltJltuH8SPPiUeyMoiWUtYePTlnFf5E3wTwQgyQ6+YPUjd5pGVFJd6BHOaVTIC1VWDOHIoiLMgWGRJYeBn6wcW2vyjNJOqeAbLwiQ4v0yvY1n7syUfLifXUiXM6opEmbzpUvsKzjJkv5t6NJN9KX/G8wm+Rs2GamTTxdYIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=C4uWh6eE; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="C4uWh6eE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5CE801F00A3F;
	Fri,  4 Sep 2026 09:42:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788514966;
	bh=k35asUOrS0AttkB9YIVN9xSPG/Vk7FdW5qKbQFpP8ag=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=C4uWh6eECX9BVrg68P+Ms/oJh5A2V59i5P8xlY71QVG5UHUWlVstZ5UXF0Q/a+kZK
	 23WLgiWrGDP+Dc/QfcIjXr7G2Opo40cUmTlFVT5NN319OAF93GXNSRPWosn49KAlLN
	 3wchKvb1MV+wqxW4oJA80gJ4JBkgwaQ2AN8IokWPzBJPeH1+BlGPVNbtGy+NJI3WbZ
	 k4YtZnqhwCFd8hUnh8ZhXlmZC9R8ofpiTNojGulBimEo2zAy7A2vT8IyCv8XoGeeF+
	 svdf5EAZQXHNw7TZ7sKJgJbULXmbVXlPzG0DAg2nMSmeliS3QJ01j5faoD0lYF879U
	 1Io9OcV51HkKQ==
Subject:
 Re: [PATCH net v3 4/9] net/sched: hhf: clamp quantum in change and init paths
From: netdev-bot+sashiko@kernel.org
To: jhs@mojatatu.com
Cc: netdev@vger.kernel.org, jiri@resnulli.us, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, horms@kernel.org,
 victor@mojatatu.com, vega@nebusec.ai, shuah@kernel.org,
 linux-kselftest@vger.kernel.org, toke@redhat.com
Date: Fri, 04 Sep 2026 09:42:44 +0000
Message-ID: <178851496497.4131868.4506740406009637307@kernel.org>
In-Reply-To: <QDISC-0CFC.v3.20260901204856@mojatatu.com.5>
References: <QDISC-0CFC.v3.20260901204856@mojatatu.com.5>
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

Critical: 0 · High: 0 · Medium: 1 (1) · Low: 0

- [Medium] The changelog's justification is stale on the tree this patch
  applies to.

Pre-existing issues:
- [Medium] A TCA_HHF_HH_FLOWS_LIMIT value supplied at qdisc creation time
  is silently discarded.

--

net/sched: hhf: clamp quantum in change and init paths

This adds a 256 byte floor to the quantum accepted from userspace in
hhf_change(), clamps the quantum derived from the device MTU in hhf_init()
to [256, 1<<20], and drops the old overflow fallback that set quantum to
256.

Two questions below, one about the changelog and one about a pre-existing
detail in hhf_init().

>     hhf_change() accepts any quantum from userspace, including 1. With a
>     crafted size table qdisc_pkt_len reaches ~2 GiB, so quantum=1 makes
>     the deficit-refill loop spin ~2^31 times under the qdisc lock
>     (a soft lockup / denial of service).
>     ...
>       tc qdisc add dev dummy0 root hhf
>       tc qdisc change dev dummy0 root hhf quantum 1 stab data 32768 size_log 15 cell_log 0
>
>     Fixes: 10239edf86f1 ("net-qdisc-hhf: Heavy-Hitter Filter (HHF) qdisc")

[Severity: Medium]
Is the ~2 GiB / ~2^31 figure still accurate on this tree?

__qdisc_calculate_pkt_len() in net/sched/sch_api.c already ends with:

	/* A size table can inflate qdisc_pkt_len() beyond any real packet
	 * (via overhead, the data table, or size_log); cap it so deficit
	 * schedulers such as DRR/ETS terminate their refill loops.
	 */
	pkt_len = clamp_t(int, pkt_len, 1, QDISC_PKT_LEN_MAX);

with QDISC_PKT_LEN_MAX defined as (1 << 20) in include/net/pkt_sched.h.
That cap is present in the baseline, added by 8f735d64382d ("net/sched:
bound qdisc_pkt_len to prevent qdisc soft lockup").

With that clamp, the quoted reproducer (32768 << 15, i.e. 2^30) yields a
pkt_len of 2^20, so the refill loop in hhf_dequeue():

		if (bucket->deficit <= 0) {
			int weight = (bucket - q->buckets == WDRR_BUCKET_FOR_HH) ?
				      1 : q->hhf_non_hh_weight;

			bucket->deficit += weight * q->quantum;

is bounded to roughly 2^20 iterations with quantum=1, not 2^31. The
changelog of 8f735d64382d itself describes 1M iterations as completing in
a few milliseconds.

Could the changelog be reworded so it describes the bound that actually
applies here, and mention 8f735d64382d as the commit that closes the
soft-lockup case? Without that dependency noted, a stable backport of this
patch alone onto a tree lacking the pkt_len cap still leaves roughly
2 GiB / 256 refill iterations under the qdisc lock.

> diff --git a/net/sched/sch_hhf.c b/net/sched/sch_hhf.c
> index 96acab6a8da03..fc72f825fbd92 100644
> --- a/net/sched/sch_hhf.c
> +++ b/net/sched/sch_hhf.c
> @@ -551,7 +551,7 @@ static int hhf_change(struct Qdisc *sch, struct nlattr *opt,
>  		return err;
>  
>  	if (tb[TCA_HHF_QUANTUM])
> -		new_quantum = nla_get_u32(tb[TCA_HHF_QUANTUM]);
> +		new_quantum = max(256U, nla_get_u32(tb[TCA_HHF_QUANTUM]));
>  
>  	if (tb[TCA_HHF_NON_HH_WEIGHT])
>  		new_hhf_non_hh_weight = nla_get_u32(tb[TCA_HHF_NON_HH_WEIGHT]);

[ ... ]

> @@ -624,10 +624,6 @@ static int hhf_init(struct Qdisc *sch, struct nlattr *opt,
>  	q->hhf_evict_timeout = HZ;      /* 1  sec */
>  	q->hhf_non_hh_weight = 2;
>  
> -	if ((int)q->quantum <= 0 ||
> -	    (u64)q->quantum * q->hhf_non_hh_weight > INT_MAX)
> -		q->quantum = 256;
> -
>  	if (opt) {
>  		int err = hhf_change(sch, opt, extack);
>  

[Severity: Medium]
This is a pre-existing issue and not something this patch introduces, but
while looking at the ordering in hhf_init() around this hhf_change() call:
is a TCA_HHF_HH_FLOWS_LIMIT value passed at creation time dropped?

hhf_change() stores it:

	if (tb[TCA_HHF_HH_FLOWS_LIMIT])
		WRITE_ONCE(q->hh_flows_limit,
			   nla_get_u32(tb[TCA_HHF_HH_FLOWS_LIMIT]));

but on a fresh qdisc q->hh_flows is NULL, so hhf_init() then enters the
allocation branch which overwrites the same field:

		/* Cap max active HHs at twice len of hh_flows table. */
		q->hh_flows_limit = 2 * HH_FLOWS_CNT;

So tc qdisc add dev X root hhf hh_limit N appears to be ignored, while the
same option via tc qdisc change on an already initialised qdisc takes
effect. That field gates admission in hhf_get_flow():

	if (q->hh_flows_current_cnt >= q->hh_flows_limit) {

Would it make sense to only apply the default when the attribute was not
supplied?

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/QDISC-0CFC.v3.20260901204856%40mojatatu.com
