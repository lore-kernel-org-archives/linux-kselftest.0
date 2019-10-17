Return-Path: <SRS0=GiAI=YK=vger.kernel.org=linux-kselftest-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 913C3FA3735
	for <linux-kselftest@archiver.kernel.org>; Thu, 17 Oct 2019 10:19:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 6925721925
	for <linux-kselftest@archiver.kernel.org>; Thu, 17 Oct 2019 10:19:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2408769AbfJQKTH (ORCPT
        <rfc822;linux-kselftest@archiver.kernel.org>);
        Thu, 17 Oct 2019 06:19:07 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:36465 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2408768AbfJQKTG (ORCPT
        <rfc822;linux-kselftest@vger.kernel.org>);
        Thu, 17 Oct 2019 06:19:06 -0400
Received: from [185.81.136.22] (helo=localhost.localdomain)
        by youngberry.canonical.com with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <christian.brauner@ubuntu.com>)
        id 1iL2s4-0007tP-Qk; Thu, 17 Oct 2019 10:19:05 +0000
From:   Christian Brauner <christian.brauner@ubuntu.com>
To:     oleg@redhat.com, linux-kernel@vger.kernel.org
Cc:     aarcange@redhat.com, akpm@linux-foundation.org,
        christian@kellner.me, cyphar@cyphar.com, elena.reshetova@intel.com,
        guro@fb.com, jannh@google.com, ldv@altlinux.org,
        linux-api@vger.kernel.org, linux-kselftest@vger.kernel.org,
        mhocko@suse.com, mingo@kernel.org, peterz@infradead.org,
        shuah@kernel.org, tglx@linutronix.de, viro@zeniv.linux.org.uk,
        Christian Brauner <christian.brauner@ubuntu.com>
Subject: [PATCH v3 4/5] exit: use pid_has_task() in do_wait()
Date:   Thu, 17 Oct 2019 12:18:31 +0200
Message-Id: <20191017101832.5985-4-christian.brauner@ubuntu.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191017101832.5985-1-christian.brauner@ubuntu.com>
References: <20191016153606.2326-1-christian.brauner@ubuntu.com>
 <20191017101832.5985-1-christian.brauner@ubuntu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kselftest-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kselftest.vger.kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org

Replace hlist_empty() with the new pid_has_task() helper which is more
idiomatic, easier to grep for, and unifies how callers perform this check.

Signed-off-by: Christian Brauner <christian.brauner@ubuntu.com>
Reviewed-by: Oleg Nesterov <oleg@redhat.com>
---
/* pidfd selftests */
passed

/* v1 */
patch not present

/* v2 */
Link: https://lore.kernel.org/r/20191016153606.2326-4-christian.brauner@ubuntu.com
patch introduced

/* v3 */
- Oleg Nesterov <oleg@redhat.com>:
  - s/task_alive/pid_has_task/
---
 kernel/exit.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/exit.c b/kernel/exit.c
index a46a50d67002..f2d20ab74422 100644
--- a/kernel/exit.c
+++ b/kernel/exit.c
@@ -1457,7 +1457,7 @@ static long do_wait(struct wait_opts *wo)
 	 */
 	wo->notask_error = -ECHILD;
 	if ((wo->wo_type < PIDTYPE_MAX) &&
-	   (!wo->wo_pid || hlist_empty(&wo->wo_pid->tasks[wo->wo_type])))
+	   (!wo->wo_pid || !pid_has_task(wo->wo_pid, wo->wo_type)))
 		goto notask;
 
 	set_current_state(TASK_INTERRUPTIBLE);
-- 
2.23.0

