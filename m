Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7F7E3B2FD9;
	Thu, 30 Jul 2026 06:47:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785394078; cv=none; b=fCqpKXpGPNDKCqVoCoQM2PEdhdcEcKSXduK1YI/MDc9HKFG8gJAWddaZSW1DMmfgt4eDiI6bl3NVZAUgBrWGw17MXDu7MHbSfvBAFDAg22YThgH683LrIYuXzHwxrdaniry7a2tQyNos4i7HgXZP9RlJFODDWH4z5kqzHhJF1vU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785394078; c=relaxed/simple;
	bh=6oeT8znk9F9ogTc0GQ4VgRaaB3Qm3nGKerdzrVtSr38=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CHCGwplynHpCgyK8W9TfZs5Xvye2tfLLSf0ROC8mwCxkhJztYkxFn7XSUTG9g2XW66SpPUcbX5XLtmrKBPJwczMBy9XYM9lBrur70arHL0hOsyzafxbryNJcNhSil/wyyi/5lFCKN2uGp3b5JCuzPFaDPiw4ZPFwzObiEKRgUWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=xZYHeexw; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=/5PwDrbh; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="xZYHeexw";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="/5PwDrbh"
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh_=28Schneider_Electric=29?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1785394070;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SLFz4MUm3z9Rq1dGX34psnh2x32SDJHTKNPeOVfXn5g=;
	b=xZYHeexwLS+NZob2oonrht/JKenVadje5Dt+d/fO+8+/Y08ftGDx2rMUbjmxCLFa3yt2c2
	Zl29jb6ywkdsO6C6gW7+BtkdXBfYZyzEmobnrmzLlG+K6cXOmI4w60X8bCmFNDdRRmN9jx
	LlX+GR/uG1h1YDs7UHd1sHDIWLQmF63LeymKxF359bcZvc3TqtKtm4Jh3qsm5W1geOJJGx
	REFMwqzUFVz4sa0ny/6aoZaVrqG5Ofwo5BWOMkWyzX1zL+8pAWQ1ZLGUyFDtqCqBkmIvJY
	0HvzqrZLEU0jFE+xp/Ct8UlLj9riAvjjTQdaOJzFajFwbF1aTd+p5uoUJdIfmA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1785394070;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SLFz4MUm3z9Rq1dGX34psnh2x32SDJHTKNPeOVfXn5g=;
	b=/5PwDrbhs3jo1u5cW1urQtYX5FSkPKKPPi+gObMIvjxW5+DyMQEDZcytImnGzXiNjD5MTY
	WHW29KRfvpPII1Ag==
Date: Thu, 30 Jul 2026 08:47:46 +0200
Subject: [PATCH 09/16] selftests: timers: nanosleep: Explicitly list the
 tested clocks
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260730-auxclock-nanosleep-prep-v1-9-cd8b61229a7c@linutronix.de>
References: <20260730-auxclock-nanosleep-prep-v1-0-cd8b61229a7c@linutronix.de>
In-Reply-To: <20260730-auxclock-nanosleep-prep-v1-0-cd8b61229a7c@linutronix.de>
To: John Stultz <jstultz@google.com>, Thomas Gleixner <tglx@kernel.org>, 
 Stephen Boyd <sboyd@kernel.org>, Miroslav Lichvar <mlichvar@redhat.com>, 
 Anna-Maria Behnsen <anna-maria@linutronix.de>, 
 Frederic Weisbecker <frederic@kernel.org>, Shuah Khan <shuah@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh_=28Schneider_Electric=29?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785394062; l=1898;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=6oeT8znk9F9ogTc0GQ4VgRaaB3Qm3nGKerdzrVtSr38=;
 b=lhcRThjAcCW1e6u4kf0+PMCkrhx4L+S4EDOrvPw2gEr7wTRujSoyCsnRe8VK+hiwruecrjB+u
 ZH0+x/v2JnmCI6GHcWv51h9Z2NQRFL8n6xzd1KoVfq7oEt741GSxJk0
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=

The test relies on the numeric values of the clockids.
As not all clocks are meant to be tested, this requires skipping some
clocks unconditionally, cluttering the result.

Use an equivalent, explicit list instead.

Signed-off-by: Thomas Weißschuh (Schneider Electric) <thomas.weissschuh@linutronix.de>
---
 tools/testing/selftests/timers/nanosleep.c | 26 ++++++++++++--------------
 1 file changed, 12 insertions(+), 14 deletions(-)

diff --git a/tools/testing/selftests/timers/nanosleep.c b/tools/testing/selftests/timers/nanosleep.c
index 629e800135ad..9dd662226261 100644
--- a/tools/testing/selftests/timers/nanosleep.c
+++ b/tools/testing/selftests/timers/nanosleep.c
@@ -30,9 +30,6 @@
 #include "clock-helpers.h"
 #include "kselftest.h"
 
-/* CLOCK_HWSPECIFIC == CLOCK_SGI_CYCLE (Deprecated) */
-#define CLOCK_HWSPECIFIC		10
-
 #define UNSUPPORTED 0xf00f
 
 /* returns 1 if a <= b, 0 otherwise */
@@ -141,20 +138,21 @@ int main(int argc, char **argv)
 {
 	long long length;
 	int clockid, ret;
-	int max_clocks = CLOCK_TAI + 1;
 
-	ksft_print_header();
-	ksft_set_plan(max_clocks);
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
-				clockid == CLOCK_HWSPECIFIC) {
-			ksft_test_result_skip("%s\n", clock_name(clockid));
-			continue;
-		}
+	for (size_t clock_index = 0; clock_index < ARRAY_SIZE(tested_clocks); clock_index++) {
+		clockid = tested_clocks[clock_index];
 
 		fflush(stdout);
 

-- 
2.55.0

