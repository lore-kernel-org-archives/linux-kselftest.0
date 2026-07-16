Received: from pdx-out-005.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-005.esa.us-west-2.outbound.mail-perimeter.amazon.com [52.13.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A5433B42C7;
	Thu, 16 Jul 2026 08:09:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=52.13.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784189370; cv=none; b=m4CdTXRjYXWn41xIUVy9oJcbzB9LqyXFwvAIEACwrosKxxx3HJngHQGXZGTPIg73OJwZj4Gh/UW3rw8f+acurV9ITOPkLs+yUKm0La+pu2Mttfbv0xM3U6kmpo/A/4nFJw0SUBjNRuZdcdsV3peYEor1h/EQ/EuVrrdtR+bePhE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784189370; c=relaxed/simple;
	bh=KDYGovPpoy8+ieNqYU8yv+NUZXC8rL/olHgkf7Vd3jk=;
	h=MIME-Version:Content-Type:Subject:From:To:CC:In-Reply-To:
	 References:Date:Message-ID; b=XluuShrINiMl/s1tYgPNIEuSujG05n7ZNgmz5NCrFWqkBmI877WbnsHFGeTbUasdVTUv+jBu9TqSASjYiuzHsCkheSJfMNDRI23SweV/iJu7YAPi5fwTM6tzN4QGXRgYjJvFT4VjrfwakJZg6iICFPJIofrMlrkQg04g/e2sqlo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com; spf=pass smtp.mailfrom=amazon.com; dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b=bEE+Fn+d; arc=none smtp.client-ip=52.13.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b="bEE+Fn+d"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1784189368; x=1815725368;
  h=mime-version:content-transfer-encoding:subject:from:to:
   cc:in-reply-to:references:date:message-id;
  bh=XcDVyrfd64gdD7dUvl18NLC2YHNxcGbgJy1A7w2T6mc=;
  b=bEE+Fn+dMyrf2d/NTgYiHUr+1qFU5iPiQgHiTeie6P37Rswb0rLLZSam
   N5VGuTjwS4vk6/eHevJSJu/OGpOl4lLsJKjC0Nw3AF6ASjOYqnhEc+S5u
   LqPuLocoL0u699b1xv0Nvj8lu6mSTNhHfSCSxW3VLapiEXXQDxKWKeyB5
   9As/e8PoADQ4NnB8KS1yqMLHSj8AGMsvOu4bVPjAHhAuWWmLaQ1LHUH3p
   jSlvwiEGn2heKXzp7cnPG3IsfT8Y2R06+NP5TfFrrw+2gFrOClK2jOEbX
   7FqVA0k+GaC6fS7kn7nZgVXq86aaWQVSApP3TGiVrrYTKvn0FcNBSn3o7
   g==;
X-CSE-ConnectionGUID: g3W/889rQkS+eRcJPdmimA==
X-CSE-MsgGUID: Sr02H2QLQQaUcCiD5uQSew==
X-IronPort-AV: E=Sophos;i="6.25,167,1779148800"; 
   d="scan'208";a="23755799"
Received: from ip-10-5-0-115.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.0.115])
  by internal-pdx-out-005.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jul 2026 08:09:22 +0000
Received: from EX19MTAUWC001.ant.amazon.com [205.251.233.105:26156]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.41.246:2525] with esmtp (Farcaster)
 id cac0b2bc-03fd-421f-ba5d-42f1813fe893; Thu, 16 Jul 2026 08:09:21 +0000 (UTC)
X-Farcaster-Flow-ID: cac0b2bc-03fd-421f-ba5d-42f1813fe893
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWC001.ant.amazon.com (10.250.64.174) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.43;
 Thu, 16 Jul 2026 08:09:21 +0000
Received: from dev-dsk-akiyano-1c-2138b29d.eu-west-1.amazon.com (172.19.83.6)
 by EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.43;
 Thu, 16 Jul 2026 08:09:15 +0000
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
To: Jacob Keller <jacob.e.keller@intel.com>
CC: Arthur Kiyanovski <akiyano@amazon.com>, David Miller
	<davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
	<netdev@vger.kernel.org>, Richard Cochran <richardcochran@gmail.com>, "Eric
 Dumazet" <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, "David
 Woodhouse" <dwmw2@infradead.org>, Thomas Gleixner <tglx@linutronix.de>,
	Miroslav Lichvar <mlichvar@redhat.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
	Wen Gu <guwen@linux.alibaba.com>, Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	David Woodhouse <dwmw@amazon.com>, Yonatan Sarna <ysarna@amazon.com>, "Zorik
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
	<horms@kernel.org>, <vadim.fedorenko@linux.dev>
In-Reply-To: <e58af0ae-ad06-4f77-8ebd-f3678d6dde66@intel.com>
References: <20260714020340.25014-1-akiyano@amazon.com>
 <20260714020340.25014-2-akiyano@amazon.com>
 <e58af0ae-ad06-4f77-8ebd-f3678d6dde66@intel.com>
Date: Thu, 16 Jul 2026 08:09:06 +0000
Message-ID: <178418934680.25423.291292029139415698.b4-reply@b4>
X-Mailer: b4 0.15.2
X-ClientProxiedBy: EX19D041UWA002.ant.amazon.com (10.13.139.121) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)

On 2026-07-14 17:45:34-07:00, Jacob Keller wrote:
> On 7/13/2026 7:03 PM, Arthur Kiyanovski wrote:
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
> 
> I'm also wondering if this can expose device-known error bounds on
> timestamps even for devices which are operated as synchronized by ptp4l..
>

The intent is for these attributes to represent device-
known clock quality information. The mechanism is
deliberately synchronization-agnostic: drivers may report
any attributes they can meaningfully vouch for, regardless
of how the clock is being disciplined. Thus a device that
genuinely knows a hardware error bound could report it even
if the PHC is being adjusted by ptp4l.

In practice, however, when a PHC is disciplined entirely
from userspace the driver often has little or no visibility
into synchronization quality. The valid bitmask is designed
for exactly this case: a driver advertises only the
attributes it can populate, so anything it cannot determine
is simply reported as unavailable.
 
> > Timescale definitions use a Continuity/Discipline framework to describe
> > timeline properties and steering behavior consistently across all
> > entries.
> > 
> > This implementation is based on the original RFC and the UAPI design
> > discussion linked below.
> 
> Not a dig against this patch set, nor a request that you work to
> implement anything else, but I am beginning to wonder if/when it would
> make sense to transition from ioctl-based implementation to genetlink or
> something. We did something similar for ethtool ioctls a few years ago.
> I know the maintainer for PTP has some distaste for netlink and prefers
> the simplicity of the ioctls.. but I think we're moving past where the
> ioctls are "simple". Now that we have ynl tools, it has gotten easier to
> implement properly. It makes extending the API much easier for the
> future vs the array of ioctls we now carry for legacy implementations.
> 

That's an interesting direction for future PTP UAPI
evolution, and ynl does make that path easier than it used
to be. For this series I've kept to the existing PTP
userspace API model and extended the current timestamping
interfaces in a backwards-compatible way; a move to a
netlink family would be a broader subsystem effort and feels
separate from this work.

> > diff --git a/include/uapi/linux/ptp_clock.h b/include/uapi/linux/ptp_clock.h
> > index 46d45f902486..88c2da6bc8c6 100644
> > --- a/include/uapi/linux/ptp_clock.h
> > +++ b/include/uapi/linux/ptp_clock.h
> > @@ -79,6 +79,137 @@
> >   */
> >  #define PTP_PEROUT_V1_VALID_FLAGS	(0)
> >  
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
> Do you have any thought on how ptp4l synchronizing the clock should
> impact the clock status here? Is this intended purely for device/drivers
> which have their own synchronization and not for ones which expose a
> clock that is synchronized by userspace? Would it make sense to have a
> mode that is something like "this clock has been modified by userspace"
> after any call to the .adjtime or .adjfreq is made?
> 

Regarding a "modified by userspace" mode, I wasn't
planning to add one. Whether adjtime() or adjfreq() was
invoked does not by itself describe the current
synchronization state or quality of the clock. A clock
disciplined from userspace may still be highly accurate. I'd
prefer to keep clock_status focused on clock quality
information that the driver can directly determine rather
than on how the clock is being controlled.

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
> 
> I appreciate the detailed explanations here as it helps to disambiguate
> the modes.
> 

Thanks — glad the breakdown is helpful.

> > @@ -106,7 +350,11 @@ struct ptp_clock_caps {
> >  	/* Whether the clock supports adjust phase */
> >  	int adjust_phase;
> >  	int max_phase_adj; /* Maximum phase adjustment in nanoseconds. */
> > -	int rsv[11];       /* Reserved for future use. */
> > +	/* Whether the clock supports extended timestamps with attributes */
> > +	int extended_attrs;
> > +	/* Whether the clock supports precise cross-timestamps with attributes */
> > +	int precise_attrs;
> > +	int rsv[9];       /* Reserved for future use. */
> 
> I do kind of wish we had opted for bit flags here given the number of
> ints being used as booleans.. :( A lot of wasted reserved space.

Agreed — a flags field would likely have scaled better. I
followed the existing ptp_clock_caps convention (one int per
capability) to stay consistent with the current UAPI
structure rather than mix two styles within the same struct.


