Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C8A3377AA9;
	Mon,  3 Aug 2026 10:04:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785751490; cv=none; b=o7UuwO0r5Ez2FTibq3Xz4NAt/lnYcC5UnRYRBxC6Ybll3IF5xhU1cIOYEueLKKo8C2LQFYxGyHGgHg2iuO0k8RmIw9YBetehevfijxelcGVhx4CHDBVO4L8KDqiu41Gs73SqClP5mtz99FHTKuZE7FUQyYZpOdkP2P5PTk3t/ac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785751490; c=relaxed/simple;
	bh=2/uqxyH8nRrSI9Tp43KO4NjA4MFqIVh4Dk3AtGbUK2g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qpjMtTgqgX3pIMytkc1DYAqPzbtWHvlZ/3gcLdNXRUr+QnuKGWlsh3OwzZE4Wdzz0GM3mmVNm4Ug+48bnVzsB9gAHEoF5hiNUyFmFQSIUrTAejsKwFSsq9uUHe8ujjtgOQj89WSVA59U8tcGMiP1ENj5+Oim4TEbFjqw7nw68rE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=DZiMNZN4; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=45LkmzdF; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="DZiMNZN4";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="45LkmzdF"
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh_=28Schneider_Electric=29?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1785751486;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ld+PasTMK75cPP06BWvC5R5pk+Vn/AN5qLyJpKdtxr0=;
	b=DZiMNZN4zwqDY4wpz5jqX5qrefWmk9uP0jRurWoVZkc632eOe2uGlC+2EhWzEswJGwBumk
	lOIaCA7IyAFBshjSmNknQ6C4M3um+lGv+5KgM0bUIRVpmCgVihZ4YxOmccOvmp/R3CVA0Y
	Mlt10XpVSc+YsXzZP9KlUQc8wfSaQd8GbvBBOFDGSrFbswmzuUzlINEz9LxI1w8TiQPc5w
	6KRUst49uWUF+K/3MaPVueNNSFpzQBlcPXY+89QZcCUfC52pKtENpo0CEKQkfEuLM7wxiw
	7hNiabSqbSxz0cazOKuoG/OAyp8yflKbWTnu/xcqwUFP6JYX/KnXIehrPcsIFw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1785751486;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ld+PasTMK75cPP06BWvC5R5pk+Vn/AN5qLyJpKdtxr0=;
	b=45LkmzdF1Wm3Xuko7EEYrdiSBOvJL+skOLSw1/rR0ntffZCr/L40L9wwz1ymwPNhsegtlB
	oG4D7lZwdvHnizBQ==
Date: Mon, 03 Aug 2026 12:04:37 +0200
Subject: [PATCH v2 06/17] selftests: add clock-helpers.h
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260803-auxclock-nanosleep-prep-v2-6-910cbd485390@linutronix.de>
References: <20260803-auxclock-nanosleep-prep-v2-0-910cbd485390@linutronix.de>
In-Reply-To: <20260803-auxclock-nanosleep-prep-v2-0-910cbd485390@linutronix.de>
To: John Stultz <jstultz@google.com>, Thomas Gleixner <tglx@kernel.org>, 
 Stephen Boyd <sboyd@kernel.org>, Miroslav Lichvar <mlichvar@redhat.com>, 
 Anna-Maria Behnsen <anna-maria@linutronix.de>, 
 Frederic Weisbecker <frederic@kernel.org>, Shuah Khan <shuah@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh_=28Schneider_Electric=29?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785751481; l=2514;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=2/uqxyH8nRrSI9Tp43KO4NjA4MFqIVh4Dk3AtGbUK2g=;
 b=lN8pcQto4RwRBI+w6EUFRoA4s4cbhfR1MJRO4Ys5x5hWRtc5Ci74Wmkuy32mWpoC/2RKTwY9M
 lVYWFK3JqwKCT5002foE2mSrTt2Bb9c5xcz4EsYKKCK2n4e/s9Bhp1g
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=

Multiple selftests duplicate various clock-related functionality.
Add a new header to collect and deduplicate those.

Signed-off-by: Thomas Weißschuh (Schneider Electric) <thomas.weissschuh@linutronix.de>
Acked-by: John Stultz <jstultz@google.com>
---
 tools/testing/selftests/clock-helpers.h | 76 +++++++++++++++++++++++++++++++++
 1 file changed, 76 insertions(+)

diff --git a/tools/testing/selftests/clock-helpers.h b/tools/testing/selftests/clock-helpers.h
new file mode 100644
index 000000000000..01451f538e71
--- /dev/null
+++ b/tools/testing/selftests/clock-helpers.h
@@ -0,0 +1,76 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+#ifndef __CLOCK_HELPERS_H
+#define __CLOCK_HELPERS_H
+
+#include <sys/types.h>
+#include <time.h>
+
+#define MSEC_PER_SEC	1000LL
+#define USEC_PER_MSEC	1000LL
+#define NSEC_PER_USEC	1000LL
+#define NSEC_PER_MSEC	1000000LL
+#define USEC_PER_SEC	1000000LL
+#define NSEC_PER_SEC	1000000000LL
+#define PSEC_PER_SEC	1000000000000LL
+#define FSEC_PER_SEC	1000000000000000LL
+
+#ifndef CLOCK_AUX
+#define CLOCK_AUX	16
+#endif
+
+#ifndef MAX_AUX_CLOCKS
+#define MAX_AUX_CLOCKS	8
+#endif
+
+#ifndef CLOCK_AUX_LAST
+#define CLOCK_AUX_LAST	(CLOCK_AUX + MAX_AUX_CLOCKS - 1)
+#endif
+
+__attribute__((unused))
+static inline const char *clock_name(clockid_t clockid)
+{
+	switch (clockid) {
+	case CLOCK_REALTIME:
+		return "CLOCK_REALTIME";
+	case CLOCK_MONOTONIC:
+		return "CLOCK_MONOTONIC";
+	case CLOCK_PROCESS_CPUTIME_ID:
+		return "CLOCK_PROCESS_CPUTIME_ID";
+	case CLOCK_THREAD_CPUTIME_ID:
+		return "CLOCK_THREAD_CPUTIME_ID";
+	case CLOCK_MONOTONIC_RAW:
+		return "CLOCK_MONOTONIC_RAW";
+	case CLOCK_REALTIME_COARSE:
+		return "CLOCK_REALTIME_COARSE";
+	case CLOCK_MONOTONIC_COARSE:
+		return "CLOCK_MONOTONIC_COARSE";
+	case CLOCK_BOOTTIME:
+		return "CLOCK_BOOTTIME";
+	case CLOCK_REALTIME_ALARM:
+		return "CLOCK_REALTIME_ALARM";
+	case CLOCK_BOOTTIME_ALARM:
+		return "CLOCK_BOOTTIME_ALARM";
+	case CLOCK_TAI:
+		return "CLOCK_TAI";
+	case CLOCK_AUX + 0:
+		return "CLOCK_AUX0";
+	case CLOCK_AUX + 1:
+		return "CLOCK_AUX1";
+	case CLOCK_AUX + 2:
+		return "CLOCK_AUX2";
+	case CLOCK_AUX + 3:
+		return "CLOCK_AUX3";
+	case CLOCK_AUX + 4:
+		return "CLOCK_AUX4";
+	case CLOCK_AUX + 5:
+		return "CLOCK_AUX5";
+	case CLOCK_AUX + 6:
+		return "CLOCK_AUX6";
+	case CLOCK_AUX + 7:
+		return "CLOCK_AUX7";
+	};
+	return "UNKNOWN_CLOCKID";
+}
+
+#endif /* __CLOCK_HELPERS_H */

-- 
2.55.0

