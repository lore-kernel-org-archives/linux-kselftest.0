Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1750538DC78;
	Thu, 30 Jul 2026 06:47:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785394081; cv=none; b=YS1pNQ3hxHl8Dg+zbp50o852N4pRjw15SNeSmTrj4i1MTHhqGw3pljGVIQKCPZru1nGE8BwnYiO4hPU28KV+gfjlglDBlTcEAHh7gU1+z3/JYBWeoPIFalG/zYSJKXFlmvSuRWrdu0fGg3/hZWm995qcUSrSQotjC58b9h4qyaw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785394081; c=relaxed/simple;
	bh=iU1Y+BB9VZdjx2WaLNxPNV3HJ6Jn3vj9FWPqGz4Mpno=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BGndQRbh3aqVH2d/g9Op4ksdMme9kLTzBJGVcu/XatE77uh0EWhen4lH43avhagjllSWCGetpeOpVBtpI1eZG4BTy3poGXT8TJNH9KYJN1UMLDY5aGPlr61X/fOqSpwQ4APyn1guK5nnxi4hVQpP7mvQ9a64njisZLs+EQnDvmg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=mmzzq96n; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=+DbLTZXh; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="mmzzq96n";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="+DbLTZXh"
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh_=28Schneider_Electric=29?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1785394070;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1r7ZwoMaOQNb4HiwhIOAdr8gcxz2F20+kk9YKDLUu38=;
	b=mmzzq96nDZbEM/jexba7LmxJoif86L2UHLHUe118rH2U2NiD9sFr9l3ZKhEVs7NQAaKPxQ
	UtUgLCZmaGTygpx9B8pq3d14XPz5tgbEDZCH2lxp+/odtoTWFVqShOix+fSqGT7CQfbeJm
	jca7ipNZDN8mpmoX2Ii5/Ncbpttue04RcoGu5ZXEnJzkklGBC+RJbHZsgljC0RELXqb5Eg
	X4d/lvlS/v2VMuzmv1nokO9Pwz+d6YsSEwJtZ2EgPyKIHfsncPM/XAMTCIZkZPxaG4wHlm
	/EkE2t1AulbT1yWZLkM1LFIQOLBCf2SwiwjUp8SeJIcGxiniwoj5odNkaor0Iw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1785394070;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1r7ZwoMaOQNb4HiwhIOAdr8gcxz2F20+kk9YKDLUu38=;
	b=+DbLTZXhKw5uZv8FDABUSJ0qDd6yBvrovqoIGbLdRd8DxAigT12bNxyha7Bf8ezk67ipzH
	37JQX6YW1vb9I2AQ==
Date: Thu, 30 Jul 2026 08:47:47 +0200
Subject: [PATCH 10/16] selftests: timers: nanosleep: Reuse kselftest error
 numbers
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260730-auxclock-nanosleep-prep-v1-10-cd8b61229a7c@linutronix.de>
References: <20260730-auxclock-nanosleep-prep-v1-0-cd8b61229a7c@linutronix.de>
In-Reply-To: <20260730-auxclock-nanosleep-prep-v1-0-cd8b61229a7c@linutronix.de>
To: John Stultz <jstultz@google.com>, Thomas Gleixner <tglx@kernel.org>, 
 Stephen Boyd <sboyd@kernel.org>, Miroslav Lichvar <mlichvar@redhat.com>, 
 Anna-Maria Behnsen <anna-maria@linutronix.de>, 
 Frederic Weisbecker <frederic@kernel.org>, Shuah Khan <shuah@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh_=28Schneider_Electric=29?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785394062; l=3330;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=iU1Y+BB9VZdjx2WaLNxPNV3HJ6Jn3vj9FWPqGz4Mpno=;
 b=SvaCFtV86lt4NxGc90IkR51Vc/YlS4S4ECEdUYXnesgp1+ejOG3JbUOMCVqkvnPnmZt6L2Nk8
 SnI+oSLF2FbD1WErq0Ln95ViDI/ckcOVapMECjSPAWP6V39vEWIcSwf
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=

The test currently defines its own custom error numbers.
These mirror the semantics from the standard KFST_* constants.

To make the code easier to read, use the standard result constants.

Signed-off-by: Thomas Weißschuh (Schneider Electric) <thomas.weissschuh@linutronix.de>
---
 tools/testing/selftests/timers/nanosleep.c | 36 ++++++++++++++----------------
 1 file changed, 17 insertions(+), 19 deletions(-)

diff --git a/tools/testing/selftests/timers/nanosleep.c b/tools/testing/selftests/timers/nanosleep.c
index 9dd662226261..0a2ca1791f27 100644
--- a/tools/testing/selftests/timers/nanosleep.c
+++ b/tools/testing/selftests/timers/nanosleep.c
@@ -30,8 +30,6 @@
 #include "clock-helpers.h"
 #include "kselftest.h"
 
-#define UNSUPPORTED 0xf00f
-
 /* returns 1 if a <= b, 0 otherwise */
 static inline int in_order(struct timespec a, struct timespec b)
 {
@@ -60,15 +58,15 @@ int nanosleep_test(int clockid, long long ns)
 
 	/* First check abs time */
 	if (clock_gettime(clockid, &now))
-		return UNSUPPORTED;
+		return KSFT_SKIP;
 	target = timespec_add(now, ns);
 
 	if (clock_nanosleep(clockid, TIMER_ABSTIME, &target, NULL))
-		return UNSUPPORTED;
+		return KSFT_SKIP;
 	clock_gettime(clockid, &now);
 
 	if (!in_order(target, now))
-		return -1;
+		return KSFT_FAIL;
 
 	/* Second check reltime */
 	clock_gettime(clockid, &now);
@@ -80,8 +78,8 @@ int nanosleep_test(int clockid, long long ns)
 	clock_gettime(clockid, &now);
 
 	if (!in_order(target, now))
-		return -1;
-	return 0;
+		return KSFT_FAIL;
+	return KSFT_PASS;
 }
 
 static void dummy_event_handler(int val)
@@ -100,38 +98,38 @@ static int nanosleep_test_remaining(int clockid)
 	sa.sa_handler = dummy_event_handler;
 	ret = sigaction(SIGALRM, &sa, NULL);
 	if (ret)
-		return -1;
+		return KSFT_FAIL;
 
 	ret = timer_create(clockid, NULL, &timer);
 	if (ret)
-		return -1;
+		return KSFT_FAIL;
 
 	itimer.it_value.tv_nsec = NSEC_PER_SEC / 4;
 	ret = timer_settime(timer, 0, &itimer, NULL);
 	if (ret)
-		return -1;
+		return KSFT_FAIL;
 
 	rqtp.tv_nsec = NSEC_PER_SEC / 2;
 	ret = clock_nanosleep(clockid, 0, &rqtp, &rmtp);
 	if (ret != EINTR)
-		return -1;
+		return KSFT_FAIL;
 
 	ret = timer_delete(timer);
 	if (ret)
-		return -1;
+		return KSFT_FAIL;
 
 	sa.sa_handler = SIG_DFL;
 	ret = sigaction(SIGALRM, &sa, NULL);
 	if (ret)
-		return -1;
+		return KSFT_FAIL;
 
 	if (!in_order((struct timespec) {}, rmtp))
-		return -1;
+		return KSFT_FAIL;
 
 	if (!in_order(rmtp, rqtp))
-		return -1;
+		return KSFT_FAIL;
 
-	return 0;
+	return KSFT_PASS;
 }
 
 int main(int argc, char **argv)
@@ -159,18 +157,18 @@ int main(int argc, char **argv)
 		length = 10;
 		while (length <= (NSEC_PER_SEC * 10)) {
 			ret = nanosleep_test(clockid, length);
-			if (ret == UNSUPPORTED) {
+			if (ret == KSFT_SKIP) {
 				ksft_test_result_skip("%s\n", clock_name(clockid));
 				goto next;
 			}
-			if (ret < 0) {
+			if (ret == KSFT_FAIL) {
 				ksft_test_result_fail("%s\n", clock_name(clockid));
 				ksft_exit_fail();
 			}
 			length *= 100;
 		}
 		ret = nanosleep_test_remaining(clockid);
-		if (ret < 0) {
+		if (ret == KSFT_FAIL) {
 			ksft_test_result_fail("%s\n", clock_name(clockid));
 			ksft_exit_fail();
 		}

-- 
2.55.0

