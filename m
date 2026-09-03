Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B98C0372ECF;
	Thu,  3 Sep 2026 07:38:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788421108; cv=none; b=DltYUBk75HB86gThLWdC2JWRuaHDZkMc4HEVEpqmDUEDaEGpdCjjoyS0/CAZlbEpup+xeBq8/PeyUMuuxostIHwzkXVxbKOTByORO700PhZRwYNQH6LTWRXCllq1HKlZ/abRPpRhj9OiaotmFAgx7otOlcyJqwcnSbMS9y7XzUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788421108; c=relaxed/simple;
	bh=jSbsNrDsNF8eG8WyWSi9/+LYAGR9JEBbXV6OZR1wqHI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=W0sfGfKIFsLPLPD36Fm78C0pTOi7EQajH8oYqV4O+Xd3ZRUiTDDL4f12m5J62aet5PNKePPEdyB+RZoNKFFph6xV9x7OiudlI3KQ4BNq4ryc/zBPFsd6MjqImXs5iLv78U8HdTbm5mfSKf9SLtg3CPO5t3UXgCBZ3QeI9pq2Xfs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=lzw22daR; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=Oef0lU1o; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="lzw22daR";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="Oef0lU1o"
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1788421098;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=g5r3iNEl0MalsavYoO99hlFyAi3SsE7pkO3K5bXIIbE=;
	b=lzw22daRC2ySfyh8dqSkxmmCPxL2OM7C7JOBcnhlhUb+FCAM63ZV1r0z7qHOVqclakW66u
	hUZaP2A57HdD+RRQ3rw+3OQ1pO4fKi/uMZh9Y8Tk7rhBYNebadQF+r0q110O0OJgfcR8UB
	pYMKv+Y+Si45VOZy/4wcCCDK/vsrbksw5DNAigqkRxdwKYiXL1Ih0qvlM1TcgyPsd7mDd9
	rrxlxhIknib+QTGTS3bBd50iJYYh0iknd5VWXySOSjHp0/iFIgOs9ux3zsK2wtHZ/ptIT1
	dSrlGXGUTNfWpUvKSRzoFnbrpmIIA7NvfFHNHIJ/b0JVZE3kKB2kxzs4tNoGxA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1788421098;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=g5r3iNEl0MalsavYoO99hlFyAi3SsE7pkO3K5bXIIbE=;
	b=Oef0lU1oT6UFQqjltZXUrfDagCN6KRFIiwtWUa+eNjLKjsBWC594M3mLVwm/hZK0ZnNvYk
	dVHneD17Qjy92FCg==
Date: Thu, 03 Sep 2026 09:38:13 +0200
Subject: [PATCH v2 1/8] selftests: vDSO: Introduce vdso_types.h
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260903-vdso-test-types-v2-1-1eec04eb3658@linutronix.de>
References: <20260903-vdso-test-types-v2-0-1eec04eb3658@linutronix.de>
In-Reply-To: <20260903-vdso-test-types-v2-0-1eec04eb3658@linutronix.de>
To: Andy Lutomirski <luto@kernel.org>, 
 Vincenzo Frascino <vincenzo.frascino@arm.com>, 
 Shuah Khan <shuah@kernel.org>, Thomas Gleixner <tglx@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788421097; l=3314;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=jSbsNrDsNF8eG8WyWSi9/+LYAGR9JEBbXV6OZR1wqHI=;
 b=FrJaC/zqqg5H6TTP0Fm9WJ+J/SLQeJtOKap/9ewVbCLtLqP0UUoIxDYwGG2QOWPFXpTVxpR32
 nWCko3CWk1MB+uDkwW4wMv7ncsbkumX46Y9Q//q61MEO9Uu+ILdVrGC
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=

Currently the vDSO selftests use the time-related types from libc.
This works on glibc by chance today but will break with other libc
implementations or on distributions which switch to 64-bit times
everywhere.

The kernel's UAPI headers provide the proper types to use with the vDSO
(and raw syscalls) but are not necessarily compatible with libc types.
Introduce a new header which makes the UAPI headers compatible with the
libc.

Tested with glibc, musl and nolibc.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 tools/testing/selftests/vDSO/vdso_types.h | 75 +++++++++++++++++++++++++++++++
 1 file changed, 75 insertions(+)

diff --git a/tools/testing/selftests/vDSO/vdso_types.h b/tools/testing/selftests/vDSO/vdso_types.h
new file mode 100644
index 000000000000..4cb564f3fa94
--- /dev/null
+++ b/tools/testing/selftests/vDSO/vdso_types.h
@@ -0,0 +1,75 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (C) 2025 Thomas Weißschuh <thomas.weissschuh@linutronix.de>, Linutronix GmbH
+ *
+ * Types to use with vDSO functions.
+ *
+ * The types used by the vDSO functions do not necessarily match the ones used
+ * by libc. The kernel's UAPI headers do provide definitions for those types
+ * but are often not compatible with libc which applications need to use.
+ * As the types differ between platforms listing them manually is a lot of work
+ * and error prone. Instead hack around the incompatibilities of the libc and
+ * UAPI headers and use the UAPI types.
+ */
+#ifndef __VDSO_TYPES_H__
+#define __VDSO_TYPES_H__
+
+/*
+ * Include the headers from libc first to not override any of its types later.
+ */
+#include <time.h>
+#include <sys/time.h>
+
+/*
+ * Avoid collisions.
+ */
+#define timeval kernel_timeval_moved
+#define itimerspec kernel_itimerspec_moved
+#define itimerval kernel_itimerval_moved
+#define timezone kernel_timezone_moved
+
+#ifndef _STRUCT_TIMESPEC
+#define _STRUCT_TIMESPEC
+#endif
+
+/*
+ * Get the UAPI types.
+ */
+#include <linux/time.h>
+
+#undef timeval
+#undef itimerspec
+#undef itimerval
+#undef timezone
+
+/*
+ * The UAPI headers do not provide their own 'struct __kernel_timezone'.
+ * 'struct timezone' is the one from libc.
+ */
+struct kernel_timezone {
+	int	tz_minuteswest;
+	int	tz_dsttime;
+};
+
+#include <linux/version.h>
+
+/*
+ * UAPI headers from the libc may be older and not provide these.
+ */
+#if KERNEL_VERSION(5, 5, 0) > LINUX_VERSION_CODE
+typedef __kernel_long_t		__kernel_old_time_t;
+
+struct __kernel_old_timespec {
+	__kernel_old_time_t	tv_sec;
+	__kernel_long_t		tv_nsec;
+};
+#endif
+
+typedef long (*vdso_gettimeofday_t)(struct __kernel_old_timeval *tv, struct kernel_timezone *tz);
+typedef long (*vdso_clock_gettime_t)(__kernel_clockid_t clk_id, struct __kernel_old_timespec *ts);
+typedef long (*vdso_clock_gettime64_t)(__kernel_clockid_t clk_id, struct __kernel_timespec *ts);
+typedef long (*vdso_clock_getres_t)(__kernel_clockid_t clk_id, struct __kernel_old_timespec *ts);
+typedef long (*vdso_clock_getres_time64_t)(__kernel_clockid_t clk_id, struct __kernel_timespec *ts);
+typedef __kernel_old_time_t (*vdso_time_t)(__kernel_old_time_t *t);
+
+#endif /* __VDSO_TYPES_H__ */

-- 
2.55.0

