Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 784CB31A55B;
	Tue,  1 Sep 2026 09:50:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788256234; cv=none; b=IZidhzBH22KSThe/q6MaO2H/xU2+NGbjY0wteX2Buj7eJVWQpPSpve4sNtqyrCiwLGILhczLTgGmwUr4D1vNlQ1X2urUnJMUrXJ+2zcqPiixMPzblzeN/K+otSL9UWviqYd0/JcDwHrkKdLEJfNbtho2stW0ar9JfNi+iwmBNTE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788256234; c=relaxed/simple;
	bh=g93HSTICGxrQAoIIj7ZqiWUqmvo1RPq0uwuH07mfHyk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=GdtcYK1SuGLxT6eJkVh4oF+IVzkJi9TR2cD9Cuhlo115B+emv49Z7PADFR2GGB/yNm9ckvx9FFH7zOCfuvF8k0iF7XMC7mb6z/l/FxHt6Ac8nV0DBq/rkU/TvxtF6N/D/sluS+BZaenOCnATt7BDpK4ZS7/g12DBBbfHvCxJe7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=jdtE3bzN; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=kaehcy+l; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="jdtE3bzN";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="kaehcy+l"
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1788256230;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ZZjGWeJsVTTKazBRnkQCiPWjdXKqCK3yXeZBtrnsmsk=;
	b=jdtE3bzNSTrREQqfWbzvwFxfLmGVQptEXbu4kgSwF7uRErtjDkqQMuD9t3lNXAsetCmJTT
	r0CkOn89+cHd7YZNs5EKgDv855VFvQ+ubxB9ntDO0qFbZdXKQVr9TrHQ5j/3j8clty0rx0
	drWgGKfQRE/jcs4Tp80KU8TwOsQ3Yt+Gm1NX4E3vE3ZwV+7eCE+MbcViR/A8vqFHCf4D/t
	csvlfcbxdxDoiRB0qZe3TIjWm8YMrTlryH4Wuc0Jq8/eIrxnmEMArlyQkhE2K6csYekWJv
	vRhpbvQdO+4SjmSwzh9S2OpBkUvEeQerL10pUu/rza4FgTqMQ1QdqXJmLFW9yA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1788256230;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ZZjGWeJsVTTKazBRnkQCiPWjdXKqCK3yXeZBtrnsmsk=;
	b=kaehcy+loJPAzpEsxdA4X3R1zazxI0tT2GG67IysJri2IEYp7n1l7dc7IhgBTxcHnntQ1k
	6MRBXoyIIyOfPHDg==
Date: Tue, 01 Sep 2026 11:50:24 +0200
Subject: [PATCH] kunit: Return void from kunit_run_all_tests()
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260901-kunit-void-v1-1-c91952391d66@linutronix.de>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDQwNL3ezSvMwS3bL8zBTdJKM0c8M081RLC4NkJaCGgqLUtMwKsGHRsbW
 1AMPkrldcAAAA
X-Change-ID: 20260109-kunit-void-b2f71f7e980c
To: Brendan Higgins <brendan.higgins@linux.dev>, 
 David Gow <david@davidgow.net>, Rae Moar <raemoar63@gmail.com>
Cc: linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788256229; l=2098;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=g93HSTICGxrQAoIIj7ZqiWUqmvo1RPq0uwuH07mfHyk=;
 b=U5kTVibJZMypvlBJLO/Re9+3Sm6IU4X706d/mm92lH8qIHNnx7JZVIC08xiSMqP+M9k5TSFc2
 TdSzTVm9w3DBqo85smGIUllftfANI6n15qwmOpHk1Z62li7Qom66JZX
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=

No caller tests the return value of this function.

The integer return type is still a remnant from when the function
was executed as initcall. This usage however was removed in
commit 8c0d884986ba ("init: main: add KUnit to kernel init")

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 include/kunit/test.h | 5 ++---
 lib/kunit/executor.c | 5 ++---
 2 files changed, 4 insertions(+), 6 deletions(-)

diff --git a/include/kunit/test.h b/include/kunit/test.h
index da5312e0dfa5..31d549578f8e 100644
--- a/include/kunit/test.h
+++ b/include/kunit/test.h
@@ -400,11 +400,10 @@ struct kunit_suite_set kunit_merge_suite_sets(struct kunit_suite_set init_suite_
 const void *kunit_array_gen_params(struct kunit *test, const void *prev, char *desc);
 
 #if IS_BUILTIN(CONFIG_KUNIT)
-int kunit_run_all_tests(void);
+void kunit_run_all_tests(void);
 #else
-static inline int kunit_run_all_tests(void)
+static inline void kunit_run_all_tests(void)
 {
-	return 0;
 }
 #endif /* IS_BUILTIN(CONFIG_KUNIT) */
 
diff --git a/lib/kunit/executor.c b/lib/kunit/executor.c
index b0f8a41d61d3..c798a02470d8 100644
--- a/lib/kunit/executor.c
+++ b/lib/kunit/executor.c
@@ -371,7 +371,7 @@ static void kunit_handle_shutdown(void)
 
 }
 
-int kunit_run_all_tests(void)
+void kunit_run_all_tests(void)
 {
 	struct kunit_suite_set suite_set = {NULL, NULL};
 	struct kunit_suite_set filtered_suite_set = {NULL, NULL};
@@ -382,7 +382,7 @@ int kunit_run_all_tests(void)
 		__kunit_suites_start, __kunit_suites_end,
 	};
 	size_t init_num_suites = init_suite_set.end - init_suite_set.start;
-	int err = 0;
+	int err;
 
 	if (init_num_suites > 0) {
 		suite_set = kunit_merge_suite_sets(init_suite_set, normal_suite_set);
@@ -432,7 +432,6 @@ int kunit_run_all_tests(void)
 
 out:
 	kunit_handle_shutdown();
-	return err;
 }
 
 #if IS_BUILTIN(CONFIG_KUNIT_TEST)

---
base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
change-id: 20260109-kunit-void-b2f71f7e980c

Best regards,
--  
Thomas Weißschuh <thomas.weissschuh@linutronix.de>

