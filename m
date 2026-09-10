Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9807510F1;
	Thu, 10 Sep 2026 08:31:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789029090; cv=none; b=atpe1813tZoVyEWF5olu8CpfA2gZzZ/HkhA0FYAj1mFqjZaE8A8NHTikQL0V5IsErL3hIw0rGlO76NiS2tIx3lt9wPQA+KaYwPjuzolTM2SSARZtNJsFtHN/SpZRPVxpfntVny1cbKu64zZcHPkFI+cLct79wEUxjafbt92ojV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789029090; c=relaxed/simple;
	bh=GWoLpW+zTzblBnXrMZz6IA6+e0I7Bn4gn42iFCGK/6Q=;
	h=Subject:From:To:Cc:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Bm/biNtHJCqfF0SEp4uJ/cGhUSwOQ8bz1chsgFa330nHoJ0VBgw77XjpbRQZk/FzZSuIN29B+ldaVX723ODMt5+LS4L4zAIZoR/yfDOfHAKDDdZuwnP9uKqoePAW3Ou6wW6a3psOERv+0MnS/0mQ18HGT2rel/B+2au7bud37MY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YkK/fw4T; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YkK/fw4T"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9DF331F000FF;
	Thu, 10 Sep 2026 08:31:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789029088;
	bh=ZcXYWSDsdcmQqmRSmgIg+J/ICf5hSz+z7CZaVEb0RZw=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=YkK/fw4T/bCpfQNW8gHhjaT9KErw8XlDQIW86LMUSUYdu5UqBB8Y1kjGW2Zumab5+
	 GAj16pfx64ovJCpAq5WBKQIdBi6hrY8H4NZDsWu9wYjyK9GjJKrlDtRBV9rn3yYqkn
	 gnc/qoTH3oeu4AUOcch643eH55aQ/I/xynHqu/ee3YICVYV37QfekkJsopsUKpLZZp
	 1BDaLViA/dh6ZVt0UUpp0uNErb2Rn/WVvWdq3YJupgHeOAPY5EX9aW+CaU+6dLZEih
	 BC1c4c713qOUYGNNGO7UUZeI1iEC8c510mVuY/dgNGlNDbguLYlYdprurUAROQI75z
	 vgxe+Acv279TA==
Subject: Re: [PATCH v7 net-next 1/7] ptp: Add ioctls for PHC timestamps with
 quality attributes
From: netdev-bot+sashiko@kernel.org
To: akiyano@amazon.com
Cc: davem@davemloft.net, kuba@kernel.org, richardcochran@gmail.com,
 netdev@vger.kernel.org, edumazet@google.com, pabeni@redhat.com,
 dwmw2@infradead.org, tglx@linutronix.de, mlichvar@redhat.com,
 maciek@machnikowski.net, andrew+netdev@lunn.ch, andrew@lunn.ch,
 cjubran@nvidia.com, guwen@linux.alibaba.com, xuanzhuo@linux.alibaba.com,
 dwmw@amazon.com, ysarna@amazon.com, zorik@amazon.com, matua@amazon.com,
 saeedb@amazon.com, msw@amazon.com, aliguori@amazon.com, nafea@amazon.com,
 evgenys@amazon.com, netanel@amazon.com, alisaidi@amazon.com, benh@amazon.com,
 ndagan@amazon.com, darinzon@amazon.com, evostrov@amazon.com, ofirt@amazon.com,
 amitbern@amazon.com, linux-kselftest@vger.kernel.org,
 linux-doc@vger.kernel.org, shuah@kernel.org, corbet@lwn.net,
 skhan@linuxfoundation.org, horms@kernel.org, bhelgaas@google.com,
 vadim.fedorenko@linux.dev, dwmw@amazon.co.uk
Date: Thu, 10 Sep 2026 08:31:25 +0000
Message-ID: <178902908512.219967.2016362197342682155@kernel.org>
In-Reply-To: <20260909073136.12863-2-akiyano@amazon.com>
References: <20260909073136.12863-2-akiyano@amazon.com>
X-sashiko-severity: Medium
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Thank you for your contribution! Sashiko AI review found 8 potential
issue(s) to consider:

Critical: 0 · High: 0 (1) · Medium: 5 · Low: 3

- [Medium] `struct ptp_sys_time.sys_rawtime` is documented in the new
  UAPI as "CLOCK_MONOTONIC_RAW time in nanoseconds", but both new ioctls…
- [Medium] The new `ptp_clock_caps` fields are documented in the UAPI as
  "Whether the clock supports extended timestamps with attributes" /…
- [Medium] `ptp_counter_id_from_csid()` maps every
  `CSID_ARM_ARCH_COUNTER` snapshot to `PTP_COUNTER_ARM_ARCH`, which the…
- [Medium] `ptp_fill_sys_counter()` derives the exported
  `sys_counter`/`sys_counter_id` pair from `struct…
- [Medium] `ptp_counter_id_from_csid()`/`ptp_fill_sys_counter()` inspect
  only the timekeeper clocksource id (`cs_id`) and its `cycles`,…
- [Low] Incomplete integration of the two new driver callbacks.
- [Low] Concern that the new UAPI has no in-tree producer of the quality
  attributes and no test coverage, making the ~280 lines of new frozen…
- [Low] The commit message presents an exhaustive-looking list of the new
  clock-status states ("unknown, initializing, synchronized, free-…

Pre-existing issues:
- [High] `ptp_sys_offset_extended()` (the function this patch refactors)
  declares `struct ptp_system_timestamp sts;` without initialization and…

--

ptp: Add ioctls for PHC timestamps with quality attributes

This adds PTP_SYS_OFFSET_EXTENDED_ATTRS and PTP_SYS_OFFSET_PRECISE_ATTRS,
which return PHC timestamps together with an error bound, clock status,
timescale and a raw system counter value. Two new driver callbacks
(gettimexattrs64, getcrosststampattrs) are introduced, and the new ioctls
fall back to gettimex64 / getcrosststamp when a driver does not implement
them.

Link: https://lore.kernel.org/netdev/20250724115657.150-1-darinzon@amazon.com/
Link: https://lore.kernel.org/all/87se7ht25o.ffs@tglx/

A few questions on the commit message and the diff below.

> 2. clock_status: Synchronization state (unknown, initializing,
>    synchronized, free-running, unreliable)

[Severity: Low]

This list looks exhaustive, but enum ptp_clock_status in the uapi header
also defines PTP_CLOCK_STATUS_HOLDOVER = 3, which is described as
"drifting but remains within acceptable error bounds" and is distinct from
FREE_RUNNING.

Could the enumeration in the commit message include holdover so it matches
the new interface?

> diff --git a/drivers/ptp/ptp_chardev.c b/drivers/ptp/ptp_chardev.c
> index dc23cd708cfe..da6792102ce7 100644
> --- a/drivers/ptp/ptp_chardev.c
> +++ b/drivers/ptp/ptp_chardev.c

[ ... ]

> @@ -190,6 +191,10 @@ static long ptp_clock_getcaps(struct ptp_clock *ptp, void __user *arg)
>  		.cross_timestamping	= ptp->info->getcrosststamp != NULL,
>  		.adjust_phase		= ptp->info->adjphase != NULL &&
>  					  ptp->info->getmaxphase != NULL,
> +		.extended_attrs		= ptp->info->gettimexattrs64 != NULL ||
> +					  ptp->info->gettimex64 != NULL,
> +		.precise_attrs		= ptp->info->getcrosststampattrs != NULL ||
> +					  ptp->info->getcrosststamp != NULL,
>  	};

[Severity: Medium]

Do these capability bits match what the header says they mean? The uapi
side of this patch documents them as:

	/* Whether the clock supports extended timestamps with attributes */
	int extended_attrs;
	/* Whether the clock supports precise cross-timestamps with attributes */
	int precise_attrs;

Here extended_attrs is set whenever gettimex64 exists, which is the case
for nearly every in-tree PHC driver (ptp_ocp, ptp_netc, dfl_tod,
virtio_rtc, hns3, nxp-c45, ...), and none of those can ever produce
attributes, so att.valid stays 0 for every sample.

The commit message explains the intended meaning ("the ioctl is
callable"), but the header comment that userspace authors read says
"supports ... with attributes". Could the header comments be reworded to
match the implementation?

Related: cross_timestamping is still keyed on getcrosststamp only, while
precise_attrs was extended to getcrosststampattrs. For a driver that
implements only getcrosststampattrs, cross_timestamping would report 0
while precise_attrs reports 1. Is that intended?

> @@ -347,11 +352,48 @@ typedef int (*ptp_gettimex_fn)(struct ptp_clock_info *,
>  			       struct timespec64 *,
>  			       struct ptp_system_timestamp *);
>  
> +static int ptp_validate_sys_offset_clockid(__kernel_clockid_t clockid)
> +{
> +	switch (clockid) {
> +	case CLOCK_REALTIME:
> +	case CLOCK_MONOTONIC:
> +	case CLOCK_MONOTONIC_RAW:
> +		return 0;
> +	case CLOCK_AUX ... CLOCK_AUX_LAST:
> +		if (IS_ENABLED(CONFIG_POSIX_AUX_CLOCKS))
> +			return 0;
> +		fallthrough;
> +	default:
> +		return -EINVAL;
> +	}
> +}
> +
> +/*
> + * Validate clock_id for the precise crosststamp path.
> + * get_device_system_crosststamp() supports only CLOCK_REALTIME and the
> + * AUX clocks, so anything else (incl. the monotonic clocks accepted for
> + * the extended path) must be rejected here to avoid its WARN_ON_ONCE().
> + */
> +static int ptp_validate_precise_clockid(__kernel_clockid_t clockid)
> +{
> +	switch (clockid) {
> +	case CLOCK_REALTIME:
> +		return 0;
> +	case CLOCK_AUX ... CLOCK_AUX_LAST:
> +		if (IS_ENABLED(CONFIG_POSIX_AUX_CLOCKS))
> +			return 0;
> +		fallthrough;
> +	default:
> +		return -EINVAL;
> +	}
> +}
> +
>  static long ptp_sys_offset_extended(struct ptp_clock *ptp, void __user *arg,
>  				    ptp_gettimex_fn gettimex_fn)
>  {
>  	struct ptp_sys_offset_extended *extoff __free(kfree) = NULL;
>  	struct ptp_system_timestamp sts;
        ^^^^

[Severity: High]

This isn't a bug introduced by this patch (the declaration is unchanged),
but since the function is being reworked here it may be a good place to
fix it: sts is uninitialized and only sts.clockid is assigned, yet the
loop below decides what to hand back to userspace with:

drivers/ptp/ptp_chardev.c:ptp_sys_offset_extended() {
	...
	/* Filter out disabled or unavailable clocks */
	if (!sts.pre_sts.valid || !sts.post_sts.valid)
		return -EINVAL;
	...
}

Can this read uninitialized stack bytes? valid is only ever set by
ptp_read_system_prets() / ptp_read_system_postts(), and two in-tree
.gettimex64 implementations never touch sts at all and return 0:

  hclge_ptp_gettimex()      (hns3, assigned to .gettimex64)
  nxp_c45_ptp_gettimex64()  (nxp-c45-tja11xx, assigned to .gettimex64)

If both leftover valid bytes happen to be non-zero, the guard passes and
extoff->ts[i][0] / ts[i][2] are filled from uninitialized sts.pre_sts.systime
and sts.post_sts.systime and then copied out with copy_to_user(). Would
initializing it the same way the new sibling does be worth folding in?

	struct ptp_system_timestamp sts = { .clockid = request.clock_id };

[ ... ]

> @@ -404,6 +436,150 @@ static long ptp_sys_offset_extended(struct ptp_clock *ptp, void __user *arg,
>  	return copy_to_user(arg, extoff, sizeof(*extoff)) ? -EFAULT : 0;
>  }
>  
> +static u32 ptp_counter_id_from_csid(enum clocksource_ids cs_id)
> +{
> +	switch (cs_id) {
> +	case CSID_X86_TSC_EARLY:
> +	case CSID_X86_TSC:
> +		return PTP_COUNTER_X86_TSC;
> +	case CSID_ARM_ARCH_COUNTER:
> +		return PTP_COUNTER_ARM_ARCH;

[Severity: Medium]

PTP_COUNTER_ARM_ARCH is documented in the uapi part of this patch as the
"ARM Generic Timer virtual counter", but can CSID_ARM_ARCH_COUNTER tell
the two counters apart?

drivers/clocksource/arm_arch_timer.c uses one clocksource id for both
accessors:

static struct clocksource clocksource_counter = {
	.name	= "arch_sys_counter",
	.id	= CSID_ARM_ARCH_COUNTER,

and arch_counter_register() picks the register at runtime:

	if ((IS_ENABLED(CONFIG_ARM64) && !is_hyp_mode_available()) ||
	    arch_timer_uses_ppi == ARCH_TIMER_VIRT_PPI ||
	    arch_timer_uses_ppi == ARCH_TIMER_HYP_VIRT_PPI) {
		... rd = arch_counter_get_cntvct;
	} else {
		... rd = arch_counter_get_cntpct;

On a configuration that takes the cntpct branch, the ioctl would export
CNTPCT cycles labelled as the virtual counter. The two differ by CNTVOFF
(often zero at EL2, so the values may coincide in practice), and userspace
normally can only read CNTVCT.

Should the enum comment drop the "virtual" wording, or should the mapping
distinguish the two?

> +	default:
> +		/* CSID_X86_KVM_CLK is deliberately mapped to unknown:
> +		 * kvmclock is not a raw hardware counter.
> +		 */
> +		return PTP_COUNTER_UNKNOWN;
> +	}
> +}
> +

[Severity: Medium]

Does this drop a counter value that the snapshot already carries?
ktime_get_snapshot_id() also fills hw_csid / hw_cycles for derived
clocksources, and kvmclock populates them with the raw TSC:

arch/x86/kernel/kvmclock.c:kvm_clock_get_cycles_snapshot() {
	...
	chs->hw_cycles = tsc;
	chs->hw_csid = CSID_X86_TSC;
	...
}

The Hyper-V TSC page clocksource does the same, and it reports
CSID_GENERIC, so it also lands in this default case.

The result is that on an x86 guest using kvm-clock (the default) or the
Hyper-V TSC page, the new ioctls report sys_counter = 0 with
sys_counter_id = PTP_COUNTER_UNKNOWN even though the paired TSC value is
sitting in the same snapshot. That is the environment the third use case
in the commit message targets ("VMMs that need raw system counter values
paired with PTP timestamps").

There is already precedent for the fallback in this subsystem:

drivers/ptp/ptp_vmclock.c:vmclock_get_crosststamp() {
	...
		} else if (sts->pre_sts.hw_csid == st->cs_id &&
			   sts->pre_sts.hw_cycles) {
			cycle = sts->pre_sts.hw_cycles;
	...
}

Could ptp_fill_sys_counter() consult hw_csid / hw_cycles when cs_id is a
derived clocksource? As it stands userspace also cannot distinguish "no
hardware counter exists" from "one was captured and discarded".

> +static void ptp_fill_sys_counter(struct ptp_sys_time *st, u64 cycles,
> +				 enum clocksource_ids cs_id)
> +{
> +	st->sys_counter_id = ptp_counter_id_from_csid(cs_id);
> +	st->sys_counter = st->sys_counter_id == PTP_COUNTER_UNKNOWN ? 0 : cycles;
> +}
> +

[ ... ]

> +	ts = ktime_to_timespec64(xtstamp.device);
> +	tstamp->systime.sys_time = ktime_to_ns(xtstamp.sys_systime);
> +	tstamp->systime.sys_rawtime = ktime_to_ns(xtstamp.sys_monoraw);
> +	ptp_fill_sys_counter(&tstamp->systime, xtstamp.sys_counter.cycles,
> +			     xtstamp.sys_counter.cs_id);

[Severity: Medium]

Should this path also look at xtstamp.sys_counter.use_nsecs? cycles is
only a cycle count when use_nsecs is false, and the timekeeping core skips
the conversion when the ids match:

kernel/time/timekeeping.c:convert_base_to_cs() {
	...
	/* The timestamp was taken from the time keeper clock source */
	if (cs->id == scv->cs_id)
		return true;
	...
}

mlx5 and idpf both report a nanosecond value with the timekeeper's id:

	*sys_counterval = (struct system_counterval_t) {
			.cycles = host,
			.cs_id = IS_ENABLED(CONFIG_X86) ? CSID_X86_ART :
							  CSID_ARM_ARCH_COUNTER,
			.use_nsecs = true,
	};

On arm64 the timekeeper id is CSID_ARM_ARCH_COUNTER, so cycles stays in
nanoseconds while cs_id still says arch counter, and
PTP_SYS_OFFSET_PRECISE_ATTRS would export that nanosecond value as
sys_counter with sys_counter_id = PTP_COUNTER_ARM_ARCH.

Whether such a sample survives timestamp_in_interval() depends on the
generic timer frequency being close to 1 GHz (mandated by ARMv8.6 ECV), so
this may be hard to hit, but nothing in the new code inspects use_nsecs.
Would reporting PTP_COUNTER_UNKNOWN when use_nsecs is set be safer?

> diff --git a/drivers/ptp/ptp_clock.c b/drivers/ptp/ptp_clock.c
> index 4111342d64f0..27c0cd1eba59 100644
> --- a/drivers/ptp/ptp_clock.c
> +++ b/drivers/ptp/ptp_clock.c
> @@ -113,7 +113,9 @@ static int ptp_clock_gettime(struct posix_clock *pc, struct timespec64 *tp)
>  	struct ptp_clock *ptp = container_of(pc, struct ptp_clock, clock);
>  	int err;
>  
> -	if (ptp->info->gettimex64)
> +	if (ptp->info->gettimexattrs64)
> +		err = ptp->info->gettimexattrs64(ptp->info, tp, NULL, NULL);
> +	else if (ptp->info->gettimex64)
>  		err = ptp->info->gettimex64(ptp->info, tp, NULL);
>  	else
>  		err = ptp->info->gettime64(ptp->info, tp);

[Severity: Low]

Correction to the finding id above: gpt-5-6-sol-2-14.

Here gettimexattrs64 is treated as a self-sufficient time read, and the
kernel-doc added by this patch calls it "Same as @gettimex64, but also
fills @att". Can a driver that implements only gettimexattrs64 register?
ptp_clock_register() is unchanged:

drivers/ptp/ptp_clock.c:ptp_clock_register() {
	if (WARN_ON_ONCE(info->n_alarm > PTP_MAX_ALARMS ||
			 (!info->gettimex64 && !info->gettime64) ||
			 !info->settime64))
		return ERR_PTR(-EINVAL);
	...
}

If such a driver adds gettime64 to get past that check, the other core
dispatch sites still do not know about the new callback:

  ptp_ioctl() PTP_SYS_OFFSET_EXTENDED -> ptp_sys_offset_extended(..., gettimex64)
  ptp_ioctl() PTP_SYS_OFFSET_PRECISE  -> ptp_sys_offset_precise(..., getcrosststamp)
  ptp_sys_offset()                    -> gettimex64 else gettime64
  ptp_clock_register()                -> getcyclesx64 = gettimex64,
                                         getcrosscycles = getcrosststamp

so PTP_CLOCK_GETCAPS would advertise extended_attrs = 1 while
PTP_SYS_OFFSET_EXTENDED returns -EOPNOTSUPP, PTP_SYS_OFFSET silently drops
to the gettime64 path with no pre/post sandwich, and the _CYCLES ioctls
plus vclock cycle support lose their shims.

Both in-tree implementers added later in the series (ptp_vmclock and ena)
populate gettimex64 as well, so nothing is broken today. Should the
kernel-doc state that the base callback stays mandatory, or should
registration and the remaining dispatch sites learn about the attrs
callbacks?

> diff --git a/include/linux/ptp_clock_kernel.h b/include/linux/ptp_clock_kernel.h
> index 36a27a910595..9bf2b6066e78 100644
> --- a/include/linux/ptp_clock_kernel.h
> +++ b/include/linux/ptp_clock_kernel.h

[ ... ]

> @@ -209,8 +222,15 @@ struct ptp_clock_info {
>  	int (*gettime64)(struct ptp_clock_info *ptp, struct timespec64 *ts);
>  	int (*gettimex64)(struct ptp_clock_info *ptp, struct timespec64 *ts,
>  			  struct ptp_system_timestamp *sts);
> +	int (*gettimexattrs64)(struct ptp_clock_info *ptp,
> +			       struct timespec64 *ts,
> +			       struct ptp_system_timestamp *sts,
> +			       struct ptp_clock_attrs *att);
>  	int (*getcrosststamp)(struct ptp_clock_info *ptp,
>  			      struct system_device_crosststamp *cts);
> +	int (*getcrosststampattrs)(struct ptp_clock_info *ptp,
> +				   struct system_device_crosststamp *cts,
> +				   struct ptp_clock_attrs *att);

[Severity: Low]

Taken on its own, this commit adds a new frozen uapi with no in-tree
producer of the quality attributes and no test coverage, so the two new
callbacks are unused at this point in the tree.

Later patches in the same series set .gettimexattrs64 /
.getcrosststampattrs in ptp_vmclock, .gettimexattrs64 in ena, and add a
testptp -a modifier exercising both ioctls, so this looks covered by the
series as a whole. Noting it only for the ordering.

> diff --git a/include/uapi/linux/ptp_clock.h b/include/uapi/linux/ptp_clock.h
> index 46d45f902486..98a86c5621d4 100644
> --- a/include/uapi/linux/ptp_clock.h
> +++ b/include/uapi/linux/ptp_clock.h

[ ... ]

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

[ ... ]

> +/**
> + * struct ptp_sys_time - system time snapshot with counter value
> + *
> + * @sys_time:       System time in nanoseconds (clock selected by request).
> + * @sys_rawtime:    CLOCK_MONOTONIC_RAW time in nanoseconds.

[Severity: Medium]

Is sys_rawtime always CLOCK_MONOTONIC_RAW? Both new ioctls accept clock_id
in the CLOCK_AUX ... CLOCK_AUX_LAST range via
ptp_validate_sys_offset_clockid() and ptp_validate_precise_clockid(), and
for those ids the value stored here is the AUX-relative raw time:

	tstamp->pre_systime.sys_rawtime = ktime_to_ns(sts.pre_sts.monoraw);
	tstamp->systime.sys_rawtime = ktime_to_ns(xtstamp.sys_monoraw);

The core documents the AUX semantics explicitly:

kernel/time/timekeeping.c:ktime_get_snapshot_id() {
	...
 *	MONOTONIC_RAW(AUX$N) = CLOCK_MONOTONIC_RAW(system) + offset(AUX$N)
 * The offset is established when a AUX clock is initialized, but it is
 * currently not accessible.
	...
}

include/linux/timekeeping.h repeats that for both
struct system_time_snapshot.monoraw and
struct system_device_crosststamp.sys_monoraw.

An application that follows this comment and compares sys_rawtime against
clock_gettime(CLOCK_MONOTONIC_RAW) would be off by an offset it cannot
query. Could this comment carry the same AUX qualification the core
headers do?

> +	__u32 sys_counter_id;
> +	__u32 rsv;
> +};

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20260909073136.12863-1-akiyano%40amazon.com
