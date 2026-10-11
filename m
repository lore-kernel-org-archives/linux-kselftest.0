Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 749CF46C847;
	Sun, 11 Oct 2026 22:34:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791758051; cv=none; b=fU7OTwKivSm7cxvymUE29Gykvu1ZU5/N/EVdBNU+InDnnxJfIc9TOxqyp4AlWBu9+2tL04FCNTojXsXtv+IV5gijO1ekMKXHsoBZfq0caWHFJE4hB6AcMTALMIsvYYRNSlE3yQT7wv4/2EXPKdJ8QkJhb1BhI5txexDJA3Byy5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791758051; c=relaxed/simple;
	bh=8rGpt82kgwwLCsrLmySaLIVFFjJfxX/Ubj+h9UYIsec=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LUi8BGz542y3BTPvX8ghR9JbgTMTVQq+GizFowrQ75m0mOCXncQdqb4jT64bHXl8bsZUCB42jHYk7BHDNLR/xwulbytUtc7j2IfwxZJWsYdLmL01azAAPt1P8+7nkOtKtRjIN9oJXoApzS/QybFn2pPIIgd1qLBllxaEoqczpFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=E2UP8Qu8; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="E2UP8Qu8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A22431F0089B;
	Sun, 11 Oct 2026 22:34:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791758050;
	bh=FJNgqeyrtcChHCRm43OZyYdn0ycOLDFYrjVOm0QMJ1M=;
	h=From:To:Cc:Subject:Date;
	b=E2UP8Qu8CxgLtOCRvRAi7p74Iz0HVOZUKJRfo137h6PkQh4PfAt6NEHyYgnIxbi61
	 yaV0SqsWZFgZ7c9zfJTM3WNxMKmpkthJngQMNFT/7Iw/unUOlcAmDP4310UgIkmZ/J
	 7RoBloTM9bf6FkCEQQYGFBieOgLCJrsZqKtlMq20sfuNvL6IzUDKA7V0GyyTRHzcdQ
	 1cp+lynuiC44aQKhuZymfDdiRayt2BQrQwuBZ0FtKMJhbubuQ/0rq1LOJ2MUhDQpY5
	 +sXFHCEARGxlFzJwOcdjusTAiuGIhtEbn9Yuxf1FZ1FxwnW5+yBsglhFVSUWSpPEy1
	 svmfXkHYmuA7w==
From: Sasha Levin <sashal@kernel.org>
To: Shuah Khan <shuah@kernel.org>
Cc: Sasha Levin <sashal@kernel.org>,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] selftests: lib.mk: define LINK.c, COMPILE.S and LINK.S when make has none
Date: Sun, 11 Oct 2026 18:33:34 -0400
Message-ID: <20261011223358.2327625-6-sashal@kernel.org>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The kernel build runs make with -rR, which removes make's built-in rules
and variables. tools/testing/selftests/Makefile copes by clearing
MAKEFLAGS for its sub-makes, and lib.mk defines LINK.c, COMPILE.S and
LINK.S again, but only when building_out_of_srctree is set. A selftest
directory built directly by a make that inherited -R gets neither, so
LINK.c is empty and the generic rule tries to execute the source file:

  make[4]: acct_syscall.c: No such file or directory

Define them whenever make does not provide them, as make itself defines
them, so that they are the same with and without -R. The definitions
lib.mk used for O= builds until now differed from make's only in using
TARGET_ARCH instead of TARGET_MACH for assembly, which no selftest sets.

Assisted-by: LLM
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 tools/testing/selftests/lib.mk | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/tools/testing/selftests/lib.mk b/tools/testing/selftests/lib.mk
index f02cc8a2e4ae3..4de034f3e9d34 100644
--- a/tools/testing/selftests/lib.mk
+++ b/tools/testing/selftests/lib.mk
@@ -207,14 +207,11 @@ CFLAGS += -I${top_srcdir}/tools/testing/selftests
 CFLAGS += $(USERCFLAGS)
 LDFLAGS += $(USERLDFLAGS)
 
-# When make O= with kselftest target from main level
-# the following aren't defined.
-#
-ifdef building_out_of_srctree
-LINK.c = $(CC) $(CFLAGS) $(CPPFLAGS) $(LDFLAGS) $(TARGET_ARCH)
-COMPILE.S = $(CC) $(ASFLAGS) $(CPPFLAGS) $(TARGET_ARCH) -c
-LINK.S = $(CC) $(ASFLAGS) $(CPPFLAGS) $(LDFLAGS) $(TARGET_ARCH)
-endif
+# Make's built-in variables are not defined when run with -R, which kbuild
+# passes down when a test is built from the main level.
+LINK.c ?= $(CC) $(CFLAGS) $(CPPFLAGS) $(LDFLAGS) $(TARGET_ARCH)
+COMPILE.S ?= $(CC) $(ASFLAGS) $(CPPFLAGS) $(TARGET_MACH) -c
+LINK.S ?= $(CC) $(ASFLAGS) $(CPPFLAGS) $(LDFLAGS) $(TARGET_MACH)
 
 # Selftest makefiles can override those targets by setting
 # OVERRIDE_TARGETS = 1.
-- 
2.53.0

