Return-Path: <linux-kselftest-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6CEDCC4338F
	for <linux-kselftest@archiver.kernel.org>; Wed, 28 Jul 2021 12:29:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4FFC360C3E
	for <linux-kselftest@archiver.kernel.org>; Wed, 28 Jul 2021 12:29:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235913AbhG1M3P (ORCPT
        <rfc822;linux-kselftest@archiver.kernel.org>);
        Wed, 28 Jul 2021 08:29:15 -0400
Received: from out30-57.freemail.mail.aliyun.com ([115.124.30.57]:53206 "EHLO
        out30-57.freemail.mail.aliyun.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234838AbhG1M3I (ORCPT
        <rfc822;linux-kselftest@vger.kernel.org>);
        Wed, 28 Jul 2021 08:29:08 -0400
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R801e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=e01e01424;MF=baolin.wang@linux.alibaba.com;NM=1;PH=DS;RN=4;SR=0;TI=SMTPD_---0UhFXizk_1627475345;
Received: from localhost(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0UhFXizk_1627475345)
          by smtp.aliyun-inc.com(127.0.0.1);
          Wed, 28 Jul 2021 20:29:05 +0800
From:   Baolin Wang <baolin.wang@linux.alibaba.com>
To:     shuah@kernel.org
Cc:     baolin.wang@linux.alibaba.com, linux-kselftest@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] selftests: openat2: Fix testing failure for O_LARGEFILE flag
Date:   Wed, 28 Jul 2021 20:29:00 +0800
Message-Id: <1627475340-128057-1-git-send-email-baolin.wang@linux.alibaba.com>
X-Mailer: git-send-email 1.8.3.1
Precedence: bulk
List-ID: <linux-kselftest.vger.kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org

When running the openat2 test suite on ARM64 platform, we got below failure,
since the definition of the O_LARGEFILE is different on ARM64. So we can
set the correct O_LARGEFILE definition on ARM64 to fix this issue.

Signed-off-by: Baolin Wang <baolin.wang@linux.alibaba.com>
---
 tools/testing/selftests/openat2/openat2_test.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tools/testing/selftests/openat2/openat2_test.c b/tools/testing/selftests/openat2/openat2_test.c
index d7ec1e7..1bddbe9 100644
--- a/tools/testing/selftests/openat2/openat2_test.c
+++ b/tools/testing/selftests/openat2/openat2_test.c
@@ -22,7 +22,11 @@
  * XXX: This is wrong on {mips, parisc, powerpc, sparc}.
  */
 #undef	O_LARGEFILE
+#ifdef __aarch64__
+#define	O_LARGEFILE 0x20000
+#else
 #define	O_LARGEFILE 0x8000
+#endif
 
 struct open_how_ext {
 	struct open_how inner;
-- 
1.8.3.1

