Received: from mail-pg1-f202.google.com (mail-pg1-f202.google.com [209.85.215.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C6FD3E315A
	for <linux-kselftest@vger.kernel.org>; Tue,  9 Jun 2026 07:56:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780991771; cv=none; b=F2c5oFC0iSkIiQx0/7l62rALX1qbqFLKY9SQ3pwInvkg3ywxHPLzmIkRYkSaPVvjtu/pir/sK1XV5TZueht6qauofOsJI9bNacTlSkTZYASXGoqZk1LM61T0p8MOa6lDW7A8Ngnu8M0lSOIpA/Z8aqyutJlTfL1FO2/J6/dSn+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780991771; c=relaxed/simple;
	bh=ZMYGJzSfYC80BCBQs98yeK6ls43XfqmH6f2P8HPHEis=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=UO/9IfV86OaNwE60b9Wyj8Eanh3cE18gLGH9oz08c+8Bl7kW2n7boCXRFzOGgRHUa3YPKE/xZW5F6LXswyaTcSfbJoB8huzgj2EXi2OEYtNfhqaSIFfQm5fEU8sZdI2Hjeirwfw70u1UQyBgaR+DZeMxCMxmDPYZgnRQRQOQ7iQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--wakel.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=j3AfLFcv; arc=none smtp.client-ip=209.85.215.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--wakel.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="j3AfLFcv"
Received: by mail-pg1-f202.google.com with SMTP id 41be03b00d2f7-c85a2c0b56fso4697555a12.0
        for <linux-kselftest@vger.kernel.org>; Tue, 09 Jun 2026 00:56:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780991768; x=1781596568; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=2F3wTWsr9h448dGCLvqZnhlMLjq8YfaAF/vL4do8mX0=;
        b=j3AfLFcvl91+yzzdY6CV6qEePQ/Qq43jJy2soDksX4e+ZFyzq4OkITM+pgE3oT7POI
         7ljtKzNnLEFsYXsjKkCzGy+FDYNmHhMsitep2f6DrjVDa7HGAj7oBEMrpqEtgHQapQDG
         67fTDST4xP6Bs6dem1A/yyAzsH0/eTdh83xtta9lyeHT7P88K9XwpJkIPXfi5zot5ABr
         ddOpXUL/7DCTGD6eqNUltxrQbCAGNsNkErw/j0PafAETn6os/62X5bHpr9OsotWyclE6
         D+p/TKn7hxOb8Z44yUACmvfcj7psmcSB2qvu5QtlyLAsgO2Mjj4ZnJZ4pptmOKEmn6i8
         fmgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780991768; x=1781596568;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2F3wTWsr9h448dGCLvqZnhlMLjq8YfaAF/vL4do8mX0=;
        b=oO165rwzP5oi9t4BaSDUNGQQX3T028VM6LDFaXQtuhqLkZI3SLJgyKwUWMa5H8jIVp
         QwOkRiJCbkoChoZPYZP8J1UlarcrJNoQd1FbYOLpV2lOxf/X0fYFEQKApu7DFsJwRYz9
         5T1YtLZHaG9Lxy2eZheukXUWg0kqyAO0whY//18XHE7Gz4QuWL0Ry1IjhxKRE6SCyaNL
         ER+6KoAoIJLRIYqlcaOSSQKJlEiZYS2DhS70YmJKhHs/xOEj5K4aewQvmLYHHIVZgsPb
         TM6/JZyPLtLiQmP4ebrQjOikiOX/S0QSpgaREfvxkwqHCRUuYaen5meG0rCNp8PqfMTU
         BETA==
X-Forwarded-Encrypted: i=1; AFNElJ/3g62zxO8gjIqlL9s8TXZoLlt6oOx1GJAS0RmF/Hcl5TY4lSMkW1bBCuYuWzrO+l1XX6citcbKoTMA4Z839us=@vger.kernel.org
X-Gm-Message-State: AOJu0YyDLWoZoX8kNj+ZptQaCOjzO0uP7u+b/4MVsCK+XZ2Qut5HV0Jw
	PrcZGIf75ZaySl4nr/N4uztUMRnQWIlaGFVRZzQV5QCJxh2G39dtzV39e926XtWaWYunW9T1+JY
	vwA==
X-Received: from pfjf5.prod.google.com ([2002:a05:6a00:22c5:b0:842:4720:4013])
 (user=wakel job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:1d8e:b0:842:6099:c55c
 with SMTP id d2e1a72fcca58-842b0d82a44mr18882021b3a.3.1780991767666; Tue, 09
 Jun 2026 00:56:07 -0700 (PDT)
Date: Tue,  9 Jun 2026 07:56:05 +0000
In-Reply-To: <CANDhNCqpWoQcPqyvg2VBHUmC0Y2mw2qMH5eU15gBouCOPbX5VA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <CANDhNCqpWoQcPqyvg2VBHUmC0Y2mw2qMH5eU15gBouCOPbX5VA@mail.gmail.com>
X-Mailer: git-send-email 2.54.0.1064.gd145956f57-goog
Message-ID: <20260609075605.234798-1-wakel@google.com>
Subject: [PATCH] Revert "selftests: timers: Remove local NSEC_PER_SEC and
 USEC_PER_SEC defines"
From: Wake Liu <wakel@google.com>
To: anna-maria@linutronix.de, frederic@kernel.org, tglx@kernel.org, 
	jstultz@google.com, shuah@kernel.org
Cc: sboyd@kernel.org, cmllamas@google.com, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, Wake Liu <wakel@google.com>
Content-Type: text/plain; charset="UTF-8"

This reverts commit 80fa614e2fbcf11069f0995e1601fb2e5702e2f4.

The reverted commit replaced local definitions of NSEC_PER_SEC and
USEC_PER_SEC with inclusion of <include/vdso/time64.h>. However,
NSEC_PER_SEC in vdso/time64.h is defined as 1000000000L, which is
32-bit on 32-bit architectures. This causes integer overflow warnings
in several timer tests when doing arithmetic like NSEC_PER_SEC * 10.

Reverting this change restores the local definitions which use
unsigned long long (ULL) or long long (LL) suffixes, ensuring 64-bit
multiplication and avoiding overflows on 32-bit systems.
This also decouples the userspace selftests from internal kernel
headers.

Signed-off-by: Wake Liu <wakel@google.com>
---
 tools/testing/selftests/timers/Makefile           |  2 +-
 tools/testing/selftests/timers/adjtick.c          |  4 +++-
 .../testing/selftests/timers/alarmtimer-suspend.c |  2 +-
 .../selftests/timers/inconsistency-check.c        |  2 +-
 tools/testing/selftests/timers/leap-a-day.c       |  2 +-
 tools/testing/selftests/timers/mqueue-lat.c       |  2 +-
 tools/testing/selftests/timers/nanosleep.c        |  3 +--
 tools/testing/selftests/timers/nsleep-lat.c       |  3 ++-
 tools/testing/selftests/timers/posix_timers.c     | 15 ++++++++-------
 tools/testing/selftests/timers/raw_skew.c         |  3 ++-
 tools/testing/selftests/timers/set-2038.c         |  3 ++-
 tools/testing/selftests/timers/set-timer-lat.c    |  3 ++-
 tools/testing/selftests/timers/valid-adjtimex.c   |  4 +++-
 13 files changed, 28 insertions(+), 20 deletions(-)

diff --git a/tools/testing/selftests/timers/Makefile b/tools/testing/selftests/timers/Makefile
index 32203593c62e..0e73a16874c4 100644
--- a/tools/testing/selftests/timers/Makefile
+++ b/tools/testing/selftests/timers/Makefile
@@ -1,5 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0
-CFLAGS += -O3 -Wl,-no-as-needed -Wall -I $(top_srcdir)
+CFLAGS += -O3 -Wl,-no-as-needed -Wall
 LDLIBS += -lrt -lpthread -lm
 
 # these are all "safe" tests that don't modify
diff --git a/tools/testing/selftests/timers/adjtick.c b/tools/testing/selftests/timers/adjtick.c
index 5b3ef708d6e9..0053c6c5bfc0 100644
--- a/tools/testing/selftests/timers/adjtick.c
+++ b/tools/testing/selftests/timers/adjtick.c
@@ -22,10 +22,12 @@
 #include <sys/time.h>
 #include <sys/timex.h>
 #include <time.h>
-#include <include/vdso/time64.h>
 
 #include "kselftest.h"
 
+#define NSEC_PER_SEC		1000000000LL
+#define USEC_PER_SEC		1000000
+
 #define MILLION			1000000
 
 long systick;
diff --git a/tools/testing/selftests/timers/alarmtimer-suspend.c b/tools/testing/selftests/timers/alarmtimer-suspend.c
index aa66c805f6a4..ba277a708aba 100644
--- a/tools/testing/selftests/timers/alarmtimer-suspend.c
+++ b/tools/testing/selftests/timers/alarmtimer-suspend.c
@@ -28,10 +28,10 @@
 #include <signal.h>
 #include <stdlib.h>
 #include <pthread.h>
-#include <include/vdso/time64.h>
 #include <errno.h>
 #include "kselftest.h"
 
+#define NSEC_PER_SEC 1000000000ULL
 #define UNREASONABLE_LAT (NSEC_PER_SEC * 5) /* hopefully we resume in 5 secs */
 
 #define SUSPEND_SECS 15
diff --git a/tools/testing/selftests/timers/inconsistency-check.c b/tools/testing/selftests/timers/inconsistency-check.c
index e53e63e18683..bf08c06ab2cd 100644
--- a/tools/testing/selftests/timers/inconsistency-check.c
+++ b/tools/testing/selftests/timers/inconsistency-check.c
@@ -28,13 +28,13 @@
 #include <sys/timex.h>
 #include <string.h>
 #include <signal.h>
-#include <include/vdso/time64.h>
 #include "kselftest.h"
 
 /* CLOCK_HWSPECIFIC == CLOCK_SGI_CYCLE (Deprecated) */
 #define CLOCK_HWSPECIFIC		10
 
 #define CALLS_PER_LOOP 64
+#define NSEC_PER_SEC 1000000000ULL
 
 char *clockstring(int clockid)
 {
diff --git a/tools/testing/selftests/timers/leap-a-day.c b/tools/testing/selftests/timers/leap-a-day.c
index 3568cfb3e815..e8be2405a72c 100644
--- a/tools/testing/selftests/timers/leap-a-day.c
+++ b/tools/testing/selftests/timers/leap-a-day.c
@@ -48,9 +48,9 @@
 #include <string.h>
 #include <signal.h>
 #include <unistd.h>
-#include <include/vdso/time64.h>
 #include "kselftest.h"
 
+#define NSEC_PER_SEC 1000000000ULL
 #define CLOCK_TAI 11
 
 time_t next_leap;
diff --git a/tools/testing/selftests/timers/mqueue-lat.c b/tools/testing/selftests/timers/mqueue-lat.c
index c0d9368e4fca..80e1638c3b56 100644
--- a/tools/testing/selftests/timers/mqueue-lat.c
+++ b/tools/testing/selftests/timers/mqueue-lat.c
@@ -29,9 +29,9 @@
 #include <signal.h>
 #include <errno.h>
 #include <mqueue.h>
-#include <include/vdso/time64.h>
 #include "kselftest.h"
 
+#define NSEC_PER_SEC 1000000000ULL
 
 #define TARGET_TIMEOUT		100000000	/* 100ms in nanoseconds */
 #define UNRESONABLE_LATENCY	40000000	/* 40ms in nanosecs */
diff --git a/tools/testing/selftests/timers/nanosleep.c b/tools/testing/selftests/timers/nanosleep.c
index a054680b3372..218191fd845f 100644
--- a/tools/testing/selftests/timers/nanosleep.c
+++ b/tools/testing/selftests/timers/nanosleep.c
@@ -27,10 +27,9 @@
 #include <sys/timex.h>
 #include <string.h>
 #include <signal.h>
-#include <include/vdso/time64.h>
 #include "kselftest.h"
 
-/* CLOCK_HWSPECIFIC == CLOCK_SGI_CYCLE (Deprecated) */
+#define NSEC_PER_SEC 1000000000ULL
 #define CLOCK_HWSPECIFIC		10
 
 #define UNSUPPORTED 0xf00f
diff --git a/tools/testing/selftests/timers/nsleep-lat.c b/tools/testing/selftests/timers/nsleep-lat.c
index a7ba1eb1e21b..88449460affe 100644
--- a/tools/testing/selftests/timers/nsleep-lat.c
+++ b/tools/testing/selftests/timers/nsleep-lat.c
@@ -24,9 +24,10 @@
 #include <sys/timex.h>
 #include <string.h>
 #include <signal.h>
-#include <include/vdso/time64.h>
 #include "kselftest.h"
 
+#define NSEC_PER_SEC 1000000000ULL
+
 #define UNRESONABLE_LATENCY 40000000 /* 40ms in nanosecs */
 
 /* CLOCK_HWSPECIFIC == CLOCK_SGI_CYCLE (Deprecated) */
diff --git a/tools/testing/selftests/timers/posix_timers.c b/tools/testing/selftests/timers/posix_timers.c
index 38512623622a..6f78b6068589 100644
--- a/tools/testing/selftests/timers/posix_timers.c
+++ b/tools/testing/selftests/timers/posix_timers.c
@@ -16,13 +16,14 @@
 #include <string.h>
 #include <unistd.h>
 #include <time.h>
-#include <include/vdso/time64.h>
 #include <pthread.h>
 #include <stdbool.h>
 
 #include "kselftest.h"
 
 #define DELAY 2
+#define USECS_PER_SEC 1000000
+#define NSECS_PER_SEC 1000000000
 
 static void __fatal_error(const char *test, const char *name, const char *what)
 {
@@ -87,9 +88,9 @@ static int check_diff(struct timeval start, struct timeval end)
 	long long diff;
 
 	diff = end.tv_usec - start.tv_usec;
-	diff += (end.tv_sec - start.tv_sec) * USEC_PER_SEC;
+	diff += (end.tv_sec - start.tv_sec) * USECS_PER_SEC;
 
-	if (llabs(diff - DELAY * USEC_PER_SEC) > USEC_PER_SEC / 2) {
+	if (llabs(diff - DELAY * USECS_PER_SEC) > USECS_PER_SEC / 2) {
 		printf("Diff too high: %lld..", diff);
 		return -1;
 	}
@@ -449,7 +450,7 @@ static inline int64_t calcdiff_ns(struct timespec t1, struct timespec t2)
 {
 	int64_t diff;
 
-	diff = NSEC_PER_SEC * (int64_t)((int) t1.tv_sec - (int) t2.tv_sec);
+	diff = NSECS_PER_SEC * (int64_t)((int) t1.tv_sec - (int) t2.tv_sec);
 	diff += ((int) t1.tv_nsec - (int) t2.tv_nsec);
 	return diff;
 }
@@ -480,7 +481,7 @@ static void check_sigev_none(int which, const char *name)
 	do {
 		if (clock_gettime(which, &now))
 			fatal_error(name, "clock_gettime()");
-	} while (calcdiff_ns(now, start) < NSEC_PER_SEC);
+	} while (calcdiff_ns(now, start) < NSECS_PER_SEC);
 
 	if (timer_gettime(timerid, &its))
 		fatal_error(name, "timer_gettime()");
@@ -537,7 +538,7 @@ static void check_gettime(int which, const char *name)
 			wraps++;
 		prev = its;
 
-	} while (calcdiff_ns(now, start) < NSEC_PER_SEC);
+	} while (calcdiff_ns(now, start) < NSECS_PER_SEC);
 
 	if (timer_delete(timerid))
 		fatal_error(name, "timer_delete()");
@@ -588,7 +589,7 @@ static void check_overrun(int which, const char *name)
 	do {
 		if (clock_gettime(which, &now))
 			fatal_error(name, "clock_gettime()");
-	} while (calcdiff_ns(now, start) < NSEC_PER_SEC);
+	} while (calcdiff_ns(now, start) < NSECS_PER_SEC);
 
 	/* Unblock it, which should deliver a signal */
 	if (sigprocmask(SIG_UNBLOCK, &set, NULL))
diff --git a/tools/testing/selftests/timers/raw_skew.c b/tools/testing/selftests/timers/raw_skew.c
index a7bae7d80916..2dd16cb4cdd0 100644
--- a/tools/testing/selftests/timers/raw_skew.c
+++ b/tools/testing/selftests/timers/raw_skew.c
@@ -25,9 +25,10 @@
 #include <sys/time.h>
 #include <sys/timex.h>
 #include <time.h>
-#include <include/vdso/time64.h>
 #include "kselftest.h"
 
+#define NSEC_PER_SEC 1000000000LL
+
 #define shift_right(x, s) ({		\
 	__typeof__(x) __x = (x);	\
 	__typeof__(s) __s = (s);	\
diff --git a/tools/testing/selftests/timers/set-2038.c b/tools/testing/selftests/timers/set-2038.c
index ecc171de4728..c1235638406d 100644
--- a/tools/testing/selftests/timers/set-2038.c
+++ b/tools/testing/selftests/timers/set-2038.c
@@ -27,9 +27,10 @@
 #include <unistd.h>
 #include <time.h>
 #include <sys/time.h>
-#include <include/vdso/time64.h>
 #include "kselftest.h"
 
+#define NSEC_PER_SEC 1000000000LL
+
 #define KTIME_MAX	((long long)~((unsigned long long)1 << 63))
 #define KTIME_SEC_MAX	(KTIME_MAX / NSEC_PER_SEC)
 
diff --git a/tools/testing/selftests/timers/set-timer-lat.c b/tools/testing/selftests/timers/set-timer-lat.c
index 44d2e3614fa5..1b60d6f3be40 100644
--- a/tools/testing/selftests/timers/set-timer-lat.c
+++ b/tools/testing/selftests/timers/set-timer-lat.c
@@ -28,12 +28,13 @@
 #include <signal.h>
 #include <stdlib.h>
 #include <pthread.h>
-#include <include/vdso/time64.h>
 #include "kselftest.h"
 
 /* CLOCK_HWSPECIFIC == CLOCK_SGI_CYCLE (Deprecated) */
 #define CLOCK_HWSPECIFIC		10
 
+
+#define NSEC_PER_SEC 1000000000ULL
 #define UNRESONABLE_LATENCY 40000000 /* 40ms in nanosecs */
 
 #define TIMER_SECS 1
diff --git a/tools/testing/selftests/timers/valid-adjtimex.c b/tools/testing/selftests/timers/valid-adjtimex.c
index e1e56d3097d6..dc2559eb11a5 100644
--- a/tools/testing/selftests/timers/valid-adjtimex.c
+++ b/tools/testing/selftests/timers/valid-adjtimex.c
@@ -29,9 +29,11 @@
 #include <string.h>
 #include <signal.h>
 #include <unistd.h>
-#include <include/vdso/time64.h>
 #include "kselftest.h"
 
+#define NSEC_PER_SEC 1000000000LL
+#define USEC_PER_SEC 1000000LL
+
 #define ADJ_SETOFFSET 0x0100
 
 #include <sys/syscall.h>
-- 
2.54.0.1064.gd145956f57-goog

