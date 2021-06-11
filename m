Return-Path: <linux-kselftest-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE806C48BE0
	for <linux-kselftest@archiver.kernel.org>; Fri, 11 Jun 2021 10:19:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A8ADF613EA
	for <linux-kselftest@archiver.kernel.org>; Fri, 11 Jun 2021 10:19:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229480AbhFKKU5 (ORCPT
        <rfc822;linux-kselftest@archiver.kernel.org>);
        Fri, 11 Jun 2021 06:20:57 -0400
Received: from out30-44.freemail.mail.aliyun.com ([115.124.30.44]:49825 "EHLO
        out30-44.freemail.mail.aliyun.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231590AbhFKKU5 (ORCPT
        <rfc822;linux-kselftest@vger.kernel.org>);
        Fri, 11 Jun 2021 06:20:57 -0400
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R471e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=e01e04423;MF=jiapeng.chong@linux.alibaba.com;NM=1;PH=DS;RN=4;SR=0;TI=SMTPD_---0Uc2YYhU_1623406719;
Received: from j63c13417.sqa.eu95.tbsite.net(mailfrom:jiapeng.chong@linux.alibaba.com fp:SMTPD_---0Uc2YYhU_1623406719)
          by smtp.aliyun-inc.com(127.0.0.1);
          Fri, 11 Jun 2021 18:18:58 +0800
From:   Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
To:     shuah@kernel.org
Cc:     linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
Subject: [PATCH v2] selftests/x86/syscall: use ARRAY_SIZE for msbs
Date:   Fri, 11 Jun 2021 18:18:34 +0800
Message-Id: <1623406714-52873-1-git-send-email-jiapeng.chong@linux.alibaba.com>
X-Mailer: git-send-email 1.8.3.1
Precedence: bulk
List-ID: <linux-kselftest.vger.kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org

Use ARRAY_SIZE instead of dividing sizeof array with sizeof an
element.

Clean up the following coccicheck warning:

./tools/testing/selftests/x86/syscall_numbering.c:316:35-36: WARNING:
Use ARRAY_SIZE.

Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
---
Changes in v2:
  -Add ARRAY_SIZE definition.

 tools/testing/selftests/x86/syscall_numbering.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/x86/syscall_numbering.c b/tools/testing/selftests/x86/syscall_numbering.c
index 9915917..ef30218 100644
--- a/tools/testing/selftests/x86/syscall_numbering.c
+++ b/tools/testing/selftests/x86/syscall_numbering.c
@@ -40,6 +40,7 @@
 #define X32_WRITEV	516
 
 #define X32_BIT 0x40000000
+#define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]))
 
 static int nullfd = -1;		/* File descriptor for /dev/null */
 static bool with_x32;		/* x32 supported on this kernel? */
@@ -313,7 +314,7 @@ static void test_syscall_numbering(void)
 	 * The MSB is supposed to be ignored, so we loop over a few
 	 * to test that out.
 	 */
-	for (size_t i = 0; i < sizeof(msbs)/sizeof(msbs[0]); i++) {
+	for (size_t i = 0; i < ARRAY_SIZE(msbs); i++) {
 		int msb = msbs[i];
 		run("Checking system calls with msb = %d (0x%x)\n",
 		    msb, msb);
-- 
1.8.3.1

