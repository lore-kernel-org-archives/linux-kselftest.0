Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE1CB42047A;
	Thu,  3 Sep 2026 07:38:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788421112; cv=none; b=T1ze5xCsFJmtsNq3zhpjf2sFtgMpPyp+R/qnXHU9D4mTDknhliUh5Wbd/5CRjXKlwrnG6wLeNZpg8rgE7h0J9sLfyr+D++oVnEVsM3Sq4w//tmpbxVGopmv2DvyXu5XeeTcC1RXf6tVfkNApk2DAO8BJZnqHDPz87XG5cB1+B+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788421112; c=relaxed/simple;
	bh=PmwujXtSxuU9x+7Synyy2iY53+6g5TwLZio9clbzMdk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bvBZ5B2Z7yEglxsMWWlH/Ixr1hNaZ5Ryf3BAxkYOyZIu7obZLmV9dn1UtwfQdci8BZbt0bGc0bvPTRBdTsXG6I9vvNJj71ijvBR3PHIhByie9GU+T2ngQ4ULLwStEhMvUuhPkw76BkI9u+iTHXK7ffgRr7mK4Cv7R5aqkX/PdPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=znWeqBey; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=+6Y3mdLE; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="znWeqBey";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="+6Y3mdLE"
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1788421101;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=P9VS99y4JKgFj3YzkVvqcAF4wpbqEVo7rub8H6dFEJ8=;
	b=znWeqBeyryqhW1+GW8x85pgvzVFWdLf8MTm95BgdtO1VpHHdRrOCu6+d6wPR8Y5yuARkbj
	D0omQfkVy1UoaFxm+S4GirXHLUzT8ds29aqWxhOW6RhRIzdgCNr3pR2l5MxcwDjxnJIk5Z
	NyqMYaWR+f/a9Bnk7s5zGeJxzoMola/IffWOl8a32bIZ6TlkV6X0u/jKuPTnUcCmC8UapH
	ozI5+evb/IRvGsrMdW1eN50lC1a+P57/ffsTHfpXgvm7AeM5E5s2ZpnW2M6RbLKv1iJeyz
	44JFZ4LezrPQlAa1aT9Oq8KfFZ6sor849dNXMHSUAbZiVMfqCSwM2s9PKfQS1w==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1788421101;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=P9VS99y4JKgFj3YzkVvqcAF4wpbqEVo7rub8H6dFEJ8=;
	b=+6Y3mdLEnHYLjE4EOkMpVyNRVauAo8SvYNiZ8F0k8QzrRO7IaWX4c98JckZWnG2CzStpUA
	VMuSnEoAZt0EmfCw==
Date: Thu, 03 Sep 2026 09:38:19 +0200
Subject: [PATCH v2 7/8] selftests: vDSO: vdso_test_correctness: Use types
 from vdso_types.h
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260903-vdso-test-types-v2-7-1eec04eb3658@linutronix.de>
References: <20260903-vdso-test-types-v2-0-1eec04eb3658@linutronix.de>
In-Reply-To: <20260903-vdso-test-types-v2-0-1eec04eb3658@linutronix.de>
To: Andy Lutomirski <luto@kernel.org>, 
 Vincenzo Frascino <vincenzo.frascino@arm.com>, 
 Shuah Khan <shuah@kernel.org>, Thomas Gleixner <tglx@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788421097; l=3667;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=PmwujXtSxuU9x+7Synyy2iY53+6g5TwLZio9clbzMdk=;
 b=3Jn+vxYz9FHipDc5XoE8EUdycsRrrntSAWyPzOhA0tsS7uNrOSHJJiAtWJzKZOKkfe/Svz8ds
 sr+9kOCETZoDngXXvH20Df35LoybpUft+rK3WP9Akj+/kUCoKssQ6W2
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=

The libc types are not necessarily compatible with the vDSO functions.

Use the dedicated types from vdso_types.h instead.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 .../testing/selftests/vDSO/vdso_test_correctness.c | 45 ++++++++--------------
 1 file changed, 15 insertions(+), 30 deletions(-)

diff --git a/tools/testing/selftests/vDSO/vdso_test_correctness.c b/tools/testing/selftests/vDSO/vdso_test_correctness.c
index 537e0030aa16..83cb408c5947 100644
--- a/tools/testing/selftests/vDSO/vdso_test_correctness.c
+++ b/tools/testing/selftests/vDSO/vdso_test_correctness.c
@@ -7,7 +7,6 @@
 #define _GNU_SOURCE
 
 #include <stdio.h>
-#include <sys/time.h>
 #include <time.h>
 #include <stdlib.h>
 #include <unistd.h>
@@ -22,6 +21,7 @@
 #include "parse_vdso.h"
 #include "vdso_config.h"
 #include "vdso_call.h"
+#include "vdso_types.h"
 #include "kselftest.h"
 
 static const char *version;
@@ -31,33 +31,15 @@ static const char **name;
 #define __NR_clock_gettime64	403
 #endif
 
-#ifndef __kernel_timespec
-struct __kernel_timespec {
-	long long	tv_sec;
-	long long	tv_nsec;
-};
-#endif
-
 /* max length of lines in /proc/self/maps - anything longer is skipped here */
 #define MAPS_LINE_LEN 128
 
 int nerrs = 0;
 
-typedef int (*vgettime_t)(clockid_t, struct timespec *);
-
-vgettime_t vdso_clock_gettime;
-
-typedef int (*vgettime64_t)(clockid_t, struct __kernel_timespec *);
-
-vgettime64_t vdso_clock_gettime64;
-
-typedef long (*vgtod_t)(struct timeval *tv, struct timezone *tz);
-
-vgtod_t vdso_gettimeofday;
-
-typedef time_t (*vtime_t)(__kernel_time_t *tloc);
-
-vtime_t vdso_time;
+vdso_clock_gettime_t vdso_clock_gettime;
+vdso_clock_gettime64_t vdso_clock_gettime64;
+vdso_gettimeofday_t vdso_gettimeofday;
+vdso_time_t vdso_time;
 
 typedef long (*getcpu_t)(unsigned *, unsigned *, void *);
 
@@ -123,21 +105,21 @@ static void fill_function_pointers(void)
 
 	vgetcpu = (getcpu_t) vsyscall_getcpu();
 
-	vdso_clock_gettime = (vgettime_t)vdso_sym(version, name[1]);
+	vdso_clock_gettime = (vdso_clock_gettime_t)vdso_sym(version, name[1]);
 	if (!vdso_clock_gettime)
 		printf("Warning: failed to find clock_gettime in vDSO\n");
 
 #if defined(VDSO_32BIT)
-	vdso_clock_gettime64 = (vgettime64_t)vdso_sym(version, name[5]);
+	vdso_clock_gettime64 = (vdso_clock_gettime64_t)vdso_sym(version, name[5]);
 	if (!vdso_clock_gettime64)
 		printf("Warning: failed to find clock_gettime64 in vDSO\n");
 #endif
 
-	vdso_gettimeofday = (vgtod_t)vdso_sym(version, name[0]);
+	vdso_gettimeofday = (vdso_gettimeofday_t)vdso_sym(version, name[0]);
 	if (!vdso_gettimeofday)
 		printf("Warning: failed to find gettimeofday in vDSO\n");
 
-	vdso_time = (vtime_t)vdso_sym(version, name[2]);
+	vdso_time = (vdso_time_t)vdso_sym(version, name[2]);
 	if (!vdso_time)
 		printf("Warning: failed to find time in vDSO\n");
 
@@ -265,7 +247,8 @@ static char const * const clocknames[] = {
 
 static void test_one_clock_gettime(int clock, const char *name)
 {
-	struct timespec start, vdso, end;
+	struct __kernel_old_timespec vdso;
+	struct timespec start, end;
 	int vdso_ret, end_ret;
 
 	printf("[RUN]\tTesting clock_gettime for clock %s (%d)...\n", name, clock);
@@ -389,8 +372,10 @@ static void test_clock_gettime64(void)
 
 static void test_gettimeofday(void)
 {
-	struct timeval start, vdso, end;
-	struct timezone sys_tz, vdso_tz;
+	struct __kernel_old_timeval vdso;
+	struct kernel_timezone vdso_tz;
+	struct timeval start, end;
+	struct timezone sys_tz;
 	int vdso_ret, end_ret;
 
 	if (!vdso_gettimeofday)

-- 
2.55.0

