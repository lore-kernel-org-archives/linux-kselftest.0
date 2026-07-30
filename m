Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13BC93A1E92;
	Thu, 30 Jul 2026 06:47:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785394081; cv=none; b=kXUWlHHi4tmCtv8VXqtaIQ4mSTQTWAJTxKgnWJ2n0V0AAa2XDicPaWk0SffOYhHdeuBZ7v9E5BPwNZv81GYpfPDcMBTmacWUVcVy1ONuUiPU7vdVQKqzM7Tdg9DIf+7e13vGttJVnb5ioZ4mnROE9UfzVdBbi0C6UZyxwDudy3U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785394081; c=relaxed/simple;
	bh=T1TBAt55PpOKjRXPMAXMq6y8FByIgeIsOhbbdoKLgIw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=D6QXoyzE6cBG+tTE7D1Nn4PFXO8YVKeiTFx+ccrtafHlx7Yk2sFh9X94T2rr9osW/ot+NP0u/FQQ2DdD//6As6m7x68oFpZgQ5RXsfzZuYstoQ8vtp53GlQtmEwkPhjjZKS7rPvXaois8C2xOVdxBhgXGmI+yUlJj45oj8WT/ZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=I6bIJCQ9; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=BDlPiEod; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="I6bIJCQ9";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="BDlPiEod"
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh_=28Schneider_Electric=29?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1785394072;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Mry8OM/gwzQes0N92pBT1UGTp437/9KhNw/3O/HJkvY=;
	b=I6bIJCQ9fvi49Y7s+A3lMOlcGZQjv7x2knopWOjdM6rEgv8k+J89MsgDsFn1iLNnvxCZsO
	7rowtd+kb2ProjN4Peu0bA8Z7sC9tR8Z7gDqWzhlA+LeT2H9o6NAy4sI7HE/v4sWQsup8T
	W8Lji+zDjNx/3tw9p+rbaSiwBsE5Ry6Rjj49JM1ghJmkVWWqe4Rp3xLW5i/Rdv0DOH8HAL
	AXxWPXepZCpp/MwW5AYuz7ehUrOwLqLtbMqPcwcG+wYUV8ImPapdbaJJHxpxAahm0dN8sF
	JD9ooQQkaCmEto4/rgo8uZXl4wWFXRdF/zdISz8sBLciwMfur323SUo4HvBZNg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1785394072;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Mry8OM/gwzQes0N92pBT1UGTp437/9KhNw/3O/HJkvY=;
	b=BDlPiEodhOFs2m1x+U1mjVsnzaRY63T12wyT7BQlULxWTYsIkS2khMgQzU5iconxYnQJSq
	AiLC2JzSoaAIpEAQ==
Date: Thu, 30 Jul 2026 08:47:49 +0200
Subject: [PATCH 12/16] selftests: timers: nanosleep: Report each test
 separately
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260730-auxclock-nanosleep-prep-v1-12-cd8b61229a7c@linutronix.de>
References: <20260730-auxclock-nanosleep-prep-v1-0-cd8b61229a7c@linutronix.de>
In-Reply-To: <20260730-auxclock-nanosleep-prep-v1-0-cd8b61229a7c@linutronix.de>
To: John Stultz <jstultz@google.com>, Thomas Gleixner <tglx@kernel.org>, 
 Stephen Boyd <sboyd@kernel.org>, Miroslav Lichvar <mlichvar@redhat.com>, 
 Anna-Maria Behnsen <anna-maria@linutronix.de>, 
 Frederic Weisbecker <frederic@kernel.org>, Shuah Khan <shuah@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh_=28Schneider_Electric=29?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785394062; l=2272;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=T1TBAt55PpOKjRXPMAXMq6y8FByIgeIsOhbbdoKLgIw=;
 b=s8MrD/BvNmXHQiD4SCkqOmMS2PDRThTBcf2M0hOjENBvqeHAbN9DAx13AF3wqx9TuhOCcegnY
 +ayxu79hEIkCKJarBMIqmoIrBFdyPqiM2Cxf8g4OC91bBVof84BpXLM
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=

Currently the test for the sleep functionality itself and the one for
the remaining time are reported together. This makes the test output a
bit confusing, especially as the upcoming tests for auxiliary clocks
will have different results between the two parts.

Report each test part on its own.

This also allows continuing testing other clocks after a single one has failed.

Signed-off-by: Thomas Weißschuh (Schneider Electric) <thomas.weissschuh@linutronix.de>
---
 tools/testing/selftests/timers/nanosleep.c | 21 ++++++++-------------
 1 file changed, 8 insertions(+), 13 deletions(-)

diff --git a/tools/testing/selftests/timers/nanosleep.c b/tools/testing/selftests/timers/nanosleep.c
index 5037481516df..e69cc0d56445 100644
--- a/tools/testing/selftests/timers/nanosleep.c
+++ b/tools/testing/selftests/timers/nanosleep.c
@@ -139,23 +139,18 @@ static void nanosleep_test_clock(clockid_t clockid)
 
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
@@ -172,7 +167,7 @@ int main(int argc, char **argv)
 	};
 
 	ksft_print_header();
-	ksft_set_plan(ARRAY_SIZE(tested_clocks));
+	ksft_set_plan(ARRAY_SIZE(tested_clocks) * 2);
 
 	for (size_t clock_index = 0; clock_index < ARRAY_SIZE(tested_clocks); clock_index++) {
 		clockid = tested_clocks[clock_index];
@@ -181,5 +176,5 @@ int main(int argc, char **argv)
 
 		nanosleep_test_clock(clockid);
 	}
-	ksft_exit_pass();
+	ksft_finished();
 }

-- 
2.55.0

