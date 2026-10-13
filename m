Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75B004BD35B
	for <linux-kselftest@vger.kernel.org>; Tue, 13 Oct 2026 10:22:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791886957; cv=none; b=e7OtZwjL4K4OBvkTgX/sZWMSzVih4Q9tR9KdcnoUYkK2bqnywT6kYPiWH+/pwiASGObEXQaU9rW8JVufy8lBfYWL2EZk5jAq8XtWY7Q4fK7vX+43PPgurQ6nXj6I0sK/V+zsAiB4rMcdffROg+JGRTYZGflNYHt7jajaXpgbVJ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791886957; c=relaxed/simple;
	bh=93xC3/upfsa/twJxPDQzew/ko1gX/yS9rNw89pYITeg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CVZY7XOf8lDK1LXEcJXOPl3UQXcacah3syQXuCeQCM/YJy4Cof4Vvyd3anmMa3Escgw0f6y3mgoTJDSqCEr7P3bWkH26b9CmFKkzYKw54IUKqnL1MoDH+hX8/6HMW0Scbd5sAN2b7eN73ffKO0CUkE3E7MKS+e+Q8xuiIYDXBZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SfIh5/+S; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SfIh5/+S"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-6b1af232df4so2168401a12.0
        for <linux-kselftest@vger.kernel.org>; Tue, 13 Oct 2026 03:22:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791886954; x=1792491754; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=q7clhEis3l5vh76pGdzr3b2EmsBU2JfvAO16ToGyoS0=;
        b=SfIh5/+SkjKmQ2Jh7X15wUMX2+aJ1bixo8jnJPeY889SzYyu8GNbSYLL9RzQzyTGL2
         ksTsiI6J/b46ZKJhH0WtyJhc84U7JQl+V34r08MkvpceFaGo7wj75d8oIm/jeGQLIcN0
         KPdkF1WdMPMBQDXPHg+5+2rFWo8YYX2Nc+02gQkjriD5vpLQr4jIzvJ22/b2w+RNfLqA
         fsCCNE6ga+td5Uwt1vDvJYm7RuvDri4MKTpcBofZAzaNFnoCPV58JrdossKDtLn2IC2p
         3vv8g7QDpEpHcZRYx20lIuS+LHMqCxMAW8vIMMtScKkY/HkUUCxm2hj86w4yC7dvyN1B
         +b7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791886954; x=1792491754;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=q7clhEis3l5vh76pGdzr3b2EmsBU2JfvAO16ToGyoS0=;
        b=PXiaoetnGIRDq2UJ43Tm09qufOlfVz0ErAfXQ8Nn+mp8V4wP/jR0yQHY9s4fG8SokK
         /Rz8XrFtKT0HNQXYYszLpzbwuCaXTjL1XCSbfJyTAeb7sjR4WkKT9xHX9OzJ7t9dThbm
         hq5N94vOfbfJzcLtpuB2APhtLX9DwPM1Eiv5KLXSa7onmOYItsnP+XKVWlydkDw+Qx+4
         kzX7plfrRsc8+cRc4ZY8kTe1agb4DFNgDP46aXrrCxPZXVupwPkiZFmbSJ6AXHRemmio
         e0fi9BzamVbdypFlFjwlIKhaC6jAYFNUvEMcglLNZm5V4CzgAU1LgBpC8yVXbJCvhjXp
         0CdA==
X-Gm-Message-State: AFq9FYJ6V2wR0jXuZu6sAwqrBScyH5tZAEZERsHjPn0FyvSu4zWTiJSH
	PZQhvBplvTcCPsxgRWCJ+GV2NYOYa5MkK6H/ba0DLmSxKj4Qp0umT8oe
X-Gm-Gg: AYBFou30Q6tBY4gDPI0S+F64lEjC9B49CrYkfJUvip8GPhhjuc1BWRDcAYzQrPQXuvn
	C4zt7wtcqWnO8Dd5rVXj8HSv+AtW6yyd7KOvcUjnJ/EEcOBJRHu6NQmq4dXTbj3Fb5TKCxZFeOn
	1tL11Fd98rpnNYCXkIjjXaqqQi8v92iLVuXX5jCwmtknPNLkEybyyNxYSUz2yZ9Ag+Fp8ekoFUo
	CC0degOMViUDQgVut82eaPXMs/CzR+AqwbCVQLMHwC56aZB09ioTEhVGy/iNfGKA0ENLtSeJ3L6
	AHs8pcmYEVAqn/aVJx4UOiJRLiH8jkTY7NUWq7+wTCLkt+wQBCvAptrDYyizdLqDBBCwXYPk9Yx
	/nDnaH/zinxmL4DAc6y3kOR7tunY+JYreU0qsCmhJ4jer4gfPvC5nNTob3853zAA1L3G1AxO4Du
	QRcX7V3zhHt/JtHzt1LELRXPgWu8zv7xZcrQ9h4rqmldsBb40qDhdC2l2ksezQS3GC/dFH5nlf1
	c/3Dcs3rla+bZplc3a8V7FmPcMsaFLq5To=
X-Received: by 2002:a17:907:2da9:b0:c31:82aa:dd47 with SMTP id a640c23a62f3a-c31aa017e24mr1179807566b.44.1791886953580;
        Tue, 13 Oct 2026 03:22:33 -0700 (PDT)
Received: from [127.0.0.2] ([2a05:f6c4:d34b:0:eb4c:5610:e9e4:9d1e])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c34d011dfccsm230739766b.42.2026.10.13.03.22.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 03:22:32 -0700 (PDT)
From: Malte Wechter <maltewechter@gmail.com>
Date: Tue, 13 Oct 2026 12:22:23 +0200
Subject: [PATCH v3 3/4] kunit: add assertions for TAINT_WARN inside of
 kunit
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261013-lockdep-kunit-v3-3-cdb8ff720c1f@gmail.com>
References: <20261013-lockdep-kunit-v3-0-cdb8ff720c1f@gmail.com>
In-Reply-To: <20261013-lockdep-kunit-v3-0-cdb8ff720c1f@gmail.com>
To: Brendan Higgins <brendan.higgins@linux.dev>, 
 David Gow <david@davidgow.net>, Rae Moar <raemoar63@gmail.com>, 
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Tamir Duberstein <tamird@kernel.org>, 
 Alexandre Courbot <acourbot@nvidia.com>, 
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>
Cc: linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 workflows@vger.kernel.org, linux-doc@vger.kernel.org, 
 Malte Wechter <maltewechter@gmail.com>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791886944; l=2647;
 i=maltewechter@gmail.com; s=20260812; h=from:subject:message-id;
 bh=93xC3/upfsa/twJxPDQzew/ko1gX/yS9rNw89pYITeg=;
 b=E4/SRkMIxWTOqpH4QGDb4bSD8sDdigI2DpKpj0JtUUCDX40gIqrqWG97Yt2KATqvDlHYDk5dB
 oaUWhab4BnzARRDlv8e6XKVuv0jCqx4cBBdD2bwv/9iyL4HDhSSiFpD
X-Developer-Key: i=maltewechter@gmail.com; a=ed25519;
 pk=Ta/JQQMOW0Cbxp+yEwWqWFEyKFRyuQeSoYicwD7yvWI=

Assert that the kernel is not tainted with `TAINT_WARN` prior to running
a KUnit test case, and assert that it has not become tainted with
`TAINT_WARN` while the test has run. If this is not enabled,
writing and running KUnit test cases that trigger a `WARN()` does not
fail the test if the test itself passes. If enabled, it marks any test
that triggers a warning as failed, and forcefully skips all proceeding
test cases, since the taint cannot be cleared and the kernel is now seen
as unreliable.
The assertions are gated behind `CONFIG_KUNIT_FAIL_TEST_ON_WARN=y`

Signed-off-by: Malte Wechter <maltewechter@gmail.com>
---
 lib/kunit/test.c | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/lib/kunit/test.c b/lib/kunit/test.c
index 1292a0799c33..6d6f1e947db5 100644
--- a/lib/kunit/test.c
+++ b/lib/kunit/test.c
@@ -81,6 +81,30 @@ void __printf(3, 4) __kunit_fail_current_test_impl(const char *file, int line, c
 	kunit_kfree(current->kunit_test, buffer);
 }
 
+/*
+ * Fails current test if TAINT_WARN has been set (changed) after the test has run.
+ */
+static void kunit_check_taint_warn(struct kunit *test, unsigned long tainted_before)
+{
+	if (IS_ENABLED(CONFIG_KUNIT_FAIL_TEST_ON_WARN) &&
+		test_taint(TAINT_WARN) && !tainted_before) {
+		kunit_err(test, "Test triggered a kernel WARN");
+		kunit_set_failure(test);
+	}
+}
+
+/*
+ * Skip a KUnit test if the kernel is tainted with TAINT_WARN.
+ */
+static void kunit_skip_if_taint_warn(struct kunit *test, struct kunit_suite *suite)
+{
+	if (IS_ENABLED(CONFIG_KUNIT_FAIL_TEST_ON_WARN) && test_taint(TAINT_WARN)) {
+		suite->forced_skip = true;
+		test->forced_skip = true;
+		kunit_skip(test, "force skip: kernel is tainted with TAINT_WARN");
+	}
+}
+
 /*
  * Fails current test if test turns off debug_locks.
  */
@@ -487,6 +511,7 @@ static void kunit_run_case_internal(struct kunit *test,
 	struct timespec64 start, end;
 
 	kunit_skip_if_lockdep(test, suite);
+	kunit_skip_if_taint_warn(test, suite);
 
 	if (suite->init) {
 		int ret;
@@ -539,6 +564,7 @@ static void kunit_try_run_case(void *data)
 	struct kunit_suite *suite = ctx->suite;
 	struct kunit_case *test_case = ctx->test_case;
 	int debug_locks_snapshot = debug_locks;
+	unsigned long tainted_warn_snapshot = test_taint(TAINT_WARN);
 
 	current->kunit_test = test;
 
@@ -549,6 +575,7 @@ static void kunit_try_run_case(void *data)
 	 */
 	kunit_run_case_internal(test, suite, test_case);
 
+	kunit_check_taint_warn(test, tainted_warn_snapshot);
 	kunit_check_lockdep(test, debug_locks_snapshot);
 }
 

-- 
2.54.0

