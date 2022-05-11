Return-Path: <linux-kselftest-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11A06C433EF
	for <linux-kselftest@archiver.kernel.org>; Wed, 11 May 2022 17:21:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240438AbiEKRVl (ORCPT
        <rfc822;linux-kselftest@archiver.kernel.org>);
        Wed, 11 May 2022 13:21:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37356 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345454AbiEKRVi (ORCPT
        <rfc822;linux-kselftest@vger.kernel.org>);
        Wed, 11 May 2022 13:21:38 -0400
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id BDC5320CA48;
        Wed, 11 May 2022 10:21:35 -0700 (PDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 338961042;
        Wed, 11 May 2022 10:21:35 -0700 (PDT)
Received: from donnerap.arm.com (donnerap.cambridge.arm.com [10.1.197.42])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0D2D73F73D;
        Wed, 11 May 2022 10:21:33 -0700 (PDT)
From:   Andre Przywara <andre.przywara@arm.com>
To:     Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Shuah Khan <shuah@kernel.org>
Cc:     linux-arm-kernel@lists.infradead.org,
        Mark Brown <broonie@kernel.org>,
        linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] kselftest/arm64: bti: force static linking
Date:   Wed, 11 May 2022 18:21:29 +0100
Message-Id: <20220511172129.2078337-1-andre.przywara@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kselftest.vger.kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org

The "bti" selftests are built with -nostdlib, which apparently
automatically creates a statically linked binary, which is what we want
and need for BTI (to avoid interactions with the dynamic linker).

However this is not true when building a PIE binary, which some
toolchains (Ubuntu) configure as the default.
When compiling btitest with such a toolchain, it will create a
dynamically linked binary, which will probably fail some tests, as the
dynamic linker might not support BTI:
===================
TAP version 13
1..18
not ok 1 nohint_func/call_using_br_x0
not ok 2 nohint_func/call_using_br_x16
not ok 3 nohint_func/call_using_blr
....
===================

To make sure we create static binaries, add an explicit -static on the
linker command line. This forces static linking even if the toolchain
defaults to PIE builds, and fixes btitest runs on BTI enabled machines.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 tools/testing/selftests/arm64/bti/Makefile | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/arm64/bti/Makefile b/tools/testing/selftests/arm64/bti/Makefile
index 73e013c082a65..dafa1c2aa5c47 100644
--- a/tools/testing/selftests/arm64/bti/Makefile
+++ b/tools/testing/selftests/arm64/bti/Makefile
@@ -39,7 +39,7 @@ BTI_OBJS =                                      \
 	teststubs-bti.o                         \
 	trampoline-bti.o
 gen/btitest: $(BTI_OBJS)
-	$(CC) $(CFLAGS_BTI) $(CFLAGS_COMMON) -nostdlib -o $@ $^
+	$(CC) $(CFLAGS_BTI) $(CFLAGS_COMMON) -nostdlib -static -o $@ $^
 
 NOBTI_OBJS =                                    \
 	test-nobti.o                         \
@@ -50,7 +50,7 @@ NOBTI_OBJS =                                    \
 	teststubs-nobti.o                       \
 	trampoline-nobti.o
 gen/nobtitest: $(NOBTI_OBJS)
-	$(CC) $(CFLAGS_BTI) $(CFLAGS_COMMON) -nostdlib -o $@ $^
+	$(CC) $(CFLAGS_BTI) $(CFLAGS_COMMON) -nostdlib -static -o $@ $^
 
 # Including KSFT lib.mk here will also mangle the TEST_GEN_PROGS list
 # to account for any OUTPUT target-dirs optionally provided by
-- 
2.25.1

