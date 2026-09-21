Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8563038B7DD;
	Mon, 21 Sep 2026 20:43:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790023414; cv=none; b=bdoR5jGNU4PXBEhdDq00JuoJP6X1b85EW8xk2Mkhf2ui2kH2y5iyscl/zQY9FzOhrH2wZ47lKlvC49JNcTesJqGGO1HHJ7iCo0UByrRmMgEtwHAZcKgtCsNsrnqZ97JttZIMbbhdN8kYbSgxEfnFQd6Ps3RcQo6GbczxgPpvn44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790023414; c=relaxed/simple;
	bh=3fFQQN6o6m4HWxTZ2sl8r4/MT/MqmNk8A/zyOMOiB5o=;
	h=Subject:From:To:Cc:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=NgplpgmOyUn7dUTpTBwNEuYpUOPoY6uza3IT9ulJDDnbVzBIhCR4TeWN/kNjwmxJAMffVultNhcULlc2aDZvICzEyCAT7aPqKCvjmo8ksSDjjSxi3p0Iz6OMxpZioNtg2WTfVfhf5Gk2r8cr9fG15YqgliTYDFIbFO6qtBWByp8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Q6haGyOa; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Q6haGyOa"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A88FD1F00898;
	Mon, 21 Sep 2026 20:43:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790023411;
	bh=pS99QdqXM9fD9Yde8MA8sDCriuJMW4gQvlk5TvA48Sw=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=Q6haGyOarywvUNL+X7Y2ad6c8G9kW20U93aNKiaYp++rcs/pFd2LoLq1Z1UJrpzei
	 FEpWjQWxA1Ww83RkP0YZ9RE4/WE6F5qgi69lXNbb2RqwlKpoVH6SqqpT3ExFwc2oTe
	 KZl2YuPLK2qTJt+2olg2Tee0MT3JVaxdbFzS/jjxbMDWFfzM2tt8C//kxSyWLcBYSK
	 OHb3UUkQWySquZtitIGzMEQfk6CSTnZ5K4TMSWu/w1pNfyVh9m/jMbGp8LKaV3Q+x6
	 1V7c+fTOpzj2wAvz9Fb66lf+Cpangwh2wHTvHxlZf0qw9umhPFncfqeoXT+O06Qjmx
	 wNlkRQwJNlasg==
Subject: Re: [PATCH net-next v6 3/3] net/sched: pie: correct tc_pie_xstats
 field documentation
From: netdev-bot+sashiko@kernel.org
To: hemendranaik@gmail.com
Cc: netdev@vger.kernel.org, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, horms@kernel.org, jiri@resnulli.us,
 jhs@mojatatu.com, shuah@kernel.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, vishy0777@gmail.com, tahiliani@nitk.edu.in
Date: Mon, 21 Sep 2026 20:43:30 +0000
Message-ID: <179002341024.2160803.17066887333412185241@kernel.org>
In-Reply-To: <20260917204225.275251-4-hemendranaik@gmail.com>
References: <20260917204225.275251-4-hemendranaik@gmail.com>
X-sashiko-severity: Medium
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Thank you for your contribution! Sashiko AI review found 3 potential
issue(s) to consider.

Critical: 0 · High: 0 · Medium: 2 · Low: 1

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] The patch now documents tc_pie_xstats.avg_dq_rate
  unconditionally as "bytes/second", but pie_dump_stats()…
- [Medium] The patch now documents tc_pie_xstats.delay as "current delay
  in microseconds" with no range caveat, but pie_dump_stats()…
- [Low] Missing `Fixes:` tag.

--

net/sched: pie: correct tc_pie_xstats field documentation

This updates the comments on struct tc_pie_xstats so the documented units
for the delay and avg_dq_rate fields match what pie_dump_stats() actually
exports.  It is described as documentation-only, touching
include/uapi/linux/pkt_sched.h alone.

A few questions about the newly documented contract below.

> diff --git a/include/uapi/linux/pkt_sched.h b/include/uapi/linux/pkt_sched.h
> index 9c0c9787f0c32..969fa30efae7f 100644
> --- a/include/uapi/linux/pkt_sched.h
> +++ b/include/uapi/linux/pkt_sched.h
> @@ -920,9 +920,9 @@ enum {
>  
>  struct tc_pie_xstats {
>  	__u64 prob;			/* current probability */
> -	__u32 delay;			/* current delay in ms */
> +	__u32 delay;			/* current delay in microseconds */

[Severity: Medium]
Is the microsecond description accurate for all values the kernel can
report here?  pie_dump_stats() in net/sched/sch_pie.c truncates the
nanosecond value to u32 before dividing:

net/sched/sch_pie.c:pie_dump_stats() {
	struct tc_pie_xstats st = {
		.prob		= READ_ONCE(q->vars.prob) << BITS_PER_BYTE,
		.delay		= ((u32)PSCHED_TICKS2NS(READ_ONCE(q->vars.qdelay))) /
				   NSEC_PER_USEC,
	...
}

PSCHED_TICKS2NS() in include/net/pkt_sched.h is:

#define PSCHED_TICKS2NS(x)		((s64)(x) << PSCHED_SHIFT)

so the (u32) cast discards the high bits, and a qdelay above roughly
4.295 s wraps modulo 2^32 ns.  A 5 s sojourn time would be reported as
(5e9 mod 2^32) / 1000 = 705032 us rather than 5000000 us, even though the
__u32 field can hold up to about 4294 s.  Delays in that range look
reachable with a large user-settable TCA_PIE_LIMIT or in ECN mode on a
low-rate link.

The peer producer of the identically documented field does the division on
the full 64-bit value:

net/sched/sch_fq_pie.c:fq_pie_dump_class_stats() {
	...
		xstats.class_stats.delay =
			div_u64(PSCHED_TICKS2NS(READ_ONCE(flow->vars.qdelay)),
				NSEC_PER_USEC);
	...
}

The preceding patch in this series, "net/sched: sch_fq_pie: add per-flow
statistics via class ops", calls out this same truncation ("which wrapped
for sojourn times above ~4.295 s") and fixes it only in sch_fq_pie.c.

Would it make sense to convert sch_pie.c to div_u64() in the same series so
the two ABI producers agree with the comment being added here?

>  	__u32 avg_dq_rate;		/* current average dq_rate in
> -					 * bits/pie_time
> +					 * bytes/second
>  					 */

[Severity: Medium]
Does the bytes/second wording hold on 32-bit kernels?  pie_dump_stats()
does the scaling without widening:

net/sched/sch_pie.c:pie_dump_stats() {
	...
	/* unscale and return dq_rate in bytes per sec */
	if (st.dq_rate_estimating)
		st.avg_dq_rate = READ_ONCE(q->vars.avg_dq_rate) *
				 (PSCHED_TICKS_PER_SEC) >> PIE_SCALE;
	...
}

q->vars.avg_dq_rate is u32 (include/net/pie.h) and PSCHED_TICKS_PER_SEC is

#define PSCHED_TICKS_PER_SEC		PSCHED_NS2TICKS(NSEC_PER_SEC)

which is 15625000 of type long.  On ILP32 both operands stay 32-bit, so the
product wraps once avg_dq_rate exceeds 4294967295 / 15625000, about 274,
i.e. a real drain rate above roughly 16.8 MB/s.  With an internal
avg_dq_rate of 512 the expected export is 512 * 15625000 >> 8 = 31250000
bytes/s, which fits __u32, but the value actually dumped is
(512 * 15625000 mod 2^32) >> 8 = 14472784.

sch_fq_pie.c widens before scaling:

net/sched/sch_fq_pie.c:fq_pie_dump_class_stats() {
	...
			xstats.class_stats.avg_dq_rate =
				((u64)READ_ONCE(flow->vars.avg_dq_rate)
				* PSCHED_TICKS_PER_SEC) >> PIE_SCALE;
	...
}

The earlier patch in this series states it "widen[s] avg_dq_rate to u64
before scaling it by PSCHED_TICKS_PER_SEC", but that widening is still
missing in sch_pie.c while this patch asserts the bytes/second contract for
it.  Could the same (u64) cast be added to pie_dump_stats()?

[Severity: Low]
This isn't a bug, but should this carry a Fixes: tag?  The wrong units in
struct tc_pie_xstats date back to the original PIE submission: commit
d4b36210c2e6 ("net: pkt_sched: PIE AQM scheme") added both the header
comments claiming ms and bits/pie_time and the pie_dump_stats() code that
already exported microseconds and "dq_rate in bytes per sec".  A

Fixes: d4b36210c2e6 ("net: pkt_sched: PIE AQM scheme")

line would record where the user-facing units first went wrong.

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20260917204225.275251-1-hemendranaik%40gmail.com
