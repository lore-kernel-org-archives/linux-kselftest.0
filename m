Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B996937EFF1;
	Thu,  3 Sep 2026 07:38:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788421108; cv=none; b=gUtnRRsPHzQahCHpLoeMl51p/q0RHCRTM1wVlJmMIBHWSxubsSakPykqoRTrhuqLFYJGf1MU2Y1tp1/iNoIicMJIYt57znMVfgmx0h6SpbifnySRzgElAA2YBbYAcOf6yzVnBx4am8F30OE+MyP2y+sXBpciQ0KxiyNA5vJQiIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788421108; c=relaxed/simple;
	bh=kfXhrU5ZDCCCcPmeDM78XUsWU5SKCVK8SjyPBbaDFX8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=e7YDG6iF11LhqwMegrHsOxPB653ZmUX2j5QRu8df707KnBRBfPcKfwbEfmtJ6hcAlfsoYWk/ZsKb4e9MY3yJ0RnjL4zs2X1Obl1TIz0YbZiSiZENyRo5TTa672M8LwCdb9vM/SYQPLthEcP+X1wygbTBknMne4d3wesfVLGNq/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=bDrMNU6B; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=AgmCtq+g; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="bDrMNU6B";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="AgmCtq+g"
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1788421099;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LV3CUf3SZGLcf02CEjkl1gTTOJdadZAMTEhDYrh8D2c=;
	b=bDrMNU6BLozNvhhXg0wtk86WW00oUBUXcOPNnum0/foKxxtsFszs3R+RGkqwSW4xobDEe1
	2lbrEQSi/g0v/yFvMonaMCZxIj1rL4HJyMJboocRwczygM/A+J8KbRVmwu+g2OX2th8CGN
	s3BLEAa83Q1hZImgQf2J08c0ozhQ7VAq8ZAHLp2JuzWBG5hVnxaRXpYTPgeWdczJoMyU4z
	dGs6wWxQ77/9ke7SyJ7/vsiSqBDeiwI3e/zyN8+bVb6dS1IfufR3QB+uh0/N91AmSWxOwr
	2x4gDpEgHJ4spf5KDFjh5IGIZkUdfoWLC4RO7Gpb2DTuJbkMZQ1EgtkwWXU0RA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1788421099;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LV3CUf3SZGLcf02CEjkl1gTTOJdadZAMTEhDYrh8D2c=;
	b=AgmCtq+gW1FeKJ5OyYnTbRCXwpKfZ/t7y3MixnvZT5g3Yn0Cs6+PYjmZIVEukVNK2w47RK
	DFOGdNfHfn8AOSCg==
Date: Thu, 03 Sep 2026 09:38:15 +0200
Subject: [PATCH v2 3/8] selftests: vDSO: vdso_test_abi: Use types from
 vdso_types.h
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260903-vdso-test-types-v2-3-1eec04eb3658@linutronix.de>
References: <20260903-vdso-test-types-v2-0-1eec04eb3658@linutronix.de>
In-Reply-To: <20260903-vdso-test-types-v2-0-1eec04eb3658@linutronix.de>
To: Andy Lutomirski <luto@kernel.org>, 
 Vincenzo Frascino <vincenzo.frascino@arm.com>, 
 Shuah Khan <shuah@kernel.org>, Thomas Gleixner <tglx@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788421097; l=4174;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=kfXhrU5ZDCCCcPmeDM78XUsWU5SKCVK8SjyPBbaDFX8=;
 b=fu3AOWRJwXw+5vNPFNrTpZxQcjp+7Q1OQ9l33neCvGqJA2TkOJMqzsF4VZkUPikWXLENIp4Tw
 mM26Cqw2RRBBLcmnlmJrH6gPV/JlnSLm1EoPdKoYGnJt1Z77qM357zK
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=

The libc types are not necessarily compatible with the vDSO functions.

Use the dedicated types from vdso_types.h instead.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 tools/testing/selftests/vDSO/vdso_test_abi.c | 35 +++++++++-------------------
 1 file changed, 11 insertions(+), 24 deletions(-)

diff --git a/tools/testing/selftests/vDSO/vdso_test_abi.c b/tools/testing/selftests/vDSO/vdso_test_abi.c
index b162a4ba9c4f..b7590a727f06 100644
--- a/tools/testing/selftests/vDSO/vdso_test_abi.c
+++ b/tools/testing/selftests/vDSO/vdso_test_abi.c
@@ -11,9 +11,7 @@
 #include <stdint.h>
 #include <elf.h>
 #include <stdio.h>
-#include <time.h>
 #include <sys/auxv.h>
-#include <sys/time.h>
 #define _GNU_SOURCE
 #include <unistd.h>
 #include <sys/syscall.h>
@@ -21,24 +19,12 @@
 #include "kselftest.h"
 #include "vdso_config.h"
 #include "vdso_call.h"
+#include "vdso_types.h"
 #include "parse_vdso.h"
 
 static const char *version;
 static const char **name;
 
-/* The same as struct __kernel_timespec */
-struct vdso_timespec64 {
-	uint64_t tv_sec;
-	uint64_t tv_nsec;
-};
-
-typedef long (*vdso_gettimeofday_t)(struct timeval *tv, struct timezone *tz);
-typedef long (*vdso_clock_gettime_t)(clockid_t clk_id, struct timespec *ts);
-typedef long (*vdso_clock_gettime64_t)(clockid_t clk_id, struct vdso_timespec64 *ts);
-typedef long (*vdso_clock_getres_t)(clockid_t clk_id, struct timespec *ts);
-typedef long (*vdso_clock_getres_time64_t)(clockid_t clk_id, struct vdso_timespec64 *ts);
-typedef time_t (*vdso_time_t)(time_t *t);
-
 static const char * const vdso_clock_name[] = {
 	[CLOCK_REALTIME]		= "CLOCK_REALTIME",
 	[CLOCK_MONOTONIC]		= "CLOCK_MONOTONIC",
@@ -66,7 +52,7 @@ static void vdso_test_gettimeofday(void)
 		return;
 	}
 
-	struct timeval tv;
+	struct __kernel_old_timeval tv;
 	long ret = VDSO_CALL(vdso_gettimeofday, 2, &tv, 0);
 
 	if (ret == 0) {
@@ -78,7 +64,7 @@ static void vdso_test_gettimeofday(void)
 	}
 }
 
-static void vdso_test_clock_gettime64(clockid_t clk_id)
+static void vdso_test_clock_gettime64(__kernel_clockid_t clk_id)
 {
 	/* Find clock_gettime64. */
 	vdso_clock_gettime64_t vdso_clock_gettime64 =
@@ -91,7 +77,7 @@ static void vdso_test_clock_gettime64(clockid_t clk_id)
 		return;
 	}
 
-	struct vdso_timespec64 ts;
+	struct __kernel_timespec ts;
 	long ret = VDSO_CALL(vdso_clock_gettime64, 2, clk_id, &ts);
 
 	if (ret == 0) {
@@ -105,7 +91,7 @@ static void vdso_test_clock_gettime64(clockid_t clk_id)
 	}
 }
 
-static void vdso_test_clock_gettime(clockid_t clk_id)
+static void vdso_test_clock_gettime(__kernel_clockid_t clk_id)
 {
 	/* Find clock_gettime. */
 	vdso_clock_gettime_t vdso_clock_gettime =
@@ -118,7 +104,7 @@ static void vdso_test_clock_gettime(clockid_t clk_id)
 		return;
 	}
 
-	struct timespec ts;
+	struct __kernel_old_timespec ts;
 	long ret = VDSO_CALL(vdso_clock_gettime, 2, clk_id, &ts);
 
 	if (ret == 0) {
@@ -155,7 +141,7 @@ static void vdso_test_time(void)
 	}
 }
 
-static void vdso_test_clock_getres(clockid_t clk_id)
+static void vdso_test_clock_getres(__kernel_clockid_t clk_id)
 {
 	int clock_getres_fail = 0;
 
@@ -170,7 +156,8 @@ static void vdso_test_clock_getres(clockid_t clk_id)
 		return;
 	}
 
-	struct timespec ts, sys_ts;
+	struct __kernel_old_timespec ts;
+	struct timespec sys_ts;
 	long ret = VDSO_CALL(vdso_clock_getres, 2, clk_id, &ts);
 
 	if (ret == 0) {
@@ -213,7 +200,7 @@ static void vdso_test_clock_getres_time64(clockid_t clk_id)
 		return;
 	}
 
-	struct vdso_timespec64 ts, sys_ts;
+	struct __kernel_timespec ts, sys_ts;
 	long ret = VDSO_CALL(vdso_clock_getres_time64, 2, clk_id, &ts);
 
 	if (ret == 0) {
@@ -250,7 +237,7 @@ static void vdso_test_clock_getres_time64(clockid_t clk_id)
  * This function calls vdso_test_clock_gettime and vdso_test_clock_getres
  * with different values for clock_id.
  */
-static inline void vdso_test_clock(clockid_t clock_id)
+static inline void vdso_test_clock(__kernel_clockid_t clock_id)
 {
 	ksft_print_msg("clock_id: %s\n", vdso_clock_name[clock_id]);
 

-- 
2.55.0

