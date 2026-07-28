Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2337C3F0A96;
	Tue, 28 Jul 2026 07:56:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785225392; cv=none; b=RHEaFx1A0mzdWDol2mPRM/nA/Sgw6YFXQOBEV8XZKhjY4H7ivDG8oAGw+TiqsXI+63OqX/u3lfjnvpKmCOzeZReu91e8akSb6n4WJVgJ2I7ZSu9j+9q77/aUFO7X6uMl8jQdt+nLOG0feXG3nNu+3YDXGmWdXPJtMxTkRYI/fo8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785225392; c=relaxed/simple;
	bh=xwPnolFD+r+nNsxX6xgjJzgSxvjH9UccOxaWNZ3mU2Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XL5EdDS5FsJNPEBJ0V3ttdEd0bLOUiTq55Zhv9fniBd4FUrNjmIUjte72HGkncJZeq4n5OwyjUOPrj/PvMDglVd8edeOXZ5hk8xhsnvUep5bWNe7sjaf1Isew5WTOsor+CRtRHBJF/bEXDOB8+bMhk/MfQYDdmwrqhTxWah3YO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=SYMhWASb; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=Ubu6Hs7J; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="SYMhWASb";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="Ubu6Hs7J"
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1785225385;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=S+aI4Tp2C1W4geEh27u0/3ND7XaBgzEGfCtu2WrGtho=;
	b=SYMhWASbozljJK1GdNbjTCTuk0dFqTxpJpZX28acjyrIyydqw3o0FEPh+fQOyHK+IRbADX
	WktmNBFRNOOyIiiVR7LgdhIovxs3eeglVzgWaQDiZQksnavRjRp/sQ9ZgeNv9VjyUhAHty
	CXTd8VEcLHxXXd3fa5kh7ZAy+UuyQi1k337VJOl0plqU7Mzt/y/RxwKFQHxUTh2ZNyWTjN
	Wsdv5KgOKa5QQslg9Pg91I1zD529PBC+qff5UPDgD4a1ig4CiQJDGpRg8y3kYO1Jw/S4v4
	XAdlXorAb4H1fxx5F6J6w8nXke4SK0RuOKGomQiTQWMVHk7tSJd7Xt61DQSs8A==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1785225385;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=S+aI4Tp2C1W4geEh27u0/3ND7XaBgzEGfCtu2WrGtho=;
	b=Ubu6Hs7JVH+JZI7/qtgri3tHmxpmWgr5pKWKA3IB/BPdVsr9GGintQf8sT7n2P49GSoob3
	lJ6ysGWja1F9S4DQ==
Date: Tue, 28 Jul 2026 09:54:31 +0200
Subject: [PATCH 5/5] selftests: vDSO: vdso_test_abi: Add tests for
 auxiliary clocks
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260728-vdso-test-axuclocks-v1-5-2fcc883a2940@linutronix.de>
References: <20260728-vdso-test-axuclocks-v1-0-2fcc883a2940@linutronix.de>
In-Reply-To: <20260728-vdso-test-axuclocks-v1-0-2fcc883a2940@linutronix.de>
To: Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
 Vincenzo Frascino <vincenzo.frascino@arm.com>, 
 Shuah Khan <shuah@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785225381; l=3063;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=xwPnolFD+r+nNsxX6xgjJzgSxvjH9UccOxaWNZ3mU2Y=;
 b=6l0HUNbOoMF68zJv+rp//BuZxRmqNZNjc5Ew0P48A+AydYJPXUZx0j29smniFKmeRjJSCClfD
 ULM2uG8pspHA3WbCdgvHksa3/vR/T9xcTh/QWVKMWHhuLuNndHjscH/
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=

Extend the test to also cover auxiliary clocks.

The hardcoded boundary of 'CLOCK_AUX + 8' is intentional.
If the number of auxiliary clocks ever changes we will not access the
vdso_clock_name array out of bounds but instead kselftest.h will report
a mismatch between the executed tests and the test plan.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 tools/testing/selftests/vDSO/vdso_test_abi.c | 28 +++++++++++++++++++++++++++-
 1 file changed, 27 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/vDSO/vdso_test_abi.c b/tools/testing/selftests/vDSO/vdso_test_abi.c
index b162a4ba9c4f..d34d112f9860 100644
--- a/tools/testing/selftests/vDSO/vdso_test_abi.c
+++ b/tools/testing/selftests/vDSO/vdso_test_abi.c
@@ -23,6 +23,14 @@
 #include "vdso_call.h"
 #include "parse_vdso.h"
 
+#ifndef CLOCK_AUX
+#define CLOCK_AUX	16
+#endif
+
+#ifndef CLOCK_AUX_LAST
+#define CLOCK_AUX_LAST	23
+#endif
+
 static const char *version;
 static const char **name;
 
@@ -52,6 +60,14 @@ static const char * const vdso_clock_name[] = {
 	[CLOCK_BOOTTIME_ALARM]		= "CLOCK_BOOTTIME_ALARM",
 	[10 /* CLOCK_SGI_CYCLE */]	= "CLOCK_SGI_CYCLE",
 	[CLOCK_TAI]			= "CLOCK_TAI",
+	[CLOCK_AUX + 0]			= "CLOCK_AUX0",
+	[CLOCK_AUX + 1]			= "CLOCK_AUX1",
+	[CLOCK_AUX + 2]			= "CLOCK_AUX2",
+	[CLOCK_AUX + 3]			= "CLOCK_AUX3",
+	[CLOCK_AUX + 4]			= "CLOCK_AUX4",
+	[CLOCK_AUX + 5]			= "CLOCK_AUX5",
+	[CLOCK_AUX + 6]			= "CLOCK_AUX6",
+	[CLOCK_AUX + 7]			= "CLOCK_AUX7",
 };
 
 static void vdso_test_gettimeofday(void)
@@ -99,6 +115,9 @@ static void vdso_test_clock_gettime64(clockid_t clk_id)
 			       (long long)ts.tv_sec, (long long)ts.tv_nsec);
 		ksft_test_result_pass("%s %s\n", name[5],
 				      vdso_clock_name[clk_id]);
+	} else if (ret == -ENODEV) {
+		ksft_test_result_skip("%s %s\n", name[5],
+				      vdso_clock_name[clk_id]);
 	} else {
 		ksft_test_result_fail("%s %s\n", name[5],
 				      vdso_clock_name[clk_id]);
@@ -126,6 +145,9 @@ static void vdso_test_clock_gettime(clockid_t clk_id)
 			       (long long)ts.tv_sec, (long long)ts.tv_nsec);
 		ksft_test_result_pass("%s %s\n", name[1],
 				      vdso_clock_name[clk_id]);
+	} else if (ret == -ENODEV) {
+		ksft_test_result_skip("%s %s\n", name[1],
+				      vdso_clock_name[clk_id]);
 	} else {
 		ksft_test_result_fail("%s %s\n", name[1],
 				      vdso_clock_name[clk_id]);
@@ -261,7 +283,8 @@ static inline void vdso_test_clock(clockid_t clock_id)
 	vdso_test_clock_getres_time64(clock_id);
 }
 
-#define VDSO_TEST_PLAN	38
+#define NUM_AUX_TESTS (4 * (CLOCK_AUX_LAST - CLOCK_AUX + 1))
+#define VDSO_TEST_PLAN	(38 + NUM_AUX_TESTS)
 
 int main(int argc, char **argv)
 {
@@ -293,6 +316,9 @@ int main(int argc, char **argv)
 	vdso_test_clock(CLOCK_PROCESS_CPUTIME_ID);
 	vdso_test_clock(CLOCK_THREAD_CPUTIME_ID);
 
+	for (clockid_t aux_clock = CLOCK_AUX; aux_clock < CLOCK_AUX + 8; aux_clock++)
+		vdso_test_clock(aux_clock);
+
 	vdso_test_time();
 
 	ksft_finished();

-- 
2.55.0

