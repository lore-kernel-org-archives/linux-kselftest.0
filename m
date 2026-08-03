Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68922382381;
	Mon,  3 Aug 2026 10:04:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785751494; cv=none; b=YowILsr1aX0iizCyLZYoR64uz19TSkJdRiMh3+adixAXsWSGXXR/O/GrsOtFOlnMXnj+hkdtuSWUc6vB70JT4VEdnAtnEBQS/VrODT/85MQ3IFRZ/1ESbLtZSR9by7MCsetu2jwCMMog24R/vkyIKkYJQQ7kgxtDp47wtHFOIak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785751494; c=relaxed/simple;
	bh=/uZikIFgs6G+Ur7FXAj0rbE4zBonV1d+zbh5dxz+nuo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kPN7q0Mkz4dPXC0XoPFrsIO0v/UcyyH/l+9csWBN11SlBufqNEGEPh0XpKxERQGRXW8wgl2ItdhpNko92JiSHLyfKKLPc9kG6klOeepvkpm9GmqaRHCtmfY4ZYWp1C4i41iCCt086WujTTgND2Zfh/VGv7PW0oCsyJqOQOxdAdM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=trsDQHKK; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=Ry4Sd9Rd; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="trsDQHKK";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="Ry4Sd9Rd"
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh_=28Schneider_Electric=29?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1785751490;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HK5JqakUosO54E2iwBY4d5EW3C/jO9SYvzU7WpNRO8g=;
	b=trsDQHKK7fKdeEMfgn8vxPWVi2MW3a3AbDu56sPeEppsz0phkwhpo2vjgzfA2yKyniSUmC
	Jt4za/FeUIZlf46Fy+roYQ7awDjz7NIJpZOVY0LLqP8xxn81dDidx/+ptmJZQyZHHiCzFp
	sE6hqvWQHJiwwPBkpR6Nt+aehgRdZueChdYQGfKWtWtVw1kpzsfg/gypY+5TcUxMTLE/30
	1FCF5MZdXjklctwcGZz69aUNELLviktwNcbhKBDqlnl9eN0r5g6jo8g7llOgEf92aH32bE
	R8Ox9WcwcKeNBST6MS06sYIk/+FTxG+7EaM6W0SjZYDBjw70zGcsx2QrJrLYHg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1785751490;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HK5JqakUosO54E2iwBY4d5EW3C/jO9SYvzU7WpNRO8g=;
	b=Ry4Sd9RdLKWWcG1NUUTU/HEjHLm4MjJ9OqqySC8pF2dHDHPcHQW5EYbU/0xLx6gyv5A43Z
	E39evQOtUAsPTwCQ==
Date: Mon, 03 Aug 2026 12:04:46 +0200
Subject: [PATCH v2 15/17] selftests: timers: nsleep-lat: Explicitly list
 the tested clocks
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260803-auxclock-nanosleep-prep-v2-15-910cbd485390@linutronix.de>
References: <20260803-auxclock-nanosleep-prep-v2-0-910cbd485390@linutronix.de>
In-Reply-To: <20260803-auxclock-nanosleep-prep-v2-0-910cbd485390@linutronix.de>
To: John Stultz <jstultz@google.com>, Thomas Gleixner <tglx@kernel.org>, 
 Stephen Boyd <sboyd@kernel.org>, Miroslav Lichvar <mlichvar@redhat.com>, 
 Anna-Maria Behnsen <anna-maria@linutronix.de>, 
 Frederic Weisbecker <frederic@kernel.org>, Shuah Khan <shuah@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh_=28Schneider_Electric=29?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785751481; l=2381;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=/uZikIFgs6G+Ur7FXAj0rbE4zBonV1d+zbh5dxz+nuo=;
 b=R32mbYPcltTBB8IYrNareiDSUcFFrOxEDqsXJ73tR0n+gmTAkxzok+eb9x0YI+KbRbgQiSljA
 6zCUOxHuoy3DsUzg59omxGlDp3tGf76kq26Snsew/iVM21QQzTPDOaa
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=

The test relies on the numeric values of the clockids.
As not all clocks are meant to be tested, this requires skipping some
clocks unconditionally, cluttering the result.

Use an equivalent, explicit list instead.

In addition to CLOCK_PROCESS_CPUTIME_ID, CLOCK_THREAD_CPUTIME_ID and
CLOCK_HWSPECIFIC which were unconditionally skipped before, this also
unconditionally skips CLOCK_MONOTONIC_RAW, CLOCK_MONOTONIC_COARSE and
CLOCK_REALTIME_COARSE. clock_nanosleep() is not supported for those.

Signed-off-by: Thomas Weißschuh (Schneider Electric) <thomas.weissschuh@linutronix.de>
Acked-by: John Stultz <jstultz@google.com>
---
 tools/testing/selftests/timers/nsleep-lat.c | 26 ++++++++++++--------------
 1 file changed, 12 insertions(+), 14 deletions(-)

diff --git a/tools/testing/selftests/timers/nsleep-lat.c b/tools/testing/selftests/timers/nsleep-lat.c
index d46f17404439..af47c28f086b 100644
--- a/tools/testing/selftests/timers/nsleep-lat.c
+++ b/tools/testing/selftests/timers/nsleep-lat.c
@@ -29,9 +29,6 @@
 
 #define UNRESONABLE_LATENCY (40 * NSEC_PER_MSEC)
 
-/* CLOCK_HWSPECIFIC == CLOCK_SGI_CYCLE (Deprecated) */
-#define CLOCK_HWSPECIFIC		10
-
 #define UNSUPPORTED 0xf00f
 
 struct timespec timespec_add(struct timespec ts, unsigned long long ns)
@@ -97,24 +94,25 @@ int nanosleep_lat_test(int clockid, long long ns)
 	return 0;
 }
 
-#define SKIPPED_CLOCK_COUNT 3
-
 int main(int argc, char **argv)
 {
 	long long length;
 	int clockid, ret;
-	int max_clocks = CLOCK_TAI + 1;
 
-	ksft_print_header();
-	ksft_set_plan(max_clocks - CLOCK_REALTIME - SKIPPED_CLOCK_COUNT);
+	static const clockid_t tested_clocks[] = {
+		CLOCK_REALTIME,
+		CLOCK_MONOTONIC,
+		CLOCK_BOOTTIME,
+		CLOCK_BOOTTIME_ALARM,
+		CLOCK_REALTIME_ALARM,
+		CLOCK_TAI,
+	};
 
-	for (clockid = CLOCK_REALTIME; clockid < max_clocks; clockid++) {
+	ksft_print_header();
+	ksft_set_plan(ARRAY_SIZE(tested_clocks));
 
-		/* Skip cputime clockids since nanosleep won't increment cputime */
-		if (clockid == CLOCK_PROCESS_CPUTIME_ID ||
-				clockid == CLOCK_THREAD_CPUTIME_ID ||
-				clockid == CLOCK_HWSPECIFIC)
-			continue;
+	for (size_t clock_index = 0; clock_index < ARRAY_SIZE(tested_clocks); clock_index++) {
+		clockid = tested_clocks[clock_index];
 
 		length = 10;
 		while (length <= (NSEC_PER_SEC * 10)) {

-- 
2.55.0

