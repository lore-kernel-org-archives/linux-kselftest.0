Received: from pdx-out-010.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-010.esa.us-west-2.outbound.mail-perimeter.amazon.com [52.12.53.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD9D73E16B2;
	Wed,  9 Sep 2026 07:32:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=52.12.53.23
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788939155; cv=none; b=B1k3imYGU5WNIRNn1Ko3LTxJCqNgEQ6OVe0KpW9JOm1h5mYhvI6uWgtGv5InxyuOeZnZrIjarz+pGKma4ucHIjqWI8Z2q6dVYxUHLwPtpTtMRdNgh0yARcHCwyivH8waz+FcLFavkvCGB0xDVy5hWzrGzWh2bBZ/w6lfkBY6IU4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788939155; c=relaxed/simple;
	bh=LJDznLb4h+0lE+GbnC0v+q6Ggf0igBWLdV44cR6icuU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ueGd9EUq3BzyKd4gD+N/FAXVmmqH7NkTfznnaIy3+wy4q+fDfU0UpjyffSlZGqAV3Ot+xJf9ZI7s7Jn+o/NZwht86o+EbsWTQce7EgvJfF5YHQTZ4BRajhij47U8RFKpACI+NABcfigdah8rlHtHhh2OjbqOBqc2A+Wb4SBRgoo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com; spf=pass smtp.mailfrom=amazon.com; dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b=ES8KKyk8; arc=none smtp.client-ip=52.12.53.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b="ES8KKyk8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1788939153; x=1820475153;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=/0jdCwn+y5nVMaX7qm+PvdYMyD43ABXxOqExSZ/wqOA=;
  b=ES8KKyk8WlTPbsC8DS5YYcmI9mX+8yHXnt22WnOiC8hg6Ct8xXhArr/G
   G5MaGFOPw2WWPLvI2aBkU6wSvKHYiDkZ4EOxlAGPfJW0fPygu8/Esy4Bh
   qKuOqcP/4CUERDos8kmmM2oedv1SJQ03Hz+yUge5gcrGYOI8+yF6yyAqh
   Wq/965XhhfuZGxjXg5/6Y3iJEdTd1MBoHjQoFCWiYJX5ZgFDBO6FEV07J
   ATfa7+QgkOYezEvhdtxkib9dGTwL+GeT6miLmnPqr7GvLX3lR/fgEeY82
   jfWfisXumITv2SezkRdy1V/JhUmSKCsHM4Vy+wP6MR60klwo+hGhMiTbk
   A==;
X-CSE-ConnectionGUID: EBKPKliLSYi+tA75jxZXGA==
X-CSE-MsgGUID: uCxTInpRS4+u6WjZVOtVCg==
X-IronPort-AV: E=Sophos;i="6.25,270,1779148800"; 
   d="scan'208";a="28069810"
Received: from ip-10-5-9-48.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.9.48])
  by internal-pdx-out-010.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2026 07:32:33 +0000
Received: from EX19MTAUWB001.ant.amazon.com [205.251.233.51:26277]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.54.182:2525] with esmtp (Farcaster)
 id b923e2a7-13ce-4fe9-bca4-b3dafad9e2c9; Wed, 9 Sep 2026 07:32:33 +0000 (UTC)
X-Farcaster-Flow-ID: b923e2a7-13ce-4fe9-bca4-b3dafad9e2c9
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWB001.ant.amazon.com (10.250.64.248) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.45;
 Wed, 9 Sep 2026 07:32:33 +0000
Received: from dev-dsk-akiyano-1c-2138b29d.eu-west-1.amazon.com (172.19.83.6)
 by EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.46;
 Wed, 9 Sep 2026 07:32:26 +0000
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
Subject: [PATCH v7 net-next 4/7] ptp: ptp_vmclock: Implement attributes ioctls
Date: Wed, 9 Sep 2026 07:31:30 +0000
Message-ID: <20260909073136.12863-5-akiyano@amazon.com>
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
X-ClientProxiedBy: EX19D040UWA001.ant.amazon.com (10.13.139.22) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)

Implement the gettimexattrs64 and getcrosststampattrs callbacks in the
ptp_vmclock driver to provide clock quality attributes through the new
PTP_SYS_OFFSET_EXTENDED_ATTRS and PTP_SYS_OFFSET_PRECISE_ATTRS ioctls.

The ptp_vmclock device exposes:
- error_bound: Derived from time_maxerror_nanosec, accumulated with
  counter frequency error (counter_period_maxerror_rate_frac_sec) over
  elapsed counter ticks
- clock_status: Mapped from the device's clock_status field
- timescale: Always reports TAI (UTC sources are converted by tai_adjust()
  before the attributes are populated)

The legacy ioctls return -EINVAL when clock_status is UNRELIABLE since
they have no way to communicate clock state to userspace. The attrs
ioctls have a status field for this purpose, so they treat UNRELIABLE
as success and let userspace check the status field.

To avoid a race where the hypervisor could update clock_status between
the timestamp call and the UNRELIABLE check, the clock state is captured
inside the seq_count loop for a consistent snapshot with the timestamp.

Signed-off-by: Arthur Kiyanovski <akiyano@amazon.com>
---
 drivers/ptp/ptp_vmclock.c | 199 +++++++++++++++++++++++++++++++++++---
 1 file changed, 183 insertions(+), 16 deletions(-)

diff --git a/drivers/ptp/ptp_vmclock.c b/drivers/ptp/ptp_vmclock.c
index bb0e14bac9f2..0cd449999139 100644
--- a/drivers/ptp/ptp_vmclock.c
+++ b/drivers/ptp/ptp_vmclock.c
@@ -53,6 +53,17 @@ struct vmclock_state {
 	char *name;
 };
 
+/**
+ * struct vmclock_crosststamp_ctx - context for get_device_system_crosststamp()
+ * @st: vmclock device state
+ * @attrs: optional output for PTP clock attributes, populated inside the
+ *         seq_count loop for a consistent snapshot with the timestamp
+ */
+struct vmclock_crosststamp_ctx {
+	struct vmclock_state *st;
+	struct ptp_clock_attrs *attrs;
+};
+
 #define VMCLOCK_MAX_WAIT ms_to_ktime(100)
 
 /* Require at least the flags field to be present. All else can be optional. */
@@ -95,13 +106,113 @@ static bool tai_adjust(struct vmclock_abi *clk, uint64_t *sec)
 	return false;
 }
 
+static uint8_t vmclock_get_ptp_timescale(uint8_t vmclock_time_type)
+{
+	switch (vmclock_time_type) {
+	case VMCLOCK_TIME_UTC:
+		return PTP_TIMESCALE_UTC;
+	case VMCLOCK_TIME_TAI:
+		return PTP_TIMESCALE_TAI;
+	case VMCLOCK_TIME_MONOTONIC:
+		return PTP_TIMESCALE_MONOTONIC;
+	default:
+		return PTP_TIMESCALE_UNKNOWN;
+	}
+}
+
+static uint8_t vmclock_get_ptp_status(uint8_t vmclock_status)
+{
+	switch (vmclock_status) {
+	case VMCLOCK_STATUS_UNKNOWN:
+		return PTP_CLOCK_STATUS_UNKNOWN;
+	case VMCLOCK_STATUS_INITIALIZING:
+		return PTP_CLOCK_STATUS_INITIALIZING;
+	case VMCLOCK_STATUS_SYNCHRONIZED:
+		return PTP_CLOCK_STATUS_SYNCED;
+	case VMCLOCK_STATUS_FREERUNNING:
+		return PTP_CLOCK_STATUS_FREE_RUNNING;
+	case VMCLOCK_STATUS_UNRELIABLE:
+		return PTP_CLOCK_STATUS_UNRELIABLE;
+	default:
+		return PTP_CLOCK_STATUS_UNKNOWN;
+	}
+}
+
+static void vmclock_populate_ptp_attributes(struct vmclock_state *st,
+					    struct ptp_clock_attrs *att,
+					    uint64_t delta)
+{
+	uint64_t maxerror_ns = UINT_MAX;
+	bool have_error_bound = false;
+
+	if (!att)
+		return;
+
+	/* Called once per seq_count retry, so don't accumulate stale bits */
+	att->valid = 0;
+	att->error_bound = 0;
+
+	/* Only calculate if the base error is flagged as valid
+	 * by the hypervisor.
+	 */
+	if (VMCLOCK_FIELD_PRESENT(st->clk, time_maxerror_nanosec) &&
+	    (le64_to_cpu(st->clk->flags) & VMCLOCK_FLAG_TIME_MAXERROR_VALID)) {
+		have_error_bound = true;
+		maxerror_ns = le64_to_cpu(st->clk->time_maxerror_nanosec);
+
+		/* If frequency error is also valid, accumulate it
+		 * over the delta.
+		 */
+		if (VMCLOCK_FIELD_PRESENT(st->clk, counter_period_maxerror_rate_frac_sec) &&
+		    (le64_to_cpu(st->clk->flags) & VMCLOCK_FLAG_PERIOD_MAXERROR_VALID)) {
+			uint64_t maxerror_rate, err_hi, err_frac, growth_ns;
+
+			maxerror_rate = le64_to_cpu(st->clk->counter_period_maxerror_rate_frac_sec);
+			err_frac = mul_u64_u64_shr_add_u64(&err_hi, delta,
+							   maxerror_rate,
+							   st->clk->counter_period_shift,
+							   0);
+
+			if (err_hi >= U64_MAX / NSEC_PER_SEC) {
+				maxerror_ns = U64_MAX;
+				goto saturate;
+			}
+
+			growth_ns = (err_hi * NSEC_PER_SEC) +
+				    mul_u64_u64_shr(err_frac, NSEC_PER_SEC, 64);
+
+			/* Guard against overflow */
+			if (U64_MAX - growth_ns < maxerror_ns)
+				maxerror_ns = U64_MAX;
+			else
+				maxerror_ns += growth_ns;
+		}
+	}
+
+saturate:
+	if (have_error_bound) {
+		att->error_bound = (maxerror_ns > UINT_MAX) ?
+			UINT_MAX : (uint32_t)maxerror_ns;
+		att->valid |= PTP_ATTRS_VALID_ERROR_BOUND;
+	}
+	att->timescale = vmclock_get_ptp_timescale(st->clk->time_type);
+	/* tai_adjust() already converted UTC to TAI before we're called */
+	if (st->clk->time_type == VMCLOCK_TIME_UTC)
+		att->timescale = PTP_TIMESCALE_TAI;
+	att->valid |= PTP_ATTRS_VALID_TIMESCALE;
+	att->status = vmclock_get_ptp_status(st->clk->clock_status);
+	att->valid |= PTP_ATTRS_VALID_STATUS;
+}
+
 static int vmclock_get_crosststamp(struct vmclock_state *st,
 				   struct ptp_system_timestamp *sts,
 				   struct system_counterval_t *system_counter,
-				   struct timespec64 *tspec)
+				   struct timespec64 *tspec,
+				   struct ptp_clock_attrs *attrs)
 {
 	ktime_t deadline = ktime_add(ktime_get(), VMCLOCK_MAX_WAIT);
 	uint64_t cycle, delta, seq, frac_sec;
+	uint8_t clock_status = VMCLOCK_STATUS_UNKNOWN;
 
 #ifdef CONFIG_X86
 	/*
@@ -121,9 +232,6 @@ static int vmclock_get_crosststamp(struct vmclock_state *st,
 		 */
 		virt_rmb();
 
-		if (st->clk->clock_status == VMCLOCK_STATUS_UNRELIABLE)
-			return -EINVAL;
-
 		/*
 		 * When invoked for gettimex64(), fill in the pre/post system
 		 * times. The simple case is when system time is based on the
@@ -164,6 +272,17 @@ static int vmclock_get_crosststamp(struct vmclock_state *st,
 		if (!tai_adjust(st->clk, &tspec->tv_sec))
 			return -EINVAL;
 
+		/*
+		 * Capture clock state inside the seq_count loop for a
+		 * consistent snapshot with the timestamp. The attrs path
+		 * reports it to userspace via the status field; the legacy
+		 * path saves it for the UNRELIABLE check after the loop.
+		 */
+		if (attrs)
+			vmclock_populate_ptp_attributes(st, attrs, delta);
+		else
+			clock_status = st->clk->clock_status;
+
 		/*
 		 * This pairs with a write barrier in the hypervisor
 		 * which populates this structure.
@@ -181,6 +300,17 @@ static int vmclock_get_crosststamp(struct vmclock_state *st,
 		system_counter->cs_id = st->cs_id;
 	}
 
+	/*
+	 * If attrs is set, attributes were already populated inside the
+	 * seq_count loop. Return success even for UNRELIABLE - the attrs
+	 * ioctl can report the status to userspace.
+	 */
+	if (attrs)
+		return 0;
+
+	if (clock_status == VMCLOCK_STATUS_UNRELIABLE)
+		return -EINVAL;
+
 	return 0;
 }
 
@@ -193,7 +323,8 @@ static int vmclock_get_crosststamp(struct vmclock_state *st,
 static int vmclock_get_crosststamp_kvmclock(struct vmclock_state *st,
 					    struct ptp_system_timestamp *sts,
 					    struct system_counterval_t *system_counter,
-					    struct timespec64 *tspec)
+					    struct timespec64 *tspec,
+					    struct ptp_clock_attrs *attrs)
 {
 	struct pvclock_vcpu_time_info *pvti = this_cpu_pvti();
 	unsigned int pvti_ver;
@@ -204,7 +335,8 @@ static int vmclock_get_crosststamp_kvmclock(struct vmclock_state *st,
 	do {
 		pvti_ver = pvclock_read_begin(pvti);
 
-		ret = vmclock_get_crosststamp(st, sts, system_counter, tspec);
+		ret = vmclock_get_crosststamp(st, sts, system_counter, tspec,
+					      attrs);
 		if (ret)
 			break;
 
@@ -233,17 +365,19 @@ static int ptp_vmclock_get_time_fn(ktime_t *device_time,
 				   struct system_counterval_t *system_counter,
 				   void *ctx)
 {
-	struct vmclock_state *st = ctx;
+	struct vmclock_crosststamp_ctx *vctx = ctx;
+	struct vmclock_state *st = vctx->st;
 	struct timespec64 tspec;
 	int ret;
 
 #ifdef SUPPORT_KVMCLOCK
 	if (READ_ONCE(st->sys_cs_id) == CSID_X86_KVM_CLK)
 		ret = vmclock_get_crosststamp_kvmclock(st, NULL, system_counter,
-						       &tspec);
+						       &tspec, vctx->attrs);
 	else
 #endif
-		ret = vmclock_get_crosststamp(st, NULL, system_counter, &tspec);
+		ret = vmclock_get_crosststamp(st, NULL, system_counter, &tspec,
+					      vctx->attrs);
 
 	if (!ret)
 		*device_time = timespec64_to_ktime(tspec);
@@ -251,12 +385,10 @@ static int ptp_vmclock_get_time_fn(ktime_t *device_time,
 	return ret;
 }
 
-static int ptp_vmclock_getcrosststamp(struct ptp_clock_info *ptp,
-				      struct system_device_crosststamp *xtstamp)
+static int ptp_vmclock_do_getcrosststamp(struct vmclock_crosststamp_ctx *vctx,
+					 struct system_device_crosststamp *xtstamp)
 {
-	struct vmclock_state *st = container_of(ptp, struct vmclock_state,
-						ptp_clock_info);
-	int ret = get_device_system_crosststamp(ptp_vmclock_get_time_fn, st,
+	int ret = get_device_system_crosststamp(ptp_vmclock_get_time_fn, vctx,
 						NULL, xtstamp);
 #ifdef SUPPORT_KVMCLOCK
 	/*
@@ -265,6 +397,7 @@ static int ptp_vmclock_getcrosststamp(struct ptp_clock_info *ptp,
 	 * timestamp that get_device_system_crosststamp() *can* handle.
 	 */
 	if (ret == -ENODEV) {
+		struct vmclock_state *st = vctx->st;
 		struct system_time_snapshot systime_snapshot;
 
 		ktime_get_snapshot_id(CLOCK_REALTIME, &systime_snapshot);
@@ -273,13 +406,23 @@ static int ptp_vmclock_getcrosststamp(struct ptp_clock_info *ptp,
 		    systime_snapshot.cs_id == CSID_X86_KVM_CLK) {
 			WRITE_ONCE(st->sys_cs_id, systime_snapshot.cs_id);
 			ret = get_device_system_crosststamp(ptp_vmclock_get_time_fn,
-							    st, NULL, xtstamp);
+							    vctx, NULL, xtstamp);
 		}
 	}
 #endif
 	return ret;
 }
 
+static int ptp_vmclock_getcrosststamp(struct ptp_clock_info *ptp,
+				      struct system_device_crosststamp *xtstamp)
+{
+	struct vmclock_state *st = container_of(ptp, struct vmclock_state,
+						ptp_clock_info);
+	struct vmclock_crosststamp_ctx vctx = { .st = st };
+
+	return ptp_vmclock_do_getcrosststamp(&vctx, xtstamp);
+}
+
 /*
  * PTP clock operations
  */
@@ -306,7 +449,29 @@ static int ptp_vmclock_gettimex(struct ptp_clock_info *ptp, struct timespec64 *t
 	struct vmclock_state *st = container_of(ptp, struct vmclock_state,
 						ptp_clock_info);
 
-	return vmclock_get_crosststamp(st, sts, NULL, ts);
+	return vmclock_get_crosststamp(st, sts, NULL, ts, NULL);
+}
+
+static int ptp_vmclock_gettimexattrs(struct ptp_clock_info *ptp,
+				     struct timespec64 *ts,
+				     struct ptp_system_timestamp *sts,
+				     struct ptp_clock_attrs *att)
+{
+	struct vmclock_state *st = container_of(ptp, struct vmclock_state,
+						ptp_clock_info);
+
+	return vmclock_get_crosststamp(st, sts, NULL, ts, att);
+}
+
+static int ptp_vmclock_getcrosststampattrs(struct ptp_clock_info *ptp,
+					   struct system_device_crosststamp *xtstamp,
+					   struct ptp_clock_attrs *att)
+{
+	struct vmclock_state *st = container_of(ptp, struct vmclock_state,
+						ptp_clock_info);
+	struct vmclock_crosststamp_ctx vctx = { .st = st, .attrs = att };
+
+	return ptp_vmclock_do_getcrosststamp(&vctx, xtstamp);
 }
 
 static int ptp_vmclock_enable(struct ptp_clock_info *ptp,
@@ -324,9 +489,11 @@ static const struct ptp_clock_info ptp_vmclock_info = {
 	.adjfine	= ptp_vmclock_adjfine,
 	.adjtime	= ptp_vmclock_adjtime,
 	.gettimex64	= ptp_vmclock_gettimex,
+	.gettimexattrs64 = ptp_vmclock_gettimexattrs,
 	.settime64	= ptp_vmclock_settime,
 	.enable		= ptp_vmclock_enable,
 	.getcrosststamp = ptp_vmclock_getcrosststamp,
+	.getcrosststampattrs = ptp_vmclock_getcrosststampattrs,
 };
 
 static struct ptp_clock *vmclock_ptp_register(struct device *dev,
-- 
2.47.3

