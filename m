Received: from pdx-out-010.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-010.esa.us-west-2.outbound.mail-perimeter.amazon.com [52.12.53.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20FBA3815CF;
	Wed,  9 Sep 2026 07:32:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=52.12.53.23
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788939136; cv=none; b=DV0B3d+GY3bi/lYLW4cer6j0z1AEZLx1EaqzM1iC0CjH89qJmX7IvgT6NewFDfF3n4sVib5WPXfa2oQvzLpE4z8AqdzIRFnzVZKikV9arDNzspOa8raXrysOAy7QJTzRF5iuGXO6oWDZxzrw5AMJjWNkD8MsqCA4lggHcF8XYQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788939136; c=relaxed/simple;
	bh=6JvE+jRSlMij4ZIa3WGdKXpsKfNLi7u7vciVNVd38wk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZcL05BFApRp28bXCjvzJvPfOIh7mnj7HNsCBiOgAf32jcPHiUXP6zaPPRktFzHu2Xwb1zIWOoHrm754SiMsLd5W+1w+P39DZI2N7O9lIE9MCs3KUR1eIY265gON8BH1nHMVJstY/Bj3P1ZciD5qu+P151m7oCZuafSgc5FjUT2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com; spf=pass smtp.mailfrom=amazon.com; dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b=gvN80k1Z; arc=none smtp.client-ip=52.12.53.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b="gvN80k1Z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1788939134; x=1820475134;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=93sVdFbNZlxmzv922GDseJ/HjUdEMSm6dNLPrNVuPEg=;
  b=gvN80k1ZkkU6F/5HKYDQ+ItTbNO7qsJlxCCZczOQLzdFpRttqF3qPHzt
   IicyWY+/N0m0gYMXx7uDcfWX5yE44UXQvDQd0fLpj6bmUrDYGVk3pgivj
   mpHg7A4JuT4BqQkV6RA4CEArdg1mPzcCeiXR8gfLUyzSLElYIp8wqMTC8
   J7GryxAp752+6jiYnBuuSRCUWONOukW9SxF8OHVXtGkjt3MYJMDmfTc29
   xMRRCb3Wehwu6ImFUJ2fHsBRHYQ8aBnzbdQWGvvlpYgd9LTUlarAltzaf
   ZVjuTJIWE2ILGvZH1HqvBUmy3CQI96/49DwolntKrc/T6gq8Jg/JX3RWM
   w==;
X-CSE-ConnectionGUID: JcxAgvccR6mXXTvkK2uaKw==
X-CSE-MsgGUID: xdu0tbDpQxyISqGlfqY+lw==
X-IronPort-AV: E=Sophos;i="6.25,270,1779148800"; 
   d="scan'208";a="28069761"
Received: from ip-10-5-0-115.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.0.115])
  by internal-pdx-out-010.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2026 07:32:11 +0000
Received: from EX19MTAUWC001.ant.amazon.com [205.251.233.105:28928]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.12.178:2525] with esmtp (Farcaster)
 id c761178a-adb8-4491-b817-80e5952241c6; Wed, 9 Sep 2026 07:32:10 +0000 (UTC)
X-Farcaster-Flow-ID: c761178a-adb8-4491-b817-80e5952241c6
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWC001.ant.amazon.com (10.250.64.174) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.45;
 Wed, 9 Sep 2026 07:32:10 +0000
Received: from dev-dsk-akiyano-1c-2138b29d.eu-west-1.amazon.com (172.19.83.6)
 by EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.46;
 Wed, 9 Sep 2026 07:32:03 +0000
From: Arthur Kiyanovski <akiyano@amazon.com>
To: David Miller <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
	Richard Cochran <richardcochran@gmail.com>, <netdev@vger.kernel.org>
CC: Arthur Kiyanovski <akiyano@amazon.com>, Eric Dumazet
	<edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, David Woodhouse
	<dwmw2@infradead.org>, Thomas Gleixner <tglx@linutronix.de>, Miroslav Lichvar
	<mlichvar@redhat.com>, Maciek Machnikowski <maciek@machnikowski.net>, "Andrew
 Lunn" <andrew+netdev@lunn.ch>, Andrew Lunn <andrew@lunn.ch>, Carolina Jubran
	<cjubran@nvidia.com>, Wen Gu <guwen@linux.alibaba.com>, Xuan Zhuo
	<xuanzhuo@linux.alibaba.com>, David Woodhouse <dwmw@amazon.com>, "Yonatan
 Sarna" <ysarna@amazon.com>, Zorik Machulsky <zorik@amazon.com>, "Alexander
 Matushevsky" <matua@amazon.com>, Saeed Bshara <saeedb@amazon.com>, Matt
 Wilson <msw@amazon.com>, Anthony Liguori <aliguori@amazon.com>, Nafea Bshara
	<nafea@amazon.com>, Evgeny Schmeilin <evgenys@amazon.com>, Netanel Belgazal
	<netanel@amazon.com>, Ali Saidi <alisaidi@amazon.com>, Benjamin Herrenschmidt
	<benh@amazon.com>, Noam Dagan <ndagan@amazon.com>, David Arinzon
	<darinzon@amazon.com>, Evgeny Ostrovsky <evostrov@amazon.com>, Ofir Tabachnik
	<ofirt@amazon.com>, Amit Bernstein <amitbern@amazon.com>,
	<linux-kselftest@vger.kernel.org>, <linux-doc@vger.kernel.org>,
	<shuah@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Shuah Khan
	<skhan@linuxfoundation.org>, Simon Horman <horms@kernel.org>, Bjorn Helgaas
	<bhelgaas@google.com>, <vadim.fedorenko@linux.dev>
Subject: [PATCH v7 net-next 1/7] ptp: Add ioctls for PHC timestamps with quality attributes
Date: Wed, 9 Sep 2026 07:31:27 +0000
Message-ID: <20260909073136.12863-2-akiyano@amazon.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260909073136.12863-1-akiyano@amazon.com>
References: <20260909073136.12863-1-akiyano@amazon.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: EX19D031UWC004.ant.amazon.com (10.13.139.246) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)

Introduce two new ioctls that extend existing PTP timestamp interfaces
with clock quality information:

- PTP_SYS_OFFSET_EXTENDED_ATTRS: Extends PTP_SYS_OFFSET_EXTENDED
- PTP_SYS_OFFSET_PRECISE_ATTRS: Extends PTP_SYS_OFFSET_PRECISE

These ioctls provide quality attributes alongside timestamps:

1. error_bound: Maximum deviation from true time (nanoseconds), based
   on device's internal clock state
2. clock_status: Synchronization state (unknown, initializing,
   synchronized, free-running, unreliable)
3. timescale: Time reference (TAI, UTC, etc.)
4. counter_value: Raw system counter (e.g. TSC ticks) captured by the
   timekeeping core alongside each system timestamp; reported as 0 with
   counter_id PTP_COUNTER_UNKNOWN when the counter source cannot be
   identified
5. counter_id: Identifies the counter source (e.g. TSC, ARM arch counter)

This supports three use cases:

1. Managed PHC devices (e.g., ENA, vmclock) that maintain their own
   synchronization and can report quality metrics directly to userspace
   without requiring ptp4l

2. Applications that need complete time quality information in a single
   call, regardless of how the PHC is synchronized

3. VMMs that need raw system counter values paired
   with PTP timestamps for feed-forward clock calibration, avoiding the
   feedback loop inherent in NTP-style synchronization

Timescale definitions use a Continuity/Discipline framework to describe
timeline properties and steering behavior consistently across all
entries.

The _ATTRS ioctls fall back to the base timestamp callbacks (gettimex64 /
getcrosststamp) when a driver does not implement the corresponding attrs
callback. In that case the ioctl still returns the timestamps and the
system counter/timestamp fields and reports no quality attributes. The
extended_attrs / precise_attrs capability bits therefore indicate that the
ioctl is callable, while the per-timestamp att.valid bitmask indicates
which quality attributes were actually populated (zero when the driver
provides none).

For the precise ioctl only CLOCK_REALTIME and the auxiliary clocks are
supported, matching get_device_system_crosststamp(); other clock ids are
rejected with -EINVAL.

This implementation is based on the original RFC and the UAPI design
discussion linked below.

Link: https://lore.kernel.org/netdev/20250724115657.150-1-darinzon@amazon.com/
Link: https://lore.kernel.org/all/87se7ht25o.ffs@tglx/
Co-developed-by: Amit Bernstein <amitbern@amazon.com>
Signed-off-by: Amit Bernstein <amitbern@amazon.com>
Signed-off-by: Arthur Kiyanovski <akiyano@amazon.com>
---
 drivers/ptp/ptp_chardev.c        | 208 +++++++++++++++++++++--
 drivers/ptp/ptp_clock.c          |   4 +-
 include/linux/ptp_clock_kernel.h |  20 +++
 include/uapi/linux/ptp_clock.h   | 283 ++++++++++++++++++++++++++++++-
 4 files changed, 500 insertions(+), 15 deletions(-)

diff --git a/drivers/ptp/ptp_chardev.c b/drivers/ptp/ptp_chardev.c
index dc23cd708cfe..da6792102ce7 100644
--- a/drivers/ptp/ptp_chardev.c
+++ b/drivers/ptp/ptp_chardev.c
@@ -4,6 +4,7 @@
  *
  * Copyright (C) 2010 OMICRON electronics GmbH
  */
+#include <linux/clocksource_ids.h>
 #include <linux/compat.h>
 #include <linux/module.h>
 #include <linux/posix-clock.h>
@@ -190,6 +191,10 @@ static long ptp_clock_getcaps(struct ptp_clock *ptp, void __user *arg)
 		.cross_timestamping	= ptp->info->getcrosststamp != NULL,
 		.adjust_phase		= ptp->info->adjphase != NULL &&
 					  ptp->info->getmaxphase != NULL,
+		.extended_attrs		= ptp->info->gettimexattrs64 != NULL ||
+					  ptp->info->gettimex64 != NULL,
+		.precise_attrs		= ptp->info->getcrosststampattrs != NULL ||
+					  ptp->info->getcrosststamp != NULL,
 	};
 
 	if (caps.adjust_phase)
@@ -347,11 +352,48 @@ typedef int (*ptp_gettimex_fn)(struct ptp_clock_info *,
 			       struct timespec64 *,
 			       struct ptp_system_timestamp *);
 
+static int ptp_validate_sys_offset_clockid(__kernel_clockid_t clockid)
+{
+	switch (clockid) {
+	case CLOCK_REALTIME:
+	case CLOCK_MONOTONIC:
+	case CLOCK_MONOTONIC_RAW:
+		return 0;
+	case CLOCK_AUX ... CLOCK_AUX_LAST:
+		if (IS_ENABLED(CONFIG_POSIX_AUX_CLOCKS))
+			return 0;
+		fallthrough;
+	default:
+		return -EINVAL;
+	}
+}
+
+/*
+ * Validate clock_id for the precise crosststamp path.
+ * get_device_system_crosststamp() supports only CLOCK_REALTIME and the
+ * AUX clocks, so anything else (incl. the monotonic clocks accepted for
+ * the extended path) must be rejected here to avoid its WARN_ON_ONCE().
+ */
+static int ptp_validate_precise_clockid(__kernel_clockid_t clockid)
+{
+	switch (clockid) {
+	case CLOCK_REALTIME:
+		return 0;
+	case CLOCK_AUX ... CLOCK_AUX_LAST:
+		if (IS_ENABLED(CONFIG_POSIX_AUX_CLOCKS))
+			return 0;
+		fallthrough;
+	default:
+		return -EINVAL;
+	}
+}
+
 static long ptp_sys_offset_extended(struct ptp_clock *ptp, void __user *arg,
 				    ptp_gettimex_fn gettimex_fn)
 {
 	struct ptp_sys_offset_extended *extoff __free(kfree) = NULL;
 	struct ptp_system_timestamp sts;
+	int err;
 
 	if (!gettimex_fn)
 		return -EOPNOTSUPP;
@@ -363,23 +405,13 @@ static long ptp_sys_offset_extended(struct ptp_clock *ptp, void __user *arg,
 	if (extoff->n_samples > PTP_MAX_SAMPLES || extoff->rsv[0] || extoff->rsv[1])
 		return -EINVAL;
 
-	switch (extoff->clockid) {
-	case CLOCK_REALTIME:
-	case CLOCK_MONOTONIC:
-	case CLOCK_MONOTONIC_RAW:
-		break;
-	case CLOCK_AUX ... CLOCK_AUX_LAST:
-		if (IS_ENABLED(CONFIG_POSIX_AUX_CLOCKS))
-			break;
-		fallthrough;
-	default:
-		return -EINVAL;
-	}
+	err = ptp_validate_sys_offset_clockid(extoff->clockid);
+	if (err)
+		return err;
 
 	sts.clockid = extoff->clockid;
 	for (unsigned int i = 0; i < extoff->n_samples; i++) {
 		struct timespec64 ts;
-		int err;
 
 		err = gettimex_fn(ptp->info, &ts, &sts);
 		if (err)
@@ -404,6 +436,150 @@ static long ptp_sys_offset_extended(struct ptp_clock *ptp, void __user *arg,
 	return copy_to_user(arg, extoff, sizeof(*extoff)) ? -EFAULT : 0;
 }
 
+static u32 ptp_counter_id_from_csid(enum clocksource_ids cs_id)
+{
+	switch (cs_id) {
+	case CSID_X86_TSC_EARLY:
+	case CSID_X86_TSC:
+		return PTP_COUNTER_X86_TSC;
+	case CSID_ARM_ARCH_COUNTER:
+		return PTP_COUNTER_ARM_ARCH;
+	default:
+		/* CSID_X86_KVM_CLK is deliberately mapped to unknown:
+		 * kvmclock is not a raw hardware counter.
+		 */
+		return PTP_COUNTER_UNKNOWN;
+	}
+}
+
+static void ptp_fill_sys_counter(struct ptp_sys_time *st, u64 cycles,
+				 enum clocksource_ids cs_id)
+{
+	st->sys_counter_id = ptp_counter_id_from_csid(cs_id);
+	st->sys_counter = st->sys_counter_id == PTP_COUNTER_UNKNOWN ? 0 : cycles;
+}
+
+static long ptp_sys_offset_extended_attrs(struct ptp_clock *ptp, void __user *arg)
+{
+	struct ptp_sys_offset_attrs *data __free(kfree) = NULL;
+	struct ptp_attrs_request request;
+	unsigned int n_samples;
+	int err;
+
+	if (copy_from_user(&request, arg, sizeof(request)))
+		return -EFAULT;
+
+	if (request.valid ||
+	    !mem_is_zero(request.rsv, sizeof(request.rsv)) ||
+	    request.num_samples > PTP_MAX_SAMPLES ||
+	    request.num_samples == 0)
+		return -EINVAL;
+
+	err = ptp_validate_sys_offset_clockid(request.clock_id);
+	if (err)
+		return err;
+
+	n_samples = request.num_samples;
+
+	data = kzalloc(struct_size(data, timestamps, n_samples), GFP_KERNEL);
+	if (!data)
+		return -ENOMEM;
+
+	/* echo the request header back unchanged (ioctl is _IOWR) */
+	data->request = request;
+
+	for (unsigned int i = 0; i < n_samples; i++) {
+		struct ptp_system_timestamp sts = { .clockid = request.clock_id };
+		struct ptp_timestamp *tstamp = &data->timestamps[i];
+		struct ptp_clock_attrs att = {};
+		struct timespec64 ts;
+
+		if (ptp->info->gettimexattrs64)
+			err = ptp->info->gettimexattrs64(ptp->info, &ts, &sts, &att);
+		else if (ptp->info->gettimex64)
+			err = ptp->info->gettimex64(ptp->info, &ts, &sts);
+		else
+			return -EOPNOTSUPP;
+
+		if (err)
+			return err;
+
+		/* Filter out disabled or unavailable clocks */
+		if (!sts.pre_sts.valid || !sts.post_sts.valid)
+			return -EINVAL;
+
+		tstamp->pre_systime.sys_time = ktime_to_ns(sts.pre_sts.systime);
+		tstamp->pre_systime.sys_rawtime = ktime_to_ns(sts.pre_sts.monoraw);
+		ptp_fill_sys_counter(&tstamp->pre_systime, sts.pre_sts.cycles,
+				     sts.pre_sts.cs_id);
+		tstamp->devtime.device_time.sec = ts.tv_sec;
+		tstamp->devtime.device_time.nsec = ts.tv_nsec;
+		tstamp->devtime.attrs = att;
+		tstamp->post_systime.sys_time = ktime_to_ns(sts.post_sts.systime);
+		tstamp->post_systime.sys_rawtime = ktime_to_ns(sts.post_sts.monoraw);
+		ptp_fill_sys_counter(&tstamp->post_systime, sts.post_sts.cycles,
+				     sts.post_sts.cs_id);
+	}
+
+	return copy_to_user(arg, data,
+			    struct_size(data, timestamps, n_samples)) ? -EFAULT : 0;
+}
+
+static long ptp_sys_offset_precise_attrs(struct ptp_clock *ptp, void __user *arg)
+{
+	struct ptp_sys_offset_attrs *data __free(kfree) = NULL;
+	struct system_device_crosststamp xtstamp = {};
+	struct ptp_attrs_request request;
+	struct ptp_clock_attrs att = {};
+	struct ptp_timestamp *tstamp;
+	struct timespec64 ts;
+	int err;
+
+	if (copy_from_user(&request, arg, sizeof(request)))
+		return -EFAULT;
+
+	if (request.valid ||
+	    !mem_is_zero(request.rsv, sizeof(request.rsv)) ||
+	    request.num_samples != 1)
+		return -EINVAL;
+
+	err = ptp_validate_precise_clockid(request.clock_id);
+	if (err)
+		return err;
+
+	xtstamp.clock_id = request.clock_id;
+
+	data = kzalloc(struct_size(data, timestamps, 1), GFP_KERNEL);
+	if (!data)
+		return -ENOMEM;
+
+	/* echo the request header back unchanged (ioctl is _IOWR) */
+	data->request = request;
+	tstamp = &data->timestamps[0];
+
+	if (ptp->info->getcrosststampattrs)
+		err = ptp->info->getcrosststampattrs(ptp->info, &xtstamp, &att);
+	else if (ptp->info->getcrosststamp)
+		err = ptp->info->getcrosststamp(ptp->info, &xtstamp);
+	else
+		return -EOPNOTSUPP;
+
+	if (err)
+		return err;
+
+	ts = ktime_to_timespec64(xtstamp.device);
+	tstamp->systime.sys_time = ktime_to_ns(xtstamp.sys_systime);
+	tstamp->systime.sys_rawtime = ktime_to_ns(xtstamp.sys_monoraw);
+	ptp_fill_sys_counter(&tstamp->systime, xtstamp.sys_counter.cycles,
+			     xtstamp.sys_counter.cs_id);
+	tstamp->devtime.device_time.sec = ts.tv_sec;
+	tstamp->devtime.device_time.nsec = ts.tv_nsec;
+	tstamp->devtime.attrs = att;
+
+	return copy_to_user(arg, data,
+			    struct_size(data, timestamps, 1)) ? -EFAULT : 0;
+}
+
 static long ptp_sys_offset(struct ptp_clock *ptp, void __user *arg)
 {
 	struct ptp_sys_offset *sysoff __free(kfree) = NULL;
@@ -539,11 +715,17 @@ long ptp_ioctl(struct posix_clock_context *pccontext, unsigned int cmd,
 		return ptp_sys_offset_precise(ptp, argptr,
 					      ptp->info->getcrosststamp);
 
+	case PTP_SYS_OFFSET_PRECISE_ATTRS:
+		return ptp_sys_offset_precise_attrs(ptp, argptr);
+
 	case PTP_SYS_OFFSET_EXTENDED:
 	case PTP_SYS_OFFSET_EXTENDED2:
 		return ptp_sys_offset_extended(ptp, argptr,
 					       ptp->info->gettimex64);
 
+	case PTP_SYS_OFFSET_EXTENDED_ATTRS:
+		return ptp_sys_offset_extended_attrs(ptp, argptr);
+
 	case PTP_SYS_OFFSET:
 	case PTP_SYS_OFFSET2:
 		return ptp_sys_offset(ptp, argptr);
diff --git a/drivers/ptp/ptp_clock.c b/drivers/ptp/ptp_clock.c
index 4111342d64f0..27c0cd1eba59 100644
--- a/drivers/ptp/ptp_clock.c
+++ b/drivers/ptp/ptp_clock.c
@@ -113,7 +113,9 @@ static int ptp_clock_gettime(struct posix_clock *pc, struct timespec64 *tp)
 	struct ptp_clock *ptp = container_of(pc, struct ptp_clock, clock);
 	int err;
 
-	if (ptp->info->gettimex64)
+	if (ptp->info->gettimexattrs64)
+		err = ptp->info->gettimexattrs64(ptp->info, tp, NULL, NULL);
+	else if (ptp->info->gettimex64)
 		err = ptp->info->gettimex64(ptp->info, tp, NULL);
 	else
 		err = ptp->info->gettime64(ptp->info, tp);
diff --git a/include/linux/ptp_clock_kernel.h b/include/linux/ptp_clock_kernel.h
index 36a27a910595..9bf2b6066e78 100644
--- a/include/linux/ptp_clock_kernel.h
+++ b/include/linux/ptp_clock_kernel.h
@@ -123,11 +123,24 @@ struct ptp_system_timestamp {
  *               reading the lowest bits of the PHC timestamp and the second
  *               reading immediately follows that.
  *
+ * @gettimexattrs64:  Same as @gettimex64, but also fills @att (if not NULL)
+ *                    with the maximum error bound for the returned PHC
+ *                    timestamp in nanoseconds, the timescale for the returned
+ *                    PHC timestamp and the clock's qualitative synchronization
+ *                    status. As for @gettimex64, @sts may be NULL; @att may
+ *                    be NULL independently.
+ *
  * @getcrosststamp:  Reads the current time from the hardware clock and
  *                   system clock simultaneously.
  *                   parameter cts: Contains timestamp (device,system) pair,
  *                   where system time is realtime and monotonic.
  *
+ * @getcrosststampattrs:  Same as @getcrosststamp, but also fills @att (if not
+ *                        NULL) with the maximum error bound for the returned
+ *                        PHC timestamp in nanoseconds, the timescale for the
+ *                        returned PHC timestamp and the clock's qualitative
+ *                        synchronization status.
+ *
  * @settime64:  Set the current time on the hardware clock.
  *              parameter ts: Time value to set.
  *
@@ -209,8 +222,15 @@ struct ptp_clock_info {
 	int (*gettime64)(struct ptp_clock_info *ptp, struct timespec64 *ts);
 	int (*gettimex64)(struct ptp_clock_info *ptp, struct timespec64 *ts,
 			  struct ptp_system_timestamp *sts);
+	int (*gettimexattrs64)(struct ptp_clock_info *ptp,
+			       struct timespec64 *ts,
+			       struct ptp_system_timestamp *sts,
+			       struct ptp_clock_attrs *att);
 	int (*getcrosststamp)(struct ptp_clock_info *ptp,
 			      struct system_device_crosststamp *cts);
+	int (*getcrosststampattrs)(struct ptp_clock_info *ptp,
+				   struct system_device_crosststamp *cts,
+				   struct ptp_clock_attrs *att);
 	int (*settime64)(struct ptp_clock_info *p, const struct timespec64 *ts);
 	int (*getcycles64)(struct ptp_clock_info *ptp, struct timespec64 *ts);
 	int (*getcyclesx64)(struct ptp_clock_info *ptp, struct timespec64 *ts,
diff --git a/include/uapi/linux/ptp_clock.h b/include/uapi/linux/ptp_clock.h
index 46d45f902486..98a86c5621d4 100644
--- a/include/uapi/linux/ptp_clock.h
+++ b/include/uapi/linux/ptp_clock.h
@@ -79,6 +79,149 @@
  */
 #define PTP_PEROUT_V1_VALID_FLAGS	(0)
 
+/*
+ * Clock status values for struct ptp_clock_attrs.status
+ */
+enum ptp_clock_status {
+	/* Clock synchronization status cannot be reliably determined */
+	PTP_CLOCK_STATUS_UNKNOWN      = 0,
+
+	/* Clock is acquiring synchronization */
+	PTP_CLOCK_STATUS_INITIALIZING = 1,
+
+	/* Clock is synchronized and maintained accurately by the device */
+	PTP_CLOCK_STATUS_SYNCED       = 2,
+
+	/*
+	 * Clock is drifting but remains within acceptable error bounds;
+	 * error_bound is valid and can be trusted.
+	 */
+	PTP_CLOCK_STATUS_HOLDOVER     = 3,
+
+	/*
+	 * Clock is free-running: not currently disciplined toward a reference
+	 * (unlike HOLDOVER), but coasting on a known oscillator. error_bound
+	 * remains valid and can be trusted, and typically grows over time.
+	 */
+	PTP_CLOCK_STATUS_FREE_RUNNING = 4,
+
+	/*
+	 * Clock is considered broken (e.g. the oscillator is faulty or
+	 * abnormally unstable): error_bound cannot be trusted. A clock that is
+	 * merely unsynchronized or resynchronizing should report
+	 * PTP_CLOCK_STATUS_UNKNOWN or PTP_CLOCK_STATUS_INITIALIZING instead.
+	 */
+	PTP_CLOCK_STATUS_UNRELIABLE   = 5
+};
+
+/*
+ * Clock timescale values for struct ptp_clock_attrs.timescale.
+ *
+ * These definitions describe the mathematical properties and reference
+ * epochs of the timescale provided by the PHC.
+ *
+ * Discipline: Describes the frequency/phase steering behavior.
+ * Continuity: Describes whether the timeline is uninterrupted.
+ */
+enum ptp_clock_timescale {
+	/* Unknown or unspecified timescale */
+	PTP_TIMESCALE_UNKNOWN = 0,
+
+	/********************* Absolute Atomic Timescales *********************
+	 * These timescales are continuous, monotonic standards based on atomic
+	 * physics. They do not experience phase jumps.
+	 **********************************************************************/
+
+	/**
+	 * International Atomic Time (TAI)
+	 * Epoch: 1958-01-01 00:00:00.
+	 * Continuity: Strictly monotonic and continuous; no leap seconds.
+	 * Discipline: Primary atomic reference; no phase jumps.
+	 */
+	PTP_TIMESCALE_TAI = 1,
+
+	/**
+	 * Terrestrial Time (TT)
+	 * Epoch: 1958-01-01 00:00:00.
+	 * Continuity: Strictly monotonic and continuous; no leap seconds.
+	 * Discipline: Defined as TAI + 32.184s constant offset.
+	 */
+	PTP_TIMESCALE_TT = 2,
+
+	/**
+	 * Global Positioning System (GPS) Time
+	 * Epoch: 1980-01-06 00:00:00.
+	 * Continuity: Strictly monotonic and continuous; no leap seconds.
+	 * Discipline: Defined by the GPS constellation; fixed offset from TAI.
+	 */
+	PTP_TIMESCALE_GPS = 3,
+
+	/****************** UTC-Based Timescales (Civil Time) *****************
+	 * These timescales are derived from TAI but adjusted to align with
+	 * the Earth's rotation, primarily through leap seconds.
+	 **********************************************************************/
+
+	/**
+	 * Coordinated Universal Time (UTC) - Wall-clock (CLOCK_REALTIME)
+	 * Epoch: 1970-01-01 00:00:00 (Unix epoch).
+	 * Continuity: Discontinuous; subject to 1-second leap second
+	 *             phase jumps.
+	 * Discipline: Frequency steered; incorporates leap second corrections.
+	 *
+	 * Note: Leap-smeared UTC MUST NOT be advertised as PTP_TIMESCALE_UTC.
+	 * Smear algorithms are not standardized and the resulting timescale
+	 * is ambiguous. Implementations using smeared UTC MUST advertise
+	 * PTP_TIMESCALE_UNKNOWN or PTP_TIMESCALE_PROPRIETARY instead.
+	 */
+	PTP_TIMESCALE_UTC = 4,
+
+	/**
+	 * POSIX Time (Unix Time)
+	 * Epoch: 1970-01-01 00:00:00.
+	 * Continuity: Discontinuous; leap seconds handled by
+	 *             repeating/skipping values.
+	 * Discipline: Follows UTC frequency steering and phase jumps.
+	 */
+	PTP_TIMESCALE_POSIX = 5,
+
+	/****************** System-Relative Monotonic Clocks ******************
+	 * These timescales are relative to a system event (like boot)
+	 * and are not synchronized to an external atomic standard.
+	 **********************************************************************/
+
+	/**
+	 * Monotonic System Clock (CLOCK_MONOTONIC)
+	 * Epoch: Arbitrary (System boot time).
+	 * Continuity: Strictly monotonic; no leap seconds.
+	 * Discipline: Frequency steered to match system reference;
+	 *             does not advance during suspend.
+	 */
+	PTP_TIMESCALE_MONOTONIC = 6,
+
+	/**
+	 * Raw Monotonic System Clock (CLOCK_MONOTONIC_RAW)
+	 * Epoch: Arbitrary (System boot time).
+	 * Continuity: Strictly monotonic; no leap seconds.
+	 * Discipline: Raw hardware oscillator; no frequency steering
+	 *             or discipline.
+	 */
+	PTP_TIMESCALE_MONOTONIC_RAW = 7,
+
+	/**
+	 * Boot Time System Clock (CLOCK_BOOTTIME)
+	 * Epoch: Arbitrary (System boot time).
+	 * Continuity: Strictly monotonic and continuous; no leap seconds.
+	 * Discipline: Frequency steered to match system reference;
+	 *             advances during suspend.
+	 */
+	PTP_TIMESCALE_BOOTTIME = 8,
+
+	/********************** Vendor-Specific Timescale *********************/
+
+	/* A proprietary or vendor-specific timescale with custom rules. */
+	PTP_TIMESCALE_PROPRIETARY = 9,
+};
+
 /*
  * struct ptp_clock_time - represents a time value
  *
@@ -94,6 +237,136 @@ struct ptp_clock_time {
 	__u32 reserved;
 };
 
+/*
+ * Hardware counter identifiers for struct ptp_sys_time.sys_counter_id
+ */
+enum ptp_counter_id {
+	/* Counter value not available or type not specified */
+	PTP_COUNTER_UNKNOWN = 0,
+
+	/* x86 Time Stamp Counter (TSC) */
+	PTP_COUNTER_X86_TSC = 1,
+
+	/* ARM Generic Timer virtual counter */
+	PTP_COUNTER_ARM_ARCH = 2,
+};
+
+/* Valid flags for struct ptp_clock_attrs.valid */
+#define PTP_ATTRS_VALID_ERROR_BOUND	(1 << 0)
+#define PTP_ATTRS_VALID_TIMESCALE	(1 << 1)
+#define PTP_ATTRS_VALID_STATUS		(1 << 2)
+
+/**
+ * struct ptp_clock_attrs - quality attributes for a PHC timestamp
+ *
+ * @valid:       Bitmask of PTP_ATTRS_VALID_* indicating which fields
+ *               are populated. Zero means no attributes available.
+ * @error_bound: Maximum error (an upper bound, in nanoseconds) between the
+ *               returned device_time and true time on the advertised
+ *               @timescale; a worst-case bound, not a statistical estimate.
+ *               Valid only when PTP_ATTRS_VALID_ERROR_BOUND is set, and must
+ *               not be trusted when @status is PTP_CLOCK_STATUS_UNKNOWN or
+ *               PTP_CLOCK_STATUS_UNRELIABLE.
+ * @timescale:   Clock timescale (enum ptp_clock_timescale). Valid only
+ *               when PTP_ATTRS_VALID_TIMESCALE is set.
+ * @status:      Synchronization status (enum ptp_clock_status). Valid
+ *               only when PTP_ATTRS_VALID_STATUS is set. Transitions between
+ *               states are device-specific; there are no kernel-defined
+ *               thresholds relating @status to @error_bound.
+ * @rsv:         Reserved for future use, must be zero.
+ */
+struct ptp_clock_attrs {
+	__u32 valid;
+	__u32 error_bound;
+	__u32 timescale;
+	__u32 status;
+	__u32 rsv[4];
+};
+
+/**
+ * struct ptp_sys_time - system time snapshot with counter value
+ *
+ * @sys_time:       System time in nanoseconds (clock selected by request).
+ * @sys_rawtime:    CLOCK_MONOTONIC_RAW time in nanoseconds.
+ * @sys_counter:    Raw clocksource counter value (0 = unavailable).
+ * @sys_counter_id: Identifies the counter (enum ptp_counter_id).
+ * @rsv:            Reserved for future use, must be zero.
+ */
+struct ptp_sys_time {
+	__s64 sys_time;
+	__s64 sys_rawtime;
+	__u64 sys_counter;
+	__u32 sys_counter_id;
+	__u32 rsv;
+};
+
+/**
+ * struct ptp_dev_time - device timestamp with quality attributes
+ *
+ * @device_time: PHC timestamp value.
+ * @attrs:       Quality attributes for this timestamp.
+ */
+struct ptp_dev_time {
+	struct ptp_clock_time device_time;
+	struct ptp_clock_attrs attrs;
+};
+
+/**
+ * struct ptp_timestamp - a complete timestamp sample
+ *
+ * @systime:      System time snapshot; shares storage with @pre_systime,
+ *                used by PTP_SYS_OFFSET_PRECISE_ATTRS.
+ * @pre_systime:  System time read right before the device read, used by
+ *                PTP_SYS_OFFSET_EXTENDED_ATTRS.
+ * @devtime:      Device timestamp with its quality attributes.
+ * @post_systime: System time read right after the device read, used by
+ *                PTP_SYS_OFFSET_EXTENDED_ATTRS.
+ *
+ * For PTP_SYS_OFFSET_EXTENDED_ATTRS: pre_systime and post_systime bracket
+ * the device read (ABA sandwich).
+ * For PTP_SYS_OFFSET_PRECISE_ATTRS: only systime (union with pre_systime)
+ * is meaningful; post_systime is zeroed.
+ */
+struct ptp_timestamp {
+	union {
+		struct ptp_sys_time systime;
+		struct ptp_sys_time pre_systime;
+	};
+	struct ptp_dev_time devtime;
+	struct ptp_sys_time post_systime;
+};
+
+/**
+ * struct ptp_attrs_request - request parameters for attrs ioctls
+ *
+ * @valid:       Bitmask for future request extensions. Must be zero for now.
+ * @clock_id:    Clock base for system timestamps (CLOCK_REALTIME, etc).
+ * @num_samples: Number of timestamp samples requested.
+ *               For PTP_SYS_OFFSET_PRECISE_ATTRS must be 1.
+ * @rsv:         Reserved for future use, must be zero.
+ */
+struct ptp_attrs_request {
+	__u32 valid;
+	__kernel_clockid_t clock_id;
+	__u32 num_samples;
+	__u32 rsv[3];
+};
+
+/**
+ * struct ptp_sys_offset_attrs - unified data structure for attrs ioctls
+ *
+ * @request:    Request parameters (see struct ptp_attrs_request).
+ * @timestamps: Array of returned samples; holds request.num_samples entries.
+ *
+ * Used by both PTP_SYS_OFFSET_EXTENDED_ATTRS and
+ * PTP_SYS_OFFSET_PRECISE_ATTRS. Userspace allocates space for
+ * request.num_samples entries in the timestamps array.
+ */
+struct ptp_sys_offset_attrs {
+	struct ptp_attrs_request request;
+	struct ptp_timestamp timestamps[];
+};
+
 struct ptp_clock_caps {
 	int max_adj;   /* Maximum frequency adjustment in parts per billon. */
 	int n_alarm;   /* Number of programmable alarms. */
@@ -106,7 +379,11 @@ struct ptp_clock_caps {
 	/* Whether the clock supports adjust phase */
 	int adjust_phase;
 	int max_phase_adj; /* Maximum phase adjustment in nanoseconds. */
-	int rsv[11];       /* Reserved for future use. */
+	/* Whether the clock supports extended timestamps with attributes */
+	int extended_attrs;
+	/* Whether the clock supports precise cross-timestamps with attributes */
+	int precise_attrs;
+	int rsv[9];       /* Reserved for future use. */
 };
 
 struct ptp_extts_request {
@@ -252,6 +529,10 @@ struct ptp_pin_desc {
 	_IOWR(PTP_CLK_MAGIC, 21, struct ptp_sys_offset_precise)
 #define PTP_SYS_OFFSET_EXTENDED_CYCLES \
 	_IOWR(PTP_CLK_MAGIC, 22, struct ptp_sys_offset_extended)
+#define PTP_SYS_OFFSET_PRECISE_ATTRS \
+	_IOWR(PTP_CLK_MAGIC, 23, struct ptp_sys_offset_attrs)
+#define PTP_SYS_OFFSET_EXTENDED_ATTRS \
+	_IOWR(PTP_CLK_MAGIC, 24, struct ptp_sys_offset_attrs)
 
 struct ptp_extts_event {
 	struct ptp_clock_time t; /* Time event occurred. */
-- 
2.47.3

