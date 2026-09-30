Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 373ED39DBFA;
	Wed, 30 Sep 2026 04:34:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790742897; cv=none; b=WqyXeEIJLl74irm7tmkLbpJCuHogSkAyTcZRj3rYqzvP3F2NRE+6LFXhSP+38NpF95X8byCfFmd9uhgqgk5kccKE2iadOH93JYKOeZ9JQ/3endpYDQRfa9kNpduIbhTJVX6b++5KEAWbxn0nbFgviVNpIJtIgEsIR+zNQRCSkaQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790742897; c=relaxed/simple;
	bh=/GpCwoI/WjPqxzTtccOi9AuIhW/vy6RG31Vtz5Jc0nA=;
	h=Subject:From:To:Cc:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=nDGVzJX9AcNQaWdI0LpjZpYiFBrn8UJJuV6BI6vfegnoYaCVu18pjTaOTgO6aiRMXL5IG4jejZb3ZisIeix99l+TFwE1IwJI+WLwaTNwFTB/ebmg8YIyKFG85Z6R51xrMyVg6IFvjEl87LDacz2Gbfel10BoMzDdKPmfEHd5i3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XL87/gVM; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XL87/gVM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F9D41F00898;
	Wed, 30 Sep 2026 04:34:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790742895;
	bh=qcOzCeldr19i6HEvgjTa/EgucQH9dpxOzxsu/u6z+X4=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=XL87/gVMAuhyrInZtoduwnj0sdfuTFZfSw2l9D64Vi+Oa0cVs/IdaPV3m032mjiC6
	 pXYJsJ75R63Bp9MUsvlnfrio7Rd9LALoLIuWEzGKzK8+7yX+CdtXRzokb/27G33MSb
	 4jY8LCsIIBdblGO5C5+5thyak5oXpADe3IB8vSdY1CbF+oEvPXjC1NEf/SKW6MGX2W
	 SIEvt7Nq2L5ti1vEY34L9XdV93QHqdG0k5a2V9rrQErUvLFqxoGlj109qCaS1NE8qn
	 AhgJOh9wXDeqHJTEgZhwWA7y3lzSm590Iyzks2ad4CiBP2ELuh1WMOZQGX6o+q6mWy
	 iodZIuhTkaQ3Q==
Subject: Re: [PATCH net-next v9 3/3] net/sched: pie: correct tc_pie_xstats
 field documentation
From: netdev-bot+sashiko@kernel.org
To: hemendranaik@gmail.com
Cc: netdev@vger.kernel.org, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, horms@kernel.org, jiri@resnulli.us,
 jhs@mojatatu.com, shuah@kernel.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, vishy0777@gmail.com, tahiliani@nitk.edu.in
Date: Wed, 30 Sep 2026 04:34:54 +0000
Message-ID: <179074289474.434549.1623558597284494175@kernel.org>
In-Reply-To: <20260928043358.6866-4-hemendranaik@gmail.com>
References: <20260928043358.6866-4-hemendranaik@gmail.com>
X-sashiko-severity: Low
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Thank you for your contribution! Sashiko AI review found more severe
issue(s) in other patches of this series. This mail is only an FYI, in case
you want to address the nit picks below when you respin.

Low priority / nit picks for your consideration:

- [Low] The patch fixes the units for struct tc_pie_xstats in
  include/uapi/linux/pkt_sched.h, but misses the other in-tree…

--

net/sched: pie: correct tc_pie_xstats field documentation

This commit changes the comments on struct tc_pie_xstats in the uapi
pkt_sched.h header so they match the values pie_dump_stats() exports.
The delay field is now documented in microseconds and avg_dq_rate in
bytes/second. There is no layout or runtime change.

> diff --git a/include/uapi/linux/pkt_sched.h b/include/uapi/linux/pkt_sched.h
> index fef848eaaab23..445a041cd103f 100644
> --- a/include/uapi/linux/pkt_sched.h
> +++ b/include/uapi/linux/pkt_sched.h
> @@ -920,9 +920,9 @@ enum {
>  
>  struct tc_pie_xstats {
>  	__u64 prob;			/* current probability */
> -	__u32 delay;			/* current delay in ms */
> +	__u32 delay;			/* current delay in microseconds */
>  	__u32 avg_dq_rate;		/* current average dq_rate in
> -					 * bits/pie_time
> +					 * bytes/second
>  					 */

[Severity: Low]
Should Documentation/netlink/specs/tc.yaml get the same fix?

The tc-pie-xstats struct in the tc netlink spec still has the old units:

Documentation/netlink/specs/tc.yaml:
      -
        name: delay
        type: u32
        doc: Current delay in ms
      -
        name: avg-dq-rate
        type: u32
        doc: Current average dq rate in bits/pie-time

pie_dump_stats() in net/sched/sch_pie.c exports microseconds and bytes
per second:

	.delay		= ((u32)PSCHED_TICKS2NS(READ_ONCE(q->vars.qdelay))) /
				   NSEC_PER_USEC,
	...
	/* unscale and return dq_rate in bytes per sec */
	if (st.dq_rate_estimating)
		st.avg_dq_rate = READ_ONCE(q->vars.avg_dq_rate) *
				 (PSCHED_TICKS_PER_SEC) >> PIE_SCALE;

After this patch, the header and the spec describe the same fields with
different units. The generated netlink spec documentation will still
show "ms" and "bits/pie-time".

The commit message says:

    Documentation-only; no UAPI layout or runtime change. Touch
    include/uapi/linux/pkt_sched.h only

Could the patch update the delay and avg-dq-rate doc strings in tc.yaml
too? The same file already uses "microseconds" for similar fields, for
example delay-c and delay-l in tc-dualpi2-xstats.

>  	__u32 dq_rate_estimating;	/* is avg_dq_rate being calculated? */
>  	__u32 packets_in;		/* total number of packets enqueued */

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20260928043358.6866-1-hemendranaik%40gmail.com
