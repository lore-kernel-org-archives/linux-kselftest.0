Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85CF2372ED5;
	Mon,  3 Aug 2026 10:04:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785751494; cv=none; b=ktGWL59yUGNuG6KLXQXVgCVbsxSfR5rVfsDzVXcr87fbjBTQzMBzOZVN7r9vF07csEh0bwnQD/VbhoIaWwaJd2ks/zZHlpWHNCzGeXwaeahoCKJgP1cEzhtG8L5GnWHMnXKzc3PMlFOvNX1v3DD1Fqccc+afsJsWvu1D59isbRc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785751494; c=relaxed/simple;
	bh=mHUW1pQQuH1WhZUbEwvFYiq4Z3Yezbz0gHQ6QiGH/9Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ReFA9vmPIlF9wcv6KZUk967HJtDtES2J6IvVk1MN/8zUEwjFp4G6nBO5g6SabPVZdYqvvrA7RZmQ1RvpCZWG9E/LFDFhy3dhTkHRI0HqJYcjYvYG3dABAQzVmJEY5qMcckSSLoxcvPKe3uT18dHqM1I4zCGs9wTNSr6McWRKIQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=3cftf9aZ; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=bZD2P/xJ; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="3cftf9aZ";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="bZD2P/xJ"
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh_=28Schneider_Electric=29?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1785751489;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1s3IbOUHyW0Oo7Tx26hOyZeC0qSi7z+B2dI3YWVmfkQ=;
	b=3cftf9aZKWfBiSgBKG0DceYJnlh2/uF4o8Q2IYR1ozQivHiK8W6i4c0YCPYSu4NrQD04uS
	ZAcxyTSVW4JMv0KR0jptWHqHr+wN0mZQ6C1x/OrVjN/ko9OEsYBDC+039U9CErUQdKFM65
	klJn2yUsjG4tgHZB3aCoCoZEF0ZEfsthlhG0yIc4Zm2pUo/KQp061OtOvE46WoZE3aUvh5
	p/Y+tSsK93x2aJf8OEHV2Kf8NJgTMkNvaTbqAs/28Yi5EPG3nz7EVHuLQZqpbpzOFrodh0
	FBxhGrO/hOfGh1BkEW8A4x3j4idKZXhoAhSdrs2rlAP5vMhI1F2/eh9+KuPczw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1785751489;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1s3IbOUHyW0Oo7Tx26hOyZeC0qSi7z+B2dI3YWVmfkQ=;
	b=bZD2P/xJ5y9YfsidO0QMI1fcjsBmWvTpyJZamHcqTmf1QLVIUk3FHFG+LdkwrPUN/j5r0n
	YwMx2/w39idq08Cw==
Date: Mon, 03 Aug 2026 12:04:44 +0200
Subject: [PATCH v2 13/17] selftests: timers: nanosleep: Report each test
 separately
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260803-auxclock-nanosleep-prep-v2-13-910cbd485390@linutronix.de>
References: <20260803-auxclock-nanosleep-prep-v2-0-910cbd485390@linutronix.de>
In-Reply-To: <20260803-auxclock-nanosleep-prep-v2-0-910cbd485390@linutronix.de>
To: John Stultz <jstultz@google.com>, Thomas Gleixner <tglx@kernel.org>, 
 Stephen Boyd <sboyd@kernel.org>, Miroslav Lichvar <mlichvar@redhat.com>, 
 Anna-Maria Behnsen <anna-maria@linutronix.de>, 
 Frederic Weisbecker <frederic@kernel.org>, Shuah Khan <shuah@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh_=28Schneider_Electric=29?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785751481; l=2273;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=mHUW1pQQuH1WhZUbEwvFYiq4Z3Yezbz0gHQ6QiGH/9Q=;
 b=VTcygLFjAPEoADwn/7VhRK4fCuQ0bIhhuKv5KIM0bj8TUY4X5NtAvV9DTfl6q8tqOlAjdDoYP
 5nmXItZTivMBS6bWpaE2eDpxP43p7WOQCY/+62DVz9Lolr67QnvIdEo
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=

Currently the test for the sleep functionality itself and the one for
the remaining time are reported together. This makes the test output a
bit confusing, especially as the upcoming tests for auxiliary clocks
will have different results between the two parts.

Report each test part on its own.

This also allows continuing testing other clocks after a single one
has failed.

Signed-off-by: Thomas Weißschuh (Schneider Electric) <thomas.weissschuh@linutronix.de>
---
 tools/testing/selftests/timers/nanosleep.c | 21 ++++++++-------------
 1 file changed, 8 insertions(+), 13 deletions(-)

diff --git a/tools/testing/selftests/timers/nanosleep.c b/tools/testing/selftests/timers/nanosleep.c
index dd899dcfb2cb..b45e4c855259 100644
--- a/tools/testing/selftests/timers/nanosleep.c
+++ b/tools/testing/selftests/timers/nanosleep.c
@@ -142,23 +142,18 @@ static void nanosleep_test_clock(clockid_t clockid)
 
 	while (length <= (NSEC_PER_SEC * 10)) {
 		ret = nanosleep_test(clockid, length);
-		if (ret == KSFT_SKIP) {
-			ksft_test_result_skip("%s\n", clock_name(clockid));
+		if (ret != KSFT_PASS) {
+			ksft_test_result_report(ret, "%s\n", clock_name(clockid));
+			ksft_test_result_skip("%s (remaining)\n", clock_name(clockid));
 			return;
 		}
-		if (ret == KSFT_FAIL) {
-			ksft_test_result_fail("%s\n", clock_name(clockid));
-			ksft_exit_fail();
-		}
+
 		length *= 100;
 	}
+	ksft_test_result_pass("%s\n", clock_name(clockid));
 
 	ret = nanosleep_test_remaining(clockid);
-	if (ret == KSFT_FAIL) {
-		ksft_test_result_fail("%s\n", clock_name(clockid));
-		ksft_exit_fail();
-	}
-	ksft_test_result_pass("%s\n", clock_name(clockid));
+	ksft_test_result_report(ret, "%s (remaining)\n", clock_name(clockid));
 }
 
 int main(int argc, char **argv)
@@ -175,7 +170,7 @@ int main(int argc, char **argv)
 	};
 
 	ksft_print_header();
-	ksft_set_plan(ARRAY_SIZE(tested_clocks));
+	ksft_set_plan(ARRAY_SIZE(tested_clocks) * 2);
 
 	for (size_t clock_index = 0; clock_index < ARRAY_SIZE(tested_clocks); clock_index++) {
 		clockid = tested_clocks[clock_index];
@@ -184,5 +179,5 @@ int main(int argc, char **argv)
 
 		nanosleep_test_clock(clockid);
 	}
-	ksft_exit_pass();
+	ksft_finished();
 }

-- 
2.55.0

