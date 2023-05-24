Return-Path: <linux-kselftest-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0D93C77B7A
	for <linux-kselftest@archiver.kernel.org>; Wed, 24 May 2023 17:45:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235902AbjEXRpZ (ORCPT
        <rfc822;linux-kselftest@archiver.kernel.org>);
        Wed, 24 May 2023 13:45:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55704 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235823AbjEXRpY (ORCPT
        <rfc822;linux-kselftest@vger.kernel.org>);
        Wed, 24 May 2023 13:45:24 -0400
Received: from bg4.exmail.qq.com (bg4.exmail.qq.com [43.154.221.58])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 379E6199;
        Wed, 24 May 2023 10:44:46 -0700 (PDT)
X-QQ-mid: bizesmtp91t1684950270tlg7ezy2
Received: from linux-lab-host.localdomain ( [116.30.125.36])
        by bizesmtp.qq.com (ESMTP) with 
        id ; Thu, 25 May 2023 01:44:28 +0800 (CST)
X-QQ-SSF: 01200000000000D0V000000A0000000
X-QQ-FEAT: YHTLUubWl265u2CW07wSJel+EACR98RM0Pu/0O4blCZfhRit2TQxF4jHhzYnx
        v61kmJUoir0VmxZ6Toueb+Uoxb0G4MLbtFWhJscPkTd/ViqkMef29uaIfE/g6WP5lJ7rRfk
        McLHsbRwJ5BwzlNH57jJvOe1CV0krfEglM2yPp/8wcmTYbTxq18j59iXQz8qGIeq5yL1T9Q
        WW0bT85CJqGkxxUwa4LGIfeepiP39SXOprgJaMT/eYzjNCEQkkbTaPO0NZjZTBt1uCJ6Pld
        C7jxnIh/s3fTQ892Zm9i+o1dPxTd1O4JTij6hXUHEo6n1/sQgKv47QbSpZtAWLH9sPJAdit
        39unhhO/LTzsyLAyvK1Qhpo9SxeshLvC4yl9NKX9i1jmGuHseYSU9G2YL1wCg==
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 16112400908867292209
From:   Zhangjin Wu <falcon@tinylab.org>
To:     w@1wt.eu
Cc:     falcon@tinylab.org, linux-kernel@vger.kernel.org,
        linux-kselftest@vger.kernel.org, linux-riscv@lists.infradead.org,
        palmer@dabbelt.com, paul.walmsley@sifive.com, thomas@t-8ch.de
Subject: [PATCH 02/13] Revert "selftests/nolibc: Fix up compile error for rv32"
Date:   Thu, 25 May 2023 01:44:26 +0800
Message-Id: <9cf5f91b2bc3d387231768349ea60f1091db4654.1684949267.git.falcon@tinylab.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1684949267.git.falcon@tinylab.org>
References: <cover.1684949267.git.falcon@tinylab.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:tinylab.org:qybglogicsvrsz:qybglogicsvrsz3a-3
Precedence: bulk
List-ID: <linux-kselftest.vger.kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org

This reverts commit 606343b7478 to prepare for a whole new patch later.

Signed-off-by: Zhangjin Wu <falcon@tinylab.org>
---
 tools/testing/selftests/nolibc/nolibc-test.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/nolibc/nolibc-test.c b/tools/testing/selftests/nolibc/nolibc-test.c
index 6e0a4dbe321e..c570bb848c1a 100644
--- a/tools/testing/selftests/nolibc/nolibc-test.c
+++ b/tools/testing/selftests/nolibc/nolibc-test.c
@@ -596,7 +596,7 @@ int run_syscall(int min, int max)
 		CASE_TEST(write_badf);        EXPECT_SYSER(1, write(-1, &tmp, 1), -1, EBADF); break;
 		CASE_TEST(write_zero);        EXPECT_SYSZR(1, write(1, &tmp, 0)); break;
 		CASE_TEST(syscall_noargs);    EXPECT_SYSEQ(1, syscall(__NR_getpid), getpid()); break;
-		CASE_TEST(syscall_args);      EXPECT_SYSER(1, syscall(__NR_read, -1, &tmp, 1), -1, EBADF); break;
+		CASE_TEST(syscall_args);      EXPECT_SYSER(1, syscall(__NR_fstat, 0, NULL), -1, EFAULT); break;
 		case __LINE__:
 			return ret; /* must be last */
 		/* note: do not set any defaults so as to permit holes above */
-- 
2.25.1

