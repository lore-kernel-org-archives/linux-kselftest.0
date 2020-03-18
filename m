Return-Path: <SRS0=uR1e=5D=vger.kernel.org=linux-kselftest-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F41F9C5ACD6
	for <linux-kselftest@archiver.kernel.org>; Wed, 18 Mar 2020 01:02:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C1BF62076E
	for <linux-kselftest@archiver.kernel.org>; Wed, 18 Mar 2020 01:02:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1584493350;
	bh=++bzRo5RK7SxZkez2gaa3Fm+VNDr89Moy/9LKUyEZfY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=d84eBH78cIFCfMwLkAnxGxkVMJjrIUIfgWu7tUPtR10YsvpZeGbSvfzb5HPe6DGSF
	 oGOE43aMxmDn6aa5YQ4dOSPzBALFzJrzU3YC+nw4Pw/n7qP+j5ZcJckk0Z/kmn5IK6
	 2ZpJnOk0vItWpMK8QCWsEIVTcAqQXreE3aFx4ft8=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727230AbgCRBCa (ORCPT
        <rfc822;linux-kselftest@archiver.kernel.org>);
        Tue, 17 Mar 2020 21:02:30 -0400
Received: from mail.kernel.org ([198.145.29.99]:39270 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727131AbgCRBCa (ORCPT <rfc822;linux-kselftest@vger.kernel.org>);
        Tue, 17 Mar 2020 21:02:30 -0400
Received: from kicinski-fedora-PC1C0HJN.thefacebook.com (unknown [163.114.132.4])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 6C25E20752;
        Wed, 18 Mar 2020 01:02:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1584493349;
        bh=++bzRo5RK7SxZkez2gaa3Fm+VNDr89Moy/9LKUyEZfY=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=mEROG4AVIN1QJqnXgXJaaAECCRHii7oZgDDK1NciXLkkO2CLxwiueiRJjVMqVW+59
         /yCl/6fsvcz98gWLm+scQ4zh5cZs8a2Dce8CmyMNY7loavp60g11I2u0W5MNVsq3GW
         Wf6iryTsSKy5vyBOU8fdvP6Lba5atKiMP8Ym0zlA=
From:   Jakub Kicinski <kuba@kernel.org>
To:     keescook@chromium.org, shuah@kernel.org
Cc:     netdev@vger.kernel.org, luto@amacapital.net, wad@chromium.org,
        linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel-team@fb.com, Tim.Bird@sony.com,
        Jakub Kicinski <kuba@kernel.org>
Subject: [PATCH v5 1/5] kselftest: factor out list manipulation to a helper
Date:   Tue, 17 Mar 2020 18:01:49 -0700
Message-Id: <20200318010153.40797-2-kuba@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200318010153.40797-1-kuba@kernel.org>
References: <20200318010153.40797-1-kuba@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kselftest-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kselftest.vger.kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org

Kees suggest to factor out the list append code to a macro,
since following commits need it, which leads to code duplication.

Suggested-by: Kees Cook <keescook@chromium.org>
Signed-off-by: Jakub Kicinski <kuba@kernel.org>
Acked-by: Kees Cook <keescook@chromium.org>
---
 tools/testing/selftests/kselftest_harness.h | 42 ++++++++++++---------
 1 file changed, 24 insertions(+), 18 deletions(-)

diff --git a/tools/testing/selftests/kselftest_harness.h b/tools/testing/selftests/kselftest_harness.h
index 5336b26506ab..aaf58fffc8f7 100644
--- a/tools/testing/selftests/kselftest_harness.h
+++ b/tools/testing/selftests/kselftest_harness.h
@@ -631,6 +631,29 @@
 	} \
 } while (0); OPTIONAL_HANDLER(_assert)
 
+/* List helpers */
+#define __LIST_APPEND(head, item) \
+{ \
+	/* Circular linked list where only prev is circular. */ \
+	if (head == NULL) { \
+		head = item; \
+		item->next = NULL; \
+		item->prev = item; \
+		return;	\
+	} \
+	if (__constructor_order == _CONSTRUCTOR_ORDER_FORWARD) { \
+		item->next = NULL; \
+		item->prev = head->prev; \
+		item->prev->next = item; \
+		head->prev = item; \
+	} else { \
+		item->next = head; \
+		item->next->prev = item; \
+		item->prev = item; \
+		head = item; \
+	} \
+}
+
 /* Contains all the information for test execution and status checking. */
 struct __test_metadata {
 	const char *name;
@@ -665,24 +688,7 @@ static int __constructor_order;
 static inline void __register_test(struct __test_metadata *t)
 {
 	__test_count++;
-	/* Circular linked list where only prev is circular. */
-	if (__test_list == NULL) {
-		__test_list = t;
-		t->next = NULL;
-		t->prev = t;
-		return;
-	}
-	if (__constructor_order == _CONSTRUCTOR_ORDER_FORWARD) {
-		t->next = NULL;
-		t->prev = __test_list->prev;
-		t->prev->next = t;
-		__test_list->prev = t;
-	} else {
-		t->next = __test_list;
-		t->next->prev = t;
-		t->prev = t;
-		__test_list = t;
-	}
+	__LIST_APPEND(__test_list, t);
 }
 
 static inline int __bail(int for_realz, bool no_print, __u8 step)
-- 
2.25.1

