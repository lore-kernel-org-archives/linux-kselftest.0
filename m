Received: from pdx-out-011.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-011.esa.us-west-2.outbound.mail-perimeter.amazon.com [52.35.192.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AFC11FB1;
	Wed, 29 Jul 2026 00:01:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=52.35.192.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785283298; cv=none; b=BV2HKG8cyE97fXEQjb1K/DdVt0ot+aAPe0NR+zKmWNGQZSupZq6XgDHHCYuT3KIJo6e5dZ0f9RbUFPZEHmMHl/DaIfgSDqTYYQIRl4Cu7SYbsIUh83hACYBqA7tiZMx0BN0eOPKxI87N/dEjOdX14uhAjRSdQSW7xNz7GfuzG9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785283298; c=relaxed/simple;
	bh=6gZl+aJtgo3fznW9oEs8v3hm4OXO0PP+lcez74vDwDI=;
	h=MIME-Version:Content-Type:Subject:From:To:CC:In-Reply-To:
	 References:Date:Message-ID; b=fMnmSyQO2IEQv/2ER5EXFC8P/zqHYFjJ0LWEh5h4Li9T7jUNq8kjwVmgtq0u/PC34u4t+kPr2eK6FaQqj4vRvv8g/81RRAyNwZprYqnRxoVa/zRMTapt0XI5nsYZ5J9XlCkFgtPzDTvKw1oaSfN5zuUIPSlThzLMLsSt/t097HA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com; spf=pass smtp.mailfrom=amazon.com; dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b=B+gcHAa5; arc=none smtp.client-ip=52.35.192.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b="B+gcHAa5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1785283295; x=1816819295;
  h=mime-version:content-transfer-encoding:subject:from:to:
   cc:in-reply-to:references:date:message-id;
  bh=XEEg9UVEQoeQdOwTCuJ9uNpL6c6CABlKqyGAgTPHdBQ=;
  b=B+gcHAa5mKqB+5w/7TIlf1AyzAdHnWMHscShdbd2Z8AXzhUymsP3aZhF
   OAvtbZPSVwOrkrX6fQ9kgS37hwxxIESXs+7T/91+6ycvC342QS38tLz2M
   8EUaskRRDOgMb/iSc3+Srj9AaiBvP28cGTDtkipiWxOlqP8T0VJ2+VLY7
   QRsPCfbE0YFSb7wANaT1mbMOZL1QP1apyMYdJSNpXCTTV0CDF1RB1p7ud
   HjrC5Y5FhfgJj1rnZ1ZIeTUcKVM+NwHWGnYhHVn5oG8H43RckGRoA8rhr
   kIJWX+ORhXTfXvRnd8vUnv/xJt2yny62m4im7TL6OaKfNqZ1Y+BHfAMsp
   g==;
X-CSE-ConnectionGUID: oP8aNxH+SbqUspNtAxFGxg==
X-CSE-MsgGUID: GWizdMxbS5Wnp7ogdsGO6g==
X-IronPort-AV: E=Sophos;i="6.25,191,1779148800"; 
   d="scan'208";a="24303488"
Received: from ip-10-5-0-115.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.0.115])
  by internal-pdx-out-011.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jul 2026 00:01:32 +0000
Received: from EX19MTAUWC001.ant.amazon.com [205.251.233.53:17120]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.10.59:2525] with esmtp (Farcaster)
 id c2972197-6d4a-4c36-b166-2d06e849c088; Wed, 29 Jul 2026 00:01:31 +0000 (UTC)
X-Farcaster-Flow-ID: c2972197-6d4a-4c36-b166-2d06e849c088
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWC001.ant.amazon.com (10.250.64.174) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.45;
 Wed, 29 Jul 2026 00:01:31 +0000
Received: from dev-dsk-akiyano-1c-2138b29d.eu-west-1.amazon.com (172.19.83.6)
 by EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.45;
 Wed, 29 Jul 2026 00:01:26 +0000
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
To: David Woodhouse <dwmw2@infradead.org>
CC: Arthur Kiyanovski <akiyano@amazon.com>, David Miller
	<davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
	<netdev@vger.kernel.org>, Richard Cochran <richardcochran@gmail.com>, "Eric
 Dumazet" <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, "Thomas
 Gleixner" <tglx@linutronix.de>, Miroslav Lichvar <mlichvar@redhat.com>,
	"Andrew Lunn" <andrew+netdev@lunn.ch>, Wen Gu <guwen@linux.alibaba.com>, Xuan
 Zhuo <xuanzhuo@linux.alibaba.com>, Yonatan Sarna <ysarna@amazon.com>, "Zorik
 Machulsky" <zorik@amazon.com>, Alexander Matushevsky <matua@amazon.com>,
	"Saeed Bshara" <saeedb@amazon.com>, Matt Wilson <msw@amazon.com>, Anthony
 Liguori <aliguori@amazon.com>, Nafea Bshara <nafea@amazon.com>, Evgeny
 Schmeilin <evgenys@amazon.com>, Netanel Belgazal <netanel@amazon.com>, Ali
 Saidi <alisaidi@amazon.com>, Benjamin Herrenschmidt <benh@amazon.com>, Noam
 Dagan <ndagan@amazon.com>, David Arinzon <darinzon@amazon.com>, Evgeny
 Ostrovsky <evostrov@amazon.com>, Ofir Tabachnik <ofirt@amazon.com>, Amit
 Bernstein <amitbern@amazon.com>, <linux-kselftest@vger.kernel.org>,
	<linux-doc@vger.kernel.org>, <shuah@kernel.org>, Jonathan Corbet
	<corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, Simon Horman
	<horms@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	<vadim.fedorenko@linux.dev>
In-Reply-To: <1a5c0883140d470657b2cba24b964f5ce71b9a15.camel@infradead.org>
References: <1a5c0883140d470657b2cba24b964f5ce71b9a15.camel@infradead.org>
Date: Wed, 29 Jul 2026 00:01:18 +0000
Message-ID: <178528327891.4304.16568887850580542012.b4-reply@b4>
X-Mailer: b4 0.15.2
X-ClientProxiedBy: EX19D033UWA002.ant.amazon.com (10.13.139.10) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)

On 2026-07-27 10:03:28+01:00, David Woodhouse wrote:
> On Fri, 2026-07-17 at 06:59 +0000, Arthur Kiyanovski wrote:
> 
> > Introduce two new ioctls that extend existing PTP timestamp interfaces
> > with clock quality information:
> >
> > - PTP_SYS_OFFSET_EXTENDED_ATTRS: Extends PTP_SYS_OFFSET_EXTENDED
> > - PTP_SYS_OFFSET_PRECISE_ATTRS: Extends PTP_SYS_OFFSET_PRECISE
> >
> > These ioctls provide quality attributes alongside timestamps:
> >
> > 1. error_bound: Maximum deviation from true time (nanoseconds), based
> >    on device's internal clock state
> > 2. clock_status: Synchronization state (unknown, initializing,
> >    synchronized, free-running, unreliable)
> > 3. timescale: Time reference (TAI, UTC, etc.)
> > 4. counter_value: Raw system counter (e.g. TSC ticks) captured by the
> >    timekeeping core alongside each system timestamp
> > 5. counter_id: Identifies the counter source (e.g. TSC, ARM arch counter)
> >
> > This supports three use cases:
> >
> > 1. Managed PHC devices (e.g., ENA, vmclock) that maintain their own
> >    synchronization and can report quality metrics directly to userspace
> >    without requiring ptp4l
> >
> > 2. Applications that need complete time quality information in a single
> >    call, regardless of how the PHC is synchronized
> >
> > 3. VMMs that need raw system counter values paired
> >    with PTP timestamps for feed-forward clock calibration, avoiding the
> >    feedback loop inherent in NTP-style synchronization
> >
> > Timescale definitions use a Continuity/Discipline framework to describe
> > timeline properties and steering behavior consistently across all
> > entries.
> >
> > This implementation is based on the original RFC and the UAPI design
> > discussion linked below.
> >
> > Link: https://lore.kernel.org/netdev/20250724115657.150-1-darinzon@amazon.com/
> > Link: https://lore.kernel.org/all/87se7ht25o.ffs@tglx/
> > Signed-off-by: Amit Bernstein <amitbern@amazon.com>
> > Signed-off-by: Arthur Kiyanovski <akiyano@amazon.com>
> 
> ...
> 
> > +static long ptp_sys_offset_extended_attrs(struct ptp_clock *ptp, void __user *arg)
> > +{
> > +	struct ptp_sys_offset_attrs *data __free(kfree) = NULL;
> > +	struct ptp_attrs_request request;
> > +	struct ptp_system_timestamp sts;
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
> 
> I hate all this line wrapping, btw. I'll defer to the net coding style
> if they insist, but my preference would just be just to have longer
> lines. Especially when it's a block of assignments like this, the
> wrapped form is *much* harder to read.
>

Agreed — I'll reduce the wrapping in v6 (a local temp var + a small helper
make that block read much better). Thanks.
 
> > +		data->timestamps[i].pre_systime.sys_counter_id =
> > +			sts.pre_sts.cs_id;
> 
> You added PTP_COUNTER_* constants as we discussed¹... but didn't you
> forget to *map* to them here?
> 
> ¹ https://lore.kernel.org/all/877boqtg3g.ffs@tglx/
>

Good catch — you're right, that's a bug. I'll add the csid→PTP_COUNTER_*
mapping in v6. 

> 
> Arguably, if the timestamps have a hw_csid then you should be returning
> that in place of the main one which will be kvmclock or hyperv
> nonsense. You can do that here for extended_attrs but precise_attrs
> will need a bit more work (as system_device_crosststamp doesn't have
> the hw_* fields). I won't randomise you further by asking you to handle
> that though. I'll do it in a follow-up.
> 

Thanks — I'll leave the hw_csid part for your follow-up as you offered. This
series exposes the base cs_id and leaves room to add it without an ABI
change.

> You can either map KVMCLOCK to unknown or give it a
> PTP_COUNTER_KVMCLOCK if you prefer. I suggest the former, as nobody who
> cares about time should be using kvmclock. And it means my promised
> follow-up will be providing counter data which previously wasn't
> provided, rather than *changing* what's provided.

Will do the former in v6 — map KVMCLOCK to UNKNOWN — so your follow-up adds
new counter data rather than changing existing values. Thanks.

