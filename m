Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0639E3793B0;
	Mon,  3 Aug 2026 10:04:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785751491; cv=none; b=JAuUJK8qJoZbxzBn/lHI/TaFa2uzknxC3FDmghfr3/Nc9RMPDGe5WsQjqrsdHpcdz68odRiqWZ03SWoZ7VhKLw2Ru2PQpSKtLSd3smdXsaHAtCbbJmcKUZYs915v6ReHRXfTP6meH/mkUDhq4dRIm72E6UewrrzZAb6szNiSc7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785751491; c=relaxed/simple;
	bh=b4Cuc09021hPuVXymmV95o2SqTAB5jJqnUVwvaXXmjU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qAAD4b8UFyhH4LdiWZ3LOjNlIVSPdpkcKKJs9x+B5OIdX3p6KwiB/ArI9fRJiOhDBUSsHxj46JUt8ZC2x10wKAhF0Q1Otu71rieba+SYYTJZ8FokD5SqhtLfxfQPnF8rCNwfQ6tNerLvkJ3n+Rbzb+6s/b9nnK+TLWAASNEbjp8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=osbE+b55; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=zZcthxHe; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="osbE+b55";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="zZcthxHe"
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh_=28Schneider_Electric=29?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1785751487;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RjFqtAmubbq/fczYkMx5lmf68yK9hq9E3ME+XfsAD4c=;
	b=osbE+b55s27woqIV2P6R80qUPSmjcweZeGZtBNFKQjdMiyPWcakY7XTP+L6i3v1o7EeOP+
	grhkerOpsuxrl3rW03dMPkddEyY1gWJaIldquXBO2g5A//i8ZVBmZkFY1FjK54nfe7Lhcp
	Eh00jU0f+aI0jEw0A8n+F2+EiInqwDIrYFTkNAy/EWN3JojJaaM+eeqpM1fPtkpm4mRT8R
	DOJMBeQvUriZxw2pd9dK1LFi48tsml+2U7LcQ2FvgT6kGL1etxTKKQ/Ujt5Do3aTotihAb
	rfwg4BJTxq5mGOrGHAU9nQohHCBEoPH8sJ7RK6RGVNBnZjtPoqoK52/crrq+xw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1785751487;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RjFqtAmubbq/fczYkMx5lmf68yK9hq9E3ME+XfsAD4c=;
	b=zZcthxHeLok+JcddMgZ2np236glz2YHJtrVExuJ5//kdm3MoLx0Ei11LdfR6B9VMn27USv
	S1+0t/EtJXqsFwBg==
Date: Mon, 03 Aug 2026 12:04:40 +0200
Subject: [PATCH v2 09/17] selftests: timers: nanosleep: Explicitly list the
 tested clocks
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260803-auxclock-nanosleep-prep-v2-9-910cbd485390@linutronix.de>
References: <20260803-auxclock-nanosleep-prep-v2-0-910cbd485390@linutronix.de>
In-Reply-To: <20260803-auxclock-nanosleep-prep-v2-0-910cbd485390@linutronix.de>
To: John Stultz <jstultz@google.com>, Thomas Gleixner <tglx@kernel.org>, 
 Stephen Boyd <sboyd@kernel.org>, Miroslav Lichvar <mlichvar@redhat.com>, 
 Anna-Maria Behnsen <anna-maria@linutronix.de>, 
 Frederic Weisbecker <frederic@kernel.org>, Shuah Khan <shuah@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh_=28Schneider_Electric=29?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785751481; l=2226;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=b4Cuc09021hPuVXymmV95o2SqTAB5jJqnUVwvaXXmjU=;
 b=s775VFXFlHQybLXC/tpdrr8gAQXJLO9ohANRNpu4TP+gwifFL75hhwECLfv19KewtM3tcd7y8
 Z13Q8oGSy6QB7amUkx2jmeQrD2n7pd6YGzT4r8DTHpH1PExQ9UwgcK1
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

