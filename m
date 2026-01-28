Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 613217A13A;
	Wed, 28 Jan 2026 09:05:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769591116; cv=none; b=RWCRrjVLeAFJTcSgZNf2RYgIRC9RBGYHpzNXx74fK7afA8s78BP/od2ULs5KJcdVrAm1r1tLSyW+M3K5xLf6TDp14Tkf60VpVg56GmWuWgWI5uWTgZaRoC2vCHBrSMni9+9g8UpATFfKWD0r8ldsDxj2eKLU6Jh1fqBHC72A7oc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769591116; c=relaxed/simple;
	bh=4MpmloK2IkTMXQTxD36cXCNYLKJU7nTWbURy9RPxOE4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=disyEaqD/7wxHZdPt6CCh4OM8LFG3fNKx/MV83M9s5AJ0iwy5k9XgjpyF5dfPA48PcG4tIodzzkMgZIRjyKpw4kSZ9jDfOmtglQogpzutgMhgWkDF1lLaD5FFEu93FC6tgYr5aOTTtN+Tlrz2eKVuWlPf1w0RZ6+WCYb5NXZ/0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=t5tOpZKu; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=mblVI3Vn; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="t5tOpZKu";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="mblVI3Vn"
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1769591108;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=BBuKoipavT94L21ZMZdpu5yukNAdTqVjx30LOj8GfJ0=;
	b=t5tOpZKuus4cXnqmC4dIa3jZBUgZ0V3d81SCB1Qvk5CRRcef48Wox7oMfQIxQikOna44h9
	Ek6Cb65vcccVaQ03oxEs3kGWSmokBZpnBGbvd8d2IotYYrc1QF2tcQfsoCXFz82Vdz5KN8
	vV4OMCyxUgLI4d5fcBUyObGWf7iMrwJsRgDhZXq7dwbFT8HIptJElwQ4llzMB7VoYB3f5J
	QFZ+Q5sFBdXnzsCM9Brs5Q5UpBz0AU2lOdqmGCfrbMMqqx0P/5KX0CY1W/KycpPpAr3Cd+
	GGse/VXC2NhqFyScgdFn9nnVEE/gnRV5gyewLNyj9PLozoPzh0ZKyCDR/Qiz/Q==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1769591108;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=BBuKoipavT94L21ZMZdpu5yukNAdTqVjx30LOj8GfJ0=;
	b=mblVI3VnbHL03d6wknjGS98AG05mHvzSyn23qn3HnuyqYdcy+jfo46uUVYBXpMWfoBNu5s
	f0SpPBwhP3HuzfDw==
Date: Wed, 28 Jan 2026 10:05:05 +0100
Subject: [PATCH] selftests: runner: Avoid spurious warning about missing
 failures file
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260128-kselftest-fix-failures-file-v1-1-b58072c66317@linutronix.de>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MQQqDQAxG4atI1g1oBBl7FeliOv2nDQ5WJloK4
 t0buvzg8Q4yVIXRtTmo4qOm78XRXRpKr7g8wfpwk7QytJ0Eng0lb7CNs345Ry17hTkKONz7MIy
 SJPaJ/LBWePS/T7fz/AES1AtgbQAAAA==
X-Change-ID: 20260128-kselftest-fix-failures-file-8b38692c2a3c
To: Shuah Khan <shuah@kernel.org>, Brendan Jackman <jackmanb@google.com>
Cc: Shuah Khan <skhan@linuxfoundation.org>, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769591106; l=1209;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=4MpmloK2IkTMXQTxD36cXCNYLKJU7nTWbURy9RPxOE4=;
 b=clxQAX9vIVaO+ZYBF4uGomTDHEOuuhDb8pWi0gV8Ib/3uzbxoFOmsOV4UCkcvnyO483jSGhDF
 WRIbQ05X7rCD5VQJEAYOTapayobcLTf+ui87s8s+QfnoGePhaBVhtq3
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=

When runner.sh is *not* executed via run_kselftest.sh, the variable
$kselftest_failures_file does not exist. This triggers a harmless but
annyoing warning from runner.sh if a test fails:

tools/testing/selftests/kselftest/runner.sh: line 50: : No such file or directory

Silence the spurious warning.

Fixes: d9e6269e3303 ("selftests/run_kselftest.sh: exit with error if tests fail")
Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 tools/testing/selftests/kselftest/runner.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/kselftest/runner.sh b/tools/testing/selftests/kselftest/runner.sh
index 3a62039fa621..1eb935b6f790 100644
--- a/tools/testing/selftests/kselftest/runner.sh
+++ b/tools/testing/selftests/kselftest/runner.sh
@@ -47,7 +47,7 @@ tap_timeout()
 report_failure()
 {
 	echo "not ok $*"
-	echo "$*" >> "$kselftest_failures_file"
+	echo "$*" >> "${kselftest_failures_file:-/dev/null}"
 }
 
 run_one()

---
base-commit: 6e39903c73df08b256322d04c4dfe4a82ec63a45
change-id: 20260128-kselftest-fix-failures-file-8b38692c2a3c

Best regards,
-- 
Thomas Weißschuh <thomas.weissschuh@linutronix.de>

