Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=159.69.126.157
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794316843;
	b=Sd4dyC+Arvo668oIpdFlmJA0PHJbi60+FHzUYZO333SxI8tKsCG9UdounA3xRdnt3aCE
	 zf0fYhD97wqSOdGdZScHu7LB7PSPD9d0GJbPzEZ6I2b+4oe6UBdhSITYVjO0zoYFs91Ef
	 OHRleAaoWkGGxh/Pj/tUUuLh2mjq8+5PQTxlXRonKRJQVGJw/4V9Bz8Mu6HbcNh/N8NhG
	 +IUhkqa8P0+WXBUb20+z2Ksa9iL8GL3ow9wM/hw15K/a9Tk/tWgbUjVWBv+rohHY+h+gN
	 KxNPJ84U0LoA06ENhl5vG2FU4SQsQQvxJfEj1vZVKW+dW+f8M/SZM+BCLujEMt6cD0Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794316843;
	h=DMARC-Filter:DKIM-Signature:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=JwMWqxCuK8RPjNY1eIeE4mQ3a+WEWgrQ7FztWEgEEJM=;
	b=S6kPfQu1h8eeSMiGoyBVBYjWv3WhoeZY8VYGHhBEuS1Ib/vURRwekEwrCb5jOkFMNKaS
	 HhUpr2ISewr9g/eq+hvna/xMbcSyTdqnXHFiyWAsyFRMPysbTEmvnt4NvwW/shPOWFH+W
	 GFOMLQBsXJ9uYpgKSat0Pk3RvRNYw2EiV2zXQf92DnJQQlJkQzbkFK8GhKW0aZZW0HkXi
	 DeRXkya2WuMpb2GNLb7GSgRXZv3DhG3pG4l2M9OUjoM1EiiRaDZ7TB1tx9j0+UC0+9aCV
	 a0U7LINGI7DQoxFN28mj2CJTNF/ro6eh8cF8Jrn9RXrfo8Tqs684V7a4mghWkUflxng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=weissschuh.net;
	spf=pass smtp.mailfrom=weissschuh.net;
	dkim=pass header.d=weissschuh.net header.i=@weissschuh.net header.a=rsa-sha256 header.s=mail header.b=cn5WkEGr;
	arc=none smtp.remote-ip=159.69.126.157
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3015B6079895;
	Tue, 10 Nov 2026 13:20:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3015B6079895
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.a=rsa-sha256 header.s=mail header.b=cn5WkEGr
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1794316839;
	bh=83UJjKCC3Qx+ol1WJwX902c909vVbbX4SBscaJVktkM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=cn5WkEGrUm5qCaT3baU+TUVVjJLmXcIplpbzcoyP1JwSl+/VzRRJ1aAohA+T1uIuW
	 gY7yvN4FDqZDzXdfC6SzkLrEwGDHtA9uGgK1nXaj3BoyAxMU2A8oLPU4xk6H5X6cpb
	 OeJktEv2g/DMmM1Jt/gZE9EDrAggiCamIKGlD4tU=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Tue, 10 Nov 2026 13:19:33 +0000
Subject: [PATCH v3 2/4] vdso: Add alarmclock support infrastructure
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261110-vdso-alarm-clocks-v3-2-8f3c0c5b5a11@weissschuh.net>
References: <20261110-vdso-alarm-clocks-v3-0-8f3c0c5b5a11@weissschuh.net>
In-Reply-To: <20261110-vdso-alarm-clocks-v3-0-8f3c0c5b5a11@weissschuh.net>
To: Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
 Vincenzo Frascino <vincenzo.frascino@arm.com>, 
 Shuah Khan <shuah@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794316776; l=4940;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=83UJjKCC3Qx+ol1WJwX902c909vVbbX4SBscaJVktkM=;
 b=jVi+E6cTsGEMvQ8x/pybfBpVL9gWl+7s9Y+qP9S/PwucyclNGt6DbPQdqkSiWBnUGuYYRMHlq
 +Eu4LH0GOZbBSCzGFNshTjhy5nd1YRwZ3vSTGH2k/v44SKaAUAifZ7H
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=

Prepare the addition of alarmclock support to the vDSO.
These behave exactly as their non-alarm counterparts,
except that they can only be used when an RTC device is enabled.

A registered RTC device can never be unregistered, so this does not need
to be handled. The basetimes will be maintained through the regular
update_vsyscall() path. As the basetime will have been set by the time
vdso_time_enable_alarmclock() will be called no synchronization is
necessary here. An unavailable alarmclock will fall through to the
system call, similar to disabled auxiliary clocks.

The following patches will extend VDSO_ALARM with the relevant clocks.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
 include/vdso/datapage.h            |  3 ++-
 kernel/time/alarmtimer.c           |  2 ++
 kernel/time/timekeeping_internal.h |  4 ++++
 kernel/time/vsyscall.c             | 11 +++++++++++
 lib/vdso/gettimeofday.c            | 12 ++++++++++++
 5 files changed, 31 insertions(+), 1 deletion(-)

diff --git a/include/vdso/datapage.h b/include/vdso/datapage.h
index 5c4dac5bdda9..89ecf9f9fce5 100644
--- a/include/vdso/datapage.h
+++ b/include/vdso/datapage.h
@@ -40,6 +40,7 @@ struct vdso_arch_data {
 			 BIT(CLOCK_MONOTONIC_COARSE))
 #define VDSO_RAW	(BIT(CLOCK_MONOTONIC_RAW))
 #define VDSO_AUX	__GENMASK(CLOCK_AUX_LAST, CLOCK_AUX)
+#define VDSO_ALARM	0
 
 /**
  * struct vdso_timestamp - basetime per clock_id
@@ -132,7 +133,7 @@ struct vdso_time_data {
 	s32				tz_minuteswest;
 	s32				tz_dsttime;
 	u32				hrtimer_res;
-	u32				__unused;
+	u32				alarmclock_mask;
 } ____cacheline_aligned;
 
 /**
diff --git a/kernel/time/alarmtimer.c b/kernel/time/alarmtimer.c
index ea5be5870e51..161a4b4127f8 100644
--- a/kernel/time/alarmtimer.c
+++ b/kernel/time/alarmtimer.c
@@ -29,6 +29,7 @@
 #include <linux/time_namespace.h>
 
 #include "posix-timers.h"
+#include "timekeeping_internal.h"
 
 #define CREATE_TRACE_POINTS
 #include <trace/events/alarmtimer.h>
@@ -101,6 +102,7 @@ static int alarmtimer_rtc_add_device(struct device *dev)
 	scoped_guard(spinlock_irqsave, &rtcdev_lock) {
 		if (!IS_ERR(pdev) && !rtcdev && try_module_get(rtc->owner)) {
 			rtcdev = rtc;
+			vdso_time_enable_alarmclock();
 			/* hold a reference so it doesn't go away */
 			get_device(dev);
 			pdev = NULL;
diff --git a/kernel/time/timekeeping_internal.h b/kernel/time/timekeeping_internal.h
index 6d719b8e5ea2..3ffda8af157f 100644
--- a/kernel/time/timekeeping_internal.h
+++ b/kernel/time/timekeeping_internal.h
@@ -55,6 +55,7 @@ long ktime_get_ntp_seconds(unsigned int id);
 extern void update_vsyscall(struct timekeeper *tk);
 extern void update_vsyscall_tz(void);
 extern void vdso_time_update_aux(struct timekeeper *tk);
+extern void vdso_time_enable_alarmclock(void);
 
 #else
 
@@ -67,6 +68,9 @@ static inline void update_vsyscall_tz(void)
 static inline void vdso_time_update_aux(struct timekeeper *tk)
 {
 }
+static inline void vdso_time_enable_alarmclock(void)
+{
+}
 #endif
 
 #endif /* _TIMEKEEPING_INTERNAL_H */
diff --git a/kernel/time/vsyscall.c b/kernel/time/vsyscall.c
index 12d3518306e4..fc3313d6afa6 100644
--- a/kernel/time/vsyscall.c
+++ b/kernel/time/vsyscall.c
@@ -141,6 +141,17 @@ void update_vsyscall_tz(void)
 	__arch_sync_vdso_time_data(vdata);
 }
 
+#ifdef CONFIG_RTC_CLASS
+void vdso_time_enable_alarmclock(void)
+{
+	struct vdso_time_data *vdata = vdso_k_time_data;
+
+	WRITE_ONCE(vdata->alarmclock_mask, VDSO_ALARM);
+
+	__arch_sync_vdso_time_data(vdata);
+}
+#endif
+
 #ifdef CONFIG_POSIX_AUX_CLOCKS
 void vdso_time_update_aux(struct timekeeper *tk)
 {
diff --git a/lib/vdso/gettimeofday.c b/lib/vdso/gettimeofday.c
index 4d1d5031cf32..9fd9ac287309 100644
--- a/lib/vdso/gettimeofday.c
+++ b/lib/vdso/gettimeofday.c
@@ -109,6 +109,14 @@ static __always_inline bool vdso_clockid_valid(clockid_t clock)
 	return likely((u32) clock <= CLOCK_AUX_LAST);
 }
 
+static __always_inline u32 vdso_alarmclock_mask(const struct vdso_time_data *vd)
+{
+	if (!IS_ENABLED(CONFIG_RTC_CLASS))
+		return 0;
+
+	return READ_ONCE(vd->alarmclock_mask);
+}
+
 /*
  * Must not be invoked within the sequence read section as a race inside
  * that loop could result in __iter_div_u64_rem() being extremely slow.
@@ -305,6 +313,8 @@ __cvdso_clock_gettime_common(const struct vdso_time_data *vd, clockid_t clock,
 		vc = &vd->raw;
 	else if (msk & VDSO_AUX)
 		return do_aux(vd, clock, ts);
+	else if (msk & vdso_alarmclock_mask(vd))
+		vc = &vd->hres_coarse;
 	else
 		return false;
 
@@ -461,6 +471,8 @@ bool __cvdso_clock_getres_common(const struct vdso_time_data *vd, clockid_t cloc
 		ns = LOW_RES_NSEC;
 	} else if (msk & VDSO_AUX) {
 		ns = aux_clock_resolution_ns();
+	} else if (msk & vdso_alarmclock_mask(vd)) {
+		ns = READ_ONCE(vd->hrtimer_res);
 	} else {
 		return false;
 	}

-- 
2.56.0

