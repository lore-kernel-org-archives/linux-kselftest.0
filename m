Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 583CE32D0FC
	for <linux-kselftest@vger.kernel.org>; Mon, 24 Aug 2026 13:32:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787578363; cv=none; b=HQ+V2yO22+Zg0clmYViGvKOSyGJ99Qq3cK0fsH9zjZSUft+nAXkggROyiAvog/KrLwSx8FJJgn0VNDyXjTZzMjfRxqfFSK16SzPKlpff+bG+Q6yCwREESghDOVSHasRLRp0pbGcVyvBQxwQPVUSEyGmW6datjz/vWR+4h9ya9wg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787578363; c=relaxed/simple;
	bh=BMm/D+92KohjIhMn3W0NfZFT9jPV1Xow0HI6rE4BsoA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CQVrWuQ7t0p4dqoX6b63+99KrqWfXfzxm4Djs5pq4/xSGbw44pGsaaYHgJg0lg9bqAJIB8GN0vW2wimkXrWeaVp9EilsV6hkxApb8OjKwyEX0zNiCidK1Jtc+G7A5gtYCaV1HZKxPWyBIS3bRMbxUdT3O8Bd1dW6PuIwlnhN4mE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X73Hk6kR; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X73Hk6kR"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-6a17cb94b26so6595165a12.3
        for <linux-kselftest@vger.kernel.org>; Mon, 24 Aug 2026 06:32:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787578358; x=1788183158; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qCd9ogdP+10eYPCwT1duiz6StUC+972KZLg0HwZ14BM=;
        b=X73Hk6kRlKmSGRvl0UmKPAUFAEPJ/HO5Cmzo0Zzhh+NOAbyrbeSVzekl2MPtSrRRTI
         oJCtROpFAZy39xa2X6a+XFiIuCo2U4tYjqt7RD9fmnZXyJANk4TeaGcgabSJ0AZW9Ytx
         N+eq06f2Cs8f3cFmUQ9e82av2evHR2DlB/4+bNZvgp433djnux+pUsbQUAxzA16uFdm0
         wCCS/+5NuI470B2tIsNY2tHjLF6230JE/xApj3BH8OLsE/jmKttP8dfRYkSwjOaGAjjW
         T2q2iyLu9k7WRIrzUaQzwCYvg0CWo9ZTjwgMYlyrcYx4xzDyUDu/wTKXKkX3MoO2+Kle
         aBKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787578358; x=1788183158;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qCd9ogdP+10eYPCwT1duiz6StUC+972KZLg0HwZ14BM=;
        b=s2XpQYFJW02BgtNobkusjDsNR6LHco11vDWGo4vUI+mIivWAfsH9/CmdKnqNUT/W5R
         GRGey+CvVHzZ8KwCjOmjc3hsiCmre1We2KWvormbPm6LppjG/Ak3wO3hfVsMxLr6whLL
         V7pGG34VduqM61xl+FcsytZQqZaa9Br6KejbE9T52xtqmmOJpu86eS9huKlBBpoJGHIR
         zbbzhpGUwgjr0FcaO3xV4xBSHdZ2n8+8gq4FDQWDW2RCuFRCX5cM22Jv/BEgIuZL0JsP
         6kZUhoaFwgSsOuwTRKqwUip172/SaCIJns8lN2FJXV/TKrg+R4OYZey67uoGVlQ/1TXq
         60+g==
X-Gm-Message-State: AFuF++nVcOrnEjp45BKvKd0apTZSmXrhEnyyYurVe1gD2g29jXuqNWid
	blZSrASSIF8x3Vkp19akyoN7KJt4HQqO/GTZFYLgETg5BkpRPuWDC0ix
X-Gm-Gg: AR+sD105JI0vg3QEB6ETrfea8RH58+w0zhWuHMys3ry6IF/AtEfOv1aCy0aCk/vpwCt
	zq7ZR//e154GflvU2+yKHy6jFV6HVDhke77k/3JXGyYYTOR/LNKhBj9ZWpBwuYkh2pN4SBn8T6Z
	9IecPM/zAKM3QmK+TL/8FIvaBtNDhS7UF02OX1MhN6VE+S3FjahcGntpe4GNPaFvZKfzjxRqFXS
	mpjOgDDzCwwl3nKbiA1G/FQpu6ZlQ85UOhQqspbFgi+yeTDs9FAe9Sauw5wAbmRKIbEOMPchpi9
	xTTlx/7EjJ3qfuh8TJm4PMhThRjuPOTTQAusfm58jNWxBL8aR/va+NwSKrp1+9h0jN0R33JE3Aj
	VPx2jf/KR0++0b3X246H2B0i2XT+4qwrzc2lvPNeXLKBqBhnx+k6gETOFX+t6ITie8BhVEdObb+
	uvXmPVrToZM/ozJnRna5A1rhrkoeS0pMvY0CF8bPNMbBgPWSgu5qBBeKyUo2Q+oVCo8+emlNP2W
	CXgbSVeXa5b3daEIfTEoqmv
X-Received: by 2002:a17:907:1c18:b0:c20:88a6:8210 with SMTP id a640c23a62f3a-c246a4f0b8cmr3078721166b.9.1787578358109;
        Mon, 24 Aug 2026 06:32:38 -0700 (PDT)
Received: from [127.0.0.2] ([195.100.225.50])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c24966f8f2asm1313492266b.36.2026.08.24.06.32.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 06:32:37 -0700 (PDT)
From: Malte Wechter <maltewechter@gmail.com>
Date: Mon, 24 Aug 2026 15:32:31 +0200
Subject: [PATCH v2 2/2] kunit: add KUnit test to assert kernel state before
 KUnit suites are run
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260824-lockdep-kunit-v2-2-36a6fec9f72e@gmail.com>
References: <20260824-lockdep-kunit-v2-0-36a6fec9f72e@gmail.com>
In-Reply-To: <20260824-lockdep-kunit-v2-0-36a6fec9f72e@gmail.com>
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
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>
Cc: linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 Malte Wechter <maltewechter@gmail.com>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787578351; l=2612;
 i=maltewechter@gmail.com; s=20260812; h=from:subject:message-id;
 bh=BMm/D+92KohjIhMn3W0NfZFT9jPV1Xow0HI6rE4BsoA=;
 b=wtZ/QA57BgH0s+WicRIuLyTQh70Xs0NsSgzHTe6QfLwpfcGol8xLQbN5UxHK/lxtsGAzBpcTx
 0P0ioPFye0bBemufbNawEGPE6BUq/J54ydkAUaFRzwPrhbh2HI8H6Sw
X-Developer-Key: i=maltewechter@gmail.com; a=ed25519;
 pk=Ta/JQQMOW0Cbxp+yEwWqWFEyKFRyuQeSoYicwD7yvWI=

add pre-defined KUnit test suite and test case that asserts both
`debug_locks` and `TAINT_WARN` prior to running any (user) KUnit tests.
This asserts integrity before tests are run.

Signed-off-by: Malte Wechter <maltewechter@gmail.com>
---
 lib/kunit/executor.c |  8 +++++++-
 lib/kunit/test.c     | 30 ++++++++++++++++++++++++++++++
 2 files changed, 37 insertions(+), 1 deletion(-)

diff --git a/lib/kunit/executor.c b/lib/kunit/executor.c
index b0f8a41d61d36..0db67fe7f09f9 100644
--- a/lib/kunit/executor.c
+++ b/lib/kunit/executor.c
@@ -290,9 +290,15 @@ void kunit_exec_run_tests(struct kunit_suite_set *suite_set, bool builtin)
 	size_t num_suites = suite_set->end - suite_set->start;
 	bool autorun = kunit_autorun();
 
+	#ifdef CONFIG_KUNIT_EXTRA_ASSERTS
+	size_t num_suites_plus_extra = num_suites+1;
+	#else
+	size_t num_suites_plus_extra = num_suites;
+	#endif
+
 	if (autorun && (builtin || num_suites)) {
 		pr_info("KTAP version 1\n");
-		pr_info("1..%zu\n", num_suites);
+		pr_info("1..%zu\n", num_suites_plus_extra);
 	}
 
 	__kunit_test_suites_init(suite_set->start, num_suites, autorun);
diff --git a/lib/kunit/test.c b/lib/kunit/test.c
index 99773e000e1b7..e64c6d1575280 100644
--- a/lib/kunit/test.c
+++ b/lib/kunit/test.c
@@ -835,6 +835,30 @@ bool kunit_enabled(void)
 	return enable_param;
 }
 
+#ifdef CONFIG_KUNIT_EXTRA_ASSERTS
+#define DEBUG_LOCKS_OK 1
+#define TAINT_WARN_OK 0
+
+static void pre_kunit_assert(struct kunit *test)
+{
+	KUNIT_EXPECT_EQ_MSG(test, debug_locks, DEBUG_LOCKS_OK,
+		"debug_locks are off before any test ran");
+	KUNIT_EXPECT_EQ_MSG(test, test_taint(TAINT_WARN), TAINT_WARN_OK,
+		"kernel already TAINT_WARN tainted before any test ran");
+}
+
+static struct kunit_case pre_kunit_assert_cases[] = {
+	KUNIT_CASE(pre_kunit_assert),
+	{}
+};
+
+static struct kunit_suite pre_kunit_assert_clean_state_suite = {
+	.name = "pre_kunit_extra_asserts",
+	.test_cases = pre_kunit_assert_cases,
+};
+
+#endif /* CONFIG_RUST_KUNIT_EXTRA_ASSERTS */
+
 int __kunit_test_suites_init(struct kunit_suite * const * const suites, int num_suites,
 			     bool run_tests)
 {
@@ -857,6 +881,12 @@ int __kunit_test_suites_init(struct kunit_suite * const * const suites, int num_
 	}
 	static_branch_inc(&kunit_running);
 
+	#ifdef CONFIG_KUNIT_EXTRA_ASSERTS
+	kunit_init_suite(&pre_kunit_assert_clean_state_suite);
+	if (run_tests)
+		kunit_run_tests(&pre_kunit_assert_clean_state_suite);
+	#endif
+
 	for (i = 0; i < num_suites; i++) {
 		kunit_init_suite(suites[i]);
 		if (run_tests)

-- 
2.51.2

