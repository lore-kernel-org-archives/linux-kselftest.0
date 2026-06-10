Received: from mail-pf1-f201.google.com (mail-pf1-f201.google.com [209.85.210.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53E8631715D
	for <linux-kselftest@vger.kernel.org>; Wed, 10 Jun 2026 01:47:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781056049; cv=none; b=eRfd97UlKEjxRaRfZ0C0gBGb/DrCr7qvMnASB4x/cZePYR474JLrz9gKU8rQbjqF81UqJWNSOCV28UOGSGQkm1zPJRjBUVrKpEmpTYUWKltceq4Ra2l6yYdz3HEbpVCYLgDFvn4+XNeO+Pwr68RQjIp93cVyz1VoJfgv+9AUfiQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781056049; c=relaxed/simple;
	bh=KJDgdbe8gOWjTBAJKtAgUiLNeFTTEbX11m+ebzHMp0M=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=qGB5+ukm3PqaFKCxiwJPThFRKJZJ1ne0mPanVG+r7FPQUksn7oT6s/zyxOvnlsZU8uR69zQl0k56i8vTS6bBfa2gFNPG0qVrN9H1d98QpuEoPEChljcajP0r3iQ3EfJFqHi0vfrzY6ICXAPuenV3KPD8jZAFMWQr2UmZiSvh9jg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--wakel.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=H24eR+AR; arc=none smtp.client-ip=209.85.210.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--wakel.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="H24eR+AR"
Received: by mail-pf1-f201.google.com with SMTP id d2e1a72fcca58-84233efcaadso4139308b3a.1
        for <linux-kselftest@vger.kernel.org>; Tue, 09 Jun 2026 18:47:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781056044; x=1781660844; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=pMegvQrFeHzriuDPWxHvzi7C9Uwq7IXHx5SYo0W8bd8=;
        b=H24eR+ARaT2erdQIpK/cOTlbsJg8RelukLDpvEqwOswZvGLDHStYLcs862AHgmdZso
         AmsRxh+sq1lwGID75bdIhDdLaJB18JTsE/2GMqahG8IavMmNcHeZCEyhWoR+BK0U6i38
         y6QrnkAJvxkBolLSygoNcDhg67lHzzkmFXwS1JnKIGNqPewoGX1sDZnY368oHqdkq259
         RAFJJcZFbc41caamNcRh2Eh+T9AYId246DXTU+DwPLMeFEoXrNRu6AEgC0KkDqmvKR0o
         rq5hcCJGY9A1czu8NVSX6BguyZvrKjqj9UJsX5g4UNFtzld8VjOg70zHvoHtI+fK33SU
         ZuAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781056044; x=1781660844;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pMegvQrFeHzriuDPWxHvzi7C9Uwq7IXHx5SYo0W8bd8=;
        b=c8/z+2vBnOBmFk91qBjsRRq2v9iV5WElPEH9wYFKWH8pWPddjZluv4wFEJN4teVPAN
         8DbjXfdpADhdAwKW7NOnxsAPRbod/zzRAB6nSepyM7GhK44hV6K19CGo7AVxIkxwFpn3
         ehR9k8hfnf3h51HxZHd0E0vfyWyFwdwDUyxfA4ygrLxa09Z1AEUp8CU35BpwBanrFImU
         sl1bMgXotQ2l6H196vOo04LUjAecirQOBetjFgsqgoJ2wHnwm+QkkYvmh+86n5HHkpRd
         4iTIEuJqdb4w9TL15g4CrZLjmoK4liWLuVn65bvecwr9mheRx9XC6aLLkPs/XUGGI3qi
         i87Q==
X-Forwarded-Encrypted: i=1; AFNElJ9tZ7XyAvOoG47bzqTTgsnonDAPwaBO73ugE3f1iQXdCtj6jMtm4BNmOvGxbiP6Io7uHmNEIQ0p6ui3Pv5X1xM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzmhKHGMmatE7ScBHvt4ZFSBT2q5otzo7T8u8ijj299EiQiDOyV
	ZsvWTuKADSnRX8lGVDSG/y1oYqU9T6g/wU+iiA0jTEeu97JLzAmyXifPa8Joz1zFnJt6EMV8Sk4
	uuA==
X-Received: from pfbft7.prod.google.com ([2002:a05:6a00:81c7:b0:842:492e:19cb])
 (user=wakel job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:1994:b0:842:6f13:1461
 with SMTP id d2e1a72fcca58-842b0f5db21mr23544385b3a.11.1781056044247; Tue, 09
 Jun 2026 18:47:24 -0700 (PDT)
Date: Wed, 10 Jun 2026 01:47:21 +0000
In-Reply-To: <CANDhNCrDSy8Zf9yo4uKGOtJnLVSNqF6pOqZiRr9giyEG89qpMg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <CANDhNCrDSy8Zf9yo4uKGOtJnLVSNqF6pOqZiRr9giyEG89qpMg@mail.gmail.com>
X-Mailer: git-send-email 2.54.0.1099.g489fc7bff1-goog
Message-ID: <20260610014721.718362-1-wakel@google.com>
Subject: [PATCH v2] selftests: timers: Partially revert "Remove local
 NSEC_PER_SEC and USEC_PER_SEC defines"
From: Wake Liu <wakel@google.com>
To: anna-maria@linutronix.de, frederic@kernel.org, tglx@kernel.org, 
	jstultz@google.com, shuah@kernel.org
Cc: sboyd@kernel.org, cmllamas@google.com, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, Wake Liu <wakel@google.com>
Content-Type: text/plain; charset="UTF-8"

This partially reverts commit 80fa614e2fbc ("selftests: timers: Remove
local NSEC_PER_SEC and USEC_PER_SEC defines").

The original commit removed local definitions of NSEC_PER_SEC and
USEC_PER_SEC in favor of including <include/vdso/time64.h>. However,
NSEC_PER_SEC in vdso/time64.h is defined as 1000000000L, which is
32-bit on 32-bit architectures. This causes integer overflow warnings
in several timer tests when doing arithmetic like NSEC_PER_SEC * 10 on
32-bit systems.

To fix this, restore the local definitions of NSEC_PER_SEC and
USEC_PER_SEC in the test files, but use "LL" suffix consistently
(1000000000LL and 1000000LL) to ensure 64-bit arithmetic and avoid
overflows.

We keep the cleanup from the original commit that renamed plural
definitions (NSECS_PER_SEC/USECS_PER_SEC) to singular ones in
posix_timers.c, but we now define them locally there as well.
This also removes the dependency of the selftests on the internal
kernel header <include/vdso/time64.h>.

Signed-off-by: Wake Liu <wakel@google.com>
---
 tools/testing/selftests/timers/Makefile              | 2 +-
 tools/testing/selftests/timers/adjtick.c             | 5 +++--
 tools/testing/selftests/timers/alarmtimer-suspend.c  | 3 ++-
 tools/testing/selftests/timers/inconsistency-check.c | 3 ++-
 tools/testing/selftests/timers/leap-a-day.c          | 3 ++-
 tools/testing/selftests/timers/mqueue-lat.c          | 3 ++-
 tools/testing/selftests/timers/nanosleep.c           | 3 ++-
 tools/testing/selftests/timers/nsleep-lat.c          | 3 ++-
 tools/testing/selftests/timers/posix_timers.c        | 4 +++-
 tools/testing/selftests/timers/raw_skew.c            | 3 ++-
 tools/testing/selftests/timers/set-2038.c            | 3 ++-
 tools/testing/selftests/timers/set-timer-lat.c       | 3 ++-
 tools/testing/selftests/timers/valid-adjtimex.c      | 4 +++-
 13 files changed, 28 insertions(+), 14 deletions(-)

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
index 5b3ef708d6e9..22d274d5520f 100644
--- a/tools/testing/selftests/timers/adjtick.c
+++ b/tools/testing/selftests/timers/adjtick.c
@@ -22,10 +22,11 @@
 #include <sys/time.h>
 #include <sys/timex.h>
 #include <time.h>
-#include <include/vdso/time64.h>
-
 #include "kselftest.h"
 
+#define NSEC_PER_SEC		1000000000LL
+#define USEC_PER_SEC		1000000LL
+
 #define MILLION			1000000
 
 long systick;
diff --git a/tools/testing/selftests/timers/alarmtimer-suspend.c b/tools/testing/selftests/timers/alarmtimer-suspend.c
index aa66c805f6a4..d55d5b0377c6 100644
--- a/tools/testing/selftests/timers/alarmtimer-suspend.c
+++ b/tools/testing/selftests/timers/alarmtimer-suspend.c
@@ -28,10 +28,11 @@
 #include <signal.h>
 #include <stdlib.h>
 #include <pthread.h>
-#include <include/vdso/time64.h>
 #include <errno.h>
 #include "kselftest.h"
 
+#define NSEC_PER_SEC 1000000000LL
+
 #define UNREASONABLE_LAT (NSEC_PER_SEC * 5) /* hopefully we resume in 5 secs */
 
 #define SUSPEND_SECS 15
diff --git a/tools/testing/selftests/timers/inconsistency-check.c b/tools/testing/selftests/timers/inconsistency-check.c
index e53e63e18683..9ab7066b4e32 100644
--- a/tools/testing/selftests/timers/inconsistency-check.c
+++ b/tools/testing/selftests/timers/inconsistency-check.c
@@ -28,9 +28,10 @@
 #include <sys/timex.h>
 #include <string.h>
 #include <signal.h>
-#include <include/vdso/time64.h>
 #include "kselftest.h"
 
+#define NSEC_PER_SEC 1000000000LL
+
 /* CLOCK_HWSPECIFIC == CLOCK_SGI_CYCLE (Deprecated) */
 #define CLOCK_HWSPECIFIC		10
 
diff --git a/tools/testing/selftests/timers/leap-a-day.c b/tools/testing/selftests/timers/leap-a-day.c
index 3568cfb3e815..26d788abda6c 100644
--- a/tools/testing/selftests/timers/leap-a-day.c
+++ b/tools/testing/selftests/timers/leap-a-day.c
@@ -48,9 +48,10 @@
 #include <string.h>
 #include <signal.h>
 #include <unistd.h>
-#include <include/vdso/time64.h>
 #include "kselftest.h"
 
+#define NSEC_PER_SEC 1000000000LL
+
 #define CLOCK_TAI 11
 
 time_t next_leap;
diff --git a/tools/testing/selftests/timers/mqueue-lat.c b/tools/testing/selftests/timers/mqueue-lat.c
index c0d9368e4fca..ce8700c95cac 100644
--- a/tools/testing/selftests/timers/mqueue-lat.c
+++ b/tools/testing/selftests/timers/mqueue-lat.c
@@ -29,9 +29,10 @@
 #include <signal.h>
 #include <errno.h>
 #include <mqueue.h>
-#include <include/vdso/time64.h>
 #include "kselftest.h"
 
+#define NSEC_PER_SEC 1000000000LL
+
 
 #define TARGET_TIMEOUT		100000000	/* 100ms in nanoseconds */
 #define UNRESONABLE_LATENCY	40000000	/* 40ms in nanosecs */
diff --git a/tools/testing/selftests/timers/nanosleep.c b/tools/testing/selftests/timers/nanosleep.c
index a054680b3372..ceff18149a48 100644
--- a/tools/testing/selftests/timers/nanosleep.c
+++ b/tools/testing/selftests/timers/nanosleep.c
@@ -27,9 +27,10 @@
 #include <sys/timex.h>
 #include <string.h>
 #include <signal.h>
-#include <include/vdso/time64.h>
 #include "kselftest.h"
 
+#define NSEC_PER_SEC 1000000000LL
+
 /* CLOCK_HWSPECIFIC == CLOCK_SGI_CYCLE (Deprecated) */
 #define CLOCK_HWSPECIFIC		10
 
diff --git a/tools/testing/selftests/timers/nsleep-lat.c b/tools/testing/selftests/timers/nsleep-lat.c
index a7ba1eb1e21b..15f6493ca7b5 100644
--- a/tools/testing/selftests/timers/nsleep-lat.c
+++ b/tools/testing/selftests/timers/nsleep-lat.c
@@ -24,9 +24,10 @@
 #include <sys/timex.h>
 #include <string.h>
 #include <signal.h>
-#include <include/vdso/time64.h>
 #include "kselftest.h"
 
+#define NSEC_PER_SEC 1000000000LL
+
 #define UNRESONABLE_LATENCY 40000000 /* 40ms in nanosecs */
 
 /* CLOCK_HWSPECIFIC == CLOCK_SGI_CYCLE (Deprecated) */
diff --git a/tools/testing/selftests/timers/posix_timers.c b/tools/testing/selftests/timers/posix_timers.c
index 38512623622a..9fb231cd8279 100644
--- a/tools/testing/selftests/timers/posix_timers.c
+++ b/tools/testing/selftests/timers/posix_timers.c
@@ -16,12 +16,14 @@
 #include <string.h>
 #include <unistd.h>
 #include <time.h>
-#include <include/vdso/time64.h>
 #include <pthread.h>
 #include <stdbool.h>
 
 #include "kselftest.h"
 
+#define NSEC_PER_SEC 1000000000LL
+#define USEC_PER_SEC 1000000LL
+
 #define DELAY 2
 
 static void __fatal_error(const char *test, const char *name, const char *what)
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
index 44d2e3614fa5..e092c18befff 100644
--- a/tools/testing/selftests/timers/set-timer-lat.c
+++ b/tools/testing/selftests/timers/set-timer-lat.c
@@ -28,9 +28,10 @@
 #include <signal.h>
 #include <stdlib.h>
 #include <pthread.h>
-#include <include/vdso/time64.h>
 #include "kselftest.h"
 
+#define NSEC_PER_SEC 1000000000LL
+
 /* CLOCK_HWSPECIFIC == CLOCK_SGI_CYCLE (Deprecated) */
 #define CLOCK_HWSPECIFIC		10
 
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
2.54.0.1099.g489fc7bff1-goog

