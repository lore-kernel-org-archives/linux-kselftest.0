Return-Path: <linux-kselftest-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5435C77B78
	for <linux-kselftest@archiver.kernel.org>; Thu,  4 May 2023 08:59:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229972AbjEDI7h (ORCPT
        <rfc822;linux-kselftest@archiver.kernel.org>);
        Thu, 4 May 2023 04:59:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58422 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229545AbjEDI7h (ORCPT
        <rfc822;linux-kselftest@vger.kernel.org>);
        Thu, 4 May 2023 04:59:37 -0400
Received: from sym2.noone.org (sym.noone.org [IPv6:2a01:4f8:120:4161::3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9F5CB358A;
        Thu,  4 May 2023 01:59:34 -0700 (PDT)
Received: by sym2.noone.org (Postfix, from userid 1002)
        id 4QBnnH2Xbczvjfm; Thu,  4 May 2023 10:59:30 +0200 (CEST)
From:   Tobias Klauser <tklauser@distanz.ch>
To:     Christian Brauner <brauner@kernel.org>,
        Shuah Khan <shuah@kernel.org>
Cc:     linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: [PATCH] selftests/clone3: test clone3 with exit signal in flags
Date:   Thu,  4 May 2023 10:59:30 +0200
Message-Id: <20230504085930.23842-1-tklauser@distanz.ch>
X-Mailer: git-send-email 2.11.0
Precedence: bulk
List-ID: <linux-kselftest.vger.kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org

Verify that calling clone3 with an exit signal (SIGCHLD) in flags will
fail.

Signed-off-by: Tobias Klauser <tklauser@distanz.ch>
---
 tools/testing/selftests/clone3/clone3.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/clone3/clone3.c b/tools/testing/selftests/clone3/clone3.c
index e495f895a2cd..e60cf4da8fb0 100644
--- a/tools/testing/selftests/clone3/clone3.c
+++ b/tools/testing/selftests/clone3/clone3.c
@@ -129,7 +129,7 @@ int main(int argc, char *argv[])
 	uid_t uid = getuid();
 
 	ksft_print_header();
-	ksft_set_plan(18);
+	ksft_set_plan(19);
 	test_clone3_supported();
 
 	/* Just a simple clone3() should return 0.*/
@@ -198,5 +198,8 @@ int main(int argc, char *argv[])
 	/* Do a clone3() in a new time namespace */
 	test_clone3(CLONE_NEWTIME, 0, 0, CLONE3_ARGS_NO_TEST);
 
+	/* Do a clone3() with exit signal (SIGCHLD) in flags */
+	test_clone3(SIGCHLD, 0, -EINVAL, CLONE3_ARGS_NO_TEST);
+
 	ksft_finished();
 }
-- 
2.40.0

