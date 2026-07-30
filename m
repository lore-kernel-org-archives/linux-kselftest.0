Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19C963B42C4;
	Thu, 30 Jul 2026 06:47:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785394084; cv=none; b=YqGFaDy0OHzkXV6LSG27lOn2D98x8NGlxFIKgqknNvMnnNlJKwENgRsSfeRue764yALEK7dOqahETyk7jVCkP/q9u4oqNQdlxHL2Mq33/nux6DJSJZ4019VNyLB4CO0Lpy4iOQLPDVgc/TEujdSJb3vWaeJrNEYiowvh3dLFCNA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785394084; c=relaxed/simple;
	bh=RhXg9bsWXMQ61Q1Fun0K6qbsFDlBGN+Vev55C7eIalI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JLJY69PEws997og+KDCHYkBOzdtWhV9sGfY0rMqsrnPvoPNXYDDleMSDjpzH2qycNIT8f3lGLOxSe1ceqngPNmGmDTSor6ldtlQsvDcH9goPbeGhFDuXvXr+gRL+5+9hUfV3Mrfa7SyKovzHvwEKOVlddw0amLJMpZp3VE7dHqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=pfRp2OSc; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=Dv3sCr6Y; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="pfRp2OSc";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="Dv3sCr6Y"
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh_=28Schneider_Electric=29?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1785394071;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=z+FC56rIO3rhyrFgS1K2dAPFJP9iU/KQ+EIVhLAiGUI=;
	b=pfRp2OScoz8TQQP75YwKUYgx4vJeb9anyW3yXNpBjd+LEIDWN5jaD79eL5VoSfqPmDs5TH
	b7KO5gJ7UHwE/JFs0GBW3ONseaMQkgVnFgdJaCRjSbJ0swp06MchA7CeE6yNs+hnVJ7pax
	0Ig+Q/HIA3uMfx6BVLWZG3d/paISI4bJfRzMMR+zXHkuOscGvqRJ2vvyOmGw6fEwD8E++2
	9PhROV4GSrQ7pRYCGHftrlmuvOVVkVzVy4bjQImM2rTkqaw4DtAHUVtGNJB20kt1yOKl7j
	TPZUo8FlGu19LqOB7rasaHUfhLwLbeS9eW/HKIZCA9DNlwewBRAYATe5LUziqA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1785394071;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=z+FC56rIO3rhyrFgS1K2dAPFJP9iU/KQ+EIVhLAiGUI=;
	b=Dv3sCr6Y4rExZ1R2LfIoprv1q5Kjlc2ocEEChthgDNE6vRCq5wxzysc/Di+vhLy1EVga4V
	Nu3tVsEW0ThdEACg==
Date: Thu, 30 Jul 2026 08:47:48 +0200
Subject: [PATCH 11/16] selftests: timers: nanosleep: Move all single clock
 tests out of the loop in main()
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260730-auxclock-nanosleep-prep-v1-11-cd8b61229a7c@linutronix.de>
References: <20260730-auxclock-nanosleep-prep-v1-0-cd8b61229a7c@linutronix.de>
In-Reply-To: <20260730-auxclock-nanosleep-prep-v1-0-cd8b61229a7c@linutronix.de>
To: John Stultz <jstultz@google.com>, Thomas Gleixner <tglx@kernel.org>, 
 Stephen Boyd <sboyd@kernel.org>, Miroslav Lichvar <mlichvar@redhat.com>, 
 Anna-Maria Behnsen <anna-maria@linutronix.de>, 
 Frederic Weisbecker <frederic@kernel.org>, Shuah Khan <shuah@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh_=28Schneider_Electric=29?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785394062; l=2191;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=RhXg9bsWXMQ61Q1Fun0K6qbsFDlBGN+Vev55C7eIalI=;
 b=N7eD3MP8T8V3cuqKdE26SWOHkT6heayxO5rPJX+JGE/sL32fXHU2FwSOi9lHnen3sR2ExGFhf
 Ii5bZ9kZr55BaGCdn465N7gy9IBwKOSeezXVP6xmuwwF+j4kemSPqV1
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=

Make the code easier to read by avoiding a goto.

Signed-off-by: Thomas Weißschuh (Schneider Electric) <thomas.weissschuh@linutronix.de>
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

