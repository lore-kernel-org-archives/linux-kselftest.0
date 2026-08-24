Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E092C27456;
	Mon, 24 Aug 2026 18:53:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787597620; cv=none; b=SbScY086Kl1ww4CF5l3KwnLSo8wmr7YP8JTktkC3MuXT3BVfWxlDObA8U3R8x1H8iJLTiluG8k3ru7t/93bWph7o13AMBJZ+tONFN7yNhKoG+cAF/277T19itt5b/t8qT42esbhsQ44ps75S3RrCM1avLONvhVTQijl9BwVvqQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787597620; c=relaxed/simple;
	bh=BiR7/qVp/z2VE1S9SoocQNgRe6gQRd2fgiOvN6n4UC8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lIcQB/lSAVmkL+NVU9qwldkAJ2HuxtUZWnU7zT2MlWdDqxdNmuXkr+xG/tpwgxSGewdbGCcCkK1aPaf/B9FqMBjKFatJDMttLa2T6kBg99lDpKPlwaE8Vdc3AEt3YSBq9rVvWZBuIxstNc74KVqDgkreuKl2AvTjAMakkcF7w2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cCV1sPzW; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cCV1sPzW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0227E1F00A3A;
	Mon, 24 Aug 2026 18:53:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787597618;
	bh=LFJWf9uqGFgfwnsZcbYGQPuDLmvvkucGOYiMuCwCdtQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=cCV1sPzWFkv+uE9coelNetagY0mCa9M/gGRgh5a9zLyz2wzsN+idLnbjZGCl/ro7h
	 Wl9DUvGBPdg46yKAmWCnWA2uy16BsjwSIDuMy5KYejtLNY/6FK7iN64qVrIuz+45ij
	 psGFl9P10MyznJhHC8soA7zkL3FbwAntSu20A+xFswTyOPNQu4yfCEKBfojQU8bsIU
	 UX6utyA+tXw7SCFBV3OACXzpxIY7MRSxrrS4qKe4mnvonGCIodtUO0R/U6a9g58Q5h
	 9nMWq5m6GXu7H564WaBNS3PqE9xsOPRYFmbdQSODAOduvSyelwahiz1fKfKleVFHt2
	 ysT7lNYntrJKg==
From: Jakub Kicinski <kuba@kernel.org>
To: junjie.cao@intel.com
Cc: Jakub Kicinski <kuba@kernel.org>,
	netdev@vger.kernel.org,
	davem@davemloft.net,
	edumazet@google.com,
	pabeni@redhat.com,
	horms@kernel.org,
	jhs@mojatatu.com,
	jiri@resnulli.us,
	vinicius.gomes@intel.com,
	shuah@kernel.org,
	bestswngs@gmail.com,
	uladzislau.zhauniarovich@gmail.com,
	hdanton@sina.com,
	syzbot+19d01f6082ec61dd45b2@syzkaller.appspotmail.com,
	syzbot+8785aaf121cfb2141e0d@syzkaller.appspotmail.com,
	syzbot+2642f347f7309b4880dc@syzkaller.appspotmail.com,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH net v2 2/3] net/sched: taprio: enforce a minimum interval for software schedules
Date: Mon, 24 Aug 2026 11:53:37 -0700
Message-ID: <20260824185337.2704003-1-kuba@kernel.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260820062715.278124-3-junjie.cao@intel.com>
References: <20260820062715.278124-3-junjie.cao@intel.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is an AI-generated review of your patch. The human sending this
email has considered the AI review valid, or at least plausible.
---
net/sched: taprio: enforce a minimum interval for software schedules

This adds taprio_min_interval() which raises the accepted minimum
per-entry interval to 100us for schedules that are neither fully
offloaded nor txtime-assisted, on the grounds that each entry expiry
costs an hrtimer callback. The same minimum is applied to the
cycle_time sanity check.

Link: https://lore.kernel.org/all/afe041f6-ef7d-4434-b2d0-096be49b5bcb@mail.kernel.org/

> diff --git a/net/sched/sch_taprio.c b/net/sched/sch_taprio.c
> index 0d566c934b2f3..91a7f7f17462b 100644
> --- a/net/sched/sch_taprio.c
> +++ b/net/sched/sch_taprio.c
> @@ -259,6 +259,26 @@ static int length_to_duration(struct taprio_sched *q, int len)
>  	return div_u64(len * atomic64_read(&q->picos_per_byte), PSEC_PER_NSEC);
>  }
>  
> +/* Software schedules service one hrtimer expiry per entry; intervals
> + * shorter than the expiry service cost rearm the timer with an expiry
> + * already in the past and storm the CPU. 100us leaves margin above the
> + * measured cost on debug configurations.
> + */
> +#define TAPRIO_MIN_SW_INTERVAL_NS	(100 * NSEC_PER_USEC)
> +
> +static s64 taprio_min_interval(struct taprio_sched *q)
> +{
> +	s64 min_interval = length_to_duration(q, ETH_ZLEN);
> +
> +	/* Only pure software schedules arm the per-entry hrtimer. */
> +	if (!FULL_OFFLOAD_IS_ENABLED(q->flags) &&
> +	    !TXTIME_ASSIST_IS_ENABLED(q->flags))
> +		min_interval = max_t(s64, min_interval,
> +				     TAPRIO_MIN_SW_INTERVAL_NS);
> +
> +	return min_interval;
> +}
> +

[Severity: High]
Does this narrow the range of schedules that userspace can install on
existing setups?

Before this patch, fill_sched_entry() only required
length_to_duration(q, ETH_ZLEN). At 1 Gb/s picos_per_byte is 8000, so the
bound was 60 * 8 = 480ns; at 100 Mb/s it was about 4.8us. With
taprio_min_interval() the bound for software mode becomes a flat 100000ns,
and parse_taprio_schedule() additionally requires:

	if (new->cycle_time < (s64)new->num_entries * taprio_min_interval(q)) {
		NL_SET_ERR_MSG(extack, "'cycle_time' is too small");
		return -EINVAL;
	}

So a 250us cycle split into 4 x 62.5us windows, or a 1ms cycle containing a
20us guard window, is now rejected with -EINVAL by tc qdisc add/replace on a
real NIC in software mode. Any 8-entry schedule with a cycle below 800us is
rejected as well.

The commit message says the hrtimer expiry costs "on the order of 10us on a
debug configuration and about a microsecond on a release build", yet the
constant is 100us for all configurations. Is a 100x margin over the
release-build cost intended as a hard limit on PREEMPT_RT and production
kernels, where sub-100us gating on isolated CPUs is the reason software
taprio exists?

Since the change carries a Fixes: tag it will be picked up for stable, so
working 802.1Qbv configurations would stop loading after a stable update.
Would it make sense to make the floor tunable (module parameter, sysctl or
netlink attribute) and document it, rather than a compile-time constant?

Was flooring the rearm interval at runtime in advance_sched() considered as
an alternative, so that the schedule is still accepted but the timer is not
rearmed in the past? As a mitigation for the reported stalls the constant is
also only a constant factor: a CAP_NET_ADMIN user in a netns can still
create many veth or bonding devices, each running a 100us cycle.

>  static int duration_to_length(struct taprio_sched *q, u64 duration)
>  {
>  	return div_u64(duration * PSEC_PER_NSEC, atomic64_read(&q->picos_per_byte));
> @@ -1088,7 +1108,7 @@ static int fill_sched_entry(struct taprio_sched *q, struct nlattr **tb,
>  			    struct sched_entry *entry,
>  			    struct netlink_ext_ack *extack)
>  {
> -	int min_duration = length_to_duration(q, ETH_ZLEN);
> +	s64 min_duration = taprio_min_interval(q);
>  	u32 interval = 0;
>  

[Severity: Low]
This isn't a bug, but the comment and the extack string further down in
fill_sched_entry() no longer describe what is enforced:

	/* The interval should allow at least the minimum ethernet
	 * frame to go out.
	 */
	if (interval < min_duration) {
		NL_SET_ERR_MSG(extack, "Invalid interval for schedule entry");
		return -EINVAL;
	}

For any link at 1 Gb/s or faster the ETH_ZLEN term is a few hundred
nanoseconds, so the frame-length rule the comment names never wins and the
rule actually applied is the 100us hrtimer-cost floor documented only at the
taprio_min_interval() definition. Could the comment be updated, and could
the extack message mention the minimum so a user whose 5us interval is
rejected after an upgrade can tell why?

>  	if (tb[TCA_TAPRIO_SCHED_ENTRY_CMD])
> @@ -1216,7 +1236,7 @@ static int parse_taprio_schedule(struct taprio_sched *q, struct nlattr **tb,
>  		new->cycle_time = cycle;
>  	}
>  
> -	if (new->cycle_time < new->num_entries * length_to_duration(q, ETH_ZLEN)) {
> +	if (new->cycle_time < (s64)new->num_entries * taprio_min_interval(q)) {
>  		NL_SET_ERR_MSG(extack, "'cycle_time' is too small");
>  		return -EINVAL;
>  	}
