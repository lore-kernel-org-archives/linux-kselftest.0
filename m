Received: from pdx-out-012.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-012.esa.us-west-2.outbound.mail-perimeter.amazon.com [35.162.73.231])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F11C01A9FA0;
	Wed, 29 Jul 2026 00:25:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=35.162.73.231
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785284748; cv=none; b=sOdMSy+hK6XkIjOAFAICqA5wq1Ifs9ufZf60RQFD2Ip9WXjJ21xbeaZGFajcudagnzjdSuHZNxzCpI2gp087q/+tLXpBvApvwyageqkkAcMDeFm2BWDiamdlo1GicDsTverP2ZUuwWTwNHFyeXajjUdmZ6ToEPH7snyy1Z6SClw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785284748; c=relaxed/simple;
	bh=sn85DsfhNJp9/lGpXpfl2TNggUvlG9sxHIsmU3XX61w=;
	h=MIME-Version:Content-Type:Subject:From:To:CC:In-Reply-To:
	 References:Date:Message-ID; b=WXnv3ZXBmVqoJkqzWaLYFxLGTcVbC1V0vLS8pAY2TLLlygAaXXNofItgxfNcC51VXToQOdNbDYQPyV43qz8WXBps/SvYbmDM+VR5K3bExzQd+IaWraVV+9uoGZ5uRdx6eG9/obsKYY4afSnYO/CJMgt+LrL482Tr3BitQTH5mF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com; spf=pass smtp.mailfrom=amazon.com; dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b=Ry+Rwdcp; arc=none smtp.client-ip=35.162.73.231
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b="Ry+Rwdcp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1785284746; x=1816820746;
  h=mime-version:content-transfer-encoding:subject:from:to:
   cc:in-reply-to:references:date:message-id;
  bh=3Qu7iQQTfMqyd+q9siW7b9oN9ZueDTI9o6UwkN35qPM=;
  b=Ry+Rwdcp6eYG7sk0LkWAEGBLHSfwlsNKfKGmHfwHuB11vH8mhY0ibPqz
   tzmgUcFqldLWz2JL61xfZTy1UpG6U4FmQfZnR9L7KGefuDSkhIYyYfVMK
   3+6flskdgdxXVSIYiEobSxgTSR1yI9qsrNUQXqnEt1IO1Jp48yC4M0F9H
   wXuYCy3wSBoSfcMsT1Mc3zkBUcBcHIBVKHs03A0U8b4tlOkWRbipXD7O9
   nHfvjxs8jECgrtu6q0NPXttkAGbJOFnhynZX1RLG7WGfga5VTgGCsSzU1
   aUHuORL5mWILmJBrW3gdj4VjblEn01N+QjJKeVxLy0kUXRfxWNK7qpUcG
   Q==;
X-CSE-ConnectionGUID: fJ9i4POmTICogX1gfo0a8Q==
X-CSE-MsgGUID: Yzx29igPTCKMchZDsUfcKg==
X-IronPort-AV: E=Sophos;i="6.25,191,1779148800"; 
   d="scan'208";a="24327348"
Received: from ip-10-5-12-219.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.12.219])
  by internal-pdx-out-012.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jul 2026 00:25:44 +0000
Received: from EX19MTAUWA001.ant.amazon.com [205.251.233.182:21671]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.10.59:2525] with esmtp (Farcaster)
 id 2278361b-149b-4fa5-91d6-4c97f2e8d4fd; Wed, 29 Jul 2026 00:25:43 +0000 (UTC)
X-Farcaster-Flow-ID: 2278361b-149b-4fa5-91d6-4c97f2e8d4fd
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWA001.ant.amazon.com (10.250.64.204) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.45;
 Wed, 29 Jul 2026 00:25:43 +0000
Received: from dev-dsk-akiyano-1c-2138b29d.eu-west-1.amazon.com (172.19.83.6)
 by EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.45;
 Wed, 29 Jul 2026 00:25:38 +0000
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v4 net-next 1/7] ptp: Add ioctls for PHC timestamps
 with quality attributes
From: Arthur Kiyanovski <akiyano@amazon.com>
To: Carolina Jubran <cjubran@nvidia.com>
CC: Arthur Kiyanovski <akiyano@amazon.com>, <netdev@vger.kernel.org>, "Richard
 Cochran" <richardcochran@gmail.com>, Eric Dumazet <edumazet@google.com>,
	"Paolo Abeni" <pabeni@redhat.com>, David Woodhouse <dwmw2@infradead.org>,
	"Thomas Gleixner" <tglx@linutronix.de>, Miroslav Lichvar
	<mlichvar@redhat.com>, "Andrew Lunn" <andrew+netdev@lunn.ch>, Wen Gu
	<guwen@linux.alibaba.com>, Xuan Zhuo <xuanzhuo@linux.alibaba.com>, David
 Woodhouse <dwmw@amazon.com>, "Yonatan Sarna" <ysarna@amazon.com>, Zorik
 Machulsky <zorik@amazon.com>, "Alexander Matushevsky" <matua@amazon.com>,
	Saeed Bshara <saeedb@amazon.com>, Matt Wilson <msw@amazon.com>, Anthony
 Liguori <aliguori@amazon.com>, Nafea Bshara <nafea@amazon.com>, Evgeny
 Schmeilin <evgenys@amazon.com>, Netanel Belgazal <netanel@amazon.com>, Ali
 Saidi <alisaidi@amazon.com>, Benjamin Herrenschmidt <benh@amazon.com>, Noam
 Dagan <ndagan@amazon.com>, David Arinzon <darinzon@amazon.com>, Evgeny
 Ostrovsky <evostrov@amazon.com>, Ofir Tabachnik <ofirt@amazon.com>, Amit
 Bernstein <amitbern@amazon.com>, <linux-kselftest@vger.kernel.org>,
	<linux-doc@vger.kernel.org>, <shuah@kernel.org>, Jonathan Corbet
	<corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, Simon Horman
	<horms@kernel.org>, <vadim.fedorenko@linux.dev>, Jakub Kicinski
	<kuba@kernel.org>, David Miller <davem@davemloft.net>
In-Reply-To: <58700765-8c3c-45a2-ae12-1f8ff46f4725@nvidia.com>
References: <20260714020340.25014-1-akiyano@amazon.com>
 <20260714020340.25014-2-akiyano@amazon.com>
 <58700765-8c3c-45a2-ae12-1f8ff46f4725@nvidia.com>
Date: Wed, 29 Jul 2026 00:25:30 +0000
Message-ID: <178528473048.4304.18226079918671904614.b4-reply@b4>
X-Mailer: b4 0.15.2
X-ClientProxiedBy: EX19D035UWA004.ant.amazon.com (10.13.139.109) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)

On 2026-07-28 10:52:52+03:00, Carolina Jubran wrote:
> On 14/07/2026 5:03, Arthur Kiyanovski wrote:
> 
> > +/*
> > + * Clock status values for struct ptp_clock_attrs.status
> > + */
> > +enum ptp_clock_status {
> > +	/* Clock synchronization status cannot be reliably determined */
> > +	PTP_CLOCK_STATUS_UNKNOWN      = 0,
> > +
> > +	/* Clock is acquiring synchronization */
> > +	PTP_CLOCK_STATUS_INITIALIZING = 1,
> > +
> > +	/* Clock is synchronized and maintained accurately by the device */
> > +	PTP_CLOCK_STATUS_SYNCED       = 2,
> > +
> > +	/* Clock is drifting but remains within acceptable error bounds */
> > +	PTP_CLOCK_STATUS_HOLDOVER     = 3,
> > +
> > +	/* Clock is drifting without adjustments or synchronization */
> > +	PTP_CLOCK_STATUS_FREE_RUNNING = 4,
> > +
> > +	/* Clock is unreliable, the error_bound value cannot be trusted */
> > +	PTP_CLOCK_STATUS_UNRELIABLE   = 5
> > +};
> 
> Could you clarify the intended distinction between FREE_RUNNING and
> UNRELIABLE? What does UNRELIABLE represent beyond FREE_RUNNING?
>

They're on different axes. FREE_RUNNING means the clock isn't being
disciplined but is coasting on a known oscillator, so error_bound is still
meaningful and can be trusted (it grows predictably) — ptp_vmclock keeps
populating it from the counter-period max-error rate in this state.
UNRELIABLE instead means the clock is considered broken (e.g. the oscillator
is faulty or abnormally unstable), so error_bound must not be trusted. This
mirrors the VMClock specification [1], which defines FREERUNNING parameters
as "expected to be valid and may be relied upon" and UNRELIABLE as the clock
being "considered broken … should not be relied upon". A clock that is
merely unsynchronized or resynchronizing (e.g. after a disruption) is better
represented by UNKNOWN or INITIALIZING. I'll update the enum comments
accordingly in v6.

[1] https://uapi-group.org/specifications/specs/vmclock/
 
> 
> Also, how is userspace expected to relate clock_status to error_bound?
> Are there defined thresholds for transitions between the states or are
> these entirely device-specific?
>

There are deliberately no kernel-defined thresholds — transitions are
device-specific. status is a qualitative hint, error_bound the quantitative
value, each gated by its own valid bit; the only defined cross-relation is
that error_bound must not be trusted when status is UNKNOWN or UNRELIABLE.
Fixed thresholds would be arbitrary across devices/hypervisors. I'll
document this in v6.
 
> > +
> > +/*
> > + * Clock timescale values for struct ptp_clock_attrs.timescale.
> > + *
> > + * These definitions describe the mathematical properties and reference
> > + * epochs of the timescale provided by the PHC.
> > + *
> > + * Discipline: Describes the frequency/phase steering behavior.
> > + * Continuity: Describes whether the timeline is uninterrupted.
> > + */
> > +enum ptp_clock_timescale {
> > +	/* Unknown or unspecified timescale */
> > +	PTP_TIMESCALE_UNKNOWN = 0,
> > +
> > +	/********************* Absolute Atomic Timescales *********************
> > +	 * These timescales are continuous, monotonic standards based on atomic
> > +	 * physics. They do not experience phase jumps.
> > +	 **********************************************************************/
> > +
> > +	/**
> > +	 * International Atomic Time (TAI)
> > +	 * Epoch: 1958-01-01 00:00:00.
> > +	 * Continuity: Strictly monotonic and continuous; no leap seconds.
> > +	 * Discipline: Primary atomic reference; no phase jumps.
> > +	 */
> > +	PTP_TIMESCALE_TAI = 1,
> > +
> > +	/**
> > +	 * Terrestrial Time (TT)
> > +	 * Epoch: 1958-01-01 00:00:00.
> > +	 * Continuity: Strictly monotonic and continuous; no leap seconds.
> > +	 * Discipline: Defined as TAI + 32.184s constant offset.
> > +	 */
> > +	PTP_TIMESCALE_TT = 2,
> > +
> > +	/**
> > +	 * Global Positioning System (GPS) Time
> > +	 * Epoch: 1980-01-06 00:00:00.
> > +	 * Continuity: Strictly monotonic and continuous; no leap seconds.
> > +	 * Discipline: Defined by the GPS constellation; fixed offset from TAI.
> > +	 */
> > +	PTP_TIMESCALE_GPS = 3,
> > +
> > +	/****************** UTC-Based Timescales (Civil Time) *****************
> > +	 * These timescales are derived from TAI but adjusted to align with
> > +	 * the Earth's rotation, primarily through leap seconds.
> > +	 **********************************************************************/
> > +
> > +	/**
> > +	 * Coordinated Universal Time (UTC) - Wall-clock (CLOCK_REALTIME)
> > +	 * Epoch: 1970-01-01 00:00:00 (Unix epoch).
> > +	 * Continuity: Discontinuous; subject to 1-second leap second
> > +	 *             phase jumps.
> > +	 * Discipline: Frequency steered; incorporates leap second corrections.
> > +	 *
> > +	 * Note: Leap-smeared UTC MUST NOT be advertised as PTP_TIMESCALE_UTC.
> > +	 * Smear algorithms are not standardized and the resulting timescale
> > +	 * is ambiguous. Implementations using smeared UTC MUST advertise
> > +	 * PTP_TIMESCALE_UNKNOWN or PTP_TIMESCALE_PROPRIETARY instead.
> > +	 */
> > +	PTP_TIMESCALE_UTC = 4,
> > +
> > +	/**
> > +	 * POSIX Time (Unix Time)
> > +	 * Epoch: 1970-01-01 00:00:00.
> > +	 * Continuity: Discontinuous; leap seconds handled by
> > +	 *             repeating/skipping values.
> > +	 * Discipline: Follows UTC frequency steering and phase jumps.
> > +	 */
> > +	PTP_TIMESCALE_POSIX = 5,
> > +
> > +	/****************** System-Relative Monotonic Clocks ******************
> > +	 * These timescales are relative to a system event (like boot)
> > +	 * and are not synchronized to an external atomic standard.
> > +	 **********************************************************************/
> > +
> > +	/**
> > +	 * Monotonic System Clock (CLOCK_MONOTONIC)
> > +	 * Epoch: Arbitrary (System boot time).
> > +	 * Continuity: Strictly monotonic; no leap seconds.
> > +	 * Discipline: Frequency steered to match system reference;
> > +	 *             does not advance during suspend.
> > +	 */
> > +	PTP_TIMESCALE_MONOTONIC = 6,
> > +
> > +	/**
> > +	 * Raw Monotonic System Clock (CLOCK_MONOTONIC_RAW)
> > +	 * Epoch: Arbitrary (System boot time).
> > +	 * Continuity: Strictly monotonic; no leap seconds.
> > +	 * Discipline: Raw hardware oscillator; no frequency steering
> > +	 *             or discipline.
> > +	 */
> > +	PTP_TIMESCALE_MONOTONIC_RAW = 7,
> > +
> > +	/**
> > +	 * Boot Time System Clock (CLOCK_BOOTTIME)
> > +	 * Epoch: Arbitrary (System boot time).
> > +	 * Continuity: Strictly monotonic and continuous; no leap seconds.
> > +	 * Discipline: Frequency steered to match system reference;
> > +	 *             advances during suspend.
> > +	 */
> > +	PTP_TIMESCALE_BOOTTIME = 8,
> > +
> > +	/********************** Vendor-Specific Timescale *********************/
> > +
> > +	/* A proprietary or vendor-specific timescale with custom rules. */
> > +	PTP_TIMESCALE_PROPRIETARY = 9,
> > +};
> > +
> >   /*
> >    * struct ptp_clock_time - represents a time value
> >    *
> > @@ -94,6 +225,119 @@ struct ptp_clock_time {
> >   	__u32 reserved;
> >   };
> >   
> > +/*
> > + * Hardware counter identifiers for struct ptp_sys_time.sys_counter_id
> > + */
> > +enum ptp_counter_id {
> > +	/* Counter value not available or type not specified */
> > +	PTP_COUNTER_UNKNOWN = 0,
> > +
> > +	/* x86 Time Stamp Counter (TSC) */
> > +	PTP_COUNTER_X86_TSC = 1,
> > +
> > +	/* ARM Generic Timer virtual counter */
> > +	PTP_COUNTER_ARM_ARCH = 2,
> > +};
> > +
> > +/* Valid flags for struct ptp_clock_attrs.valid */
> > +#define PTP_ATTRS_VALID_ERROR_BOUND	(1 << 0)
> > +#define PTP_ATTRS_VALID_TIMESCALE	(1 << 1)
> > +#define PTP_ATTRS_VALID_STATUS		(1 << 2)
> > +
> > +/**
> > + * struct ptp_clock_attrs - quality attributes for a PHC timestamp
> > + *
> > + * @valid:       Bitmask of PTP_ATTRS_VALID_* indicating which fields
> > + *               are populated. Zero means no attributes available.
> > + * @error_bound: Maximum error in nanoseconds. Valid only when
> > + *               PTP_ATTRS_VALID_ERROR_BOUND is set.
> > + * @timescale:   Clock timescale (enum ptp_clock_timescale). Valid only
> > + *               when PTP_ATTRS_VALID_TIMESCALE is set.
> > + * @status:      Synchronization status (enum ptp_clock_status). Valid
> > + *               only when PTP_ATTRS_VALID_STATUS is set.
> > + * @rsv:         Reserved for future use, must be zero.
> > + */
> > +struct ptp_clock_attrs {
> > +	__u32 valid;
> > +	__u32 error_bound;
> 
> Error relative to what? The advertised timescale's true time, or the
> device's sync source? And is this a hard bound or an estimate?

It's an upper bound (maximum error) in nanoseconds on the offset between
device_time and true time on the advertised @timescale — not relative to an
internal sync source, and a bound, not a statistical estimate. This follows
the VMClock specification's [1] error model, which advertises maximum error
bounds (T₁ ± time_maxerror, P ± counter_period_maxerror) as distinct from
the estimated-error fields; we expose the maximum. On ENA it's the
device-reported "timestamp error limit (nsec)". I'll clarify the
@error_bound kernel-doc in v6.


