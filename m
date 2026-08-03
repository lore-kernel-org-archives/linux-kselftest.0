Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74DBD37BE9E;
	Mon,  3 Aug 2026 10:04:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785751492; cv=none; b=ubbiqKRUhvH20wp3FsFpGa6iQBnxy9e/1f/1zXARDcFzv86/TKe5s4yyeRUykBYonkYhyAwJedssYmx05D/kJvN6ZCeIIT1ed5DxCi4te6j1htFvVsOjv/uc1w2JHUkl7kOHEj14dGiTgav3zxFmumjHdspO7hEhHtAj0xHRVUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785751492; c=relaxed/simple;
	bh=JGtDg2PzLVWZ8cqSK/cuU7S2V+MlHg+yhTHqysxcxsA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ayo/azoigBeKZygw1an2kn1knGmwIKiujlSB8pIcLqUG3vWRgrLYittRGy/pYTK0XcmatTD8MYuprC/rpvjX6x2no5Pbc702aa1/3sfi++RyskO6Y6or/DhasqnimVbb1eAP7VYAzAKJV4eyHZYX56olJxdaYo8fERVcb2Xma6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=dBvhwPLU; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=c/7jhd7x; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="dBvhwPLU";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="c/7jhd7x"
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh_=28Schneider_Electric=29?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1785751488;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cYH09veRA0Aw/Jroe4r+pOSS+OXP0wrgXBET9VeRh+4=;
	b=dBvhwPLUKU3Kssq/8jdzjP5qVPQagIE0eMA+2rxa7sYd0R3GCAE8pLnXl1si0BLCtsw+rb
	zEQd0ogyyagUYYxYJZk0oBeHNEAepjiMebnAsTo4fB6VPq2gxxVwP0ajm7W4N78L2BYU+A
	u5CK7IcumozBtvlztJ1bw7WKsAa+tdSRdWgZNzXfU5ivk/4n7x5pipjli7qLJ6a2G05s67
	42O2XfuXcHSbfIaRB3v8aOVFlEjuQlvTgnk1G7bqETL+FU0TrohosQnefFZgB97u3Ucvyo
	VplkT4jTNym+er36vE/TzUyp+sJLiqBO07bS78PTYqLiJxaZ1dlGu93TFPwUCw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1785751488;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cYH09veRA0Aw/Jroe4r+pOSS+OXP0wrgXBET9VeRh+4=;
	b=c/7jhd7xj7KOxujmgI35dDc6JZ9Xx+TIq+jRKCzzosvP32UPDTo0+Q7QbvS1dyJ5MQDR8w
	FAbB934E2JIIE9Cw==
Date: Mon, 03 Aug 2026 12:04:42 +0200
Subject: [PATCH v2 11/17] selftests: timers: nanosleep: Move all single
 clock tests out of the loop in main()
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260803-auxclock-nanosleep-prep-v2-11-910cbd485390@linutronix.de>
References: <20260803-auxclock-nanosleep-prep-v2-0-910cbd485390@linutronix.de>
In-Reply-To: <20260803-auxclock-nanosleep-prep-v2-0-910cbd485390@linutronix.de>
To: John Stultz <jstultz@google.com>, Thomas Gleixner <tglx@kernel.org>, 
 Stephen Boyd <sboyd@kernel.org>, Miroslav Lichvar <mlichvar@redhat.com>, 
 Anna-Maria Behnsen <anna-maria@linutronix.de>, 
 Frederic Weisbecker <frederic@kernel.org>, Shuah Khan <shuah@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh_=28Schneider_Electric=29?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785751481; l=2235;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=JGtDg2PzLVWZ8cqSK/cuU7S2V+MlHg+yhTHqysxcxsA=;
 b=JGJlwOch6xadLBHRJkBnFd5NrcaCqNg0spCa/3WiSWlPJAOg8ue3ubUdUIFCeu5Ae4T1O0Z3m
 zd+rlFz6Yh9CM2LhI5KrTc5YeU63lD9zh656hYT5Sie6sA33dWMMxRM
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=

Make the code easier to read by avoiding a goto.

Signed-off-by: Thomas Weißschuh (Schneider Electric) <thomas.weissschuh@linutronix.de>
Acked-by: John Stultz <jstultz@google.com>
---
 tools/testing/selftests/timers/nanosleep.c | 51 ++++++++++++++++--------------
 1 file changed, 28 insertions(+), 23 deletions(-)

diff --git a/tools/testing/selftests/timers/nanosleep.c b/tools/testing/selftests/timers/nanosleep.c
index 0a2ca1791f27..5037481516df 100644
--- a/tools/testing/selftests/timers/nanosleep.c
+++ b/tools/testing/selftests/timers/nanosleep.c
@@ -132,10 +132,35 @@ static int nanosleep_test_remaining(int clockid)
 	return KSFT_PASS;
 }
 
+static void nanosleep_test_clock(clockid_t clockid)
+{
+	long long length = 10;
+	int ret;
+
+	while (length <= (NSEC_PER_SEC * 10)) {
+		ret = nanosleep_test(clockid, length);
+		if (ret == KSFT_SKIP) {
+			ksft_test_result_skip("%s\n", clock_name(clockid));
+			return;
+		}
+		if (ret == KSFT_FAIL) {
+			ksft_test_result_fail("%s\n", clock_name(clockid));
+			ksft_exit_fail();
+		}
+		length *= 100;
+	}
+
+	ret = nanosleep_test_remaining(clockid);
+	if (ret == KSFT_FAIL) {
+		ksft_test_result_fail("%s\n", clock_name(clockid));
+		ksft_exit_fail();
+	}
+	ksft_test_result_pass("%s\n", clock_name(clockid));
+}
+
 int main(int argc, char **argv)
 {
-	long long length;
-	int clockid, ret;
+	int clockid;
 
 	static const clockid_t tested_clocks[] = {
 		CLOCK_REALTIME,
@@ -154,27 +179,7 @@ int main(int argc, char **argv)
 
 		fflush(stdout);
 
-		length = 10;
-		while (length <= (NSEC_PER_SEC * 10)) {
-			ret = nanosleep_test(clockid, length);
-			if (ret == KSFT_SKIP) {
-				ksft_test_result_skip("%s\n", clock_name(clockid));
-				goto next;
-			}
-			if (ret == KSFT_FAIL) {
-				ksft_test_result_fail("%s\n", clock_name(clockid));
-				ksft_exit_fail();
-			}
-			length *= 100;
-		}
-		ret = nanosleep_test_remaining(clockid);
-		if (ret == KSFT_FAIL) {
-			ksft_test_result_fail("%s\n", clock_name(clockid));
-			ksft_exit_fail();
-		}
-		ksft_test_result_pass("%s\n", clock_name(clockid));
-next:
-		ret = 0;
+		nanosleep_test_clock(clockid);
 	}
 	ksft_exit_pass();
 }

-- 
2.55.0

