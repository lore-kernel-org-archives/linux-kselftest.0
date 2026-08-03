Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40E1E3859F0;
	Mon,  3 Aug 2026 10:04:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785751495; cv=none; b=qZY3NhIEu5TKwe0kQA8JIcVe6kpdxg5YTXhR0bitFzzv7US8ETlvQHbjIOGARnxtnFwAH6QLEkE7fMIn1QDZ23LTaNOO2/KsFHwSSM6qOFaL0sY5lKKMGOhAkEFWh0sS6XMxrdgtBXfalPlxgyNF6z2jf11vmiD9hgP9+FHeRE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785751495; c=relaxed/simple;
	bh=KBuR27FmiAit9MkMPsuSedgOvHjxdUwveXX1XWHfNTM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=p7glw0uSa6Xi+MKuTPJCPxr/7tr3cj8L+fBxiKoau386By6+2cNw5xLpSmhNSLipMKd9w+dTPo0iZDK5IBvOQYb0DO2YCrRCdjtBFC0QAXblC2g6eAI1hWsg/X9IdtPrVZHLp6h7WwnZV2Os4HkYwK8dsC5CyX4f5EBkHHgW42Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=m9AZr0Kv; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=FmM8r1Sp; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="m9AZr0Kv";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="FmM8r1Sp"
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh_=28Schneider_Electric=29?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1785751491;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=22eg8S4Bhv40LKAFTgzCrRXIhahwNXX/6FUVy3/T6aI=;
	b=m9AZr0KvGqlTOhj2vXDoBJbyWwXdWzO+O0EBTPpJBnhUQtruzLnxo2aA2wgcjwbAkBlSYu
	72EZpwAEzuqZHjGI0H5vGAby6JwDK4wgiynWRRcd7y2XMM/4lyoSBttGtBKY0PuynSXNOz
	C2FkIxq2RoQAjLoQDP2ucCb2UkYTnU0OYQ15G1vDK1/a+EkMAUxGSmHlV3zHUGUzf0dNmj
	MSV1kmurgArnTS3tv/prijnpZLoO+n6q76avAKiM78/6K/B089D4hySt2hOnkvgNuuXXao
	JR+b5XbEO7+eVomj6BDTSL6tMATRlXn+4EEwnlRvjhim/OY+WPqZ/Ge25vwxBA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1785751491;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=22eg8S4Bhv40LKAFTgzCrRXIhahwNXX/6FUVy3/T6aI=;
	b=FmM8r1SpE16jvH1bESZt3W8vtywruJHa5v9Kdr5QxAzON7ww3vSyZ1vhtjLJR/A7vnoCom
	9pruIpdlNFq5V7Cg==
Date: Mon, 03 Aug 2026 12:04:47 +0200
Subject: [PATCH v2 16/17] selftests: timers: nsleep-lat: Reuse kselftest
 error numbers
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260803-auxclock-nanosleep-prep-v2-16-910cbd485390@linutronix.de>
References: <20260803-auxclock-nanosleep-prep-v2-0-910cbd485390@linutronix.de>
In-Reply-To: <20260803-auxclock-nanosleep-prep-v2-0-910cbd485390@linutronix.de>
To: John Stultz <jstultz@google.com>, Thomas Gleixner <tglx@kernel.org>, 
 Stephen Boyd <sboyd@kernel.org>, Miroslav Lichvar <mlichvar@redhat.com>, 
 Anna-Maria Behnsen <anna-maria@linutronix.de>, 
 Frederic Weisbecker <frederic@kernel.org>, Shuah Khan <shuah@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh_=28Schneider_Electric=29?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785751481; l=2191;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=KBuR27FmiAit9MkMPsuSedgOvHjxdUwveXX1XWHfNTM=;
 b=Xt8+nQHWLDeygz4NxKsbbKajXABW+zLtIBjoGbMRH5lQ15S08w/xbDZvyeFk+Qh+VTmULsAWD
 n/35aKMq3BZAbhuGBQE1t80qSCplI5zWTl4CexKPgwKYfgrNfJAPM+J
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=

The test currently defines its own custom error numbers.
These mirror the semantics from the standard KFST_* constants.

To make the code easier to read, use the standard result constants.

Signed-off-by: Thomas Weißschuh (Schneider Electric) <thomas.weissschuh@linutronix.de>
Acked-by: John Stultz <jstultz@google.com>
---
 tools/testing/selftests/timers/nsleep-lat.c | 19 ++++++-------------
 1 file changed, 6 insertions(+), 13 deletions(-)

diff --git a/tools/testing/selftests/timers/nsleep-lat.c b/tools/testing/selftests/timers/nsleep-lat.c
index af47c28f086b..266ca0cc37ec 100644
--- a/tools/testing/selftests/timers/nsleep-lat.c
+++ b/tools/testing/selftests/timers/nsleep-lat.c
@@ -29,8 +29,6 @@
 
 #define UNRESONABLE_LATENCY (40 * NSEC_PER_MSEC)
 
-#define UNSUPPORTED 0xf00f
-
 struct timespec timespec_add(struct timespec ts, unsigned long long ns)
 {
 	ts.tv_nsec += ns;
@@ -60,9 +58,9 @@ int nanosleep_lat_test(int clockid, long long ns)
 	target.tv_nsec = ns%NSEC_PER_SEC;
 
 	if (clock_gettime(clockid, &start))
-		return UNSUPPORTED;
+		return KSFT_SKIP;
 	if (clock_nanosleep(clockid, 0, &target, NULL))
-		return UNSUPPORTED;
+		return KSFT_SKIP;
 
 	count = 10;
 
@@ -74,7 +72,7 @@ int nanosleep_lat_test(int clockid, long long ns)
 
 	if (((timespec_sub(start, end)/count)-ns) > UNRESONABLE_LATENCY) {
 		ksft_print_msg("Large rel latency: %lld ns :", (timespec_sub(start, end)/count)-ns);
-		return -1;
+		return KSFT_FAIL;
 	}
 
 	/* Next check absolute latency */
@@ -88,10 +86,10 @@ int nanosleep_lat_test(int clockid, long long ns)
 
 	if (latency/count > UNRESONABLE_LATENCY) {
 		ksft_print_msg("Large abs latency: %lld ns :", latency/count);
-		return -1;
+		return KSFT_FAIL;
 	}
 
-	return 0;
+	return KSFT_PASS;
 }
 
 int main(int argc, char **argv)
@@ -123,12 +121,7 @@ int main(int argc, char **argv)
 
 		}
 
-		if (ret == UNSUPPORTED) {
-			ksft_test_result_skip("%s\n", clock_name(clockid));
-		} else {
-			ksft_test_result(ret >= 0, "%s\n",
-					 clock_name(clockid));
-		}
+		ksft_test_result_report(ret, "%s\n", clock_name(clockid));
 	}
 
 	ksft_finished();

-- 
2.55.0

