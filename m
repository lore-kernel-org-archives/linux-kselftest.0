Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3927B4502F
	for <linux-kselftest@vger.kernel.org>; Mon, 13 Jul 2026 02:00:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783908058; cv=none; b=tyaSnB+h+W6Gz0vvkWDdTH9JX/9nXSoqLKlBwyAD+U8UnGRntwCR+CuNPAF5O4G5FFTVovHXVcl8XR5+UwkTwn0vtms5HhA10rf/HfFflr1SVdMUOV+6T2krHFiCUQUePoEgyxvqJJFLnN1J5mFZsyHGwbEVa7OrEhXEDwocaIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783908058; c=relaxed/simple;
	bh=NJvX4kCRFksJa0wb0RXVmH2j/5ZLTl9fmErLszuC8Ko=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=cbxGieKSpAfvokc5wIBECwHMpa+AKuhVb0GiIJcuNDXA48fJ8qFgRiKbWmMgLJ5GuDnTQfPhEjWaDdh+4CkfczvC2RSi2nhX6nMiurLNMnXNWJzocgfskJB7gu/cdShKl8VWcVJfjZQ+kv92hH0wBOtvxnQImgB/1QOLRxCnVNw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--wakel.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=KEQRsBy2; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--wakel.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="KEQRsBy2"
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-385d2703b64so3674306a91.1
        for <linux-kselftest@vger.kernel.org>; Sun, 12 Jul 2026 19:00:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1783908055; x=1784512855; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/aKXi+914ETzc5OT00HoyBu/yEdiUI+Jo2Zkp+kvf+M=;
        b=KEQRsBy2hgmfMDBWwEWlZEYvqz5sRlowjyLskqZzKT9ybGhGg2JXQ4AzbTc1oC6wqH
         ZDvnBIFCe8NNl9usuBgNFM9zpqBRVXXUwdAb2plhq9oJvNSjb6LzWGanFQ1z8X+geowJ
         B6jD/tiC8EFdLEQHrzRwndLZwrH0YmfOBylFp6DAmf4Rg5+2DTBwd5R2wDVOH4zc3J4/
         EzZQfppUC6MufEBdbgxX0YNhhwtatfstl3uQnHy0tYj1d2DHpDNQLOxO+x6AKYXRNq6/
         wlJcmQ4kTM+8Il2wyaHpZRVYFGmAfebb/JUhXErv+TZAEXSYaJd7qrPlbr/Pp6xLMBCf
         p4JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783908055; x=1784512855;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/aKXi+914ETzc5OT00HoyBu/yEdiUI+Jo2Zkp+kvf+M=;
        b=RJ/5Rgjbx77iVT5mnk6OdNZ3jBQNlM859uT4y4tRzSnNTftsXxfSdn7a+32lY+nnhz
         sOq33Iofceah6UJRyqp+Ucyy25IxDgFNKTb5RC+HAkxAK4UYFbe/rv4TtoHsFg4eBeOe
         854nfV97Zinj0HR1HmQQ6k10JRyZ7NWZi1bXQTtgwgj74TemH0KDY+R3dYJQNnG+RNxd
         R6k7lRRDxRZUKIeCBqqN5ko09gVzj6xEp6XSvskw46Xbp19UuNAsj2bL6CeYUb+qqPRi
         +uJGIoLrEL0Un2lc8RWI8Jqs/n53sldqzPBffkH6iH/hkUVVUp9iGmtjcC4R0dyQmTiA
         GoQQ==
X-Forwarded-Encrypted: i=1; AHgh+RroyzoRMgjk1tSZxrM56EOp7q+D9GC+dSO6RXi4UIcuImboSP3vjEilveGor2zNpacztRGEZSycc/yXCudjOu4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxew/DOIN2OMEiKqJi4ss0nxTCbbdzkM9niiKegrvZwN7VBvHK5
	hc6s8VPNBrPR6XaV6yVgCW5xYSNGS6K76KSoPNN8MhMugtGV+KwRZmEnkKyAcRW9vactoOXxR01
	d7w==
X-Received: from pjvd13.prod.google.com ([2002:a17:90a:d98d:b0:38d:f086:96])
 (user=wakel job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:3901:b0:37f:d265:18d2
 with SMTP id 98e67ed59e1d1-38dc81b0ec8mr5882908a91.7.1783908055110; Sun, 12
 Jul 2026 19:00:55 -0700 (PDT)
Date: Mon, 13 Jul 2026 02:00:53 +0000
In-Reply-To: <20260710025144.2000000-1-wakel@google.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260710025144.2000000-1-wakel@google.com>
X-Mailer: git-send-email 2.55.0.795.g602f6c329a-goog
Message-ID: <20260713020053.3897259-1-wakel@google.com>
Subject: [PATCH v2] selftests: timers: Make sleep time in raw_skew configurable
From: Wake Liu <wakel@google.com>
To: Anna-Maria Behnsen <anna-maria@linutronix.de>, Frederic Weisbecker <frederic@kernel.org>, 
	Thomas Gleixner <tglx@kernel.org>, John Stultz <jstultz@google.com>, Shuah Khan <shuah@kernel.org>
Cc: Stephen Boyd <sboyd@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, Wake Liu <wakel@google.com>
Content-Type: text/plain; charset="UTF-8"

The raw_skew test currently sleeps for 120 seconds to estimate clock
drift. This is a very long time for a single test, and can cause
timeouts in automated test suites or CI systems.

Allow overriding the sleep time via a command line argument,
so it can be adjusted if needed in different environments, while
keeping the default at 120 seconds to preserve original behavior.

Also add -h/--help support to document this option.

Signed-off-by: Wake Liu <wakel@google.com>
---
 tools/testing/selftests/timers/raw_skew.c | 24 +++++++++++++++++++++--
 1 file changed, 22 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/timers/raw_skew.c b/tools/testing/selftests/timers/raw_skew.c
index a7bae7d80916..5fff3eaf1307 100644
--- a/tools/testing/selftests/timers/raw_skew.c
+++ b/tools/testing/selftests/timers/raw_skew.c
@@ -27,6 +27,7 @@
 #include <time.h>
 #include <include/vdso/time64.h>
 #include "kselftest.h"
+#include <string.h>
 
 #define shift_right(x, s) ({		\
 	__typeof__(x) __x = (x);	\
@@ -87,11 +88,30 @@ void get_monotonic_and_raw(struct timespec *mon, struct timespec *raw)
 	}
 }
 
+static void usage(char *argv0)
+{
+	printf("Usage: %s [sleep_secs]\n", argv0);
+	printf("  sleep_secs: time to sleep in seconds to estimate clock drift (default: 120s)\n");
+}
+
 int main(int argc, char **argv)
 {
 	struct timespec mon, raw, start, end;
 	long long delta1, delta2, interval, eppm, ppm;
 	struct timex tx1, tx2;
+	int sleep_sec = 120;
+
+	if (argc > 1) {
+		if (strcmp(argv[1], "-h") == 0 || strcmp(argv[1], "--help") == 0) {
+			usage(argv[0]);
+			ksft_exit_pass();
+		}
+		sleep_sec = atoi(argv[1]);
+		if (sleep_sec <= 0) {
+			printf("Invalid sleep time, using default 120s\n");
+			sleep_sec = 120;
+		}
+	}
 
 	setbuf(stdout, NULL);
 
@@ -109,9 +129,9 @@ int main(int argc, char **argv)
 	if (tx1.offset)
 		printf("WARNING: ADJ_OFFSET in progress, this will cause inaccurate results\n");
 
-	printf("Estimating clock drift: ");
+	printf("Estimating clock drift (%ds): ", sleep_sec);
 	fflush(stdout);
-	sleep(120);
+	sleep(sleep_sec);
 
 	get_monotonic_and_raw(&mon, &raw);
 	end = mon;
-- 
2.55.0.795.g602f6c329a-goog

