Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A20B3E1203;
	Thu,  3 Sep 2026 07:38:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788421109; cv=none; b=FOdu6KykB1JpgRJr5Q/c4llzlwUPzqn4uzTjM+jZES8sj0QbLROTJL8l9Q7rTMcvgWDT9HwinGWCbgENnmWh7APh/ujU+iFjR2bUL26hOgcgForntIpMFRrg6fz/Xh/NzsVTrB5C5fP0MKn1NxJM4X19PK4LcPIA+hUrmVcmoOM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788421109; c=relaxed/simple;
	bh=9FCxlMLSZpoxZ3Ra9hcixI7EIm3apsjbfqrvi+XsRlw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rMH5z44fwRvA4PLZ0uWh1XfrI1Ofxun0F8L1fzTjxRDqfzCBZq38Z5v9gPwX69r61Qnr3DnTYLfQIt2DoTrdShnKEITm8OJvg39ehBVsWICdZvZnf3pztsyKspl3ElZLhgtXgOfWHk9X8NpMixGr2qxjG2D8OSov7fn/8DoHe5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=tRRWk4sk; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=jY7+NlFV; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="tRRWk4sk";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="jY7+NlFV"
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1788421100;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IXgMeHW2Ljzg4Fdzw6/9muy1ZzZpBfRtq04fn6Kd1UY=;
	b=tRRWk4skfPhRDZnTHT3V2CDgdLy7fo2jedsxBQGvwB4XTw/e3ybGyW8mMH0rRE/ByMLn80
	HUWzaLcYuIOGkaJZvJHQaMybUBtK181uh1WVVCIRSCH4tpyR2sPAHLtm2HufWlBhceH5Op
	DgJ0gII2B3OXAK2ZYayWkc5l4+487onPc0LFcqAwfni1AD28BtUKKPXRZuXYUi1kzxHmDg
	fN4wNdoOl1ds7qFLfWdmgg6KmShzsWtQfJWNviJ192bjvVCGZAilmmdBUL5P+4yGzoXjbn
	LTehhVvn5wNGUyqD7poRsjuYDVnvL48SYcW5UIlphvhyD6airyHnKuiPcJudlg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1788421100;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IXgMeHW2Ljzg4Fdzw6/9muy1ZzZpBfRtq04fn6Kd1UY=;
	b=jY7+NlFVkYf6CbZW5ENvqj9la935CFLVT31UUV9mj36vpwKtvVrzhU9+nUbjnUFXDbUwFC
	TCmG2Xf/e2qivsDA==
Date: Thu, 03 Sep 2026 09:38:16 +0200
Subject: [PATCH v2 4/8] selftests: vDSO: vdso_test_abi: Use system call
 wrappers from vdso_syscalls.h
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260903-vdso-test-types-v2-4-1eec04eb3658@linutronix.de>
References: <20260903-vdso-test-types-v2-0-1eec04eb3658@linutronix.de>
In-Reply-To: <20260903-vdso-test-types-v2-0-1eec04eb3658@linutronix.de>
To: Andy Lutomirski <luto@kernel.org>, 
 Vincenzo Frascino <vincenzo.frascino@arm.com>, 
 Shuah Khan <shuah@kernel.org>, Thomas Gleixner <tglx@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788421097; l=1720;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=9FCxlMLSZpoxZ3Ra9hcixI7EIm3apsjbfqrvi+XsRlw=;
 b=9KHokY70A8GpdbURC4ZF8xhH9MDl4GOy+kanCSt3jl9cfOmYHVF+1I9IxW/+gm6fxww6q+zdk
 H6uyQbIrsyiAV+ZpfviIqhLKCFM0CLjgPMtml1oSoQWHHU27xXTvY34
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=

Using syscall(SYS_getcpu) is problematic for the reasons outlined in
vdso_syscalls.h.

Use the wrappers from the utility header instead.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 tools/testing/selftests/vDSO/vdso_test_abi.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/tools/testing/selftests/vDSO/vdso_test_abi.c b/tools/testing/selftests/vDSO/vdso_test_abi.c
index b7590a727f06..4f63582f4e65 100644
--- a/tools/testing/selftests/vDSO/vdso_test_abi.c
+++ b/tools/testing/selftests/vDSO/vdso_test_abi.c
@@ -19,6 +19,7 @@
 #include "kselftest.h"
 #include "vdso_config.h"
 #include "vdso_call.h"
+#include "vdso_syscalls.h"
 #include "vdso_types.h"
 #include "parse_vdso.h"
 
@@ -157,7 +158,7 @@ static void vdso_test_clock_getres(__kernel_clockid_t clk_id)
 	}
 
 	struct __kernel_old_timespec ts;
-	struct timespec sys_ts;
+	struct __kernel_timespec sys_ts;
 	long ret = VDSO_CALL(vdso_clock_getres, 2, clk_id, &ts);
 
 	if (ret == 0) {
@@ -167,7 +168,7 @@ static void vdso_test_clock_getres(__kernel_clockid_t clk_id)
 		clock_getres_fail++;
 	}
 
-	ret = syscall(__NR_clock_getres, clk_id, &sys_ts);
+	ret = sys_clock_getres(clk_id, &sys_ts);
 
 	ksft_print_msg("The syscall resolution is %lld %lld\n",
 			(long long)sys_ts.tv_sec, (long long)sys_ts.tv_nsec);
@@ -210,7 +211,7 @@ static void vdso_test_clock_getres_time64(clockid_t clk_id)
 		clock_getres_fail++;
 	}
 
-	ret = syscall(__NR_clock_getres_time64, clk_id, &sys_ts);
+	ret = sys_clock_getres(clk_id, &sys_ts);
 
 	ksft_print_msg("The syscall resolution is %lld %lld\n",
 			(long long)sys_ts.tv_sec, (long long)sys_ts.tv_nsec);

-- 
2.55.0

