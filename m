Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF7D034751F;
	Tue, 28 Jul 2026 07:56:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785225388; cv=none; b=uXgaHCFTpUdnqh/sv8M9Xn5Y8N36tBQAxA3+H5we3lDpwA2E93KR9xtkQk44l2MQcExMraxHOXkFW2bPRf9tw37SnosQOGd/vYn7fs9A3+UzSG93/2mBgDmo60CvHbkk0+92nJ6NYZf6rL3XM9hOiTJB3HdPlqH2OKzx3i0VtmA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785225388; c=relaxed/simple;
	bh=jCMK/yd3sV56+FChhTNUHioQr1qNHXVcHeo5AxaQI20=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XpLxzK1VcXzh1LCEKs8JGxImtdTKO3zM4voDzWPjz47eNDdDRu6TjUTeFiQiABdUhDi5RXmsIgBcQutlKWTPQ2r5UGKOlHFA2MxObC8yeoJUXV+KwUPhb+ACMd2rHGA2zWePuZQAoA7MrWIQZHlAfXL/Zkjec8kPBDgYHUPX+80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=uXSM7PtT; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=W7DikQlg; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="uXSM7PtT";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="W7DikQlg"
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1785225385;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AFQmMsnXjdHNOdNUGY93GS4xBBG1j14qc9RhMsmJWXo=;
	b=uXSM7PtTraxKfT7HsWoURa846ZYttpZFLwkA9Q4OQC2hpKQ6Y25JG047rBTyyfaZx0PSWX
	P0l/UdTQu8uPOk6U9xPVYg9CKcHZwLKoqczGS9x0qCK15Dtqhuaj5N+dbSF9lwdQmeuuPK
	YMK//Lq2JHZKHi8jzUrlOY/30HuBgcP2jbMFadjWVfntw1nbD4ZBv0vu/W6EiJPU9VMjW9
	1w4cqT2Pw5odxPZBQzKgQ5gvnf/MB+6lF9dwla5RQgzZa/5NHpZ74zkSotqO/Jc/rb5/8/
	Sl4dNwzDCHcofZFQAmYmiEviG38WoF94DAqRYBVzf6iVGI1mCRPgA5Acp2K2Aw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1785225385;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AFQmMsnXjdHNOdNUGY93GS4xBBG1j14qc9RhMsmJWXo=;
	b=W7DikQlgRYkeKxScwi+dj4qZwsC6EHmInOcJIyieUAbrvKAeBIHySkpoY0TOlTRnLXcRds
	IX+97uDGs0gwMEAw==
Date: Tue, 28 Jul 2026 09:54:30 +0200
Subject: [PATCH 4/5] selftests: vDSO: vdso_test_correctness: Add tests for
 auxiliary clocks
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260728-vdso-test-axuclocks-v1-4-2fcc883a2940@linutronix.de>
References: <20260728-vdso-test-axuclocks-v1-0-2fcc883a2940@linutronix.de>
In-Reply-To: <20260728-vdso-test-axuclocks-v1-0-2fcc883a2940@linutronix.de>
To: Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
 Vincenzo Frascino <vincenzo.frascino@arm.com>, 
 Shuah Khan <shuah@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785225381; l=2048;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=jCMK/yd3sV56+FChhTNUHioQr1qNHXVcHeo5AxaQI20=;
 b=wLJFH6Z8BAJwxeuwN6DASNgRNWYHsFi1ZTEqygJwYEc3gxMh/hcDuoaOGKe5JQO/IVA7h6vUl
 +t6dhQ7CCWUDhutH1pM0O/UszruG+mXfAZemVa5hI3iMZFkAfbB+Z+t
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=

Extend the test to also cover auxiliary clocks.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 tools/testing/selftests/vDSO/vdso_test_correctness.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/tools/testing/selftests/vDSO/vdso_test_correctness.c b/tools/testing/selftests/vDSO/vdso_test_correctness.c
index ffad3e636e56..a37dc391bccf 100644
--- a/tools/testing/selftests/vDSO/vdso_test_correctness.c
+++ b/tools/testing/selftests/vDSO/vdso_test_correctness.c
@@ -27,6 +27,10 @@
 static const char *version;
 static const char **name;
 
+#ifndef CLOCK_AUX
+#define CLOCK_AUX	16
+#endif
+
 #ifndef __NR_clock_gettime64
 #define __NR_clock_gettime64	403
 #endif
@@ -267,6 +271,14 @@ static const struct {
 	{ CLOCK_BOOTTIME_ALARM,		"CLOCK_BOOTTIME_ALARM"},
 	{ 10,				"CLOCK_SGI_CYCLE"},
 	{ CLOCK_TAI,			"CLOCK_TAI"},
+	{ CLOCK_AUX + 0,		"CLOCK_AUX0"},
+	{ CLOCK_AUX + 1,		"CLOCK_AUX1"},
+	{ CLOCK_AUX + 2,		"CLOCK_AUX2"},
+	{ CLOCK_AUX + 3,		"CLOCK_AUX3"},
+	{ CLOCK_AUX + 4,		"CLOCK_AUX4"},
+	{ CLOCK_AUX + 5,		"CLOCK_AUX5"},
+	{ CLOCK_AUX + 6,		"CLOCK_AUX6"},
+	{ CLOCK_AUX + 7,		"CLOCK_AUX7"},
 };
 
 static void test_one_clock_gettime(int clock, const char *name)
@@ -285,6 +297,8 @@ static void test_one_clock_gettime(int clock, const char *name)
 			nerrs++;
 		} else if (errno == EINVAL) {
 			printf("[OK]\tNo such clock.\n");
+		} else if (errno == ENODEV) {
+			printf("[SKIP]\t clock_gettime(%d) syscall returned ENODEV\n", clock);
 		} else {
 			printf("[WARN]\t clock_gettime(%d) syscall returned error %d\n", clock, errno);
 		}
@@ -347,6 +361,8 @@ static void test_one_clock_gettime64(int clock, const char *name)
 			nerrs++;
 		} else if (errno == EINVAL) {
 			printf("[OK]\tNo such clock.\n");
+		} else if (errno == ENODEV) {
+			printf("[SKIP]\t clock_gettime64(%d) syscall returned ENODEV\n", clock);
 		} else {
 			printf("[WARN]\t clock_gettime64(%d) syscall returned error %d\n", clock, errno);
 		}

-- 
2.55.0

