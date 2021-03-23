Return-Path: <linux-kselftest-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2BB7C433C1
	for <linux-kselftest@archiver.kernel.org>; Tue, 23 Mar 2021 03:41:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A023F619AC
	for <linux-kselftest@archiver.kernel.org>; Tue, 23 Mar 2021 03:41:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229665AbhCWDlN (ORCPT
        <rfc822;linux-kselftest@archiver.kernel.org>);
        Mon, 22 Mar 2021 23:41:13 -0400
Received: from mail-m17637.qiye.163.com ([59.111.176.37]:38484 "EHLO
        mail-m17637.qiye.163.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229761AbhCWDlI (ORCPT
        <rfc822;linux-kselftest@vger.kernel.org>);
        Mon, 22 Mar 2021 23:41:08 -0400
Received: from wanjb-virtual-machine.localdomain (unknown [36.152.145.182])
        by mail-m17637.qiye.163.com (Hmail) with ESMTPA id B6C0C9801A4;
        Tue, 23 Mar 2021 11:34:32 +0800 (CST)
From:   Wan Jiabing <wanjiabing@vivo.com>
To:     Michael Ellerman <mpe@ellerman.id.au>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        Shuah Khan <shuah@kernel.org>,
        Wan Jiabing <wanjiabing@vivo.com>,
        linuxppc-dev@lists.ozlabs.org, linux-kselftest@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     kael_w@yeah.net
Subject: [PATCH] tools: testing: Remove duplicate include of sched.h
Date:   Tue, 23 Mar 2021 11:34:11 +0800
Message-Id: <20210323033413.284420-1-wanjiabing@vivo.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgYFAkeWUFZS1VLWVdZKFlBSE83V1ktWUFJV1kPCR
        oVCBIfWUFZTxlIGh4aTBhPGBlMVkpNSk1PTEtPQ09MSkNVEwETFhoSFyQUDg9ZV1kWGg8SFR0UWU
        FZT0tIVUpKS0hKQ1VLWQY+
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6PjI6MTo*Ij8UKDosMwMZMRIS
        Ax8KCjFVSlVKTUpNT0xLT0NOS0tKVTMWGhIXVQwaFRESGhkSFRw7DRINFFUYFBZFWVdZEgtZQVlI
        TVVKTklVSk9OVUpDSVlXWQgBWUFKTEJONwY+
X-HM-Tid: 0a785d262682d992kuwsb6c0c9801a4
Precedence: bulk
List-ID: <linux-kselftest.vger.kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org

sched.h has been included at line 33.
So we remove the duplicate one at line 36.

Signed-off-by: Wan Jiabing <wanjiabing@vivo.com>
---
 tools/testing/selftests/powerpc/mm/tlbie_test.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/tools/testing/selftests/powerpc/mm/tlbie_test.c b/tools/testing/selftests/powerpc/mm/tlbie_test.c
index f85a0938ab25..48344a74b212 100644
--- a/tools/testing/selftests/powerpc/mm/tlbie_test.c
+++ b/tools/testing/selftests/powerpc/mm/tlbie_test.c
@@ -33,7 +33,6 @@
 #include <sched.h>
 #include <time.h>
 #include <stdarg.h>
-#include <sched.h>
 #include <pthread.h>
 #include <signal.h>
 #include <sys/prctl.h>
-- 
2.25.1

