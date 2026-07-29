Received: from pdx-out-010.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-010.esa.us-west-2.outbound.mail-perimeter.amazon.com [52.12.53.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2D8C1F936;
	Wed, 29 Jul 2026 00:16:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=52.12.53.23
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785284209; cv=none; b=FeR41+aQTm7i+NfEtF+LX996661wwr3/hPDwhhXZyIr9yiE9OMDEeFjj6VV23B0dqSXw0irnsAhuGjY5WnOO+9JranXmC29tTb55HQn4iXnN/5AmV3dABZWeIZHggMCAVo0sCvA7vHeQ6udyDAsH5eSuSNtknUQT0aYLdVpDkgQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785284209; c=relaxed/simple;
	bh=MfdujIwDm4+ttQzSY6tpmUPQINnWq9E89sb6zDGpdHU=;
	h=MIME-Version:Content-Type:Subject:From:To:CC:In-Reply-To:
	 References:Date:Message-ID; b=NHx/V+f+SejqQw4CC2DpJL0Qs2YDv2ZUgX+x5E2qbRN2EITGMqtHT6RelYCwas3sByvuOcR+/xiZCFaMCwk5x6WwTNHS1u3KAe8uSPDr24Iozkbzz9/DN2fGeremoc79of7XahcKO77x3oEpg3IyChvaSqXkUxDemfyHMPeKew8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com; spf=pass smtp.mailfrom=amazon.com; dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b=d6aqWgPj; arc=none smtp.client-ip=52.12.53.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b="d6aqWgPj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1785284207; x=1816820207;
  h=mime-version:content-transfer-encoding:subject:from:to:
   cc:in-reply-to:references:date:message-id;
  bh=ZpD4Ua04Vv0uYDXdU0rOLhZG+hDOgEuRDU0pu7vViiY=;
  b=d6aqWgPjovMOjAD0189E2wONGaQtewYUMC+6OH7+yfX9oSqJ52C5xkvi
   8VmUOhEfcY0BgTWjwhWQm7YvXViwr63UIP1ECb9ITxwl6MHs0eMA17TSx
   exDZCIuXrwNfsuKy5JMD5pDPG/y2P1UHMAmU5xfQ6d/SfVT/B5KtHnQSb
   2eeKGIRvhsY+ZapwQxW3nrpS7ZsUE4EVH8xxg6e8UhNelTD1zV9XYZJYJ
   mKqkFdB2IQtCMmHKHPikKxM8zTE6aziHnmyzNMWN2azwV47RLWiRwqFTR
   905dDUMIEqV6XUCXnMwIAfoENLwzwbGxaBKYhDdl5mmKwnDU2JX50MP+r
   Q==;
X-CSE-ConnectionGUID: kfJWssZYSI2aKVdyC1H8Bw==
X-CSE-MsgGUID: VHxpAjQDTsG23Ss1IAx9aA==
X-IronPort-AV: E=Sophos;i="6.25,191,1779148800"; 
   d="scan'208";a="24410212"
Received: from ip-10-5-0-115.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.0.115])
  by internal-pdx-out-010.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jul 2026 00:16:42 +0000
Received: from EX19MTAUWC002.ant.amazon.com [205.251.233.51:30802]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.32.26:2525] with esmtp (Farcaster)
 id 72b7a435-0e5c-4e65-af21-284e36f31ebe; Wed, 29 Jul 2026 00:16:42 +0000 (UTC)
X-Farcaster-Flow-ID: 72b7a435-0e5c-4e65-af21-284e36f31ebe
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWC002.ant.amazon.com (10.250.64.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.45;
 Wed, 29 Jul 2026 00:16:42 +0000
Received: from dev-dsk-akiyano-1c-2138b29d.eu-west-1.amazon.com (172.19.83.6)
 by EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.45;
 Wed, 29 Jul 2026 00:16:36 +0000
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v5 net-next 1/7] ptp: Add ioctls for PHC timestamps
 with quality attributes
From: Arthur Kiyanovski <akiyano@amazon.com>
To: Jakub Kicinski <kuba@kernel.org>
CC: <akiyano@amazon.com>, <davem@davemloft.net>, <netdev@vger.kernel.org>,
	<richardcochran@gmail.com>, <edumazet@google.com>, <pabeni@redhat.com>,
	<dwmw2@infradead.org>, <tglx@linutronix.de>, <mlichvar@redhat.com>,
	<andrew+netdev@lunn.ch>, <guwen@linux.alibaba.com>,
	<xuanzhuo@linux.alibaba.com>, <dwmw@amazon.com>, <ysarna@amazon.com>,
	<zorik@amazon.com>, <matua@amazon.com>, <saeedb@amazon.com>,
	<msw@amazon.com>, <aliguori@amazon.com>, <nafea@amazon.com>,
	<evgenys@amazon.com>, <netanel@amazon.com>, <alisaidi@amazon.com>,
	<benh@amazon.com>, <ndagan@amazon.com>, <darinzon@amazon.com>,
	<evostrov@amazon.com>, <ofirt@amazon.com>, <amitbern@amazon.com>,
	<linux-kselftest@vger.kernel.org>, <linux-doc@vger.kernel.org>,
	<shuah@kernel.org>, <corbet@lwn.net>, <skhan@linuxfoundation.org>,
	<horms@kernel.org>, <bhelgaas@google.com>, <vadim.fedorenko@linux.dev>
In-Reply-To: <20260727201514.2757107-1-kuba@kernel.org>
References: <20260717065924.2556-2-akiyano@amazon.com>
 <20260727201514.2757107-1-kuba@kernel.org>
Date: Wed, 29 Jul 2026 00:16:24 +0000
Message-ID: <178528418489.4304.3834224813970456673.b4-reply@b4>
X-Mailer: b4 0.15.2
X-ClientProxiedBy: EX19D043UWA004.ant.amazon.com (10.13.139.41) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)

On 2026-07-27 13:15:14-07:00, Jakub Kicinski wrote:
> This is an AI-generated review of your patch. The human sending this
> email has considered the AI review valid, or at least plausible.
> ---
> ptp: Add ioctls for PHC timestamps with quality attributes
> 
> This introduces PTP_SYS_OFFSET_EXTENDED_ATTRS and
> PTP_SYS_OFFSET_PRECISE_ATTRS, extending the existing extended/precise
> offset ioctls with clock quality attributes (error bound, timescale,
> sync status) and raw system counter fields. New driver callbacks
> gettimexattrs64 and getcrosststampattrs are added to ptp_clock_info.
> 
> Link: https://lore.kernel.org/netdev/20250724115657.150-1-darinzon@amazon.com/
> Link: https://lore.kernel.org/all/87se7ht25o.ffs@tglx/
> 
> A few questions inline below.
> 
> > diff --git a/drivers/ptp/ptp_chardev.c b/drivers/ptp/ptp_chardev.c
> > index dc23cd708cfe..d30ee4f51fbb 100644
> > --- a/drivers/ptp/ptp_chardev.c
> > +++ b/drivers/ptp/ptp_chardev.c
> > @@ -190,6 +190,8 @@ static long ptp_clock_getcaps(struct ptp_clock *ptp, void __user *arg)
> >  		.cross_timestamping	= ptp->info->getcrosststamp != NULL,
> >  		.adjust_phase		= ptp->info->adjphase != NULL &&
> >  					  ptp->info->getmaxphase != NULL,
> > +		.extended_attrs		= ptp->info->gettimexattrs64 != NULL,
> > +		.precise_attrs		= ptp->info->getcrosststampattrs != NULL,
> >  	};
> 
> [Medium]
> Are the capability bits consistent with what the ioctls will actually
> accept?
> 
> The caps are set based only on the presence of the new *_attrs callbacks,
> but the ioctl handlers fall back to gettimex64/getcrosststamp when the
> *_attrs callback is absent:
> 
>     if (ptp->info->gettimexattrs64)
>         err = ptp->info->gettimexattrs64(ptp->info, &ts, &sts, &att);
>     else if (ptp->info->gettimex64)
>         err = ptp->info->gettimex64(ptp->info, &ts, &sts);
>     else
>         return -EOPNOTSUPP;
> 
> A userspace that respects the capability bits would refuse to call the
> new ioctl on drivers that would in fact serve it via the fallback. Is
> the fallback intended, and if so, should the caps advertise it? The
> commit message does not describe this behavior.
> 

The fallback is intentional. I'll widen the caps in v6 so they advertise it
(gettimexattrs64 || gettimex64, getcrosststampattrs || getcrosststamp) and
document the behavior in the commit message. Thanks.

> [ ... ]
> 
> > @@ -404,6 +413,130 @@ static long ptp_sys_offset_extended(struct ptp_clock *ptp, void __user *arg,
> >  	return copy_to_user(arg, extoff, sizeof(*extoff)) ? -EFAULT : 0;
> >  }
> >  
> > +static long ptp_sys_offset_extended_attrs(struct ptp_clock *ptp, void __user *arg)
> > +{
> > +	struct ptp_sys_offset_attrs *data __free(kfree) = NULL;
> > +	struct ptp_attrs_request request;
> > +	struct ptp_system_timestamp sts;
> 
> [Medium]
> Can this leak uninitialized stack contents to userspace?
> 
> Only sts.clockid is initialized below, and sts is reused across loop
> iterations. If any driver's gettimex64/gettimexattrs64 returns success
> without touching pre_sts/post_sts on the sts pointer, sts.pre_sts.valid
> is either uninitialized (first iteration) or stale (later iterations),
> and the "if (!sts.pre_sts.valid || !sts.post_sts.valid)" gate can admit
> a partially-populated snapshot.
> 
> On the success path the code then copies pre_sts.cycles, pre_sts.cs_id,
> pre_sts.monoraw, pre_sts.systime and the post_sts equivalents to
> userspace. The pre-existing ptp_sys_offset_extended() has the same
> shape but only copied systime, so the exposed surface is now wider.
> Would something like:
> 
>     struct ptp_system_timestamp sts = {};
> 
> inside the loop (or at declaration) be safer?
>

Yes — I'll zero-initialize sts per loop iteration in v6, so nothing
uninitialized or stale can reach userspace. Thanks.
 
> > +	unsigned int n_samples;
> > +	int err;
> > +
> > +	if (copy_from_user(&request, arg, sizeof(request)))
> > +		return -EFAULT;
> > +
> > +	if (request.valid ||
> > +	    request.num_samples > PTP_MAX_SAMPLES ||
> > +	    request.num_samples == 0)
> > +		return -EINVAL;
> 
> [Medium]
> Should this also reject non-zero request.rsv[]?
> 
> The kernel-doc for struct ptp_attrs_request says "Reserved for future
> use, must be zero", but rsv[3] is never validated. The neighboring
> ptp_sys_offset_extended() enforces the same contract on its own
> reserved fields:
> 
>     if (extoff->n_samples > PTP_MAX_SAMPLES || extoff->rsv[0] || extoff->rsv[1])
>         return -EINVAL;
> 
> Without a similar check, existing userspace binaries can start sending
> garbage in rsv[], which then blocks any future repurposing of those
> bytes.
> 

Agreed — v6 will reject a non-zero rsv[], matching
ptp_sys_offset_extended(). Thanks.

> > +
> > +	err = ptp_validate_sys_offset_clockid(request.clock_id);
> > +	if (err)
> > +		return err;
> > +
> > +	n_samples = request.num_samples;
> > +	sts.clockid = request.clock_id;
> > +
> > +	data = kzalloc(struct_size(data, timestamps, n_samples), GFP_KERNEL);
> > +	if (!data)
> > +		return -ENOMEM;
> > +
> > +	data->request.num_samples = n_samples;
> 
> [Low]
> This is a _IOWR ioctl and the whole struct (including data->request) is
> copied back to userspace at the end, but only data->request.num_samples
> is populated. data->request.valid, data->request.clock_id and
> data->request.rsv[] therefore always come back as zero, silently
> overwriting the values userspace put in the request buffer.
> 
> Is that intentional? It is not mentioned in the commit message, and it
> locks in a slightly surprising contract for future extensions.
> 

Not intentional — v6 will echo the full request back so
valid/clock_id/num_samples/rsv round-trip as submitted. Thanks.

> > +
> > +	for (unsigned int i = 0; i < n_samples; i++) {
> > +		struct ptp_clock_attrs att = {};
> > +		struct timespec64 ts;
> > +
> > +		if (ptp->info->gettimexattrs64)
> > +			err = ptp->info->gettimexattrs64(ptp->info, &ts,
> > +							 &sts, &att);
> > +		else if (ptp->info->gettimex64)
> > +			err = ptp->info->gettimex64(ptp->info, &ts, &sts);
> > +		else
> > +			return -EOPNOTSUPP;
> > +
> > +		if (err)
> > +			return err;
> > +
> > +		/* Filter out disabled or unavailable clocks */
> > +		if (!sts.pre_sts.valid || !sts.post_sts.valid)
> > +			return -EINVAL;
> > +
> > +		data->timestamps[i].pre_systime.sys_time =
> > +			ktime_to_ns(sts.pre_sts.systime);
> > +		data->timestamps[i].pre_systime.sys_rawtime =
> > +			ktime_to_ns(sts.pre_sts.monoraw);
> > +		data->timestamps[i].pre_systime.sys_counter =
> > +			sts.pre_sts.cycles;
> > +		data->timestamps[i].pre_systime.sys_counter_id =
> > +			sts.pre_sts.cs_id;
> 
> [Critical]
> Does the sys_counter_id assignment produce the correct UAPI value?
> 
> sts.pre_sts.cs_id is enum clocksource_ids from
> include/linux/clocksource_ids.h:
> 
>     CSID_GENERIC          = 0,
>     CSID_ARM_ARCH_COUNTER = 1,
>     CSID_S390_TOD         = 2,
>     CSID_X86_TSC_EARLY    = 3,
>     CSID_X86_TSC          = 4,
>     CSID_X86_KVM_CLK      = 5,
>     CSID_X86_ART          = 6,
> 
> But sys_counter_id is documented as enum ptp_counter_id from the UAPI:
> 
>     PTP_COUNTER_UNKNOWN  = 0,
>     PTP_COUNTER_X86_TSC  = 1,
>     PTP_COUNTER_ARM_ARCH = 2,
> 
> With this direct assignment, on ARM sts.pre_sts.cs_id == 1
> (CSID_ARM_ARCH_COUNTER) is reported to userspace as PTP_COUNTER_X86_TSC.
> On x86, real CSID_X86_TSC (4) has no defined UAPI meaning. On s390,
> CSID_S390_TOD (2) is reported as PTP_COUNTER_ARM_ARCH.
> 
> Should the ioctl translate cs_id into the UAPI enum before copying it
> out? Once released, later adding a translation layer would break any
> userspace that started decoding the raw kernel values.
> 

Good catch — that's a bug. v6 will translate enum clocksource_ids to the
UAPI enum ptp_counter_id before copying out. Thanks.

> [High]
> On clocksources that are derived/virtualised (kvm-clock, scaled arch
> counter, ART, ...), the raw underlying counter identity is exposed by
> system_time_snapshot as hw_cycles/hw_csid rather than cycles/cs_id.
> The new UAPI only propagates cycles/cs_id.
> 
> The commit message says one motivation is:
> 
>     3. VMMs that need raw system counter values paired with PTP
>        timestamps for feed-forward clock calibration ...
> 
> but a guest on a derived clocksource will not see the underlying
> hardware counter identity or value here. Should the UAPI also expose
> hw_cycles/hw_csid, given that the struct is frozen once merged?
> 

This is being handled as a follow-up (David Woodhouse offered on-list to
take the hw_csid side). This series exposes the base cs_id/cycles, and the
UAPI leaves room to add the hw_* values without an ABI change.

> > +		data->timestamps[i].devtime.device_time.sec = ts.tv_sec;
> > +		data->timestamps[i].devtime.device_time.nsec = ts.tv_nsec;
> > +		data->timestamps[i].devtime.attrs = att;
> 
> [ ... ]
> 
> > +}
> > +
> > +static long ptp_sys_offset_precise_attrs(struct ptp_clock *ptp, void __user *arg)
> > +{
> > +	struct ptp_sys_offset_attrs *data __free(kfree) = NULL;
> > +	struct system_device_crosststamp xtstamp;
> > +	struct ptp_attrs_request request;
> > +	struct ptp_clock_attrs att = {};
> > +	struct timespec64 ts;
> > +	int err;
> > +
> > +	if (copy_from_user(&request, arg, sizeof(request)))
> > +		return -EFAULT;
> > +
> > +	if (request.valid ||
> > +	    request.num_samples != 1)
> > +		return -EINVAL;
> > +
> > +	err = ptp_validate_sys_offset_clockid(request.clock_id);
> > +	if (err)
> > +		return err;
> > +
> > +	data = kzalloc(struct_size(data, timestamps, 1), GFP_KERNEL);
> > +	if (!data)
> > +		return -ENOMEM;
> > +
> > +	if (ptp->info->getcrosststampattrs)
> > +		err = ptp->info->getcrosststampattrs(ptp->info, &xtstamp, &att);
> > +	else if (ptp->info->getcrosststamp)
> > +		err = ptp->info->getcrosststamp(ptp->info, &xtstamp);
> > +	else
> > +		return -EOPNOTSUPP;
> 
> [High]
> Can any driver using get_device_system_crosststamp() actually serve
> this ioctl?
> 
> xtstamp is declared without an initializer, so xtstamp.clock_id holds
> whatever was on the stack. The pre-existing ptp_sys_offset_precise()
> explicitly sets it:
> 
>     struct system_device_crosststamp xtstamp = {
>         .clock_id = CLOCK_REALTIME,
>     };
> 
> Drivers commonly forward xtstamp to get_device_system_crosststamp() in
> kernel/time/timekeeping.c, which switches on xtstamp->clock_id and
> falls through to:
> 
>     default:
>         WARN_ON_ONCE(1);
>         return -ENODEV;
> 
> So on most drivers implementing getcrosststamp (kvm, mlx5, ice, igc,
> bnxt, s390, ...), an unprivileged caller of PTP_SYS_OFFSET_PRECISE_ATTRS
> would trigger a first-hit WARN and get -ENODEV.
> 
> In addition, request.clock_id is validated by
> ptp_validate_sys_offset_clockid() but never assigned to
> xtstamp.clock_id, so the userspace-selected clock is silently dropped
> even for the paths documented in the UAPI header (CLOCK_MONOTONIC,
> CLOCK_MONOTONIC_RAW, CLOCK_AUX...).
> 
> Should xtstamp.clock_id be set from request.clock_id (and xtstamp
> zeroed before use)?
> 

Real bug, thanks. v6 zero-initializes xtstamp and sets clock_id from the
validated request. To avoid the get_device_system_crosststamp() default
WARN, precise will validate clock_id against a dedicated allowlist (REALTIME
+ AUX) and return -EINVAL for anything else.

> [ ... ]
> 
> > diff --git a/drivers/ptp/ptp_clock.c b/drivers/ptp/ptp_clock.c
> > index d6f54ccaf93b..849aef8191c5 100644
> > --- a/drivers/ptp/ptp_clock.c
> > +++ b/drivers/ptp/ptp_clock.c
> > @@ -112,7 +112,9 @@ static int ptp_clock_gettime(struct posix_clock *pc, struct timespec64 *tp)
> >  	struct ptp_clock *ptp = container_of(pc, struct ptp_clock, clock);
> >  	int err;
> >  
> > -	if (ptp->info->gettimex64)
> > +	if (ptp->info->gettimexattrs64)
> > +		err = ptp->info->gettimexattrs64(ptp->info, tp, NULL, NULL);
> > +	else if (ptp->info->gettimex64)
> >  		err = ptp->info->gettimex64(ptp->info, tp, NULL);
> >  	else
> >  		err = ptp->info->gettime64(ptp->info, tp);
> 
> [Low]
> This call site passes both sts and att as NULL, but the kernel-doc for
> gettimexattrs64 only documents that att may be NULL ("fills @att (if
> not NULL)"). The dual-NULL contract on sts is implicitly inherited
> from gettimex64 but is not stated.
> 
> Would it be worth spelling out in the kernel-doc that both sts and att
> may be NULL, so a new driver author does not skip the NULL check on
> sts?

Yes — v6 will state that both sts and att may be NULL. Thanks.

> 
> [ ... ]


