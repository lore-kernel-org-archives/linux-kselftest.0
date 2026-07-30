Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A3953AFAED;
	Thu, 30 Jul 2026 06:48:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785394086; cv=none; b=sxUXYmtQ7pKIB/3LC7Y9SA/fqYzXY5BbtOqCpdrx/yt0fizq4mQ4/SLOt8PUfQgyv8R7j08aFbf2ABdiS4ehUQvXjEsFWlQSIWvNalJW/RcaWkdA8//r6r9y56l2p3g0ZfqT2C1NKdn4Wu9IlLH/tIZR/CAeYh9cA2d5eQnG41c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785394086; c=relaxed/simple;
	bh=AWnxTh16355kTz5f9zsO6DPaGnEXFuGEChngb+mo6aM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=X0wTn/c6asNCynx97ynGpzL4KVMcWZgB/N+RcFhCFT70bYUpYEmB5OI9dHbDSuS/nxgrLMvPamQeRFrTfKCQ5n3Wgn7moUkB/bZUt6qOa5FfcKAZmR0pLEDCbMDa4DVx0H2ZiFGuJcVTXha1IdvoP2Rtd4YStmTyS7Cls3xYQRk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=QhsoNHJF; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=kBQKRx/S; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="QhsoNHJF";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="kBQKRx/S"
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh_=28Schneider_Electric=29?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1785394075;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7bULqQqZ8a6YNKKzH09gWdyvdTg9G1ZXXAomYtM34eg=;
	b=QhsoNHJFw34QyNIwA+VqiWwDIdWJilX3giF1Uspes35muB5uYhLqJqB3Bc02oROHjuB+kM
	u5OLhyZy9+YoHLSiU05LnlCTyg6Hj10tYxG3eed9nhfK5V0rA34bguPaHMNWU6XX5jtxR2
	UzgKBVvXdvag76WrQ2sDmQ79gw1e9t4D+fErDA43ipVtu1jAHS9sVBV1vMknHjyr/vpK0j
	Rl7VsQzsbhi4KZlQeeLmi34BSronFGTSgu/dvyY+0BhjjhEZsYRmclQ9upboh+uuIAH2/4
	aDOnyxdNuYlQIgdJNL6Bl022/mceEqGTua/Yd22qFXueC/KFdNkr5WKPuzlgzQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1785394075;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7bULqQqZ8a6YNKKzH09gWdyvdTg9G1ZXXAomYtM34eg=;
	b=kBQKRx/SAqD8yoP7vYSLa86aA6w2J7vjn2/qCShnHQ5Mk2+UVYYP3EKItswHZeyL93Id9K
	8hlwYi/ZlD1dijCQ==
Date: Thu, 30 Jul 2026 08:47:53 +0200
Subject: [PATCH 16/16] selftests: timers: nsleep-lat: Check all calls to
 clock_nanosleep() and clock_gettime()
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260730-auxclock-nanosleep-prep-v1-16-cd8b61229a7c@linutronix.de>
References: <20260730-auxclock-nanosleep-prep-v1-0-cd8b61229a7c@linutronix.de>
In-Reply-To: <20260730-auxclock-nanosleep-prep-v1-0-cd8b61229a7c@linutronix.de>
To: John Stultz <jstultz@google.com>, Thomas Gleixner <tglx@kernel.org>, 
 Stephen Boyd <sboyd@kernel.org>, Miroslav Lichvar <mlichvar@redhat.com>, 
 Anna-Maria Behnsen <anna-maria@linutronix.de>, 
 Frederic Weisbecker <frederic@kernel.org>, Shuah Khan <shuah@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh_=28Schneider_Electric=29?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785394062; l=1921;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=AWnxTh16355kTz5f9zsO6DPaGnEXFuGEChngb+mo6aM=;
 b=BR2aDXH1z+rPKxZs2+IYkZ5V+TbmExcMfoNxxeTSYeG+8uSu2Z46yABi1NXndP8glnWZR6v2Q
 PUIPQEVpB+OBpuS0KTOmcJExUx5s5UOq0EP6kPOzhBL3gRB3ApRZx7x
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=

Both these functions can fail.

The first calls to those functions are already checked and result in
KSFT_SKIP.

If they start failing afterwards unexpectedly, report a hard error.

Signed-off-by: Thomas Weißschuh (Schneider Electric) <thomas.weissschuh@linutronix.de>
---
 tools/testing/selftests/timers/nsleep-lat.c | 23 ++++++++++++++++-------
 1 file changed, 16 insertions(+), 7 deletions(-)

diff --git a/tools/testing/selftests/timers/nsleep-lat.c b/tools/testing/selftests/timers/nsleep-lat.c
index 86af6d81cb14..fceb74c01d69 100644
--- a/tools/testing/selftests/timers/nsleep-lat.c
+++ b/tools/testing/selftests/timers/nsleep-lat.c
@@ -65,10 +65,16 @@ int nanosleep_lat_test(int clockid, long long ns)
 	count = 10;
 
 	/* First check relative latency */
-	clock_gettime(clockid, &start);
-	for (i = 0; i < count; i++)
-		clock_nanosleep(clockid, 0, &target, NULL);
-	clock_gettime(clockid, &end);
+	if (clock_gettime(clockid, &start))
+		return KSFT_FAIL;
+
+	for (i = 0; i < count; i++) {
+		if (clock_nanosleep(clockid, 0, &target, NULL))
+			return KSFT_FAIL;
+	}
+
+	if (clock_gettime(clockid, &end))
+		return KSFT_FAIL;
 
 	if (((timespec_sub(start, end)/count)-ns) > UNRESONABLE_LATENCY) {
 		ksft_print_msg("Large rel latency: %lld ns :", (timespec_sub(start, end)/count)-ns);
@@ -77,10 +83,13 @@ int nanosleep_lat_test(int clockid, long long ns)
 
 	/* Next check absolute latency */
 	for (i = 0; i < count; i++) {
-		clock_gettime(clockid, &start);
+		if (clock_gettime(clockid, &start))
+			return KSFT_FAIL;
 		target = timespec_add(start, ns);
-		clock_nanosleep(clockid, TIMER_ABSTIME, &target, NULL);
-		clock_gettime(clockid, &end);
+		if (clock_nanosleep(clockid, TIMER_ABSTIME, &target, NULL))
+			return KSFT_FAIL;
+		if (clock_gettime(clockid, &end))
+			return KSFT_FAIL;
 		latency += timespec_sub(target, end);
 	}
 

-- 
2.55.0

