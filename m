Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AA783644C4;
	Tue,  4 Aug 2026 12:37:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785847070; cv=none; b=CSgTGt532FVLUw8gLW95XtCVYd9MipN1irUOwIfI5kXjH10H2mbZKu6/gKWFJGoZ2B+Sb9LxI6iB2IVdy91q9PKVIOdY5AaFFc/3GmucQfqPwUM0o/KyRijnTOJwCJLdBKn/jfZNf0bQgxleag6wNNPpSDcXQM/9Ol/DdTSdB90=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785847070; c=relaxed/simple;
	bh=EieNp/YNEWfCJ/nS9mOvHuM0BYSEdAllos6iAzdLNxI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cOygRy3sus92aps2y6YC7dYFIyUonPky+38p2jpXx3bmHHGXa0ebW9kgA/m40L5oclvgTifT1kHRHkNSEcquyJ0FCvTqtmCzWo8B87+YVE9kgKO/UWdKfn828Ux18zoHpI3gcKbOqt5sLp+6Qa/tdMoBXm2g7BVmuGKtJgH/tGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Gqk79v1g; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Gqk79v1g"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7CC941F000E9;
	Tue,  4 Aug 2026 12:37:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785847067;
	bh=o0hDzMUzXTXLcZbR/cMAIrPS2jl1EtG0west4JLjGUg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Gqk79v1gcOp8xbuKiIPDbTI4LgdH3blYiwu7nhreDXF0H8ZSNJkeJoMi/9Ry/3VA4
	 PuZYGGcggHZvvJVB6+nqdRuO8tcrOodP3AerJXQVHQR1lFtS0/xeNXWmpFcssOT+Pi
	 /yMJgw7hUZijhtR+E6BzomuWrLvxLBSlOPSYRo6oNLIOAQKx1D6Rf1JhHIV1/mNid2
	 8afNRqikGU2LlclzszGEdB5hwPlxJZ2h8iPTwTuMCeKmSJGXe4gRIwSuftDzeYLak3
	 7lDXsTAblvq6HHySpG7JaJrciL8x08PsZ8BB0Lt67uuYLzFxVxI4RyaHIj0sevTUSr
	 NP686j9xrM9vA==
Date: Tue, 4 Aug 2026 13:37:39 +0100
From: Simon Horman <horms@kernel.org>
To: Arthur Kiyanovski <akiyano@amazon.com>
Cc: David Miller <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
	Richard Cochran <richardcochran@gmail.com>, netdev@vger.kernel.org,
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
	David Woodhouse <dwmw2@infradead.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Miroslav Lichvar <mlichvar@redhat.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>, Andrew Lunn <andrew@lunn.ch>,
	Carolina Jubran <cjubran@nvidia.com>,
	Wen Gu <guwen@linux.alibaba.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	David Woodhouse <dwmw@amazon.com>,
	Yonatan Sarna <ysarna@amazon.com>,
	Zorik Machulsky <zorik@amazon.com>,
	Alexander Matushevsky <matua@amazon.com>,
	Saeed Bshara <saeedb@amazon.com>, Matt Wilson <msw@amazon.com>,
	Anthony Liguori <aliguori@amazon.com>,
	Nafea Bshara <nafea@amazon.com>,
	Evgeny Schmeilin <evgenys@amazon.com>,
	Netanel Belgazal <netanel@amazon.com>,
	Ali Saidi <alisaidi@amazon.com>,
	Benjamin Herrenschmidt <benh@amazon.com>,
	Noam Dagan <ndagan@amazon.com>, David Arinzon <darinzon@amazon.com>,
	Evgeny Ostrovsky <evostrov@amazon.com>,
	Ofir Tabachnik <ofirt@amazon.com>,
	Amit Bernstein <amitbern@amazon.com>,
	linux-kselftest@vger.kernel.org, linux-doc@vger.kernel.org,
	shuah@kernel.org, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Bjorn Helgaas <bhelgaas@google.com>, vadim.fedorenko@linux.dev,
	David Woodhouse <dwmw@amazon.co.uk>
Subject: Re: [PATCH v6 net-next 4/7] ptp: ptp_vmclock: Implement attributes
 ioctls
Message-ID: <20260804123739.GM51943@horms.kernel.org>
References: <20260729233740.16516-1-akiyano@amazon.com>
 <20260729233740.16516-5-akiyano@amazon.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260729233740.16516-5-akiyano@amazon.com>

This is an AI-generated review of your patch. The human sending this
email has considered the AI review valid, or at least plausible.
Full review at: https://sashiko.dev/#/patchset/20260729233740.16516-2-akiyano@amazon.com?part=4
---
--- Patch [4]: [PATCH v6 net-next 4/7] ptp: ptp_vmclock: Implement attributes ioctls ---
commit 9ab73b649349967c6e3befcbed4c125d48bd8c43
Author: Arthur Kiyanovski <akiyano@amazon.com>

ptp: ptp_vmclock: Implement attributes ioctls

Implement the gettimexattrs64 and getcrosststampattrs callbacks in the
ptp_vmclock driver to provide clock quality attributes through the new
PTP_SYS_OFFSET_EXTENDED_ATTRS and PTP_SYS_OFFSET_PRECISE_ATTRS ioctls.

> diff --git a/drivers/ptp/ptp_vmclock.c b/drivers/ptp/ptp_vmclock.c
> index eebdcd5ebc080..fe26123ad940d 100644
> --- a/drivers/ptp/ptp_vmclock.c
> +++ b/drivers/ptp/ptp_vmclock.c
> @@ -95,13 +106,111 @@ static bool tai_adjust(struct vmclock_abi *clk, uint64_t *sec)

[ ... ]

> +static void vmclock_populate_ptp_attributes(struct vmclock_state *st,
> +					    struct ptp_clock_attrs *att,
> +					    uint64_t delta)
> +{
> +	uint64_t maxerror_ns = UINT_MAX;
> +
> +	if (!att)
> +		return;
> +
> +	/* Only calculate if the base error is flagged as valid
> +	 * by the hypervisor.
> +	 */
> +	if (VMCLOCK_FIELD_PRESENT(st->clk, time_maxerror_nanosec) &&
> +	    (le64_to_cpu(st->clk->flags) & VMCLOCK_FLAG_TIME_MAXERROR_VALID)) {
> +		maxerror_ns = le64_to_cpu(st->clk->time_maxerror_nanosec);
> +
> +		/* If frequency error is also valid, accumulate it
> +		 * over the delta.
> +		 */
> +		if (VMCLOCK_FIELD_PRESENT(st->clk, counter_period_maxerror_rate_frac_sec) &&
> +		    (le64_to_cpu(st->clk->flags) & VMCLOCK_FLAG_PERIOD_MAXERROR_VALID)) {
> +			uint64_t maxerror_rate, err_hi, err_frac, growth_ns;
> +
> +			if (st->clk->counter_period_shift >= 128) {
> +				maxerror_ns = U64_MAX;
> +				goto saturate;
> +			}
> +
> +			maxerror_rate = le64_to_cpu(st->clk->counter_period_maxerror_rate_frac_sec);
> +			err_frac = mul_u64_u64_shr_add_u64(&err_hi, delta,
> +							   maxerror_rate,
> +							   st->clk->counter_period_shift,
> +							   0);

[Severity: High]
Could a malicious hypervisor modify counter_period_shift concurrently?

The counter_period_shift field is read directly from shared memory twice,
first for the bounds check and then as an argument to
mul_u64_u64_shr_add_u64(). If the value changes between these reads, it
could bypass the bounds check and cause an out-of-bounds shift.

Would it be better to read it once using READ_ONCE() to ensure the bounds
check operates on the exact value passed to the math helper?

> +
> +			if (err_hi >= U64_MAX / NSEC_PER_SEC) {
> +				maxerror_ns = U64_MAX;
> +				goto saturate;
> +			}
> +
> +			growth_ns = (err_hi * NSEC_PER_SEC) +
> +				    mul_u64_u64_shr(err_frac, NSEC_PER_SEC, 64);
> +
> +			/* Guard against overflow */
> +			if (U64_MAX - growth_ns < maxerror_ns)
> +				maxerror_ns = U64_MAX;
> +			else
> +				maxerror_ns += growth_ns;
> +		}
> +	}
> +
> +saturate:
> +	/* PTP UAPI error_bound is 32-bit nanoseconds */
> +	att->error_bound = (maxerror_ns > UINT_MAX) ?
> +		UINT_MAX : (uint32_t)maxerror_ns;
> +	att->valid |= PTP_ATTRS_VALID_ERROR_BOUND;

[Severity: Medium]
Does this unconditionally tell userspace that the error bound is valid, even
if the hypervisor flagged time_maxerror_nanosec as invalid?

If VMCLOCK_FLAG_TIME_MAXERROR_VALID is clear, maxerror_ns remains UINT_MAX
and PTP_ATTRS_VALID_ERROR_BOUND is still set. Userspace might interpret the
resulting UINT_MAX as a legitimate worst-case error bound rather than an
unsupported attribute.

> +	att->timescale = vmclock_get_ptp_timescale(st->clk->time_type);
> +	/* tai_adjust() already converted UTC to TAI before we're called */
> +	if (st->clk->time_type == VMCLOCK_TIME_UTC)
> +		att->timescale = PTP_TIMESCALE_TAI;
> +	att->valid |= PTP_ATTRS_VALID_TIMESCALE;
> +	att->status = vmclock_get_ptp_status(st->clk->clock_status);
> +	att->valid |= PTP_ATTRS_VALID_STATUS;
> +}
> +
>  static int vmclock_get_crosststamp(struct vmclock_state *st,
>  				   struct ptp_system_timestamp *sts,
>  				   struct system_counterval_t *system_counter,

[ ... ]

>  		delta = cycle - le64_to_cpu(st->clk->counter_value);
>  
>  		frac_sec = mul_u64_u64_shr_add_u64(&tspec->tv_sec, delta,
>  						   le64_to_cpu(st->clk->counter_period_frac_sec),
>  						   st->clk->counter_period_shift,
>  						   le64_to_cpu(st->clk->time_frac_sec));

[Severity: High]
This is a pre-existing issue, but can counter_period_shift be greater than
or equal to 128 here?

Since counter_period_shift is controlled by the hypervisor and passed directly
to mul_u64_u64_shr_add_u64() without bounds checking, an invalid value could
cause an out-of-bounds bitwise shift and undefined behavior:

mul_u64_u64_shr_add_u64() {
    ...
    res >>= shift;
    ...
}

Given that vmclock_populate_ptp_attributes() actively defends against
invalid shift values, should we add a similar bounds check here to prevent
a potential kernel panic?

>  		tspec->tv_nsec = mul_u64_u64_shr(frac_sec, NSEC_PER_SEC, 64);
>  		tspec->tv_sec += le64_to_cpu(st->clk->time_sec);
>  
>  		if (!tai_adjust(st->clk, &tspec->tv_sec))
>  			return -EINVAL;
>  
> +		/*
> +		 * Capture clock state inside the seq_count loop for a
> +		 * consistent snapshot with the timestamp. The attrs path
> +		 * reports it to userspace via the status field; the legacy
> +		 * path saves it for the UNRELIABLE check after the loop.
> +		 */
