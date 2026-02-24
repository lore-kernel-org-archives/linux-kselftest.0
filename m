Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com [209.85.167.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0084379990
	for <linux-kselftest@vger.kernel.org>; Tue, 24 Feb 2026 10:45:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771929910; cv=none; b=dj7vbMYLEeMoJaRuwj1mny7x8n3JAq7DZ2XagYFwWyuaA38VV9upKKv91KrBl46SnnHwkvXhH5Kks3Vl/CFgcY7KkfmGTo2xqVh1bltBg6gLuu0xqGlGmwIQzbE+GsFC+s/jBCRr0cT0MJyS4Mv3YT71JVzdu35a9/5qq6W7Xv4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771929910; c=relaxed/simple;
	bh=4sWOiOmov7pXHesk/kMClarPFFoDVRWZZWw5FqizKLU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aU5nQRsLvkdtlX7SDOcjYUT6ILNZlPFgfB1iT9u7sS2s4YczidAulglV7YYtMJ8uU7CtuzuSL5zl/MByjlbOV4dV9FtKqaDpBc+n6kxv70Mgz/Svv38OQ2KV/6nChEGX2NCbxy/944mCK+0QVDaXVfwaV2xI3sUWTHznWLHB5Qg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fTMyVgJ3; arc=none smtp.client-ip=209.85.167.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fTMyVgJ3"
Received: by mail-oi1-f172.google.com with SMTP id 5614622812f47-45effa36240so3503665b6e.1
        for <linux-kselftest@vger.kernel.org>; Tue, 24 Feb 2026 02:45:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771929907; x=1772534707; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s0osYvSfuq+cEJNXKz69BQQO4P3x6o0j/TaGapvJ+PU=;
        b=fTMyVgJ3IrxPZmEE+If2O3VRFfJ1hT4FIMcjIJaSO8qqOVljRX5mFl/D0HP/7KxNoA
         XkhdUWhlIFvE2x5MRqyLa4/5mg47Hu02W9Z5HPe4UfZJjxnkH2ePNsCq5N46RJHLxd6j
         PUi0UsjGn3zr/UFIrdy77z1xkyr3hdk2Ploev4j7dhJ6rXHI9VHjybkZRR+K0lOuRaS+
         J3Q/fO/WfDBiBuU7srADiMX6L4nzOOV5Qqf4YfTosP+ZSApqMz7gyW5ve5fKNBsDtrCW
         yHYjPPAEyQ9x88dSKv6WYZYaPJpqrp9OsL11IQfSKsYQm9xR1a/eLCfN8/9OJZm2fDWi
         WBfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771929907; x=1772534707;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=s0osYvSfuq+cEJNXKz69BQQO4P3x6o0j/TaGapvJ+PU=;
        b=bUxxLz61HHjAv4Yk0F1JkfFzoyASMgXTSR/yz9qkCFWzCI2ddWOAuBv0Zn8au0cwqz
         BmRwqpHj6An7jNY0EhoxonWtIKJ7PljWgyRP4/DGqoNqu/4jPaG91M7597jLXOT95BdZ
         t9FaNfYpTVQ51B7lqbVNd8X1uo0Fr5suAxfuSJgubUUfn6xL5v7oWOCq1JaZN5W1oJ3h
         /IRT0STZzU+S96u0nLitT1kJirObqb6uUmQ3BPl6lXPhCu8uirqiSs5wnrfzOuvbrE3O
         +4Fg+gjimSU318pdqGTvfRUoiVle105m4m4OENSozGGNKPAvxPIqRD9ErAJQhTEPNzOh
         Rt2A==
X-Gm-Message-State: AOJu0Yz/h+RSVqdUkgVaVYCjyfG7EsyYeyzejsiHVw46MEfIkDsZC7LC
	qvg0EgxjyarUPNuavDUoRo6mChVfvgepXPT/WI9GNSqrRKsveawTt78e
X-Gm-Gg: ATEYQzw/P3xL+xrC9+WWmh9/FrJSZ2LKZb6p85kkwPvC1Ctk5eqmeDDIcuwpCGgMxbG
	aaggoUN7v/DgmTRnU+wE8jO+At1nNaPn/IRj9j/Atip3J95dbUxrvlOUfQMQ6EDXjwk6onJdPj4
	260rwTU4uFbyPvnsKZuXilEzG8KbPXFDXuL3VezfUyj9ckGQEKTUwJ1Q1p3ZR091REuXSOe9TpI
	K3RthI9ZoLDjj/exUcpUroNfneKbR7EHt9CLJ4bgQCx3JOwr7cVwMGDGGWkbSBIeze/gRYry928
	UjpGXM9CK2qE4+x//I/NhluAFp0Amj8+ofvnqdeG2TP8gP4+VLxqrTJA6CpdC1Ay+6Rhb58LQu7
	VLMpXR3VMFyJGmA2WFPFD/isEFlb++FjKZ/DboyksSuGj3w0TzKZAh/wwFnLOfSnbGY2pZ4jCTQ
	3xmxmr9hzOUAXZni1vsbmmbH6t/93gfMo4NV1eW8YHc3VhviFkFbUGoYZmaJ9LhQQpMKSYYKQ+K
	VaR1qA1UKKxv+9lw7HO/Ec=
X-Received: by 2002:a05:6871:4724:b0:409:5ade:7063 with SMTP id 586e51a60fabf-4157b103319mr7212812fac.32.1771929906635;
        Tue, 24 Feb 2026 02:45:06 -0800 (PST)
Received: from localhost.localdomain (108-214-96-168.lightspeed.sntcca.sbcglobal.net. [108.214.96.168])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4157cfa6624sm11210270fac.8.2026.02.24.02.44.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Feb 2026 02:45:05 -0800 (PST)
From: Sun Jian <sun.jian.kdev@gmail.com>
To: netdev@vger.kernel.org
Cc: linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	edumazet@google.com,
	davem@davemloft.net,
	horms@kernel.org,
	shuah@kernel.org,
	kees@kernel.org,
	luto@amacapital.net,
	wad@chromium.org,
	Sun Jian <sun.jian.kdev@gmail.com>
Subject: [PATCH 1/2] selftests/harness: order TEST_F and XFAIL_ADD constructors
Date: Tue, 24 Feb 2026 18:44:33 +0800
Message-ID: <20260224104434.14912-1-sun.jian.kdev@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260222111847.692325-1-sun.jian.kdev@gmail.com>
References: <20260222111847.692325-1-sun.jian.kdev@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

TEST_F() allocates and registers its struct __test_metadata via mmap()
inside its constructor, and only then assigns the
_##fixture_##test##_object pointer.

XFAIL_ADD() runs in a constructor too and reads
_##fixture_##test##_object to initialize xfail->test. If XFAIL_ADD runs
first, xfail->test can be NULL and the expected failure will be reported
as FAIL.

Use constructor priorities to ensure TEST_F registration runs before
XFAIL_ADD, without adding extra state or runtime lookups.

Fixes: 2709473c9386 ("selftests: kselftest_harness: support using xfail")
Signed-off-by: Sun Jian <sun.jian.kdev@gmail.com>
---
v2:
  - Switch from name-based fallback matching to ctor priorities.
  - Drop the extra xfail state and runtime matching.
---
 tools/testing/selftests/kselftest_harness.h | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/kselftest_harness.h b/tools/testing/selftests/kselftest_harness.h
index 16a119a4656c..afcba0c4e98d 100644
--- a/tools/testing/selftests/kselftest_harness.h
+++ b/tools/testing/selftests/kselftest_harness.h
@@ -175,6 +175,9 @@ static inline void __kselftest_memset_safe(void *s, int c, size_t n)
  *
  * EXPECT_* and ASSERT_* are valid in a TEST() { } context.
  */
+#define KSELFTEST_PRIO_TEST_F  20000
+#define KSELFTEST_PRIO_XFAIL   20001
+
 #define TEST_SIGNAL(test_name, signal) __TEST_IMPL(test_name, signal)
 
 #define __TEST_IMPL(test_name, _signal) \
@@ -465,7 +468,7 @@ static inline void __kselftest_memset_safe(void *s, int c, size_t n)
 			fixture_name##_teardown(_metadata, self, variant); \
 	} \
 	static struct __test_metadata *_##fixture_name##_##test_name##_object; \
-	static void __attribute__((constructor)) \
+	static void __attribute__((constructor(KSELFTEST_PRIO_TEST_F))) \
 			_register_##fixture_name##_##test_name(void) \
 	{ \
 		struct __test_metadata *object = mmap(NULL, sizeof(*object), \
@@ -880,7 +883,7 @@ struct __test_xfail {
 		.fixture = &_##fixture_name##_fixture_object, \
 		.variant = &_##fixture_name##_##variant_name##_object, \
 	}; \
-	static void __attribute__((constructor)) \
+	static void __attribute__((constructor(KSELFTEST_PRIO_XFAIL))) \
 		_register_##fixture_name##_##variant_name##_##test_name##_xfail(void) \
 	{ \
 		_##fixture_name##_##variant_name##_##test_name##_xfail.test = \

base-commit: 7dff99b354601dd01829e1511711846e04340a69
-- 
2.43.0

