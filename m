Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68481412BFB;
	Thu,  3 Sep 2026 07:38:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788421112; cv=none; b=u6QcuuBILjZ0l85AbwHzc9jN4lCFO6O1QHH7gyymRgDArImHRmL2TpWrYBqAdI9Ah0YtIsEikj7EFRSJd62FHPuxMyF6uH+YKxk9cREZNZtPNGqkiqpuJtQGFuqDdAuOnuhhEYVMoEYPfLsEGuXgAVxv+Q+BTJw6tihk+oK5BKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788421112; c=relaxed/simple;
	bh=TKhqe2TTfNfj5sVgLqQO7VGrRZqhW+HkUrYx9bVViVM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rOTgKlsBHq2Vdb1z8f2L2c7YM/9SS5msgzjxRk56x2axVJShoMED6VWX9UYdAmcOR5r9Mu1bGnX6Itl7F5/2UbGM0B3ImsjG7V/GHgwUSiRlTfcnxa6EbrdRUxKIYgD1XHH02rx4pmgAR5Vm/AWO1i1EyjzJvDhw6cYdXYHrzoo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=x+m0s4cu; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=Nj2wLmGt; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="x+m0s4cu";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="Nj2wLmGt"
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1788421102;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=U8CGbkM5rrJiQ04yKNrLPdNbiL3kdhf4Yu4nKYrxqKI=;
	b=x+m0s4cubI0u5x4nwbt3Ocpqr9zmMJkURaPzUeEbCmd2KLjdahM7SpWCjwlB3KBvaMUpsI
	r6nF0DUH2gLH5DyFdyP0WYWw80AzADIUk0l9GTZymJmKAbZTH5aJokr/QTW0KMp6rcC/ek
	KkS9qMacbaG1eWkjbU/iIQAOK9lD5Pecp37C9vBnovwslG5ytRgL7DraBPqpjsfUGn+8rF
	RmqXBWsgBHy4viYX96uGxOhhA+4a5Wom8vBpyzg1Iy4UIJ8E+SThsd6SrODm5P0e/FmFKa
	ZqAq9TSEmRgpPoZIS/Ubhwbp5OrxeTflPUDxvO/+xQhSAqlz5QMFZjKkSNGnwQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1788421102;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=U8CGbkM5rrJiQ04yKNrLPdNbiL3kdhf4Yu4nKYrxqKI=;
	b=Nj2wLmGtD8cL2VneksO3+I9rg2EXatGCeMgFtqN12aWw+kXLquIkEOD57+pgjdfp0KdzGC
	aFV0rqFeMKOh3gBw==
Date: Thu, 03 Sep 2026 09:38:20 +0200
Subject: [PATCH v2 8/8] selftests: vDSO: vdso_test_correctness: Use system
 call wrappers from vdso_syscalls.h
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260903-vdso-test-types-v2-8-1eec04eb3658@linutronix.de>
References: <20260903-vdso-test-types-v2-0-1eec04eb3658@linutronix.de>
In-Reply-To: <20260903-vdso-test-types-v2-0-1eec04eb3658@linutronix.de>
To: Andy Lutomirski <luto@kernel.org>, 
 Vincenzo Frascino <vincenzo.frascino@arm.com>, 
 Shuah Khan <shuah@kernel.org>, Thomas Gleixner <tglx@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788421097; l=3755;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=TKhqe2TTfNfj5sVgLqQO7VGrRZqhW+HkUrYx9bVViVM=;
 b=RNGYbkdLMlxJUvW9wM1o6ytG4ocDq2BW+wgUlla0ytqmzPh2ZVF5RSc04tNh2X2vPWqUoN8gG
 GXlJLCEbWSvCFLOGh7fD+r8HSO+EjAFC3f9CMqJbqHLIJV7AD8dFlMX
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=

Using syscall() is problematic for the reasons outlined in vdso_syscalls.h.

Use the wrappers from the utility header instead.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 .../testing/selftests/vDSO/vdso_test_correctness.c | 44 +++++-----------------
 1 file changed, 9 insertions(+), 35 deletions(-)

diff --git a/tools/testing/selftests/vDSO/vdso_test_correctness.c b/tools/testing/selftests/vDSO/vdso_test_correctness.c
index 83cb408c5947..76133566d747 100644
--- a/tools/testing/selftests/vDSO/vdso_test_correctness.c
+++ b/tools/testing/selftests/vDSO/vdso_test_correctness.c
@@ -21,6 +21,7 @@
 #include "parse_vdso.h"
 #include "vdso_config.h"
 #include "vdso_call.h"
+#include "vdso_syscalls.h"
 #include "vdso_types.h"
 #include "kselftest.h"
 
@@ -131,31 +132,6 @@ static long sys_getcpu(unsigned * cpu, unsigned * node,
 	return syscall(__NR_getcpu, cpu, node, cache);
 }
 
-static inline int sys_clock_gettime(clockid_t id, struct timespec *ts)
-{
-	return syscall(__NR_clock_gettime, id, ts);
-}
-
-static inline int sys_clock_gettime64(clockid_t id, struct __kernel_timespec *ts)
-{
-	return syscall(__NR_clock_gettime64, id, ts);
-}
-
-static inline int sys_gettimeofday(struct timeval *tv, struct timezone *tz)
-{
-	return syscall(__NR_gettimeofday, tv, tz);
-}
-
-static inline __kernel_old_time_t sys_time(__kernel_old_time_t *tloc)
-{
-#ifdef __NR_time
-	return syscall(__NR_time, tloc);
-#else
-	errno = ENOSYS;
-	return -1;
-#endif
-}
-
 static void test_getcpu(void)
 {
 	printf("[RUN]\tTesting getcpu...\n");
@@ -247,8 +223,8 @@ static char const * const clocknames[] = {
 
 static void test_one_clock_gettime(int clock, const char *name)
 {
+	struct __kernel_timespec start, end;
 	struct __kernel_old_timespec vdso;
-	struct timespec start, end;
 	int vdso_ret, end_ret;
 
 	printf("[RUN]\tTesting clock_gettime for clock %s (%d)...\n", name, clock);
@@ -279,9 +255,9 @@ static void test_one_clock_gettime(int clock, const char *name)
 	}
 
 	printf("\t%llu.%09ld %llu.%09ld %llu.%09ld\n",
-	       (unsigned long long)start.tv_sec, start.tv_nsec,
-	       (unsigned long long)vdso.tv_sec, vdso.tv_nsec,
-	       (unsigned long long)end.tv_sec, end.tv_nsec);
+	       (unsigned long long)start.tv_sec, (unsigned long)start.tv_nsec,
+	       (unsigned long long)vdso.tv_sec, (unsigned long)vdso.tv_nsec,
+	       (unsigned long long)end.tv_sec, (unsigned long)end.tv_nsec);
 
 	if (!ts_leq(&start, &vdso) || !ts_leq(&vdso, &end)) {
 		printf("[FAIL]\tTimes are out of sequence\n");
@@ -315,7 +291,7 @@ static void test_one_clock_gettime64(int clock, const char *name)
 
 	printf("[RUN]\tTesting clock_gettime64 for clock %s (%d)...\n", name, clock);
 
-	if (sys_clock_gettime64(clock, &start) < 0) {
+	if (sys_clock_gettime(clock, &start) < 0) {
 		if (errno == EINVAL) {
 			vdso_ret = VDSO_CALL(vdso_clock_gettime64, 2, clock, &vdso);
 			if (vdso_ret == -EINVAL) {
@@ -331,7 +307,7 @@ static void test_one_clock_gettime64(int clock, const char *name)
 	}
 
 	vdso_ret = VDSO_CALL(vdso_clock_gettime64, 2, clock, &vdso);
-	end_ret = sys_clock_gettime64(clock, &end);
+	end_ret = sys_clock_gettime(clock, &end);
 
 	if (vdso_ret != 0 || end_ret != 0) {
 		printf("[FAIL]\tvDSO returned %d, syscall errno=%d\n",
@@ -372,10 +348,8 @@ static void test_clock_gettime64(void)
 
 static void test_gettimeofday(void)
 {
-	struct __kernel_old_timeval vdso;
-	struct kernel_timezone vdso_tz;
-	struct timeval start, end;
-	struct timezone sys_tz;
+	struct __kernel_old_timeval start, vdso, end;
+	struct kernel_timezone vdso_tz, sys_tz;
 	int vdso_ret, end_ret;
 
 	if (!vdso_gettimeofday)

-- 
2.55.0

