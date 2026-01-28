Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 788E52E8B6B;
	Wed, 28 Jan 2026 10:24:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769595880; cv=none; b=o5yMW1fPtEkGcqbBsnpVmyCqIuVM345zChMcUFa1vOl5hCr7+2fofHMt/a0NMTA+YDUJPtot5AJNBwvijuL1kuYmtZtT5P4f3takkax8Q+5RYy5nIc93N11du8q0yQ8swV0e3Goz1dBaR+RvWUCYCmCPWNgoj+0o38tub19Ki5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769595880; c=relaxed/simple;
	bh=4ZP43tZBP/y5Yypr+B35Tkwkx6rebvs59GV2Y/mc/oY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fNAeT4mmIt+WhHTtOxG8NzWcjya6SWBShEPS8fwnM9SeEJAHUvBzOSgzMdqFjb44rzdtC5oMyAX0zSXtxNSdhDdsQSnVwakBr/g/y8koP86fNcsr9tFroo/AjWSRzW1ypmwn0Ak7d5/FYZs+/jzfZE7hAokDvQjJGpDsflOvwy0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=z3KMfhLn; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=AR67r/rL; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="z3KMfhLn";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="AR67r/rL"
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1769595878;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2SATdtGSdXWpcc4Jp34tPsqDMd+6GlgQIVHuGtJoCT0=;
	b=z3KMfhLn+cQ//qgy2hjduXRJcp3RLy0Az4WP1kqQgHmkUre1nM5m+Q67DRC/ilmrkZj0yw
	5BVQjOGemM+QdDpRgwZsHXcOLuq83/zi/yPLOyL04WkyUh3yDDZ/XD926eD3ZphfN+kpF6
	onemXA617PB+bzASEO9P9YTk64coebzegd/V2hm8IdlpSuEDUK51sDJ7ICx/Vb5PVtXe7o
	mIFW3WZLPQKN0+jDMygtq/BgQ+GmrQWC3MJZH4v5ttalVQwXPqLVI0LiWMX3fqa2m1jyhs
	J2wiYaCymojGIIBqCxOMUBiRMQVUF/KQKUuEClM1Yjkc0EvPv1ungwa+kGngdg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1769595878;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2SATdtGSdXWpcc4Jp34tPsqDMd+6GlgQIVHuGtJoCT0=;
	b=AR67r/rLLYVtQAXvmPMGnGos+5r27gE8UTd28HP63knqWuwl8xL10amlj0TGOEg+4ypU9c
	/zjwGx8qizJqolBg==
Date: Wed, 28 Jan 2026 11:24:35 +0100
Subject: [PATCH 3/5] selftests: kselftest: Add ksft_reset_state()
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260128-kselftest-harness-v1-3-cb259fa81cd0@linutronix.de>
References: <20260128-kselftest-harness-v1-0-cb259fa81cd0@linutronix.de>
In-Reply-To: <20260128-kselftest-harness-v1-0-cb259fa81cd0@linutronix.de>
To: Shuah Khan <shuah@kernel.org>, Kees Cook <kees@kernel.org>, 
 Andy Lutomirski <luto@amacapital.net>, Will Drewry <wad@chromium.org>
Cc: linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769595876; l=948;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=4ZP43tZBP/y5Yypr+B35Tkwkx6rebvs59GV2Y/mc/oY=;
 b=kqapdEEqQYE+DbVelXPSl3LOIGh3diiACKBB/m9KMAsPHMoL027PHGNThykwY8F2C5u7Su8Jy
 IWfeQKtl0ZKD1CYixoSqPQHRF3Lc7nYLFbwKDnhzZyPtpi+hzH9N30g
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=

Add a helper to reset the internal state of the kselftest framework.
It will be used by the selftest harness.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 tools/testing/selftests/kselftest.h | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/tools/testing/selftests/kselftest.h b/tools/testing/selftests/kselftest.h
index 1e7e73f77fa7..7979d6904ac6 100644
--- a/tools/testing/selftests/kselftest.h
+++ b/tools/testing/selftests/kselftest.h
@@ -476,4 +476,15 @@ static inline int ksft_min_kernel_version(unsigned int min_major,
 	return major > min_major || (major == min_major && minor >= min_minor);
 }
 
+static inline void ksft_reset_state(void)
+{
+	ksft_cnt.ksft_pass = 0;
+	ksft_cnt.ksft_fail = 0;
+	ksft_cnt.ksft_xfail = 0;
+	ksft_cnt.ksft_xpass = 0;
+	ksft_cnt.ksft_xskip = 0;
+	ksft_cnt.ksft_error = 0;
+	ksft_plan = 0;
+};
+
 #endif /* __KSELFTEST_H */

-- 
2.52.0

