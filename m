Return-Path: <linux-kselftest-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05303C74A44
	for <linux-kselftest@archiver.kernel.org>; Tue, 14 Mar 2023 11:53:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229687AbjCNLx5 (ORCPT
        <rfc822;linux-kselftest@archiver.kernel.org>);
        Tue, 14 Mar 2023 07:53:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43056 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229627AbjCNLx4 (ORCPT
        <rfc822;linux-kselftest@vger.kernel.org>);
        Tue, 14 Mar 2023 07:53:56 -0400
Received: from sym2.noone.org (sym.noone.org [IPv6:2a01:4f8:120:4161::3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 19BCD18AA6;
        Tue, 14 Mar 2023 04:53:55 -0700 (PDT)
Received: by sym2.noone.org (Postfix, from userid 1002)
        id 4PbX402HfLzvjfn; Tue, 14 Mar 2023 12:53:52 +0100 (CET)
From:   Tobias Klauser <tklauser@distanz.ch>
To:     Christian Brauner <brauner@kernel.org>,
        Shuah Khan <shuah@kernel.org>
Cc:     linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] selftests/clone3: fix number of tests in ksft_set_plan
Date:   Tue, 14 Mar 2023 12:53:52 +0100
Message-Id: <20230314115352.20623-1-tklauser@distanz.ch>
X-Mailer: git-send-email 2.11.0
Precedence: bulk
List-ID: <linux-kselftest.vger.kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org

Commit 515bddf0ec41 ("selftests/clone3: test clone3 with CLONE_NEWTIME")
added an additional test, so the number passed to ksft_set_plan needs to
be bumped accordingly.

Also use ksft_finish to print results and exit. This will catch future
mismatches between ksft_set_plan and the number of tests being run.

Fixes: 515bddf0ec41 ("selftests/clone3: test clone3 with CLONE_NEWTIME")
Cc: Christian Brauner <brauner@kernel.org>
Signed-off-by: Tobias Klauser <tklauser@distanz.ch>
---
 tools/testing/selftests/clone3/clone3.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/clone3/clone3.c b/tools/testing/selftests/clone3/clone3.c
index 4fce46afe6db..7b45c9854202 100644
--- a/tools/testing/selftests/clone3/clone3.c
+++ b/tools/testing/selftests/clone3/clone3.c
@@ -129,7 +129,7 @@ int main(int argc, char *argv[])
 	uid_t uid = getuid();
 
 	ksft_print_header();
-	ksft_set_plan(17);
+	ksft_set_plan(18);
 	test_clone3_supported();
 
 	/* Just a simple clone3() should return 0.*/
-- 
2.39.1

