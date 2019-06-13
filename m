Return-Path: <SRS0=2zA2=UM=vger.kernel.org=linux-kselftest-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.9 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9ABFDC31E4A
	for <linux-kselftest@archiver.kernel.org>; Thu, 13 Jun 2019 15:30:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 7DB12206BB
	for <linux-kselftest@archiver.kernel.org>; Thu, 13 Jun 2019 15:30:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728239AbfFMPa3 (ORCPT
        <rfc822;linux-kselftest@archiver.kernel.org>);
        Thu, 13 Jun 2019 11:30:29 -0400
Received: from foss.arm.com ([217.140.110.172]:38182 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728795AbfFMLOq (ORCPT <rfc822;linux-kselftest@vger.kernel.org>);
        Thu, 13 Jun 2019 07:14:46 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5F9B0367;
        Thu, 13 Jun 2019 04:14:45 -0700 (PDT)
Received: from e120937-lin.cambridge.arm.com (e120937-lin.cambridge.arm.com [10.1.197.50])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E5CA03F694;
        Thu, 13 Jun 2019 04:16:27 -0700 (PDT)
From:   Cristian Marussi <cristian.marussi@arm.com>
To:     linux-kselftest@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, shuah@kernel.org
Cc:     dave.martin@arm.com, andreyknvl@google.com
Subject: [PATCH 12/13] kselftest: arm64: fake_sigreturn_bad_size_for_magic0
Date:   Thu, 13 Jun 2019 12:13:34 +0100
Message-Id: <20190613111335.7645-13-cristian.marussi@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190613111335.7645-1-cristian.marussi@arm.com>
References: <20190613111335.7645-1-cristian.marussi@arm.com>
Sender: linux-kselftest-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kselftest.vger.kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org

Added a simple fake_sigreturn testcase which builds a ucontext_t
with a badly sized magic0 header and place it onto the stack.
Expects a SIGSEGV on test PASS.

Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
---
 .../arm64/signal/testcases/.gitignore         |  1 +
 .../fake_sigreturn_bad_size_for_magic0.c      | 44 +++++++++++++++++++
 2 files changed, 45 insertions(+)
 create mode 100644 tools/testing/selftests/arm64/signal/testcases/fake_sigreturn_bad_size_for_magic0.c

diff --git a/tools/testing/selftests/arm64/signal/testcases/.gitignore b/tools/testing/selftests/arm64/signal/testcases/.gitignore
index 9ad1735e0018..66ba865b3b7e 100644
--- a/tools/testing/selftests/arm64/signal/testcases/.gitignore
+++ b/tools/testing/selftests/arm64/signal/testcases/.gitignore
@@ -9,3 +9,4 @@ mangle_pstate_ssbs_regs
 fake_sigreturn_misaligned
 fake_sigreturn_bad_magic
 fake_sigreturn_bad_size
+fake_sigreturn_bad_size_for_magic0
diff --git a/tools/testing/selftests/arm64/signal/testcases/fake_sigreturn_bad_size_for_magic0.c b/tools/testing/selftests/arm64/signal/testcases/fake_sigreturn_bad_size_for_magic0.c
new file mode 100644
index 000000000000..703909959473
--- /dev/null
+++ b/tools/testing/selftests/arm64/signal/testcases/fake_sigreturn_bad_size_for_magic0.c
@@ -0,0 +1,44 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/* Copyright (C) 2019 ARM Limited */
+
+#include <asm/sigcontext.h>
+#include <ucontext.h>
+#include <stdio.h>
+
+#include "test_signals_utils.h"
+#include "testcases.h"
+
+struct a_sigframe sf;
+
+static int fake_sigreturn_bad_size_for_magic0_run(struct tdescr *td,
+						  siginfo_t *si, ucontext_t *uc)
+{
+	struct _aarch64_ctx *head = GET_SF_RESV_HEAD(sf);
+
+	/* just to fill the ucontext_t with something real */
+	if (!get_current_context(td, &sf.uc))
+		return 1;
+
+	/*
+	 * Jump to the free slot...we must preserve existing
+	 * magics like fpsimd in order no to SEGV anyway
+	 */
+	head = get_terminator(head, GET_SF_RESV_SIZE(sf), NULL);
+	if (head) {
+		head->magic = 0;
+		head->size = 256;
+
+		ASSERT_BAD_CONTEXT(&sf.uc);
+		fake_sigreturn(&sf, sizeof(sf), 16);
+	}
+
+	return 1;
+}
+
+struct tdescr tde = {
+		.name = "FAKE_SIGRETURN_BAD_SIZE_FOR_MAGIC0",
+		.descr = "Triggers a fake sigreturn with a sigframe including a bad non-zero size magic0",
+		.sig_ok = SIGSEGV,
+		.timeout = 3,
+		.run = fake_sigreturn_bad_size_for_magic0_run,
+};
-- 
2.17.1

