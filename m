Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A06933FE2F;
	Mon,  3 Aug 2026 10:04:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785751494; cv=none; b=c6EQvDU2tWFi9WKWq0BFcAEym2h4L90cXPc2VPzJaDIgPCCPUGHdbCKdr7yB6SJBkLLObrHCtvKk5kw2QineeQHOj3j1b2w/2RDDD5R+bJ3jwkRYnavhv/brlvva/u8UIxvyJe2XSwz6YrsrpY/0gKLgMFqH4a0VtbMUpBUIRaE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785751494; c=relaxed/simple;
	bh=8f0cZ9Z81JEy5Nb5GMW8Jvm2yJSqxh8ZEWYwvfBFEuc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=K9bcJF56QHpXBSuozUHn2xKYDLXcLDhzBUkRKfxgYVrlGxUq8lm/xtjiN/NYOesQrDwyy7p0jiH5icsdSAMrhtAFCuI9GClEwZB+4G+m57IzGUQj1Xmcg44wYJJpO0jP1U+oyJ1LuSUBmqEcq1yEplhtcRXXbJ6RDgDeUfp3bB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=E05+8ZAS; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=hwSOGtvf; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="E05+8ZAS";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="hwSOGtvf"
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh_=28Schneider_Electric=29?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1785751489;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Rmy8O6Q1rL0QWJQTqilfs0RBAsmI3zNX8zv3Fz4GAfo=;
	b=E05+8ZASTKl4RP04szB5tGPtFTBl37IwoICLMevXXkVEokQkFE6JdTouv8iksvrZGnjd9g
	wX4TRS9jiKyvpQeq8tOnISTo9lIl6XLVD7684xum1xFS+fcpcKMC1MftAVJugHViZmohvI
	OwCRcRyTExZIzvTdxupFccxIknLV/WNOQcdO7/mH4TXoUB6QIOw0pYtqfsPRLXsOW+wOTE
	DVGmnCgNjbtC1fCfH5RdP//EiDuWTsUQA/1X142dVbhwJbpVZQN3A8ZjxMO+Dan8ajZewb
	XwjQ4q43g8XTQI1HwDBJa7sms+VQJXuf9rGofRlGf6bEBkHdYf40Sx70ua+12w==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1785751489;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Rmy8O6Q1rL0QWJQTqilfs0RBAsmI3zNX8zv3Fz4GAfo=;
	b=hwSOGtvfsMlJY5TUkxxVH6GjzMSugNfhLKm5576dkq6TRt/Bfp/fdatuKm7lZbEMZshPys
	phspecCeXOBMeWCw==
Date: Mon, 03 Aug 2026 12:04:43 +0200
Subject: [PATCH v2 12/17] selftests: timers: nanosleep: Explicitly handle
 timer_delete() failure
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260803-auxclock-nanosleep-prep-v2-12-910cbd485390@linutronix.de>
References: <20260803-auxclock-nanosleep-prep-v2-0-910cbd485390@linutronix.de>
In-Reply-To: <20260803-auxclock-nanosleep-prep-v2-0-910cbd485390@linutronix.de>
To: John Stultz <jstultz@google.com>, Thomas Gleixner <tglx@kernel.org>, 
 Stephen Boyd <sboyd@kernel.org>, Miroslav Lichvar <mlichvar@redhat.com>, 
 Anna-Maria Behnsen <anna-maria@linutronix.de>, 
 Frederic Weisbecker <frederic@kernel.org>, Shuah Khan <shuah@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh_=28Schneider_Electric=29?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785751481; l=1475;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=8f0cZ9Z81JEy5Nb5GMW8Jvm2yJSqxh8ZEWYwvfBFEuc=;
 b=KOtMmrDukMJx+I69FFumKIg0u61u22eQi8T8QYe7wWMIlZ87e68lsM7RfR2tFyaMvV6W+lwpW
 HgV4/jalOaKDDJGGHDn0urPsz4zg7EJKVeySIs/TwFllSTdXYaloAFk
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=

An upcoming patch will remove the early exit on failure of a single
testcase. If a test fails because a timeout timer could not be deleted,
then that timeout timer might interfere with the following tettcases.

Exit the whole test case with a clear error message in this case.

Other failures are not problematic:
* If timer_settime() fails, a harmless unarmed timer is left around.
* The SIGALRM handler reconfigured for each call to
  nanosleep_test_remaining() anyways.

Signed-off-by: Thomas Weißschuh (Schneider Electric) <thomas.weissschuh@linutronix.de>
---
 tools/testing/selftests/timers/nanosleep.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/tools/testing/selftests/timers/nanosleep.c b/tools/testing/selftests/timers/nanosleep.c
index 5037481516df..dd899dcfb2cb 100644
--- a/tools/testing/selftests/timers/nanosleep.c
+++ b/tools/testing/selftests/timers/nanosleep.c
@@ -111,11 +111,14 @@ static int nanosleep_test_remaining(int clockid)
 
 	rqtp.tv_nsec = NSEC_PER_SEC / 2;
 	ret = clock_nanosleep(clockid, 0, &rqtp, &rmtp);
-	if (ret != EINTR)
-		return KSFT_FAIL;
 
-	ret = timer_delete(timer);
-	if (ret)
+	if (timer_delete(timer)) {
+		ksft_exit_fail_msg("Unable to delete the timeout timer for %s. "
+				   "This might interfere with following testcases.\n",
+				   clock_name(clockid));
+	}
+
+	if (ret != EINTR)
 		return KSFT_FAIL;
 
 	sa.sa_handler = SIG_DFL;

-- 
2.55.0

