Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 430033009ED;
	Wed, 28 Jan 2026 10:24:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769595881; cv=none; b=N1rTs/HDz3FcCy2vphk9cugwtYORryFooITkMkQmDRN7NKn0nsLTuBxPbw3QPFD5Wk60bVPFyld+GLJ8DhjOPy4bOdveE0yFyBvCQhe8GE/cfNQ4C2VUYoCNHmrc9YoTRU7ZM0siChBNnDvnqMiXbUarVKT5aWZZAq5Q/nE743w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769595881; c=relaxed/simple;
	bh=JAGIyo7uHu02wmsXenqxKdWTtyrL5SRUkDJGKs429A0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=M5MJ/PJEbrl9cR4R88/8jlEMAAhDu5sqCKz9nKLI1T1S/86g3veTMLS9Yo2GpuZNeIHMFQ7y1dziZRneCmifDdup6I0Oupcwv/H0gU8LIyFScVWNW6+2Nqs61XWYCUDIFTf+oISjj983jV5CYlTzR3u1Cq/bpcOC2t+ai2FPlKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=vnGQqd4T; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=sy2cBbOy; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="vnGQqd4T";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="sy2cBbOy"
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1769595878;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=h094TGqPdEZdGAE351vHcgY/GUuHvPkqMcFJn5StH3g=;
	b=vnGQqd4TIMQA4f/lokzkyL6N2j9vUSaLUoulNOSfngyatZhywvVfVXlseYwb/RgjsAU8Yd
	JFwq/bRy/PQl7TFaM8Yikx2Bn2QMX/c3fUW6a+Lf3ltrX3AUePI3GDbOaP/HuBzR0OgP9n
	bKkCVKtWo0SOR+QrRLSh+hhLtN57cfU+eRvFrIsJ4MMnyqByGZsS12m73s2XjLjlAS3Tbj
	5LNMVudd4jPhDLJNqhXwgwMzGV/b4/fR4Jjzg5n0IEFJPUPCYEC9fU4uOB9do3NwDFKKlD
	m4VAzSLHrazKDw3swRr0HNO/D0Bd23OGYI/F24CW7MRqVmEmgX757wuCLzKjHA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1769595878;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=h094TGqPdEZdGAE351vHcgY/GUuHvPkqMcFJn5StH3g=;
	b=sy2cBbOympleZ3QCQldQmqJxEMsKt5FC9HPivAVaalXBnS9Z/Ws2ACwYs6sfpOLYjuyxK2
	uJ8uU1yUnVa2CuBg==
Date: Wed, 28 Jan 2026 11:24:36 +0100
Subject: [PATCH 4/5] selftests: harness: Detect illegal mixing of kselftest
 and harness functionality
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260128-kselftest-harness-v1-4-cb259fa81cd0@linutronix.de>
References: <20260128-kselftest-harness-v1-0-cb259fa81cd0@linutronix.de>
In-Reply-To: <20260128-kselftest-harness-v1-0-cb259fa81cd0@linutronix.de>
To: Shuah Khan <shuah@kernel.org>, Kees Cook <kees@kernel.org>, 
 Andy Lutomirski <luto@amacapital.net>, Will Drewry <wad@chromium.org>
Cc: linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>, 
 Yuwen Chen <ywen.chen@foxmail.com>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769595876; l=1714;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=JAGIyo7uHu02wmsXenqxKdWTtyrL5SRUkDJGKs429A0=;
 b=qz7K87evmY5YXplIseWpn7JYDZEPgT/YRPNft+DjLNg61Q2lYsS6nngaB9X3uoB7NVIvU0SVT
 681Im/e5Lv4DSdd3hs19A23F8mynIHHBABBqw4aNLVLmnLjjrsUTcaa
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=

Users may accidentally use the kselftest_test_result_*() functions in
their harness tests. If ksft_finished() is not used, the results
reported in this way are silently ignored.

Detect such false-positive cases and fail the test.

A more correct test would be to reject *any* usage of the ksft APIs but
that would force code churn on users.

Correct usages, which do use ksft_finished() will not trigger this
validation as the test will exit before it.

Reported-by: Yuwen Chen <ywen.chen@foxmail.com>
Link: https://lore.kernel.org/lkml/tencent_56D79AF3D23CEFAF882E83A2196EC1F12107@qq.com/
Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>

---
This is intentionally a Link tag over a Closes tag, as the real fix will
be to the selftests.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 tools/testing/selftests/kselftest_harness.h | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/tools/testing/selftests/kselftest_harness.h b/tools/testing/selftests/kselftest_harness.h
index baae6b7ded41..93dcba095338 100644
--- a/tools/testing/selftests/kselftest_harness.h
+++ b/tools/testing/selftests/kselftest_harness.h
@@ -1216,7 +1216,16 @@ static void __run_test(struct __fixture_metadata *f,
 		t->exit_code = KSFT_FAIL;
 	} else if (child == 0) {
 		setpgrp();
+
+		/* Reset state inherited from the harness */
+		ksft_reset_state();
+
 		t->fn(t, variant);
+
+		if (__test_passed(t) && (ksft_get_fail_cnt() || ksft_get_error_cnt())) {
+			ksft_print_msg("Illegal usage of low-level ksft APIs in harness test\n");
+			t->exit_code = KSFT_FAIL;
+		}
 		_exit(t->exit_code);
 	} else {
 		t->pid = child;

-- 
2.52.0

