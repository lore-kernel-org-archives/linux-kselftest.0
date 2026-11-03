Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793715148;
	b=f4Ow5G3A550I0yz5TuoldU2WwB1rJ/odKvmYOHWCkNZwC6UmZjQzPqGNeFd47fXR6AGS
	 bcKN7wzu3GdymiSTcByty+wg87Qot7SFUxWG1o/LVs2iPUSQ0Nt6DQx1gyhHjqe02F3Ep
	 QXmkHHyOY0g0rY/DeBY9+EP5QNpamzz5joyIar4d4kzXxDCe3PdXT+r2hMXADS1ui+DVZ
	 yWSpUUlEOUDLv0DqGIL2g6j2+PdyO1lV9JtMwZUtudFti2uBy3QXkL1iHW7YeILwoVChu
	 G8eJB5Z1Z8inqLnhWDFCAacndAkiaEByqN2W6xUztfDn0ULuCRuazC96Rgpj0Hnc3bQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793715148;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=jQiHQJYaf/EXsGdTe2p5klR92l65Zw/CdzHHYP7vMSc=;
	b=2K6tkgZjzku22oEBDz7dCjy6JCqiPSXRwSc+Skq2MwECA/Rj6ZJUbV4a2qO/lPWjhFiH
	 qvDWryxErbMlOxT89hbE5A0JsJUA742r4mHxezASKFgauVLJQx79h/GquhhcCBUlJU8g3
	 smAqUzum1QC0w5xKbKaRKHtuCwrtXWOBvSE7gAdn6GeWtrl9HlpEC3M5qstQsUJ86xD6b
	 Ditc680rzxcks70J8MXdTdTwjnO2lf28Nk60sIgz30cOEiH9cGZqMQe7lcp5KwYI6I6Ux
	 VqNqz/tiK1QuHVlhh7ibCUTL5g5WlNgyylAqku8ONq8IcMTnaPoMCl1eAufPh1BKKbA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=f3ia8tux;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87139606A331;
	Tue,  3 Nov 2026 14:12:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=f3ia8tux
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6087B1F00919;
	Tue,  3 Nov 2026 14:12:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793715148;
	bh=jQiHQJYaf/EXsGdTe2p5klR92l65Zw/CdzHHYP7vMSc=;
	h=From:To:Cc:Subject:Date;
	b=f3ia8tuxNUn8HykJy+JcC1cAYNMS3x7aHQNJSahYmElxB9R7MSqPfI0Nu0A5epnk+
	 mGDfgZH2ibEc/1zITs3pQhfg3/wHNUhkxIkNBiTBfWQIrBU5wXM+ACPXiR+pl72ZCd
	 bXCv+r+kl95sz63pI145IJnP8kmwabDv60jmiOoU1l7yT6xwcaXXyk/1dl6A7cesXz
	 BQMLqz6lqXp5duiYsiB21hFeKB9XcByJLVaXGQFephXVBN4q83Bwi/LI3kEHlRuRJA
	 WlGJitWyV3BVE3P/3qwR/FIW2V62Izs3tq9PPv9VlGEo+ESVvbMqKtSqGqVnTMMTjp
	 gDbc3a2QL7+Lg==
From: Sasha Levin <sashal@kernel.org>
To: Shuah Khan <shuah@kernel.org>
Cc: Andrei Vagin <avagin@google.com>,
	=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
	Nathan Chancellor <nathan@kernel.org>,
	linux-kselftest@vger.kernel.org,
	llvm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] selftests/timens: print and parse time_t as long long
Date: Tue,  3 Nov 2026 09:12:26 -0500
Message-ID: <20261103141226.28507-1-sashal@kernel.org>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Several timens tests pass time_t values to printf-style functions with
%ld or %lu, exec.c reads one with sscanf("%ld"), and exec.c and
vfork_exec.c take the absolute value of a time_t difference with
labs(). On 32-bit architectures where the C library uses a 64-bit
time_t, such as armhf in Debian 13, time_t is a long long and every
timens test fails to build with -Werror:

  timens.h:72:48: error: format '%ld' expects argument of type 'long int', but argument 5 has type 'time_t' {aka 'long long int'} [-Werror=format=]

Clang also rejects the labs() calls with -Wabsolute-value.

Cast the values to long long and print them with %lld, parse the exec
argument into a long long, and use llabs() as timer.c and timerfd.c
already do.

Signed-off-by: Sasha Levin <sashal@kernel.org>
---
KernelCI hits this on every 32-bit arm kselftest build: all nine timens
programs fail. Built the timens sources with gcc 16 and clang 21 for
x86_64, for i386 and for i386 with _TIME_BITS=64 (the last one fails
without this patch). exec, vfork_exec, clock_nanosleep and futex pass
on x86_64 in a user namespace.

 .../selftests/timens/clock_nanosleep.c        |  4 +--
 tools/testing/selftests/timens/exec.c         | 27 ++++++++++++-------
 tools/testing/selftests/timens/procfs.c       |  7 ++---
 tools/testing/selftests/timens/timens.c       | 16 ++++++-----
 tools/testing/selftests/timens/timens.h       |  3 ++-
 tools/testing/selftests/timens/vfork_exec.c   | 17 +++++++-----
 6 files changed, 45 insertions(+), 29 deletions(-)

diff --git a/tools/testing/selftests/timens/clock_nanosleep.c b/tools/testing/selftests/timens/clock_nanosleep.c
index 5cc0010e85ff0..aeb1883e90f7c 100644
--- a/tools/testing/selftests/timens/clock_nanosleep.c
+++ b/tools/testing/selftests/timens/clock_nanosleep.c
@@ -102,8 +102,8 @@ static int run_test(int clockid, int abs)
 	}
 
 	if (rem.tv_sec < 3300 || rem.tv_sec > 3900) {
-		pr_fail("clockid: %d abs: %d remain: %ld\n",
-			clockid, abs, rem.tv_sec);
+		pr_fail("clockid: %d abs: %d remain: %lld\n",
+			clockid, abs, (long long)rem.tv_sec);
 		return 1;
 	}
 	ksft_test_result_pass("clockid: %d abs:%d\n", clockid, abs);
diff --git a/tools/testing/selftests/timens/exec.c b/tools/testing/selftests/timens/exec.c
index a644162d56fdc..7dcac5765e259 100644
--- a/tools/testing/selftests/timens/exec.c
+++ b/tools/testing/selftests/timens/exec.c
@@ -25,13 +25,17 @@ int main(int argc, char *argv[])
 	pid_t pid;
 
 	if (argc > 1) {
-		if (sscanf(argv[1], "%ld", &now.tv_sec) != 1)
+		long long sec;
+
+		if (sscanf(argv[1], "%lld", &sec) != 1)
 			return pr_perror("sscanf");
+		now.tv_sec = sec;
 
 		for (i = 0; i < 2; i++) {
 			_gettime(CLOCK_MONOTONIC, &tst, i);
-			if (labs(tst.tv_sec - now.tv_sec) > 5)
-				return pr_fail("%ld %ld\n", now.tv_sec, tst.tv_sec);
+			if (llabs(tst.tv_sec - now.tv_sec) > 5)
+				return pr_fail("%lld %lld\n", (long long)now.tv_sec,
+					       (long long)tst.tv_sec);
 		}
 		return 0;
 	}
@@ -52,9 +56,10 @@ int main(int argc, char *argv[])
 
 	for (i = 0; i < 2; i++) {
 		_gettime(CLOCK_MONOTONIC, &tst, i);
-		if (labs(tst.tv_sec - now.tv_sec) > 5)
-			return pr_fail("%ld %ld\n",
-					now.tv_sec, tst.tv_sec);
+		if (llabs(tst.tv_sec - now.tv_sec) > 5)
+			return pr_fail("%lld %lld\n",
+					(long long)now.tv_sec,
+					(long long)tst.tv_sec);
 	}
 
 	if (argc > 1)
@@ -72,13 +77,15 @@ int main(int argc, char *argv[])
 		/* Check that a child process is in the new timens. */
 		for (i = 0; i < 2; i++) {
 			_gettime(CLOCK_MONOTONIC, &tst, i);
-			if (labs(tst.tv_sec - now.tv_sec - OFFSET) > 5)
-				return pr_fail("%ld %ld\n",
-						now.tv_sec + OFFSET, tst.tv_sec);
+			if (llabs(tst.tv_sec - now.tv_sec - OFFSET) > 5)
+				return pr_fail("%lld %lld\n",
+						(long long)now.tv_sec + OFFSET,
+						(long long)tst.tv_sec);
 		}
 
 		/* Check for proper vvar offsets after execve. */
-		snprintf(now_str, sizeof(now_str), "%ld", now.tv_sec + OFFSET);
+		snprintf(now_str, sizeof(now_str), "%lld",
+			 (long long)now.tv_sec + OFFSET);
 		execve("/proc/self/exe", cargv, cenv);
 		return pr_perror("execve");
 	}
diff --git a/tools/testing/selftests/timens/procfs.c b/tools/testing/selftests/timens/procfs.c
index 0a9ff90ee69a9..ded9e0f51b394 100644
--- a/tools/testing/selftests/timens/procfs.c
+++ b/tools/testing/selftests/timens/procfs.c
@@ -138,9 +138,10 @@ static int check_uptime(void)
 
 	uptime_expected = uptime_old.tv_sec + TEN_DAYS_IN_SEC;
 	if (fabs(difftime(uptime_new.tv_sec, uptime_expected)) > prec) {
-		pr_fail("uptime in /proc/uptime: old %ld, new %ld [%ld]",
-			uptime_old.tv_sec, uptime_new.tv_sec,
-			uptime_old.tv_sec + TEN_DAYS_IN_SEC);
+		pr_fail("uptime in /proc/uptime: old %lld, new %lld [%lld]",
+			(long long)uptime_old.tv_sec,
+			(long long)uptime_new.tv_sec,
+			(long long)uptime_old.tv_sec + TEN_DAYS_IN_SEC);
 		return 1;
 	}
 
diff --git a/tools/testing/selftests/timens/timens.c b/tools/testing/selftests/timens/timens.c
index a9c0534ef8f67..f3cefacecd572 100644
--- a/tools/testing/selftests/timens/timens.c
+++ b/tools/testing/selftests/timens/timens.c
@@ -118,9 +118,11 @@ static int test_gettime(clockid_t clock_index, bool raw_syscall, time_t offset)
 
 	if (difftime(cur_ts.tv_sec, child_ts_new.tv_sec) < precision) {
 		ksft_test_result_fail(
-			"Child's %s (%s) time has not changed: %lu -> %lu [%lu]\n",
-			clocks[clock_index].name, entry, parent_ts_old.tv_sec,
-			child_ts_new.tv_sec, cur_ts.tv_sec);
+			"Child's %s (%s) time has not changed: %lld -> %lld [%lld]\n",
+			clocks[clock_index].name, entry,
+			(long long)parent_ts_old.tv_sec,
+			(long long)child_ts_new.tv_sec,
+			(long long)cur_ts.tv_sec);
 		return -1;
 	}
 
@@ -132,9 +134,11 @@ static int test_gettime(clockid_t clock_index, bool raw_syscall, time_t offset)
 
 	if (difftime(cur_ts.tv_sec, parent_ts_old.tv_sec) > DAY_IN_SEC) {
 		ksft_test_result_fail(
-			"Parent's %s (%s) time has changed: %lu -> %lu [%lu]\n",
-			clocks[clock_index].name, entry, parent_ts_old.tv_sec,
-			child_ts_new.tv_sec, cur_ts.tv_sec);
+			"Parent's %s (%s) time has changed: %lld -> %lld [%lld]\n",
+			clocks[clock_index].name, entry,
+			(long long)parent_ts_old.tv_sec,
+			(long long)child_ts_new.tv_sec,
+			(long long)cur_ts.tv_sec);
 		/* Let's play nice and put it closer to original */
 		clock_settime(clocks[clock_index].id, &cur_ts);
 		return -1;
diff --git a/tools/testing/selftests/timens/timens.h b/tools/testing/selftests/timens/timens.h
index 7ca4b46ca61d0..fa9a60f75e39a 100644
--- a/tools/testing/selftests/timens/timens.h
+++ b/tools/testing/selftests/timens/timens.h
@@ -69,7 +69,8 @@ static inline int _settime(clockid_t clk_id, time_t offset)
 	if (clk_id == CLOCK_MONOTONIC_COARSE || clk_id == CLOCK_MONOTONIC_RAW)
 		clk_id = CLOCK_MONOTONIC;
 
-	len = snprintf(buf, sizeof(buf), "%d %ld 0", clk_id, offset);
+	len = snprintf(buf, sizeof(buf), "%d %lld 0", clk_id,
+		       (long long)offset);
 
 	fd = open("/proc/self/timens_offsets", O_WRONLY);
 	if (fd < 0)
diff --git a/tools/testing/selftests/timens/vfork_exec.c b/tools/testing/selftests/timens/vfork_exec.c
index b957e1a651243..42fa0dcdfdec4 100644
--- a/tools/testing/selftests/timens/vfork_exec.c
+++ b/tools/testing/selftests/timens/vfork_exec.c
@@ -32,9 +32,10 @@ static void *tcheck(void *_args)
 
 	for (i = 0; i < 2; i++) {
 		_gettime(CLOCK_MONOTONIC, &tst, i);
-		if (labs(tst.tv_sec - now->tv_sec) > 5) {
-			pr_fail("%s: in-thread: unexpected value: %ld (%ld)\n",
-				args->tst_name, tst.tv_sec, now->tv_sec);
+		if (llabs(tst.tv_sec - now->tv_sec) > 5) {
+			pr_fail("%s: in-thread: unexpected value: %lld (%lld)\n",
+				args->tst_name, (long long)tst.tv_sec,
+				(long long)now->tv_sec);
 			return (void *)1UL;
 		}
 	}
@@ -64,9 +65,10 @@ static int check(char *tst_name, struct timespec *now)
 
 	for (i = 0; i < 2; i++) {
 		_gettime(CLOCK_MONOTONIC, &tst, i);
-		if (labs(tst.tv_sec - now->tv_sec) > 5)
-			return pr_fail("%s: unexpected value: %ld (%ld)\n",
-					tst_name, tst.tv_sec, now->tv_sec);
+		if (llabs(tst.tv_sec - now->tv_sec) > 5)
+			return pr_fail("%s: unexpected value: %lld (%lld)\n",
+					tst_name, (long long)tst.tv_sec,
+					(long long)now->tv_sec);
 	}
 	if (check_in_thread(tst_name, now))
 		return 1;
@@ -118,7 +120,8 @@ int main(int argc, char *argv[])
 		char *cenv[] = {NULL};
 
 		/* Check for proper vvar offsets after execve. */
-		snprintf(now_str, sizeof(now_str), "%ld", now.tv_sec + OFFSET);
+		snprintf(now_str, sizeof(now_str), "%lld",
+			 (long long)now.tv_sec + OFFSET);
 		execve("/proc/self/exe", cargv, cenv);
 		pr_perror("execve");
 		_exit(1);
-- 
2.53.0

