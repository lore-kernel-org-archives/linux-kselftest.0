Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BDDA3AC0E5;
	Thu, 30 Jul 2026 06:47:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785394081; cv=none; b=rrFztzf93uXfNxaAtLgXacOo+SVFsUkUnvazdur9JEcond/ps4I3oZ2PYWBJOHsAanN9nR5rh5UZ8STlzgfvUOcvQ39kk6xAHINq/ReDRLJNdfq+Vj1Kpkt1FtB8YkVaSxuvmGak242lWCgue7HH8pCeGd7E0GPz+s4JdS1NV04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785394081; c=relaxed/simple;
	bh=F8fMJpEpFCXwINgbk0+Rfly2Hit+tF2mUCBvtk7KxxI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ju1dpFu16uscQ6qhn6+1KOMlKh6jZf4zX44IDKFQo+2JvcoAdGwYh70DC+5/0Ii67SM/0iJ3onQ6mWFXYbaea4tz9400naLNxGflMibkCzFt3MTI1LLyu0GsRs5Qf1i5eRrE1PRNdcauHPuXYUnEwD89meYK2cxJKg+/Om/1cbk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=YsL4nVFS; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=1ghFl6Dh; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="YsL4nVFS";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="1ghFl6Dh"
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh_=28Schneider_Electric=29?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1785394068;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RuS7sQiHKDFeghnr35yMBbiCshO6S8KwZARLvu+Zf/8=;
	b=YsL4nVFS9DW0y5ecCl8TG2WmKzp0BunDeCkoz7Bo8pnPN8PUijLmokNi8SiB1jMBqgQvKc
	YDAWid4Wkxj6nld8iigPe/4gpbymSAmd8YgL6Deh38MFUYoyrQj8Ib6VbIVfKnx29ZJ8SS
	mO9/SANR+wP6OM6xfR0ZdLzuiCx9FStxE9dDfvT8ZA/lYB9083H0ucHYVyL4NVisUcO34E
	Ap7EZHHCM+Zu3UoNzSG12wiHjwATvxqGlULfwtkBEk1nI0Q34usv00CkWD9ml0iPls9DXY
	kqE8QUdqcA1RuDxUtipB8aUAxff6TtaFlpDt1tkHBjN3AQlRKgS5TYaHlfksig==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1785394068;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RuS7sQiHKDFeghnr35yMBbiCshO6S8KwZARLvu+Zf/8=;
	b=1ghFl6DhZcy5mxYUHMOkktXCrCIJAavpzE+0meo+JklOFIGaqpUaGpq07VtH/+LEN/Q6LM
	xguUGpZHhQuxvBCw==
Date: Thu, 30 Jul 2026 08:47:43 +0200
Subject: [PATCH 06/16] selftests: add clock-helpers.h
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260730-auxclock-nanosleep-prep-v1-6-cd8b61229a7c@linutronix.de>
References: <20260730-auxclock-nanosleep-prep-v1-0-cd8b61229a7c@linutronix.de>
In-Reply-To: <20260730-auxclock-nanosleep-prep-v1-0-cd8b61229a7c@linutronix.de>
To: John Stultz <jstultz@google.com>, Thomas Gleixner <tglx@kernel.org>, 
 Stephen Boyd <sboyd@kernel.org>, Miroslav Lichvar <mlichvar@redhat.com>, 
 Anna-Maria Behnsen <anna-maria@linutronix.de>, 
 Frederic Weisbecker <frederic@kernel.org>, Shuah Khan <shuah@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh_=28Schneider_Electric=29?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785394062; l=2470;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=F8fMJpEpFCXwINgbk0+Rfly2Hit+tF2mUCBvtk7KxxI=;
 b=lwi9AwGVbJxod3DZthyb+cyjjPv6NqhvNJNMfnVwNJW80lWutQLVK7V8VCJ82QW+IRtvvf95G
 wkt4omxwwsgDWHurrplK7XGK87NzLyFhKaSYsrZOP1ScwhCDiLKBD1Z
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=

Multiple selftests duplicate various clock-related functionality.
Add a new header to collect and deduplicate those.

Signed-off-by: Thomas Weißschuh (Schneider Electric) <thomas.weissschuh@linutronix.de>
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

