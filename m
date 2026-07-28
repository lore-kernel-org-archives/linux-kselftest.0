Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13F4B3D4126;
	Tue, 28 Jul 2026 07:56:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785225386; cv=none; b=qp4aYe9ho34wlF5RFKzhun/oy4T3/FNNn/MmNOXBWBT28lfKei+JBhKjYZiOHBChaIjFhRa77C0A21W8p1Ahuwj5X+tXz2NXHOiJp5lLk9O/34ntKUXBM9Ix6qEqyd3a9JECA3tYRSTjXsXFplLQCxWYckKi6GDu4o8gFkYvYHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785225386; c=relaxed/simple;
	bh=3wkVoAmQBiDmx4IEQCYA6tEJck5ZGZAsOFyFBRVSUYg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iX33tSJgK1n4UW03EXTwGE67k1LIjkxnQEO3hxlQJ0BBhuqocVyFUG7iTt6/rkQ+2wXwon90DOfJZCPUVjd20INCS5SlVr6i02pr0dLw6tImLAjxIEsEpgFlhEejdXNjdf2NCLGvKPEKLWU0Icz+fLHhZAw+XPXpV06kjrzn21E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=1QZvYPcs; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=7ADwAjkT; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="1QZvYPcs";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="7ADwAjkT"
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1785225383;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IRk08++oct4WCnwD0T4wPVSNJPJ3EzY31deqpssaQHs=;
	b=1QZvYPcsZD+YCIB/Njv+dxzS2mbBV7TRGqcWm01IkfxK1ANLceCDmcA8VjJza3OqvT+xBI
	gFEZ6BfhZtQoPL41YQfyfEFDcmlf5z2/W2ROxfyjAA6eKmIcapPro7JC6dx4+Bw28pc5Jl
	wCjgxbvGJRE3VpGHqIcRjJ0kwFHdxoIpuRuAyLV6mVJSjdLjjASnl5BMWjIilP6iOdPjTn
	w3D8k1crzokgWMDd1pjtQv73wFPJf27k8FsMcoVa7jZ31u2dtWD15b92ikpVQBsDh6aILR
	0FbLo/AoV6xN4tdY9CVmfWJhUjNVbQ9gbqkfBq1oseiHwjMQ1FM7kOhqG+uQhw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1785225383;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IRk08++oct4WCnwD0T4wPVSNJPJ3EzY31deqpssaQHs=;
	b=7ADwAjkTK2LIs9c8ojxO5Kfoqn1pieKR18tcJtsqQ/xIuOPtr4pbfnPGp8pT9bhBvtt3li
	TgYyxxSUc0B6RCCQ==
Date: Tue, 28 Jul 2026 09:54:27 +0200
Subject: [PATCH 1/5] selftests: vDSO: vdso_test_correctness: Store the
 clock id in the array
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260728-vdso-test-axuclocks-v1-1-2fcc883a2940@linutronix.de>
References: <20260728-vdso-test-axuclocks-v1-0-2fcc883a2940@linutronix.de>
In-Reply-To: <20260728-vdso-test-axuclocks-v1-0-2fcc883a2940@linutronix.de>
To: Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
 Vincenzo Frascino <vincenzo.frascino@arm.com>, 
 Shuah Khan <shuah@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785225381; l=2676;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=3wkVoAmQBiDmx4IEQCYA6tEJck5ZGZAsOFyFBRVSUYg=;
 b=Mjpa3nD0bNk7Ku2arGkq1NUsAuJN4rJu7fHAkInzwH7HDWrAtvX4hGmEjqmO7Xo5MH5hjX5WC
 3+6D32F5ckjAnuiIa7bm+PqVQTPzYa/6wPMJ1Sw70XLCto2NRI9gjgg
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=

The tests iterate over all elements of the array.
No gaps are possible with the current logic.
This prevents the test of auxiliary clocks which start at 16.

Transform the array so the clock id is part of the array entry and not
the entries index.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 .../testing/selftests/vDSO/vdso_test_correctness.c | 37 ++++++++++++----------
 1 file changed, 20 insertions(+), 17 deletions(-)

diff --git a/tools/testing/selftests/vDSO/vdso_test_correctness.c b/tools/testing/selftests/vDSO/vdso_test_correctness.c
index 5c5a07dd1128..bcce5053e822 100644
--- a/tools/testing/selftests/vDSO/vdso_test_correctness.c
+++ b/tools/testing/selftests/vDSO/vdso_test_correctness.c
@@ -251,19 +251,22 @@ static bool tv_leq(const struct timeval *a, const struct timeval *b)
 		return a->tv_usec <= b->tv_usec;
 }
 
-static char const * const clocknames[] = {
-	[0] = "CLOCK_REALTIME",
-	[1] = "CLOCK_MONOTONIC",
-	[2] = "CLOCK_PROCESS_CPUTIME_ID",
-	[3] = "CLOCK_THREAD_CPUTIME_ID",
-	[4] = "CLOCK_MONOTONIC_RAW",
-	[5] = "CLOCK_REALTIME_COARSE",
-	[6] = "CLOCK_MONOTONIC_COARSE",
-	[7] = "CLOCK_BOOTTIME",
-	[8] = "CLOCK_REALTIME_ALARM",
-	[9] = "CLOCK_BOOTTIME_ALARM",
-	[10] = "CLOCK_SGI_CYCLE",
-	[11] = "CLOCK_TAI",
+static const struct {
+	clockid_t id;
+	const char *const name;
+} clocks[] = {
+	{ 0,	"CLOCK_REALTIME"},
+	{ 1,	"CLOCK_MONOTONIC"},
+	{ 2,	"CLOCK_PROCESS_CPUTIME_ID"},
+	{ 3,	"CLOCK_THREAD_CPUTIME_ID"},
+	{ 4,	"CLOCK_MONOTONIC_RAW"},
+	{ 5,	"CLOCK_REALTIME_COARSE"},
+	{ 6,	"CLOCK_MONOTONIC_COARSE"},
+	{ 7,	"CLOCK_BOOTTIME"},
+	{ 8,	"CLOCK_REALTIME_ALARM"},
+	{ 9,	"CLOCK_BOOTTIME_ALARM"},
+	{ 10,	"CLOCK_SGI_CYCLE"},
+	{ 11,	"CLOCK_TAI"},
 };
 
 static void test_one_clock_gettime(int clock, const char *name)
@@ -319,8 +322,8 @@ static void test_clock_gettime(void)
 		return;
 	}
 
-	for (int clock = 0; clock < ARRAY_SIZE(clocknames); clock++)
-		test_one_clock_gettime(clock, clocknames[clock]);
+	for (int clock = 0; clock < ARRAY_SIZE(clocks); clock++)
+		test_one_clock_gettime(clocks[clock].id, clocks[clock].name);
 
 	/* Also test some invalid clock ids */
 	test_one_clock_gettime(-1, "invalid");
@@ -381,8 +384,8 @@ static void test_clock_gettime64(void)
 		return;
 	}
 
-	for (int clock = 0; clock < ARRAY_SIZE(clocknames); clock++)
-		test_one_clock_gettime64(clock, clocknames[clock]);
+	for (int clock = 0; clock < ARRAY_SIZE(clocks); clock++)
+		test_one_clock_gettime64(clocks[clock].id, clocks[clock].name);
 
 	/* Also test some invalid clock ids */
 	test_one_clock_gettime64(-1, "invalid");

-- 
2.55.0

