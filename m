Received: from pdx-out-015.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-015.esa.us-west-2.outbound.mail-perimeter.amazon.com [50.112.246.219])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4E54266565;
	Wed,  2 Sep 2026 01:19:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=50.112.246.219
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788311992; cv=none; b=BEwk3BAkD6E2tHzqY0NMKokkj4EtbAJ3CWrAjUpLUGvQu3VSJ530L7tXPvXFnXtn2VZRqQPqscL+3+BZ1BZ0M5m88cwzzOAWCygQVNC6fojfxkfI2kT54+zS80sciHdVGOsOmMwkkSVH8w6LbE/cVVuTmjBzA0s9eBs4FBypn/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788311992; c=relaxed/simple;
	bh=dECynDlh6qhLrOm+UCPlQ/TSTHRaTSIwOrDLAZr56XE=;
	h=MIME-Version:Content-Type:Subject:From:To:CC:In-Reply-To:
	 References:Date:Message-ID; b=Hwo6QyFNthSnaPAJmiLzOkGxww9XSotrhsuuMq0QrDkz298rPdq1QBJzH/KtKoc4c2nP4UL2m/O231dXSGBS3tpYxokbp/YyiMBGMAlCUi5Jk7p1XPHNGbw6dNl25JCotaiayoRBmUqn+RpUEkIC9U/LIF97f8sG9bXpVeKnEyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com; spf=pass smtp.mailfrom=amazon.com; dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b=b3ysdK29; arc=none smtp.client-ip=50.112.246.219
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b="b3ysdK29"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1788311990; x=1819847990;
  h=mime-version:content-transfer-encoding:subject:from:to:
   cc:in-reply-to:references:date:message-id;
  bh=nDVdMuVF8NuUOSHnrHAvyl65dXJIPVruO3LO8eLQQ0c=;
  b=b3ysdK29Ly66xMk7Yc3dkj901+oBYQm0jEXh5K+iEusdI94nBWZmOyXj
   3jswOyOrWrh2cDymuEbsbBqzrg4YPg89Pa1/QWg6cE6GcEahQyOG3wEsd
   yC6ihSSL/PHM30KU2Da97isfDhBkxp2LhB0crPRFxi02xx9jmMHQUZF2d
   qp+WYjjMJXBaQmNPFplzo0e7sFKJE4Wz4EqjV6fWGidBW5QKkAzdNjIJ9
   u+nmLZaaKQB16ExboRIcZ12nlBcyfP/GQMRbNRZhIvOyKzS/NeIz6fZte
   5uh1BXx+rSAittU66zcQUinPw7RQG5Fb5f3oAEnTHSi+WR0SHXUiZVvyU
   g==;
X-CSE-ConnectionGUID: 67UQq9DOQ5qZUItrQdioTg==
X-CSE-MsgGUID: 7uhzjY3OSbeWHUPFrMHkKw==
X-IronPort-AV: E=Sophos;i="6.25,257,1779148800"; 
   d="scan'208";a="27348005"
Received: from ip-10-5-9-48.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.9.48])
  by internal-pdx-out-015.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2026 01:19:47 +0000
Received: from EX19MTAUWA002.ant.amazon.com [205.251.233.178:27769]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.31.51:2525] with esmtp (Farcaster)
 id a2381d95-17d7-44d1-94e6-e81954fb7b41; Wed, 2 Sep 2026 01:19:46 +0000 (UTC)
X-Farcaster-Flow-ID: a2381d95-17d7-44d1-94e6-e81954fb7b41
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWA002.ant.amazon.com (10.250.64.202) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.45;
 Wed, 2 Sep 2026 01:19:46 +0000
Received: from dev-dsk-akiyano-1c-2138b29d.eu-west-1.amazon.com (172.19.83.6)
 by EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.46;
 Wed, 2 Sep 2026 01:19:40 +0000
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v6 net-next 4/7] ptp: ptp_vmclock: Implement attributes
 ioctls
From: Arthur Kiyanovski <akiyano@amazon.com>
To: Simon Horman <horms@kernel.org>
CC: Arthur Kiyanovski <akiyano@amazon.com>, David Miller
	<davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Richard Cochran
	<richardcochran@gmail.com>, <netdev@vger.kernel.org>, Eric Dumazet
	<edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, David Woodhouse
	<dwmw2@infradead.org>, Thomas Gleixner <tglx@linutronix.de>, Miroslav Lichvar
	<mlichvar@redhat.com>, Andrew Lunn <andrew+netdev@lunn.ch>, Andrew Lunn
	<andrew@lunn.ch>, Carolina Jubran <cjubran@nvidia.com>, Wen Gu
	<guwen@linux.alibaba.com>, Xuan Zhuo <xuanzhuo@linux.alibaba.com>, "David
 Woodhouse" <dwmw@amazon.com>, Yonatan Sarna <ysarna@amazon.com>, "Zorik
 Machulsky" <zorik@amazon.com>, Alexander Matushevsky <matua@amazon.com>,
	"Saeed Bshara" <saeedb@amazon.com>, Matt Wilson <msw@amazon.com>, Anthony
 Liguori <aliguori@amazon.com>, Nafea Bshara <nafea@amazon.com>, Evgeny
 Schmeilin <evgenys@amazon.com>, Netanel Belgazal <netanel@amazon.com>, Ali
 Saidi <alisaidi@amazon.com>, Benjamin Herrenschmidt <benh@amazon.com>, Noam
 Dagan <ndagan@amazon.com>, David Arinzon <darinzon@amazon.com>, Evgeny
 Ostrovsky <evostrov@amazon.com>, Ofir Tabachnik <ofirt@amazon.com>, Amit
 Bernstein <amitbern@amazon.com>, <linux-kselftest@vger.kernel.org>,
	<linux-doc@vger.kernel.org>, <shuah@kernel.org>, Jonathan Corbet
	<corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, Bjorn Helgaas
	<bhelgaas@google.com>, <vadim.fedorenko@linux.dev>, David Woodhouse
	<dwmw@amazon.co.uk>
In-Reply-To: <20260804123739.GM51943@horms.kernel.org>
References: <20260729233740.16516-1-akiyano@amazon.com>
 <20260729233740.16516-5-akiyano@amazon.com>
 <20260804123739.GM51943@horms.kernel.org>
Date: Wed, 2 Sep 2026 01:19:33 +0000
Message-ID: <178831197324.28813.9998121184169113388.b4-reply@b4>
X-Mailer: b4 0.15.2
X-ClientProxiedBy: EX19D033UWC001.ant.amazon.com (10.13.139.218) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)

On 2026-08-04 13:37:39+01:00, Simon Horman wrote:
> This is an AI-generated review of your patch. The human sending this
> email has considered the AI review valid, or at least plausible.
> Full review at: https://sashiko.dev/#/patchset/20260729233740.16516-2-akiyano@amazon.com?part=4
> ---
> --- Patch [4]: [PATCH v6 net-next 4/7] ptp: ptp_vmclock: Implement attributes ioctls ---
> commit 9ab73b649349967c6e3befcbed4c125d48bd8c43
> Author: Arthur Kiyanovski <akiyano@amazon.com>
> 
> ptp: ptp_vmclock: Implement attributes ioctls
> 
> Implement the gettimexattrs64 and getcrosststampattrs callbacks in the
> ptp_vmclock driver to provide clock quality attributes through the new
> PTP_SYS_OFFSET_EXTENDED_ATTRS and PTP_SYS_OFFSET_PRECISE_ATTRS ioctls.
> 

Thanks Simon, and thanks for the AI review. Responses inline.

> > diff --git a/drivers/ptp/ptp_vmclock.c b/drivers/ptp/ptp_vmclock.c
> > index eebdcd5ebc080..fe26123ad940d 100644
> > --- a/drivers/ptp/ptp_vmclock.c
> > +++ b/drivers/ptp/ptp_vmclock.c
> > @@ -95,13 +106,111 @@ static bool tai_adjust(struct vmclock_abi *clk, uint64_t *sec)
> 
> [ ... ]
> 
> > +static void vmclock_populate_ptp_attributes(struct vmclock_state *st,
> > +					    struct ptp_clock_attrs *att,
> > +					    uint64_t delta)
> > +{
> > +	uint64_t maxerror_ns = UINT_MAX;
> > +
> > +	if (!att)
> > +		return;
> > +
> > +	/* Only calculate if the base error is flagged as valid
> > +	 * by the hypervisor.
> > +	 */
> > +	if (VMCLOCK_FIELD_PRESENT(st->clk, time_maxerror_nanosec) &&
> > +	    (le64_to_cpu(st->clk->flags) & VMCLOCK_FLAG_TIME_MAXERROR_VALID)) {
> > +		maxerror_ns = le64_to_cpu(st->clk->time_maxerror_nanosec);
> > +
> > +		/* If frequency error is also valid, accumulate it
> > +		 * over the delta.
> > +		 */
> > +		if (VMCLOCK_FIELD_PRESENT(st->clk, counter_period_maxerror_rate_frac_sec) &&
> > +		    (le64_to_cpu(st->clk->flags) & VMCLOCK_FLAG_PERIOD_MAXERROR_VALID)) {
> > +			uint64_t maxerror_rate, err_hi, err_frac, growth_ns;
> > +
> > +			if (st->clk->counter_period_shift >= 128) {
> > +				maxerror_ns = U64_MAX;
> > +				goto saturate;
> > +			}
> > +
> > +			maxerror_rate = le64_to_cpu(st->clk->counter_period_maxerror_rate_frac_sec);
> > +			err_frac = mul_u64_u64_shr_add_u64(&err_hi, delta,
> > +							   maxerror_rate,
> > +							   st->clk->counter_period_shift,
> > +							   0);
> 
> [Severity: High]
> Could a malicious hypervisor modify counter_period_shift concurrently?
> 
> The counter_period_shift field is read directly from shared memory twice,
> first for the bounds check and then as an argument to
> mul_u64_u64_shr_add_u64(). If the value changes between these reads, it
> could bypass the bounds check and cause an out-of-bounds shift.
> 
> Would it be better to read it once using READ_ONCE() to ensure the bounds
> check operates on the exact value passed to the math helper?
> 

Good point that the >= 128 guard here is inconsistent with the rest of
the driver: counter_period_shift is read from the shared page and passed
to the same helper on the main timestamp path (vmclock_get_crosststamp())
with no bounds check, so this field has always been treated as trusted
via the seq_count snapshot. Adding a guard (or READ_ONCE()) to only the
new attrs path is the wrong place to change that posture.

For v7 I'll drop the guard so both paths read the field identically.
With the guard gone the attrs path reads counter_period_shift once, so
the divergent double-read the review flagged no longer exists.


> > +
> > +			if (err_hi >= U64_MAX / NSEC_PER_SEC) {
> > +				maxerror_ns = U64_MAX;
> > +				goto saturate;
> > +			}
> > +
> > +			growth_ns = (err_hi * NSEC_PER_SEC) +
> > +				    mul_u64_u64_shr(err_frac, NSEC_PER_SEC, 64);
> > +
> > +			/* Guard against overflow */
> > +			if (U64_MAX - growth_ns < maxerror_ns)
> > +				maxerror_ns = U64_MAX;
> > +			else
> > +				maxerror_ns += growth_ns;
> > +		}
> > +	}
> > +
> > +saturate:
> > +	/* PTP UAPI error_bound is 32-bit nanoseconds */
> > +	att->error_bound = (maxerror_ns > UINT_MAX) ?
> > +		UINT_MAX : (uint32_t)maxerror_ns;
> > +	att->valid |= PTP_ATTRS_VALID_ERROR_BOUND;
> 
> [Severity: Medium]
> Does this unconditionally tell userspace that the error bound is valid, even
> if the hypervisor flagged time_maxerror_nanosec as invalid?
> 
> If VMCLOCK_FLAG_TIME_MAXERROR_VALID is clear, maxerror_ns remains UINT_MAX
> and PTP_ATTRS_VALID_ERROR_BOUND is still set. Userspace might interpret the
> resulting UINT_MAX as a legitimate worst-case error bound rather than an
> unsupported attribute.
> 

Agreed, that's misleading. This will be fixed in v7:
PTP_ATTRS_VALID_ERROR_BOUND is only set when the hypervisor flags the
base error valid (VMCLOCK_FLAG_TIME_MAXERROR_VALID); otherwise the bit
stays clear so userspace sees "not provided" rather than a UINT_MAX that
looks like a real ~4.29 s bound.

> > +	att->timescale = vmclock_get_ptp_timescale(st->clk->time_type);
> > +	/* tai_adjust() already converted UTC to TAI before we're called */
> > +	if (st->clk->time_type == VMCLOCK_TIME_UTC)
> > +		att->timescale = PTP_TIMESCALE_TAI;
> > +	att->valid |= PTP_ATTRS_VALID_TIMESCALE;
> > +	att->status = vmclock_get_ptp_status(st->clk->clock_status);
> > +	att->valid |= PTP_ATTRS_VALID_STATUS;
> > +}
> > +
> >  static int vmclock_get_crosststamp(struct vmclock_state *st,
> >  				   struct ptp_system_timestamp *sts,
> >  				   struct system_counterval_t *system_counter,
> 
> [ ... ]
> 
> >  		delta = cycle - le64_to_cpu(st->clk->counter_value);
> >  
> >  		frac_sec = mul_u64_u64_shr_add_u64(&tspec->tv_sec, delta,
> >  						   le64_to_cpu(st->clk->counter_period_frac_sec),
> >  						   st->clk->counter_period_shift,
> >  						   le64_to_cpu(st->clk->time_frac_sec));
> 
> [Severity: High]
> This is a pre-existing issue, but can counter_period_shift be greater than
> or equal to 128 here?
> 
> Since counter_period_shift is controlled by the hypervisor and passed directly
> to mul_u64_u64_shr_add_u64() without bounds checking, an invalid value could
> cause an out-of-bounds bitwise shift and undefined behavior:
> 
> mul_u64_u64_shr_add_u64() {
>     ...
>     res >>= shift;
>     ...
> }
> 
> Given that vmclock_populate_ptp_attributes() actively defends against
> invalid shift values, should we add a similar bounds check here to prevent
> a potential kernel panic?

As noted, this is pre-existing: it predates this series -- it's in the
original vmclock driver, and my v6 attrs helper was the only
guarded use. Dropping that guard (above) keeps the new path consistent
with the existing one rather than diverging from it.

If the shift should actually be bounds-checked, that's a fix to the
existing driver and better handled on its own rather than folded into
this attributes series. I'll defer to David Woodhouse as vmclock
maintainer on whether that hardening is worth doing separately.

Thanks,
Arthur

