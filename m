Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC33D3E7BCE;
	Tue, 28 Jul 2026 07:56:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785225387; cv=none; b=VFmzWoByu0xCNWcKMrliiYNSVzyzqfdj7xVnUeRi8ImuaxarqjrSbcV7NFSBa9iZ2Nwkvj7Mfu7l5674ZalIj/6/L6GdOoAokAMGQNSug+PtW7cEDZHzPlurNDIu9WdOoT3yuLAhFQuktfW9q0hoXNb9os7+4cD5Fy4ZUFkGH38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785225387; c=relaxed/simple;
	bh=iURTu10mGAMF8r101DAi59Sfd7rjDpf8oxW6jzJfeA4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PjfCNOEvYrNtiGMx1IGgkHvjRTDX/aa07d6NA6JczK0tPS7LuD3l+hVHUa/WQ8KWrUGYC/2crdkhOy9nOjSi5vAkL7vCFXbTqrBeZs66XDzoJygVb+/RUfXpMTA4NE2U1FPHY2tWYRywXD5LjPCog6gJ85fZI0gasBQjEEgct2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=Fg105P5h; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=K0hBrtlM; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="Fg105P5h";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="K0hBrtlM"
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1785225384;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+iK7hxnOIbQ2L2eg+a06KzApf6xtxC4oqyM1hrJTosM=;
	b=Fg105P5hLL+9sfBf2HghlPuvKsz2g23ldN2Hj3R7NEMjDyU/QPQKVag0KLY7nuzNzoLD7o
	LSN9rpyEPa+pRuUkIpBcbIPLCNpjKTRDXxwzBOrqkKz6jp5t8Y4zGk0tEz3XeHfYZs7sZc
	HhIRhmSFuTVa6Al2ngt+hn9rgxXBl+YFEZwm5B3IdNcVGn87GwQYVOMldyEhKfsgdM09CR
	9jveTSga8lp83xmg7zhonstmFsakZzydWkuRYVsOl3c1AYegp18rKinVfWDUYroD/tZFyI
	D6FWgv9TMSoefSqmsoEh5ZdwtOa+G8IRhKkd00HOqv/vZKeOXw1bZC50Iunv9g==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1785225384;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+iK7hxnOIbQ2L2eg+a06KzApf6xtxC4oqyM1hrJTosM=;
	b=K0hBrtlMVCEcF1rViGrHyVgE+MHccrWRPGu7fg0HSMylz0uZqPUQAtCa3f+2toZ4BIqlmS
	LZZKkU4nNmoXYwCQ==
Date: Tue, 28 Jul 2026 09:54:28 +0200
Subject: [PATCH 2/5] selftests: vDSO: vdso_test_correctness: Use symbolic
 clock IDs
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260728-vdso-test-axuclocks-v1-2-2fcc883a2940@linutronix.de>
References: <20260728-vdso-test-axuclocks-v1-0-2fcc883a2940@linutronix.de>
In-Reply-To: <20260728-vdso-test-axuclocks-v1-0-2fcc883a2940@linutronix.de>
To: Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
 Vincenzo Frascino <vincenzo.frascino@arm.com>, 
 Shuah Khan <shuah@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785225381; l=1760;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=iURTu10mGAMF8r101DAi59Sfd7rjDpf8oxW6jzJfeA4=;
 b=Oila3PVSNPMPpD8IEr4U2SXuHxdWW9jBuWj58DXVezDWxfUGzsRh2YxzJ2dLRHmErhQaHF5kX
 r6wy7NpXEGtBrh4cIfzAb651+ZP0/HBxSiPlGjvGsJ0aEEr+fabFm6v
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=

While the hardcoded constants are correct, they are not obvious when
reading the code.

Switch to symbolic identifiers.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 .../testing/selftests/vDSO/vdso_test_correctness.c | 24 +++++++++++-----------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/tools/testing/selftests/vDSO/vdso_test_correctness.c b/tools/testing/selftests/vDSO/vdso_test_correctness.c
index bcce5053e822..3671ea815823 100644
--- a/tools/testing/selftests/vDSO/vdso_test_correctness.c
+++ b/tools/testing/selftests/vDSO/vdso_test_correctness.c
@@ -255,18 +255,18 @@ static const struct {
 	clockid_t id;
 	const char *const name;
 } clocks[] = {
-	{ 0,	"CLOCK_REALTIME"},
-	{ 1,	"CLOCK_MONOTONIC"},
-	{ 2,	"CLOCK_PROCESS_CPUTIME_ID"},
-	{ 3,	"CLOCK_THREAD_CPUTIME_ID"},
-	{ 4,	"CLOCK_MONOTONIC_RAW"},
-	{ 5,	"CLOCK_REALTIME_COARSE"},
-	{ 6,	"CLOCK_MONOTONIC_COARSE"},
-	{ 7,	"CLOCK_BOOTTIME"},
-	{ 8,	"CLOCK_REALTIME_ALARM"},
-	{ 9,	"CLOCK_BOOTTIME_ALARM"},
-	{ 10,	"CLOCK_SGI_CYCLE"},
-	{ 11,	"CLOCK_TAI"},
+	{ CLOCK_REALTIME,		"CLOCK_REALTIME"},
+	{ CLOCK_MONOTONIC,		"CLOCK_MONOTONIC"},
+	{ CLOCK_PROCESS_CPUTIME_ID,	"CLOCK_PROCESS_CPUTIME_ID"},
+	{ CLOCK_THREAD_CPUTIME_ID,	"CLOCK_THREAD_CPUTIME_ID"},
+	{ CLOCK_MONOTONIC_RAW,		"CLOCK_MONOTONIC_RAW"},
+	{ CLOCK_REALTIME_COARSE,	"CLOCK_REALTIME_COARSE"},
+	{ CLOCK_MONOTONIC_COARSE,	"CLOCK_MONOTONIC_COARSE"},
+	{ CLOCK_BOOTTIME,		"CLOCK_BOOTTIME"},
+	{ CLOCK_REALTIME_ALARM,		"CLOCK_REALTIME_ALARM"},
+	{ CLOCK_BOOTTIME_ALARM,		"CLOCK_BOOTTIME_ALARM"},
+	{ 10,				"CLOCK_SGI_CYCLE"},
+	{ CLOCK_TAI,			"CLOCK_TAI"},
 };
 
 static void test_one_clock_gettime(int clock, const char *name)

-- 
2.55.0

