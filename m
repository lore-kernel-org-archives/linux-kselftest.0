Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EC3D224F3
	for <linux-kselftest@vger.kernel.org>; Fri, 10 Jul 2026 02:51:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783651908; cv=none; b=Wu9TjlxVwj1Y9AUGuQ/NlAMfZkDGyVwA8mPEG7lLQOdQu66W4W20yurmzYjaC8ntlnEUIOw8oK196wmCSCwo3yBwhTA0uMVI8to+HdD5gwxeVnY5Uwj0tAyHmfypTa+XyaB7/WtC4QeV4xhLZ0DFYHu9Hd/+sFKN+Kk4DAE+nbg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783651908; c=relaxed/simple;
	bh=+U683y7R5me6dREyPy07yxUQP5UD8ZNU7r7BQeS5FOs=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=Ip0nnHrLzZGUQqOt/UgSm4w2xy9iWB937IMtbPcf7ihL6yTc7q2z+/Q8LzA3820KN1IrvKErrhdk5JzZr20T0LK+a0Z0nOBdrie9TDipIHSv4M8ZFk7J+XbyJLrSg5yDr5RxIRzJMHUKvLxFewZgucbD3M5iCHWgQDnyHBBLelg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--wakel.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=eJ1rsjqF; arc=none smtp.client-ip=209.85.214.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--wakel.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="eJ1rsjqF"
Received: by mail-pl1-f202.google.com with SMTP id d9443c01a7336-2ccafc5e82cso4365755ad.3
        for <linux-kselftest@vger.kernel.org>; Thu, 09 Jul 2026 19:51:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1783651906; x=1784256706; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BL5H+fL/wTSfQg6h+aaEmu80X+4MxC2DuWxeidn6HIU=;
        b=eJ1rsjqF20YYke03+wGD8LTBvEdqQBHZDEoEulVRQyfLNc3W4TRawb8LsrTSYp/SLO
         MeXS0gdGaz0dJQQ3CB7j/Sye0M8IKdJKHxiaNF/ZgZTIjJ1cwgMFuzwdfMrpkxhTRnfj
         7tPtIvh4Llu6G7xbVlNFffqKNDsF6fwagmoa2YqryG7+bFaywPlDCoXkk9oUaHAXupFq
         S/lxvk+dTL2fnM/oYhJsV9vu5iRXDcEZbExo1mEnKDGz3LXoF53G6Vh03CTvFL42Ubb4
         XKLDVjSsWxDRshB2WJUjENSJH4NaVctMM76IKbabP5XYbJxSQPmJCfNBbrmGe3GtIgnK
         vpoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783651906; x=1784256706;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BL5H+fL/wTSfQg6h+aaEmu80X+4MxC2DuWxeidn6HIU=;
        b=Wh3dFi1Q0qdwBxmTNOZzkM35C8CF4xotes3zFElBwnfcfXY4mX0/Ol86dHj5RmxC6M
         YgEIbqW6fyTCi1K/9hXS8D62c1mbk5kLsJGsD5AgPyeM4izv3u1Q9RFUmBmJNCH6ZirD
         Y4fPBpGoGpQrE8jjA7tMYVR8iaL2dLJuRFQ1cMJvCFwgLlTUSCTSjBn5gXurKr5Imo9n
         Exjxb9JQSOVilPeZbVYZxQUVdbmrU5e/z2YQqnVJYoIRT/Yn2wXKu1XpEQrozS03Kjqa
         w4DEoCntn0hqWWanJdCc4dNW8EyhszCJgZMgZryfHZyw5XReD3DfjKntPpyR7PMhudid
         lstw==
X-Forwarded-Encrypted: i=1; AHgh+Rq75VybPZePNT5D+KqVehtTLv+YG3xi647qk/eCsK/Rk8qkRCABqupEdHsR29BOnSN4YkqG3nDR2E+nA1l412c=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8DjbafcZK9arwgucttZAvtUlQdnAtp3QOD4UtrxKtLy95pgnD
	Af50X4dpZZFE/WXxYJtJ7HasKSKp6ALZwWUeeAQmqLZZWY1947RKB0uGt3qSjQeXfA9li6D4f83
	kGQ==
X-Received: from pjzz12.prod.google.com ([2002:a17:90b:58ec:b0:37c:5da3:8742])
 (user=wakel job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90a:e183:b0:381:25ce:bcc2
 with SMTP id 98e67ed59e1d1-3893fb6b6ebmr9232786a91.6.1783651906245; Thu, 09
 Jul 2026 19:51:46 -0700 (PDT)
Date: Fri, 10 Jul 2026 02:51:44 +0000
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.55.0.795.g602f6c329a-goog
Message-ID: <20260710025144.2000000-1-wakel@google.com>
Subject: [PATCH] selftests: timers: Make sleep time in raw_skew configurable
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

Signed-off-by: Wake Liu <wakel@google.com>
---
 tools/testing/selftests/timers/raw_skew.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/timers/raw_skew.c b/tools/testing/selftests/timers/raw_skew.c
index a7bae7d80916..03cdcecba8f4 100644
--- a/tools/testing/selftests/timers/raw_skew.c
+++ b/tools/testing/selftests/timers/raw_skew.c
@@ -92,6 +92,15 @@ int main(int argc, char **argv)
 	struct timespec mon, raw, start, end;
 	long long delta1, delta2, interval, eppm, ppm;
 	struct timex tx1, tx2;
+	int sleep_sec = 120;
+
+	if (argc > 1) {
+		sleep_sec = atoi(argv[1]);
+		if (sleep_sec <= 0) {
+			printf("Invalid sleep time, using default 120s\n");
+			sleep_sec = 120;
+		}
+	}
 
 	setbuf(stdout, NULL);
 
@@ -109,9 +118,9 @@ int main(int argc, char **argv)
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

