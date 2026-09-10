Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B89813B059F;
	Thu, 10 Sep 2026 08:31:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789029095; cv=none; b=tUPOIVGjZSAbFKjZgyjE4D0SX0QHDnGV9fo5bCZVR+OI1byPBjKKgQadPPOnSN6WpwvXaeYBsJWMko8qzKJxRed8yk8/3S0EHJaZdVIzRD6YXxmRB0rrMcyLhIkLvuANZ/fKg/PyG7Dy11M0x2bJDFPa7quHSRq0kh1lwyTh1L0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789029095; c=relaxed/simple;
	bh=0rvktlisGG/pXViy7VnJ86L2uEFtIO+dWsXgYLDpFNQ=;
	h=Subject:From:To:Cc:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=FC/6x3Ro4w1NEwZcI+FNsI/lDTCAtDtEt5gpH/sucw9Q62ZFPQRuD4+r4eXZyGhPIJzuNanOGgRcBqPjBmjTHWk8JzPCehZDFEGTsDtD3ntdDZm8+LD4Nt0R6aiciYiTcP5TTKMw26meloIVn38zOwPZ7NODH285uPQ74eciPsY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BXb6xkzB; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BXb6xkzB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51A5A1F000FF;
	Thu, 10 Sep 2026 08:31:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789029093;
	bh=SIiKgXvOxvLKCbF2u4mFNRdPie6pSoalejtOcLHAoqY=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=BXb6xkzBSdEABUFcjMwCN4DqW/qyWFeuo9TPNoV7EJNSH1TALisbvsYcLVrJ7M5Zi
	 ewmGLbDoP+yspYA04x5Cv8gI7mv4WaZwXGXpuCkkYQ1IogV0DNkeGyRC7DBhnLGYaH
	 fOnmjUQw0zvKubQXra4wISpB+WA+PC4Qajx6eB+8WM3Yz7RhLKPwFztBZpyN3EuyPZ
	 lc3lNdLgwMdL/V8JQAXUAcsqwLaMV8KfNxWo5lzVZjSqGPr0ks627bJnvzOIhj7ZmJ
	 quelJgdKREvRzN6WY+49DlqOpbiL0H941n4VOmEaX092+mQkVa6RYIavGaCrwOl1hi
	 d8gfJXr+6m3eQ==
Subject:
 Re: [PATCH v7 net-next 4/7] ptp: ptp_vmclock: Implement attributes ioctls
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
Date: Thu, 10 Sep 2026 08:31:30 +0000
Message-ID: <178902909090.219967.1847972587492686819@kernel.org>
In-Reply-To: <20260909073136.12863-5-akiyano@amazon.com>
References: <20260909073136.12863-5-akiyano@amazon.com>
X-sashiko-severity: Medium
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Thank you for your contribution! Sashiko AI review found 4 potential
issue(s) to consider:

Critical: 0 · High: 0 · Medium: 4 · Low: 0

- [Medium] vmclock_populate_ptp_attributes()
  (drivers/ptp/ptp_vmclock.c:193-196) clamps the computed 64-bit worst-…
- [Medium] vmclock_populate_ptp_attributes() sets have_error_bound (and
  therefore PTP_ATTRS_VALID_ERROR_BOUND) based on…
- [Medium] The driver advertises PTP_TIMESCALE_TAI for vmclock devices
  (drivers/ptp/ptp_vmclock.c:114-115 and the UTC-converted case at…
- [Medium] vmclock_populate_ptp_attributes() introduces the first
  *runtime* uses of VMCLOCK_FIELD_PRESENT (drivers/ptp/ptp_vmclock.c:158…

--

ptp: ptp_vmclock: Implement attributes ioctls

This adds gettimexattrs64 and getcrosststampattrs to ptp_vmclock so the
new PTP_SYS_OFFSET_EXTENDED_ATTRS and PTP_SYS_OFFSET_PRECISE_ATTRS
ioctls can report an error bound, a clock status and a timescale.  The
attributes are filled in inside the seq_count loop, and the UNRELIABLE
check that used to abort the read is moved after the loop so that only
the legacy ioctls still fail with -EINVAL.

A few questions about the new attribute code below.

> diff --git a/drivers/ptp/ptp_vmclock.c b/drivers/ptp/ptp_vmclock.c
> index bb0e14bac9f2..0cd449999139 100644
> --- a/drivers/ptp/ptp_vmclock.c
> +++ b/drivers/ptp/ptp_vmclock.c

[ ... ]

> @@ -95,13 +106,113 @@ static bool tai_adjust(struct vmclock_abi *clk, uint64_t *sec)
>  	return false;
>  }
>  
> +static uint8_t vmclock_get_ptp_timescale(uint8_t vmclock_time_type)
> +{
> +	switch (vmclock_time_type) {
> +	case VMCLOCK_TIME_UTC:
> +		return PTP_TIMESCALE_UTC;
> +	case VMCLOCK_TIME_TAI:
> +		return PTP_TIMESCALE_TAI;
> +	case VMCLOCK_TIME_MONOTONIC:
> +		return PTP_TIMESCALE_MONOTONIC;
> +	default:
> +		return PTP_TIMESCALE_UNKNOWN;
> +	}
> +}

[ ... ]

> +static void vmclock_populate_ptp_attributes(struct vmclock_state *st,
> +					    struct ptp_clock_attrs *att,
> +					    uint64_t delta)
> +{
> +	uint64_t maxerror_ns = UINT_MAX;
> +	bool have_error_bound = false;
> +
> +	if (!att)
> +		return;
> +
> +	/* Called once per seq_count retry, so don't accumulate stale bits */
> +	att->valid = 0;
> +	att->error_bound = 0;
> +
> +	/* Only calculate if the base error is flagged as valid
> +	 * by the hypervisor.
> +	 */
> +	if (VMCLOCK_FIELD_PRESENT(st->clk, time_maxerror_nanosec) &&
> +	    (le64_to_cpu(st->clk->flags) & VMCLOCK_FLAG_TIME_MAXERROR_VALID)) {
> +		have_error_bound = true;
> +		maxerror_ns = le64_to_cpu(st->clk->time_maxerror_nanosec);

[Severity: Medium]
Is VMCLOCK_FIELD_PRESENT safe to evaluate at ioctl time?  The macro reads
the size field straight out of the shared mapping:

drivers/ptp/ptp_vmclock.c:
#define VMCLOCK_FIELD_PRESENT(_c, _f)			  \
	(le32_to_cpu((_c)->size) >= (offsetof(struct vmclock_abi, _f) +	\
				     sizeof((_c)->_f)))

and size is only compared against the mapping length once, in
vmclock_probe():

	st->clk = devm_memremap(dev, st->res.start, resource_size(&st->res),
				MEMREMAP_WB | MEMREMAP_DEC);
	...
	if (le32_to_cpu(st->clk->magic) != VMCLOCK_MAGIC ||
	    le32_to_cpu(st->clk->size) > resource_size(&st->res) ||

Before this patch VMCLOCK_FIELD_PRESENT was only used at probe, right
after that comparison, so the checked and used values were the same
snapshot.  These new call sites run long afterwards, and the hypervisor
can raise size in shared memory at any point.

PTP registration only requires size to cover time_frac_sec, i.e. 88
bytes, while time_maxerror_nanosec sits at bytes 96..103 of struct
vmclock_abi.  With a resource of 88..103 bytes and a later size write of
104 or more, does the dereference of st->clk->time_maxerror_nanosec then
read past the end of the devm_memremap()ed region, and publish whatever
it finds with PTP_ATTRS_VALID_ERROR_BOUND set?

The seq_count loop does not cover this, since it only detects hypervisor
updates and never re-validates size against resource_size(&st->res).
Would snapshotting the validated size at probe time (e.g. a clk_size
field in struct vmclock_state) and using that at runtime be preferable?

[Severity: Medium]
Should have_error_bound depend on VMCLOCK_FLAG_TIME_MAXERROR_VALID alone?

time_maxerror_nanosec bounds the error of the reference time at
counter_value, while counter_period_maxerror_rate_frac_sec bounds the
error accumulated while extrapolating over the elapsed ticks.  The two
validity flags are independent bits in
include/uapi/linux/vmclock-abi.h:

#define VMCLOCK_FLAG_PERIOD_MAXERROR_VALID	(1 << 4)
#define VMCLOCK_FLAG_TIME_MAXERROR_VALID	(1 << 6)

The timestamp handed back to userspace is taken at counter_value + delta.
When VMCLOCK_FLAG_PERIOD_MAXERROR_VALID is clear and delta is non-zero,
the extrapolation error is unknown, yet the code below still sets
PTP_ATTRS_VALID_ERROR_BOUND on the reference-time error only.  With the
50 PPM counter tolerance the vmclock ABI header itself mentions, tens of
seconds of delta already add milliseconds that are not reflected in the
reported bound.  Would it be more correct to leave
PTP_ATTRS_VALID_ERROR_BOUND clear in that case?

> +
> +		/* If frequency error is also valid, accumulate it
> +		 * over the delta.
> +		 */
> +		if (VMCLOCK_FIELD_PRESENT(st->clk, counter_period_maxerror_rate_frac_sec) &&
> +		    (le64_to_cpu(st->clk->flags) & VMCLOCK_FLAG_PERIOD_MAXERROR_VALID)) {
> +			uint64_t maxerror_rate, err_hi, err_frac, growth_ns;
> +
> +			maxerror_rate = le64_to_cpu(st->clk->counter_period_maxerror_rate_frac_sec);
> +			err_frac = mul_u64_u64_shr_add_u64(&err_hi, delta,
> +							   maxerror_rate,
> +							   st->clk->counter_period_shift,
> +							   0);
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
> +	if (have_error_bound) {
> +		att->error_bound = (maxerror_ns > UINT_MAX) ?
> +			UINT_MAX : (uint32_t)maxerror_ns;
> +		att->valid |= PTP_ATTRS_VALID_ERROR_BOUND;
> +	}

[Severity: Medium]
Can this report a bound that is smaller than the real one?  The clamp to
UINT_MAX caps the value at roughly 4.295 s, and PTP_ATTRS_VALID_ERROR_BOUND
is still set, so userspace has no way to tell that saturation happened.

The kernel-doc for struct ptp_clock_attrs in include/uapi/linux/ptp_clock.h
describes the field as:

 * @error_bound: Maximum error (an upper bound, in nanoseconds) between the
 *               returned device_time and true time on the advertised
 *               @timescale; a worst-case bound, not a statistical estimate.

and defines no saturation sentinel, only allowing the value to be
distrusted when @status is UNKNOWN or UNRELIABLE.  A hypervisor
publishing time_maxerror_nanosec above 0xffffffff (a legal __le64 value)
with status SYNCHRONIZED, or a long enough delta in the growth
accumulation above, both end up at 0xffffffff with the valid bit set,
including the explicit maxerror_ns = U64_MAX branches.

Would it be better to leave PTP_ATTRS_VALID_ERROR_BOUND clear when the
value does not fit in __u32, or to define a saturation convention in the
uAPI?  Related to that, the maxerror_ns = UINT_MAX initializer looks dead
now, since it is overwritten whenever have_error_bound becomes true.

> +	att->timescale = vmclock_get_ptp_timescale(st->clk->time_type);
> +	/* tai_adjust() already converted UTC to TAI before we're called */
> +	if (st->clk->time_type == VMCLOCK_TIME_UTC)
> +		att->timescale = PTP_TIMESCALE_TAI;
> +	att->valid |= PTP_ATTRS_VALID_TIMESCALE;

[Severity: Medium]
Which epoch does PTP_TIMESCALE_TAI imply here?  The two headers that are
in tree after this series disagree.

include/uapi/linux/vmclock-abi.h:

#define VMCLOCK_TIME_TAI			1	/* Since 1970-01-01 00:00:00z */

and tspec->tv_sec is built directly from time_sec, so the value returned
to userspace is Unix-epoch based in both the TAI and the tai_adjust()
converted UTC case.

include/uapi/linux/ptp_clock.h, as added by "ptp: Add ioctls for PHC
timestamps with quality attributes" in this series, documents:

	/**
	 * International Atomic Time (TAI)
	 * Epoch: 1958-01-01 00:00:00.
	 ...
	PTP_TIMESCALE_TAI = 1,

in explicit contrast to PTP_TIMESCALE_UTC/POSIX which it documents with
the 1970 epoch.  A consumer following the enum documentation would be off
by about 378.7 million seconds.  The commit message also states:

    - timescale: Always reports TAI (UTC sources are converted by tai_adjust()
      before the attributes are populated)

Should the enum documentation be corrected to the Unix epoch that PHC
timestamps actually use, or is the driver expected to shift the value?

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20260909073136.12863-1-akiyano%40amazon.com
