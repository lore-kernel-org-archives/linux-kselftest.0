Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA39930C35F;
	Wed, 11 Mar 2026 22:01:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773266492; cv=none; b=iM7G0563c9HWpSpcOhy1F31k6ZKHFuM2ER2DezC64CnMHAnLRmDm/cBxwFS4bDKiktAaZ/vrh7t0BBoAQwPmJjcbfFJTi+7BMzj+R5/Z0fBNTwLCuqQNhxPuC5u8NDx+T7ziin0FBfCxJhomxhCa6EGinMHZn20XgW0fnxhKDS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773266492; c=relaxed/simple;
	bh=K/p/6td6qQEvWG9AhaOSyDEDNlhhNk5HXL1E1wSA3s8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IsEEsR1MIj63K/6eufsBpD+S8CrhkIsfiyQg5ZBZtL8GGOQLdMhK5LAMEoe1BLIWufdna2hoR5gM0QCTrbC94ICTbeF+ay8WnN1NTxT6TMeH/vEZKx3sMbdA/pLnA0MWDq9gmkG2txyISJQwiyW22bvBXa7zCkgt0u8izInC5+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=dGT0lr30; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="dGT0lr30"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1773266488;
	bh=K/p/6td6qQEvWG9AhaOSyDEDNlhhNk5HXL1E1wSA3s8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=dGT0lr304xSrDnbq7H73UlI/O9oXgAKF5tG+qW/gMv5gAd7Hl50nQ/N5/6c7l4CQ7
	 mBhuuC70gN342M9xUL7+79NIyH8D+l7a3Z6D6FZzr/IbI+hs+KE5bSxkmUInij9ahS
	 Nt59abswR0BFj9nXgjOHvkJE5qO3nREImDv2Gp1U=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Wed, 11 Mar 2026 23:00:49 +0100
Subject: [PATCH 1/4] selftests/nolibc: add a variable for nolibc-test
 source files
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260311-nolibc-err-h-v1-1-735a9de7f15d@weissschuh.net>
References: <20260311-nolibc-err-h-v1-0-735a9de7f15d@weissschuh.net>
In-Reply-To: <20260311-nolibc-err-h-v1-0-735a9de7f15d@weissschuh.net>
To: Willy Tarreau <w@1wt.eu>, Shuah Khan <shuah@kernel.org>
Cc: linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773266488; l=3019;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=K/p/6td6qQEvWG9AhaOSyDEDNlhhNk5HXL1E1wSA3s8=;
 b=390NenVbU3rNlFf0ICz3LEitM6PQpYWwFUcVK2fZj9Bk2e/wj7tNxkqWek84vtUGc0l8PkztX
 NRRfuYV/hxsAxAHLwbSqvLjm5eH5eJUsmfvtWq2SSmtw23wrtPyeI0O
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=

The list of the nolibc-test source files is repeated many times.
Another source file is about to be added, adding to the mess.

Introduce a common variable instead.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
 tools/testing/selftests/nolibc/Makefile         | 4 ++--
 tools/testing/selftests/nolibc/Makefile.include | 2 ++
 tools/testing/selftests/nolibc/Makefile.nolibc  | 8 ++++----
 3 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/tools/testing/selftests/nolibc/Makefile b/tools/testing/selftests/nolibc/Makefile
index 0370489d938b..6bace04227a7 100644
--- a/tools/testing/selftests/nolibc/Makefile
+++ b/tools/testing/selftests/nolibc/Makefile
@@ -13,9 +13,9 @@ $(OUTPUT)/nolibc-test: CFLAGS = -nostdlib -nostdinc -static \
 	 -isystem $(top_srcdir)/tools/include/nolibc -isystem $(top_srcdir)/usr/include \
 	 $(CFLAGS_NOLIBC_TEST)
 $(OUTPUT)/nolibc-test: LDLIBS = $(if $(LLVM),,-lgcc)
-$(OUTPUT)/nolibc-test: nolibc-test.c nolibc-test-linkage.c | headers
+$(OUTPUT)/nolibc-test: $(NOLIBC_TEST_SOURCES) | headers
 
-$(OUTPUT)/libc-test: nolibc-test.c nolibc-test-linkage.c
+$(OUTPUT)/libc-test: $(NOLIBC_TEST_SOURCES)
 	$(call msg,CC,,$@)
 	$(Q)$(LINK.c) $^ -o $@
 
diff --git a/tools/testing/selftests/nolibc/Makefile.include b/tools/testing/selftests/nolibc/Makefile.include
index 66287fafbbe0..6455373d56be 100644
--- a/tools/testing/selftests/nolibc/Makefile.include
+++ b/tools/testing/selftests/nolibc/Makefile.include
@@ -8,3 +8,5 @@ _CFLAGS_SANITIZER ?= $(call cc-option,-fsanitize=undefined -fsanitize-trap=all)
 CFLAGS_NOLIBC_TEST  ?= -Os -fno-ident -fno-asynchronous-unwind-tables -std=c89 -W -Wall -Wextra \
 		$(call cc-option,-fno-stack-protector) $(call cc-option,-Wmissing-prototypes) \
 		$(_CFLAGS_STACKPROTECTOR) $(_CFLAGS_SANITIZER)
+
+NOLIBC_TEST_SOURCES := nolibc-test.c nolibc-test-linkage.c
diff --git a/tools/testing/selftests/nolibc/Makefile.nolibc b/tools/testing/selftests/nolibc/Makefile.nolibc
index f5704193038f..2d32cec1105f 100644
--- a/tools/testing/selftests/nolibc/Makefile.nolibc
+++ b/tools/testing/selftests/nolibc/Makefile.nolibc
@@ -302,12 +302,12 @@ sysroot/$(ARCH)/include:
 	$(Q)$(MAKE) -C $(srctree)/tools/include/nolibc ARCH=$(ARCH) OUTPUT=$(CURDIR)/sysroot/ headers_standalone headers_check
 	$(Q)mv sysroot/sysroot sysroot/$(ARCH)
 
-nolibc-test: nolibc-test.c nolibc-test-linkage.c sysroot/$(ARCH)/include
+nolibc-test: $(NOLIBC_TEST_SOURCES) sysroot/$(ARCH)/include
 	$(QUIET_CC)$(CC) $(CFLAGS) $(LDFLAGS) -o $@ \
-	  -nostdlib -nostdinc -static -Isysroot/$(ARCH)/include nolibc-test.c nolibc-test-linkage.c $(LIBGCC)
+	  -nostdlib -nostdinc -static -Isysroot/$(ARCH)/include $(NOLIBC_TEST_SOURCES) $(LIBGCC)
 
-libc-test: nolibc-test.c nolibc-test-linkage.c
-	$(QUIET_CC)$(HOSTCC) -o $@ nolibc-test.c nolibc-test-linkage.c
+libc-test: $(NOLIBC_TEST_SOURCES)
+	$(QUIET_CC)$(HOSTCC) -o $@ $(NOLIBC_TEST_SOURCES)
 
 # local libc-test
 run-libc-test: libc-test

-- 
2.53.0

