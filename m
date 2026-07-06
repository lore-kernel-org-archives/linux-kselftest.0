Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A8B03815DE
	for <linux-kselftest@vger.kernel.org>; Mon,  6 Jul 2026 17:52:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783360363; cv=none; b=cpyR3IdeGJa4ao4f1hiOjq/Ud8sykLNiPIiPv59vv5AXbhvyFz3KNuWrN7A2bu2ee8/hVmp9vCMu5kdyJphREhiIhMgUdlkCPwe4w994Mz0NW60ww2j/zrrzyCiUTdi0271lTGKlsC4KEsHvK5DTrXWr7zXsG5oSDt3bNJv/wtc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783360363; c=relaxed/simple;
	bh=GnkKxSJ7Xk2y+xY1zEhFtkt9ZoxLrW9bqQv35sZxlOk=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=n16M1VULHfSYx13E/jxdlVlmcbr/cRQAxW/qx/XRPwUFKQYKShXRiRLW1n3iBvGmcqkh+9WJe5JcZsXnfd77tZwAlpla4kyqxj0kvgygXG17eqP3wz1GEyqO0eVUzAkf31Cgt8YLfB9VLQLZpmhQ2ZqVDldsXOvGq6bjbY1L96U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--dmatlack.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=DpoLDoZY; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--dmatlack.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="DpoLDoZY"
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-380ddac2b02so4881773a91.1
        for <linux-kselftest@vger.kernel.org>; Mon, 06 Jul 2026 10:52:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1783360358; x=1783965158; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=A6A8xAuC1RftYdiH1Z5a7OhOer4aDxqV+KFlphF++dQ=;
        b=DpoLDoZYDmmTo+b2AM3XF+WDTciuaa7t8ERLJ11PjCBASNj1/LT/biTZXj6NdAx+9g
         eo3kekwEByeCtyJ0mgL5rXrn1Svutqv+zJs3xuFltE63qTYhQ5SPWSoW+G3udMySPAn4
         4MGQwJmhcEJmnVz04kkt8BsvF2Vm4topDa28AenjGIQYBXlZr9d/P9mEj7F5RfHhstO7
         EshYohZojXPTsQZ8bO/bTiR/xCE9agG89qoWenthrKig6M3itqMuAfemKFudl2WqMOQI
         iKrINlT+CxUcEQGA4roMyjk4Du4r3haSJtimLh8E2/IOBYOfApm4sNr9VmyBq9qapAd5
         3CDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783360358; x=1783965158;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=A6A8xAuC1RftYdiH1Z5a7OhOer4aDxqV+KFlphF++dQ=;
        b=gwzgK2wKB4uL8/cPEdPABvcPSxf89AEyXgrJlirJ4w74FFagUErFFgxyYelDGtAeSN
         UM9YdG4c4jJRWwTNgmmc6VqMWV5Nh4/pfOB4hW4ECyXzasqo0EU8cF50h/y3ybiHwAQp
         5OyQ0KxJun38X0/oVIwBrON9G4EapkmkffH9cYui0yycbdV7ase5YyZ31YQ1P5SgLors
         wYN4Y/Fs51uYkBALRcw56o1pYcxhb78KQrFn5gVaPeI9tjpTdNLtqRHOVFu3eMfnyVOE
         kVCtdv2hmfYgfvq0kKe7pxEdPt8c9P1vRX0rGgjUejkgDdxnLORVRyZYAqpVjv2Z0lGV
         rgAA==
X-Forwarded-Encrypted: i=1; AHgh+RoU6w2QAmm/Dmoh3c7d0eyFVBoj/+FprrZut6yDxzTkRXZU14DmOBdynM+3RRPUtVoc/4n4Bqqpea7FwYsFgA4=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywao63YOILpjmfyeWotcWO/c+zYxYnLQQrsjYjsVFB0YDVq3VTF
	PSRYfb/4GRB0/aRfFAJseVsRA3t1Yi4rP0vW5wSqIiqIxEIQoeNHzHDICX0pCR/BsZ5nkKFBux+
	YHaNiTwLj+fG99A==
X-Received: from plgs8.prod.google.com ([2002:a17:902:ea08:b0:2cc:9345:c60a])
 (user=dmatlack job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:902:f745:b0:2ca:d874:c6cf with SMTP id d9443c01a7336-2ccbe40bcbfmr16844165ad.4.1783360358471;
 Mon, 06 Jul 2026 10:52:38 -0700 (PDT)
Date: Mon,  6 Jul 2026 17:52:28 +0000
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.55.0.rc2.803.g1fd1e6609c-goog
Message-ID: <20260706175228.2468730-1-dmatlack@google.com>
Subject: [PATCH v2] selftests: harness: Mark test fixture objects __maybe_unused
From: David Matlack <dmatlack@google.com>
To: linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	llvm@lists.linux.dev
Cc: Andy Lutomirski <luto@amacapital.net>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Kees Cook <kees@kernel.org>, 
	"=?UTF-8?q?Micka=C3=ABl=20Sala=C3=BCn?=" <mic@digikod.net>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Shuah Khan <shuah@kernel.org>, 
	Will Drewry <wad@chromium.org>, David Matlack <dmatlack@google.com>, 
	Kuniyuki Iwashima <kuniyu@google.com>, Aaron Lewis <aaronlewis@google.com>
Content-Type: text/plain; charset="UTF-8"

Mark global test fixture object pointers __maybe_unused since they may
not ever be read (e.g. if fixture variants are used instead).

clang made a change to -Wunused-but-set-variable (split out into its own
subwarning, -Wunused-but-set-global) that causes this warning to be
emitted for various selftests and can be upgraded to an error in
selftest that set -Werror.

VFIO selftests have been broken since commit ff556bd98348 ("vfio:
selftests: Add -Wall and -Werror to the Makefile"), and the net
selftests builds have been noisy due to -Wall.

Fixes: 24cf65a62266 ("selftests/harness: Share _metadata between forked processes")
Reported-by: Kuniyuki Iwashima <kuniyu@google.com>
Reported-by: Aaron Lewis <aaronlewis@google.com>
Signed-off-by: David Matlack <dmatlack@google.com>
---
v2:
 - Update commit message about the change to clang (Nathan)
 - Correct the Fixes: tag (Nathan)

v1: https://lore.kernel.org/linux-kselftest/20260630213341.1664345-1-dmatlack@google.com/

Note: The fixes tag is commit 24cf65a62266 ("selftests/harness: Share
_metadata between forked processes"), which refactored TEST_F to share
test metadata across processes using mmap and convereted the test
fixture object from a static struct to a static pointer. Prior to commit
24cf65a62266 the static struct was always used once (the address of it
was taken and passed to __register_test()), but after the static pointer
was always assigned but potentially never read.

Cc: Nathan Chancellor <nathan@kernel.org>

 tools/testing/selftests/kselftest_harness.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/kselftest_harness.h b/tools/testing/selftests/kselftest_harness.h
index 261e4df94d9d..29a19bc87084 100644
--- a/tools/testing/selftests/kselftest_harness.h
+++ b/tools/testing/selftests/kselftest_harness.h
@@ -467,7 +467,7 @@ static inline void __kselftest_memset_safe(void *s, int c, size_t n)
 				!__atomic_test_and_set(_metadata->no_teardown, __ATOMIC_RELAXED)) \
 			fixture_name##_teardown(_metadata, self, variant); \
 	} \
-	static struct __test_metadata *_##fixture_name##_##test_name##_object; \
+	static struct __test_metadata *_##fixture_name##_##test_name##_object __maybe_unused; \
 	static void __attribute__((constructor(KSELFTEST_PRIO_TEST))) \
 			_register_##fixture_name##_##test_name(void) \
 	{ \

base-commit: dc59e4fea9d83f03bad6bddf3fa2e52491777482
-- 
2.55.0.rc2.803.g1fd1e6609c-goog

