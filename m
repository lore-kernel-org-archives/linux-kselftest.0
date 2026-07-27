Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F94242A160;
	Mon, 27 Jul 2026 20:15:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785183327; cv=none; b=NEkG27QL4pmcs56SkWHrz0/dJUfR2H5L4yzFasohdCNSIxwMeAuBe8K1QmTIsyHEyVLqc7GYCe1aoBDhjfL3K2y6km490ouLA8EPeOYBiW2A7wjAAa9clmBqQndaM5E42DkIgMQhsU+epVdZJS3nQnMjXEei8IUSP1nD33QXNaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785183327; c=relaxed/simple;
	bh=X/yVn7Fgb9sFEzATQrpmSVw6HGjUFB2ORMcjWnr3zrI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uUC7X97VYJ0tGC/83cCjOOWkZy4r8hT+CVDfhAjGNUiZhnz9bDQZyHEXfDyNsKh1uW2meY+t30IEZI3P5aXAxlCUhZKRi4RrI9kPRs98HWOVrtubxcZAenVJ2p8a4s9gshTw0jSiF+FBIVQrovqhy8UX3L4xvGv52qsuBZamh/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kdN0Cxl/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kdN0Cxl/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98FC91F000E9;
	Mon, 27 Jul 2026 20:15:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785183316;
	bh=TsleewrwmX6vOnRoiUAEemwP78vsSSLrfwaG7uyiqyI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=kdN0Cxl/gjqk2Tu9Jia+PIZ3rIC/dyl8vkN/RnjKzUPpKS30ifNrGjQ19nGPUm2QA
	 KjZiBzYB1B0Do3D7j9QyY4I3R+HwK54xA6kNo2XGFSiDzTozL/zpZNEuC2aUcjqRxS
	 bE8mFoXn4UrlAzdxh65krybdDRHA/wH4Txj4VLsoOj5y9SdkweQOi3I9Ubal2GmWt8
	 Gwefiu0Ybdqho0FIHYcOoWsRdtSdKNhPhMvM1/rnjhO5fC7Iu21+HLglKunVA4gMb4
	 EptBXCYD2Dqb4Eyg1L77MtLdVY/yvVuXypvJRClGqB49u/x4wJFBRhe9TK5L+TBWpO
	 JEmixo7RjqWUg==
From: Jakub Kicinski <kuba@kernel.org>
To: akiyano@amazon.com
Cc: Jakub Kicinski <kuba@kernel.org>,
	davem@davemloft.net,
	netdev@vger.kernel.org,
	richardcochran@gmail.com,
	edumazet@google.com,
	pabeni@redhat.com,
	dwmw2@infradead.org,
	tglx@linutronix.de,
	mlichvar@redhat.com,
	andrew+netdev@lunn.ch,
	guwen@linux.alibaba.com,
	xuanzhuo@linux.alibaba.com,
	dwmw@amazon.com,
	ysarna@amazon.com,
	zorik@amazon.com,
	matua@amazon.com,
	saeedb@amazon.com,
	msw@amazon.com,
	aliguori@amazon.com,
	nafea@amazon.com,
	evgenys@amazon.com,
	netanel@amazon.com,
	alisaidi@amazon.com,
	benh@amazon.com,
	ndagan@amazon.com,
	darinzon@amazon.com,
	evostrov@amazon.com,
	ofirt@amazon.com,
	amitbern@amazon.com,
	linux-kselftest@vger.kernel.org,
	linux-doc@vger.kernel.org,
	shuah@kernel.org,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	horms@kernel.org,
	bhelgaas@google.com,
	vadim.fedorenko@linux.dev
Subject: Re: [PATCH v5 net-next 1/7] ptp: Add ioctls for PHC timestamps with quality attributes
Date: Mon, 27 Jul 2026 13:15:14 -0700
Message-ID: <20260727201514.2757107-1-kuba@kernel.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260717065924.2556-2-akiyano@amazon.com>
References: <20260717065924.2556-2-akiyano@amazon.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is an AI-generated review of your patch. The human sending this
email has considered the AI review valid, or at least plausible.
---
ptp: Add ioctls for PHC timestamps with quality attributes

This introduces PTP_SYS_OFFSET_EXTENDED_ATTRS and
PTP_SYS_OFFSET_PRECISE_ATTRS, extending the existing extended/precise
offset ioctls with clock quality attributes (error bound, timescale,
sync status) and raw system counter fields. New driver callbacks
gettimexattrs64 and getcrosststampattrs are added to ptp_clock_info.

Link: https://lore.kernel.org/netdev/20250724115657.150-1-darinzon@amazon.com/
Link: https://lore.kernel.org/all/87se7ht25o.ffs@tglx/

A few questions inline below.

> diff --git a/drivers/ptp/ptp_chardev.c b/drivers/ptp/ptp_chardev.c
> index dc23cd708cfe..d30ee4f51fbb 100644
> --- a/drivers/ptp/ptp_chardev.c
> +++ b/drivers/ptp/ptp_chardev.c
> @@ -190,6 +190,8 @@ static long ptp_clock_getcaps(struct ptp_clock *ptp, void __user *arg)
>  		.cross_timestamping	= ptp->info->getcrosststamp != NULL,
>  		.adjust_phase		= ptp->info->adjphase != NULL &&
>  					  ptp->info->getmaxphase != NULL,
> +		.extended_attrs		= ptp->info->gettimexattrs64 != NULL,
> +		.precise_attrs		= ptp->info->getcrosststampattrs != NULL,
>  	};

[Medium]
Are the capability bits consistent with what the ioctls will actually
accept?

The caps are set based only on the presence of the new *_attrs callbacks,
but the ioctl handlers fall back to gettimex64/getcrosststamp when the
*_attrs callback is absent:

    if (ptp->info->gettimexattrs64)
        err = ptp->info->gettimexattrs64(ptp->info, &ts, &sts, &att);
    else if (ptp->info->gettimex64)
        err = ptp->info->gettimex64(ptp->info, &ts, &sts);
    else
        return -EOPNOTSUPP;

A userspace that respects the capability bits would refuse to call the
new ioctl on drivers that would in fact serve it via the fallback. Is
the fallback intended, and if so, should the caps advertise it? The
commit message does not describe this behavior.

[ ... ]

> @@ -404,6 +413,130 @@ static long ptp_sys_offset_extended(struct ptp_clock *ptp, void __user *arg,
>  	return copy_to_user(arg, extoff, sizeof(*extoff)) ? -EFAULT : 0;
>  }
>  
> +static long ptp_sys_offset_extended_attrs(struct ptp_clock *ptp, void __user *arg)
> +{
> +	struct ptp_sys_offset_attrs *data __free(kfree) = NULL;
> +	struct ptp_attrs_request request;
> +	struct ptp_system_timestamp sts;

[Medium]
Can this leak uninitialized stack contents to userspace?

Only sts.clockid is initialized below, and sts is reused across loop
iterations. If any driver's gettimex64/gettimexattrs64 returns success
without touching pre_sts/post_sts on the sts pointer, sts.pre_sts.valid
is either uninitialized (first iteration) or stale (later iterations),
and the "if (!sts.pre_sts.valid || !sts.post_sts.valid)" gate can admit
a partially-populated snapshot.

On the success path the code then copies pre_sts.cycles, pre_sts.cs_id,
pre_sts.monoraw, pre_sts.systime and the post_sts equivalents to
userspace. The pre-existing ptp_sys_offset_extended() has the same
shape but only copied systime, so the exposed surface is now wider.
Would something like:

    struct ptp_system_timestamp sts = {};

inside the loop (or at declaration) be safer?

> +	unsigned int n_samples;
> +	int err;
> +
> +	if (copy_from_user(&request, arg, sizeof(request)))
> +		return -EFAULT;
> +
> +	if (request.valid ||
> +	    request.num_samples > PTP_MAX_SAMPLES ||
> +	    request.num_samples == 0)
> +		return -EINVAL;

[Medium]
Should this also reject non-zero request.rsv[]?

The kernel-doc for struct ptp_attrs_request says "Reserved for future
use, must be zero", but rsv[3] is never validated. The neighboring
ptp_sys_offset_extended() enforces the same contract on its own
reserved fields:

    if (extoff->n_samples > PTP_MAX_SAMPLES || extoff->rsv[0] || extoff->rsv[1])
        return -EINVAL;

Without a similar check, existing userspace binaries can start sending
garbage in rsv[], which then blocks any future repurposing of those
bytes.

> +
> +	err = ptp_validate_sys_offset_clockid(request.clock_id);
> +	if (err)
> +		return err;
> +
> +	n_samples = request.num_samples;
> +	sts.clockid = request.clock_id;
> +
> +	data = kzalloc(struct_size(data, timestamps, n_samples), GFP_KERNEL);
> +	if (!data)
> +		return -ENOMEM;
> +
> +	data->request.num_samples = n_samples;

[Low]
This is a _IOWR ioctl and the whole struct (including data->request) is
copied back to userspace at the end, but only data->request.num_samples
is populated. data->request.valid, data->request.clock_id and
data->request.rsv[] therefore always come back as zero, silently
overwriting the values userspace put in the request buffer.

Is that intentional? It is not mentioned in the commit message, and it
locks in a slightly surprising contract for future extensions.

> +
> +	for (unsigned int i = 0; i < n_samples; i++) {
> +		struct ptp_clock_attrs att = {};
> +		struct timespec64 ts;
> +
> +		if (ptp->info->gettimexattrs64)
> +			err = ptp->info->gettimexattrs64(ptp->info, &ts,
> +							 &sts, &att);
> +		else if (ptp->info->gettimex64)
> +			err = ptp->info->gettimex64(ptp->info, &ts, &sts);
> +		else
> +			return -EOPNOTSUPP;
> +
> +		if (err)
> +			return err;
> +
> +		/* Filter out disabled or unavailable clocks */
> +		if (!sts.pre_sts.valid || !sts.post_sts.valid)
> +			return -EINVAL;
> +
> +		data->timestamps[i].pre_systime.sys_time =
> +			ktime_to_ns(sts.pre_sts.systime);
> +		data->timestamps[i].pre_systime.sys_rawtime =
> +			ktime_to_ns(sts.pre_sts.monoraw);
> +		data->timestamps[i].pre_systime.sys_counter =
> +			sts.pre_sts.cycles;
> +		data->timestamps[i].pre_systime.sys_counter_id =
> +			sts.pre_sts.cs_id;

[Critical]
Does the sys_counter_id assignment produce the correct UAPI value?

sts.pre_sts.cs_id is enum clocksource_ids from
include/linux/clocksource_ids.h:

    CSID_GENERIC          = 0,
    CSID_ARM_ARCH_COUNTER = 1,
    CSID_S390_TOD         = 2,
    CSID_X86_TSC_EARLY    = 3,
    CSID_X86_TSC          = 4,
    CSID_X86_KVM_CLK      = 5,
    CSID_X86_ART          = 6,

But sys_counter_id is documented as enum ptp_counter_id from the UAPI:

    PTP_COUNTER_UNKNOWN  = 0,
    PTP_COUNTER_X86_TSC  = 1,
    PTP_COUNTER_ARM_ARCH = 2,

With this direct assignment, on ARM sts.pre_sts.cs_id == 1
(CSID_ARM_ARCH_COUNTER) is reported to userspace as PTP_COUNTER_X86_TSC.
On x86, real CSID_X86_TSC (4) has no defined UAPI meaning. On s390,
CSID_S390_TOD (2) is reported as PTP_COUNTER_ARM_ARCH.

Should the ioctl translate cs_id into the UAPI enum before copying it
out? Once released, later adding a translation layer would break any
userspace that started decoding the raw kernel values.

[High]
On clocksources that are derived/virtualised (kvm-clock, scaled arch
counter, ART, ...), the raw underlying counter identity is exposed by
system_time_snapshot as hw_cycles/hw_csid rather than cycles/cs_id.
The new UAPI only propagates cycles/cs_id.

The commit message says one motivation is:

    3. VMMs that need raw system counter values paired with PTP
       timestamps for feed-forward clock calibration ...

but a guest on a derived clocksource will not see the underlying
hardware counter identity or value here. Should the UAPI also expose
hw_cycles/hw_csid, given that the struct is frozen once merged?

> +		data->timestamps[i].devtime.device_time.sec = ts.tv_sec;
> +		data->timestamps[i].devtime.device_time.nsec = ts.tv_nsec;
> +		data->timestamps[i].devtime.attrs = att;
[ ... ]
> +}
> +
> +static long ptp_sys_offset_precise_attrs(struct ptp_clock *ptp, void __user *arg)
> +{
> +	struct ptp_sys_offset_attrs *data __free(kfree) = NULL;
> +	struct system_device_crosststamp xtstamp;
> +	struct ptp_attrs_request request;
> +	struct ptp_clock_attrs att = {};
> +	struct timespec64 ts;
> +	int err;
> +
> +	if (copy_from_user(&request, arg, sizeof(request)))
> +		return -EFAULT;
> +
> +	if (request.valid ||
> +	    request.num_samples != 1)
> +		return -EINVAL;
> +
> +	err = ptp_validate_sys_offset_clockid(request.clock_id);
> +	if (err)
> +		return err;
> +
> +	data = kzalloc(struct_size(data, timestamps, 1), GFP_KERNEL);
> +	if (!data)
> +		return -ENOMEM;
> +
> +	if (ptp->info->getcrosststampattrs)
> +		err = ptp->info->getcrosststampattrs(ptp->info, &xtstamp, &att);
> +	else if (ptp->info->getcrosststamp)
> +		err = ptp->info->getcrosststamp(ptp->info, &xtstamp);
> +	else
> +		return -EOPNOTSUPP;

[High]
Can any driver using get_device_system_crosststamp() actually serve
this ioctl?

xtstamp is declared without an initializer, so xtstamp.clock_id holds
whatever was on the stack. The pre-existing ptp_sys_offset_precise()
explicitly sets it:

    struct system_device_crosststamp xtstamp = {
        .clock_id = CLOCK_REALTIME,
    };

Drivers commonly forward xtstamp to get_device_system_crosststamp() in
kernel/time/timekeeping.c, which switches on xtstamp->clock_id and
falls through to:

    default:
        WARN_ON_ONCE(1);
        return -ENODEV;

So on most drivers implementing getcrosststamp (kvm, mlx5, ice, igc,
bnxt, s390, ...), an unprivileged caller of PTP_SYS_OFFSET_PRECISE_ATTRS
would trigger a first-hit WARN and get -ENODEV.

In addition, request.clock_id is validated by
ptp_validate_sys_offset_clockid() but never assigned to
xtstamp.clock_id, so the userspace-selected clock is silently dropped
even for the paths documented in the UAPI header (CLOCK_MONOTONIC,
CLOCK_MONOTONIC_RAW, CLOCK_AUX...).

Should xtstamp.clock_id be set from request.clock_id (and xtstamp
zeroed before use)?

[ ... ]

> diff --git a/drivers/ptp/ptp_clock.c b/drivers/ptp/ptp_clock.c
> index d6f54ccaf93b..849aef8191c5 100644
> --- a/drivers/ptp/ptp_clock.c
> +++ b/drivers/ptp/ptp_clock.c
> @@ -112,7 +112,9 @@ static int ptp_clock_gettime(struct posix_clock *pc, struct timespec64 *tp)
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

[Low]
This call site passes both sts and att as NULL, but the kernel-doc for
gettimexattrs64 only documents that att may be NULL ("fills @att (if
not NULL)"). The dual-NULL contract on sts is implicitly inherited
from gettimex64 but is not stated.

Would it be worth spelling out in the kernel-doc that both sts and att
may be NULL, so a new driver author does not skip the NULL check on
sts?

[ ... ]
-- 
pw-bot: cr
