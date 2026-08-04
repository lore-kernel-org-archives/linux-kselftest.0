Received: from sender4-of-o52.zoho.com (sender4-of-o52.zoho.com [136.143.188.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD8B649552D;
	Tue,  4 Aug 2026 18:00:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785866434; cv=pass; b=LLrVBV8tiX8zNkKtZecgunwGK09FbAF6O3AOHrm8CjSuNLTUmUFe7rhhDl2kFDmKA1g3FErl2nSoCTS29j68YsvskseVdmuWBcxwy1j8x3ZAiIJ0D24P0VW6Rfs8i/l3H9ad/NkBdQUKatdBvdA5TJUCA/oZDUIRgr31b/cWEgQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785866434; c=relaxed/simple;
	bh=SwJCU6dzIpARsSxB4INX7Wbgfj/GVUgzjebrU0XPmg8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=F1vi2KS/X02LLayWad+10DLzx8KWpkMg1ILQjrU5FM1PpwdgatkEuQmIL6BscISSbxW3cMzFsznZjQQHXDDF+AZqof2/izrVZM8JDZiZgu+tjPdnLmKe1WY3ozyy7Jllj1K06CmJ2OCfDSnCRT8pPZEkggsrP5hxq/NJebkRHME=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=machnikowski.net; spf=pass smtp.mailfrom=machnikowski.net; dkim=pass (2048-bit key) header.d=machnikowski.net header.i=maciek@machnikowski.net header.b=PiSNxoTV; arc=pass smtp.client-ip=136.143.188.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=machnikowski.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=machnikowski.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=machnikowski.net header.i=maciek@machnikowski.net header.b="PiSNxoTV"
ARC-Seal: i=1; a=rsa-sha256; t=1785866366; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=OnC5K4A/dzXaV6HATJklnN+Hw+yBdk3rqZmBuHrYk7jSO/sScIaX68QnXW1tR8mmQ6t0BsXU1L/dVki81tCF7WwcBFuOba042vQ37JeuooxED+/ZQpoDQnex8stB3eGwmRypaIEprc3K4q5DKM5MZduwDtgbKhuaKxqBOwVq3So=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1785866366; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=4Hx63wYyhpUz8/M2kRLyuJ7fuvr6MmVRCdKtXgYif5s=; 
	b=bpul9Si9UyKF/yNA59FdLe63GAZ5nc1+ysxs6HNOcl6rVyFF+yodf7ZzdohdEzvSGNGT7TSxn4Qh045mKuk0jcZd5Q/24Xp+A/FBYNOdxUg3bgwMbQJ0C3Nb7wHvjai3v50PRAGhWwAPcRiGgU0gyovntZg2qfkuOiTLtWpusb8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=machnikowski.net;
	spf=pass  smtp.mailfrom=maciek@machnikowski.net;
	dmarc=pass header.from=<maciek@machnikowski.net>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1785866365;
	s=zoho; d=machnikowski.net; i=maciek@machnikowski.net;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=4Hx63wYyhpUz8/M2kRLyuJ7fuvr6MmVRCdKtXgYif5s=;
	b=PiSNxoTVfKmD8NiFTgrFFqTOG7ZUeM3fwcE7ZgNbNMELHo0fICOyPRC9ZipP2vxM
	mOMpcgqfVbHjrZ5c+SAts5+QhfXSAMctQZRT8E0jWE6yTY1TSZuSG2/Oe0ma4lPS+cz
	aKtvi9GElocGs5IKV/QzglCjkBwaG7NHpgB7M4hohpL9K/Ht8RcnSxTYA7LRzKWI9iz
	hC0e49KPLO+AcJuc1jTThwcfvarpmT/7WBwAk5q8hGm73QWS+20YQ+wY5DMdZhssqN8
	X/SAm9RCSOR8iJ2WMZ2uQ8FRHCLpRj1hvzkyyT5D2azJUI3+vM/p0S5hXbicDiXNl4Z
	0+ey0GsWvQ==
Received: by mx.zohomail.com with SMTPS id 1785866362148587.1866007291997;
	Tue, 4 Aug 2026 10:59:22 -0700 (PDT)
Message-ID: <d43d255a-4a67-44c7-ab1e-5e08ac01a9c6@machnikowski.net>
Date: Tue, 4 Aug 2026 19:59:14 +0200
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 net-next 1/7] ptp: Add ioctls for PHC timestamps with
 quality attributes
To: Arthur Kiyanovski <akiyano@amazon.com>, David Miller
 <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Richard Cochran <richardcochran@gmail.com>, netdev@vger.kernel.org
Cc: Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
 David Woodhouse <dwmw2@infradead.org>, Thomas Gleixner <tglx@linutronix.de>,
 Miroslav Lichvar <mlichvar@redhat.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 Andrew Lunn <andrew@lunn.ch>, Carolina Jubran <cjubran@nvidia.com>,
 Wen Gu <guwen@linux.alibaba.com>, Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
 David Woodhouse <dwmw@amazon.com>, Yonatan Sarna <ysarna@amazon.com>,
 Zorik Machulsky <zorik@amazon.com>, Alexander Matushevsky
 <matua@amazon.com>, Saeed Bshara <saeedb@amazon.com>,
 Matt Wilson <msw@amazon.com>, Anthony Liguori <aliguori@amazon.com>,
 Nafea Bshara <nafea@amazon.com>, Evgeny Schmeilin <evgenys@amazon.com>,
 Netanel Belgazal <netanel@amazon.com>, Ali Saidi <alisaidi@amazon.com>,
 Benjamin Herrenschmidt <benh@amazon.com>, Noam Dagan <ndagan@amazon.com>,
 David Arinzon <darinzon@amazon.com>, Evgeny Ostrovsky <evostrov@amazon.com>,
 Ofir Tabachnik <ofirt@amazon.com>, Amit Bernstein <amitbern@amazon.com>,
 linux-kselftest@vger.kernel.org, linux-doc@vger.kernel.org,
 shuah@kernel.org, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>, Simon Horman <horms@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>, vadim.fedorenko@linux.dev
References: <20260729233740.16516-1-akiyano@amazon.com>
 <20260729233740.16516-2-akiyano@amazon.com>
Content-Language: en-US
From: Maciek Machnikowski <maciek@machnikowski.net>
In-Reply-To: <20260729233740.16516-2-akiyano@amazon.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External



On 30/07/2026 01:37, Arthur Kiyanovski wrote:
> Introduce two new ioctls that extend existing PTP timestamp interfaces
> with clock quality information:
> 

>  
> +/*
> + * Clock status values for struct ptp_clock_attrs.status
> + */
> +enum ptp_clock_status {
> +	/* Clock synchronization status cannot be reliably determined */
> +	PTP_CLOCK_STATUS_UNKNOWN      = 0,
> +
> +	/* Clock is acquiring synchronization */
> +	PTP_CLOCK_STATUS_INITIALIZING = 1,
> +
> +	/* Clock is synchronized and maintained accurately by the device */
> +	PTP_CLOCK_STATUS_SYNCED       = 2,
> +
> +	/*
> +	 * Clock is drifting but remains within acceptable error bounds;
> +	 * error_bound is valid and can be trusted.
> +	 */
> +	PTP_CLOCK_STATUS_HOLDOVER     = 3,
> +
> +	/*
> +	 * Clock is free-running: not currently disciplined toward a reference
> +	 * (unlike HOLDOVER), but coasting on a known oscillator. error_bound
> +	 * remains valid and can be trusted, and typically grows over time.
> +	 */
> +	PTP_CLOCK_STATUS_FREE_RUNNING = 4,
> +
> +	/*
> +	 * Clock is considered broken (e.g. the oscillator is faulty or
> +	 * abnormally unstable): error_bound cannot be trusted. A clock that is
> +	 * merely unsynchronized or resynchronizing should report
> +	 * PTP_CLOCK_STATUS_UNKNOWN or PTP_CLOCK_STATUS_INITIALIZING instead.
> +	 */
> +	PTP_CLOCK_STATUS_UNRELIABLE   = 5
What is the practical use of UNRELIABLE vs UNKNOWN.
I think it can be simplified to UNRELIABLE, SYNCED and HOLDOVER. All
clocks will start in UNRELIABLE, switch to SYNCED whenever the clock
gets synchronized correctly and enter HOLDOVER if it was at the SYNCED
state and report the last synced for that state. Status INITIALIZING has
no practical meaning and requires more work from the APIs, and
HOLDOVER->FREE_RUNNING state transition is undefined (what is
"acceptable" for one application won't be acceptable for another)

> +};
> +
> +/*
> + * Clock timescale values for struct ptp_clock_attrs.timescale.
> + *
> + * These definitions describe the mathematical properties and reference
> + * epochs of the timescale provided by the PHC.
> + *
> + * Discipline: Describes the frequency/phase steering behavior.
> + * Continuity: Describes whether the timeline is uninterrupted.
> + */
> +enum ptp_clock_timescale {
> +	/* Unknown or unspecified timescale */
> +	PTP_TIMESCALE_UNKNOWN = 0,
> +
> +	/********************* Absolute Atomic Timescales *********************
> +	 * These timescales are continuous, monotonic standards based on atomic
> +	 * physics. They do not experience phase jumps.
> +	 **********************************************************************/
> +
> +	/**
> +	 * International Atomic Time (TAI)
> +	 * Epoch: 1958-01-01 00:00:00.
> +	 * Continuity: Strictly monotonic and continuous; no leap seconds.
> +	 * Discipline: Primary atomic reference; no phase jumps.
> +	 */
> +	PTP_TIMESCALE_TAI = 1,
> +
> +	/**
> +	 * Terrestrial Time (TT)
> +	 * Epoch: 1958-01-01 00:00:00.
> +	 * Continuity: Strictly monotonic and continuous; no leap seconds.
> +	 * Discipline: Defined as TAI + 32.184s constant offset.
> +	 */
> +	PTP_TIMESCALE_TT = 2,
> +
> +	/**
> +	 * Global Positioning System (GPS) Time
> +	 * Epoch: 1980-01-06 00:00:00.
> +	 * Continuity: Strictly monotonic and continuous; no leap seconds.
> +	 * Discipline: Defined by the GPS constellation; fixed offset from TAI.
> +	 */
> +	PTP_TIMESCALE_GPS = 3,
> +
> +	/****************** UTC-Based Timescales (Civil Time) *****************
> +	 * These timescales are derived from TAI but adjusted to align with
> +	 * the Earth's rotation, primarily through leap seconds.
> +	 **********************************************************************/
> +
> +	/**
> +	 * Coordinated Universal Time (UTC) - Wall-clock (CLOCK_REALTIME)
> +	 * Epoch: 1970-01-01 00:00:00 (Unix epoch).
> +	 * Continuity: Discontinuous; subject to 1-second leap second
> +	 *             phase jumps.
> +	 * Discipline: Frequency steered; incorporates leap second corrections.
> +	 *
> +	 * Note: Leap-smeared UTC MUST NOT be advertised as PTP_TIMESCALE_UTC.
> +	 * Smear algorithms are not standardized and the resulting timescale
> +	 * is ambiguous. Implementations using smeared UTC MUST advertise
> +	 * PTP_TIMESCALE_UNKNOWN or PTP_TIMESCALE_PROPRIETARY instead.
> +	 */
> +	PTP_TIMESCALE_UTC = 4,
> +
> +	/**
> +	 * POSIX Time (Unix Time)
> +	 * Epoch: 1970-01-01 00:00:00.
> +	 * Continuity: Discontinuous; leap seconds handled by
> +	 *             repeating/skipping values.
> +	 * Discipline: Follows UTC frequency steering and phase jumps.
> +	 */
> +	PTP_TIMESCALE_POSIX = 5,
> +
> +	/****************** System-Relative Monotonic Clocks ******************
> +	 * These timescales are relative to a system event (like boot)
> +	 * and are not synchronized to an external atomic standard.
> +	 **********************************************************************/
> +
> +	/**
> +	 * Monotonic System Clock (CLOCK_MONOTONIC)
> +	 * Epoch: Arbitrary (System boot time).
> +	 * Continuity: Strictly monotonic; no leap seconds.
> +	 * Discipline: Frequency steered to match system reference;
> +	 *             does not advance during suspend.
> +	 */
> +	PTP_TIMESCALE_MONOTONIC = 6,
> +
> +	/**
> +	 * Raw Monotonic System Clock (CLOCK_MONOTONIC_RAW)
> +	 * Epoch: Arbitrary (System boot time).
> +	 * Continuity: Strictly monotonic; no leap seconds.
> +	 * Discipline: Raw hardware oscillator; no frequency steering
> +	 *             or discipline.
> +	 */
> +	PTP_TIMESCALE_MONOTONIC_RAW = 7,
> +
> +	/**
> +	 * Boot Time System Clock (CLOCK_BOOTTIME)
> +	 * Epoch: Arbitrary (System boot time).
> +	 * Continuity: Strictly monotonic and continuous; no leap seconds.
> +	 * Discipline: Frequency steered to match system reference;
> +	 *             advances during suspend.
> +	 */
> +	PTP_TIMESCALE_BOOTTIME = 8,
> +
> +	/********************** Vendor-Specific Timescale *********************/
> +
> +	/* A proprietary or vendor-specific timescale with custom rules. */
> +	PTP_TIMESCALE_PROPRIETARY = 9,
> +};
Do we need this many timescales defined here? Can't we just use the
notion of TIMESCALE_ARBITRARY and TIMESCALE_ABSOLUTE with the UTC
offset? CLOCK_MONOTONIC / MONOTONIC_RAW are really ARBITRARY, is there
any value of differentating between those two?
 > +
>  /*
>   * struct ptp_clock_time - represents a time value
>   *
> @@ -94,6 +237,136 @@ struct ptp_clock_time {
>  	__u32 reserved;
>  };
>  
> +/*
> + * Hardware counter identifiers for struct ptp_sys_time.sys_counter_id
> + */
> +enum ptp_counter_id {
> +	/* Counter value not available or type not specified */
> +	PTP_COUNTER_UNKNOWN = 0,
> +
> +	/* x86 Time Stamp Counter (TSC) */
> +	PTP_COUNTER_X86_TSC = 1,
> +
> +	/* ARM Generic Timer virtual counter */
> +	PTP_COUNTER_ARM_ARCH = 2,
> +};
> +
> +/* Valid flags for struct ptp_clock_attrs.valid */
> +#define PTP_ATTRS_VALID_ERROR_BOUND	(1 << 0)
> +#define PTP_ATTRS_VALID_TIMESCALE	(1 << 1)
> +#define PTP_ATTRS_VALID_STATUS		(1 << 2)
> +
> +/**
> + * struct ptp_clock_attrs - quality attributes for a PHC timestamp
> + *
> + * @valid:       Bitmask of PTP_ATTRS_VALID_* indicating which fields
> + *               are populated. Zero means no attributes available.
> + * @error_bound: Maximum error (an upper bound, in nanoseconds) between the
> + *               returned device_time and true time on the advertised
> + *               @timescale; a worst-case bound, not a statistical estimate.
> + *               Valid only when PTP_ATTRS_VALID_ERROR_BOUND is set, and must
> + *               not be trusted when @status is PTP_CLOCK_STATUS_UNKNOWN or
> + *               PTP_CLOCK_STATUS_UNRELIABLE.
> + * @timescale:   Clock timescale (enum ptp_clock_timescale). Valid only
> + *               when PTP_ATTRS_VALID_TIMESCALE is set.
> + * @status:      Synchronization status (enum ptp_clock_status). Valid
> + *               only when PTP_ATTRS_VALID_STATUS is set. Transitions between
> + *               states are device-specific; there are no kernel-defined
> + *               thresholds relating @status to @error_bound.
> + * @rsv:         Reserved for future use, must be zero.
> + */
> +struct ptp_clock_attrs {
> +	__u32 valid;
> +	__u32 error_bound;
> +	__u32 timescale;
> +	__u32 status;
> +	__u32 rsv[4];
> +};
This does not look like a practical model. Error bounds changes over
time and will get stale by the time you transfer them over IOCTL.

I think a more practical approach would be to return error_bound
alongside the anchor_timestamp at which it was measured. For example you
can define master_offset for the RX timestamp of the Sync packet, or the
offset for the last 1PPS signal you received. This should be
complemented by some drift_factor that would define how fast it grows.

If you capture the time from the PHC you can use the formula of
error_bound+(phc_time - anchor_timestamp)*drift_factor to interpolate
the boundaries.

Do we want to squash all errors into a single error_bound - it may make
sense to add the hw_error and sync_error - hw_error would squash
hw-based error bounds (such as clock resolution, GNSS precision) and
sync_error (which would hold the dynamic part derived from the sync
protocol)

Thanks,
Maciek
