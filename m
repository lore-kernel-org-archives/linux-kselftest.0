Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9D1037A4AB;
	Mon,  3 Aug 2026 10:04:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785751491; cv=none; b=o6CxQKLtBmoQe2aB2y59CuS/O8sWNShWVVCWH71SA58r4ZyISWGeIyHVAyI7Lc9aZcIJrwd9GOmwPFbcVriz0Sm0oX2Z8F1Rd0YW7MGrCQVDNr1PEzHFfopJI3fTRQOXinlDJpqhf7A+otqyl/deb5vI6hXZ+NkMLTdXi9uZ5GE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785751491; c=relaxed/simple;
	bh=sIKAr4iZmHA7egKodlsSM+sqkyR+6mdVrZ95PgxfZIk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ELhflONBXgItpmjjGgazH2e+PQh/2bmZJqR2m92QOzFnxqZWMjMUb2wSWzxyX1Dkf+7HEF3r6uzD7tjIzV+rQ9y+2IWyZY3ohqZpoZOYH4Jz7B/Te35r7HSJ1h9BVQbDW0K1Sd57WE1m9RhWkqA9DCuHh7K3pUICyY0+Ai36b28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=X3yNUlan; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=mys2v/8f; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="X3yNUlan";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="mys2v/8f"
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh_=28Schneider_Electric=29?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1785751488;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Z4KtPUsXHq5SCbQ18r2P4i6cQ7hpYeXzhBirlnr7E7A=;
	b=X3yNUlanw2GVvr6RX4M+2AVA7ARyZl0H+y7wzHL0B74TgFK/4useSSYhDJT/Yzl1pC+dmz
	iZGZzRat3y0PoxC/fy5OZUC8qPWqp3LzqcDvxpAKEiFlWSesg7bGkZFn1Bp4pc1J5jMlst
	IpSkGKegANCvbna0XtGsQDHt0w3RLr6SauCX8TLEnyInWGETYmQ4rjQlj+Vrx8RkByHjbV
	sSnOgw4cqpy3wmjy/d8gFwJmLFjiFGReRcQ3UxE8R4lT0DNWhCNY0zt8UAkmN32Gh/b7Sx
	/LGLrWxP4N+Nw177AdYDSDpzHwLet8Sph0hVQfjbKb7dHvIj9OPbkC4P1+BC9Q==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1785751488;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Z4KtPUsXHq5SCbQ18r2P4i6cQ7hpYeXzhBirlnr7E7A=;
	b=mys2v/8f0z2jUvGmQcYSi2YJ64+ahdRxCCZ6ND+9DzsnjCnceDm87NABMfGjRP6B8UnxQ5
	lqliaSwx318asHAQ==
Date: Mon, 03 Aug 2026 12:04:41 +0200
Subject: [PATCH v2 10/17] selftests: timers: nanosleep: Reuse kselftest
 error numbers
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260803-auxclock-nanosleep-prep-v2-10-910cbd485390@linutronix.de>
References: <20260803-auxclock-nanosleep-prep-v2-0-910cbd485390@linutronix.de>
In-Reply-To: <20260803-auxclock-nanosleep-prep-v2-0-910cbd485390@linutronix.de>
To: John Stultz <jstultz@google.com>, Thomas Gleixner <tglx@kernel.org>, 
 Stephen Boyd <sboyd@kernel.org>, Miroslav Lichvar <mlichvar@redhat.com>, 
 Anna-Maria Behnsen <anna-maria@linutronix.de>, 
 Frederic Weisbecker <frederic@kernel.org>, Shuah Khan <shuah@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh_=28Schneider_Electric=29?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785751481; l=3374;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=sIKAr4iZmHA7egKodlsSM+sqkyR+6mdVrZ95PgxfZIk=;
 b=J7iWJEVbSfQb9RyzR7MoIn4LbOTj7raMgaRQyLlJt9tHGRSqWfz+yD+KB6LSGUK/mCEU4YASM
 No0DGQ/IZyoAHilBsHAd0vNGax8vNiyt/fPWgJS7IGpI+YTbxT5qHVv
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=

The test currently defines its own custom error numbers.
These mirror the semantics from the standard KFST_* constants.

To make the code easier to read, use the standard result constants.

Signed-off-by: Thomas Weißschuh (Schneider Electric) <thomas.weissschuh@linutronix.de>
Acked-by: John Stultz <jstultz@google.com>
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

