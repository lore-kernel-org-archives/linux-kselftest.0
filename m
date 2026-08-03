Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50674385D67;
	Mon,  3 Aug 2026 10:04:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785751495; cv=none; b=ECV54gdoZ62mRaae1U7ldhMbJImND6ifet5h7HWWLhC3hxLgCZsYfJHA809pfB5VgD1I7cxrRic7x2mD2Ibhl8ILQpuQnDCGQPMvtX+b2oiBk3zxPahkGHxrIPga+T7UY2Qy/EH4a3FJcbjfzlKcDMaWXxfA7oBrxQDdyDFxOH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785751495; c=relaxed/simple;
	bh=h+2lQiqO/NRAxL8WSKif4LkJFiy7JSahqsxhWLQVyPk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CcJgZsECE1YkxbT1BzrYygqGFCMigA/l/wzZQagmWxyUH2jgCRtui1MjM3u8XBVx3W0MMSeGotzTNUk9PtkfygocbMTuJRxCxpk0CwKB0s9a7ruVdnHe2A9ACV+jERmciX6gmh9mRNZ6wfnotyDF7YBtNqiCMG2JKrH3VS3caiY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=ISHDrN9v; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=BzPxfC+e; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="ISHDrN9v";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="BzPxfC+e"
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh_=28Schneider_Electric=29?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1785751491;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LBlp3AZJMcGpKgu/Bpbq6rKg4no43YHiR5Qw5u7fpKE=;
	b=ISHDrN9vso9kBotGVgNcSDqc8MgPg68KtRlmhPRnN8zSRku+PRuqDQ9W/XEfvyxzf4NYXM
	rV2pJ7WhteIRdLZHy/QfkCxPR7Jdnetsmsy/vSyd/6Q38qJoi9cc3cRNd6sPfGVi3YkSz/
	lWB1ZXfetsmpQAxtcox+i3ynQQvIvRKmh3hJLqn6NEUrLc+11dGqvxTwOPGL3Y+dm68FJn
	GxHH4ip69YFja3sPzO8WGFFRbqm+2ItJVvj8rVe/OWUt4fxvniI7Y5xDktK2PCzfvwiyx9
	0KoQ3bn7J8hGriHFadCfCg5vzgHBDTJLVJLveAxyNNkTEqae0MabRS35PxBjZg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1785751491;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LBlp3AZJMcGpKgu/Bpbq6rKg4no43YHiR5Qw5u7fpKE=;
	b=BzPxfC+eLRjPOAlt38Vvpt6uZB2tIHP93CB9W7Ph6mMHAyW6tji8pUgbn8RNKVS6p3M/16
	82YI40/qhj0E/OBA==
Date: Mon, 03 Aug 2026 12:04:48 +0200
Subject: [PATCH v2 17/17] selftests: timers: nsleep-lat: Check all calls to
 clock_nanosleep() and clock_gettime()
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260803-auxclock-nanosleep-prep-v2-17-910cbd485390@linutronix.de>
References: <20260803-auxclock-nanosleep-prep-v2-0-910cbd485390@linutronix.de>
In-Reply-To: <20260803-auxclock-nanosleep-prep-v2-0-910cbd485390@linutronix.de>
To: John Stultz <jstultz@google.com>, Thomas Gleixner <tglx@kernel.org>, 
 Stephen Boyd <sboyd@kernel.org>, Miroslav Lichvar <mlichvar@redhat.com>, 
 Anna-Maria Behnsen <anna-maria@linutronix.de>, 
 Frederic Weisbecker <frederic@kernel.org>, Shuah Khan <shuah@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh_=28Schneider_Electric=29?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785751481; l=1965;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=h+2lQiqO/NRAxL8WSKif4LkJFiy7JSahqsxhWLQVyPk=;
 b=7CBEpuH84JdVE5JnBPaKcbpxYE9ROm6YbaTYvtlEdNiLmVfDFvLkyCVrCewnvchKyA/yYrbnO
 b5EtLviINUSDB38PNJdaKTqAV8juga99NbAcjvLTxgT/wej7l5FQWra
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=

Both these functions can fail.

The first calls to those functions are already checked and result in
KSFT_SKIP.

If they start failing afterwards unexpectedly, report a hard error.

Signed-off-by: Thomas Weißschuh (Schneider Electric) <thomas.weissschuh@linutronix.de>
Acked-by: John Stultz <jstultz@google.com>
---
 tools/testing/selftests/timers/nsleep-lat.c | 23 ++++++++++++++++-------
 1 file changed, 16 insertions(+), 7 deletions(-)

diff --git a/tools/testing/selftests/timers/nsleep-lat.c b/tools/testing/selftests/timers/nsleep-lat.c
index 266ca0cc37ec..5de0051ac8e3 100644
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

