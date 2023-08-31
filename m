Return-Path: <linux-kselftest-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E769DC83F10
	for <linux-kselftest@archiver.kernel.org>; Thu, 31 Aug 2023 09:32:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235594AbjHaJcB (ORCPT
        <rfc822;linux-kselftest@archiver.kernel.org>);
        Thu, 31 Aug 2023 05:32:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51910 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231946AbjHaJcB (ORCPT
        <rfc822;linux-kselftest@vger.kernel.org>);
        Thu, 31 Aug 2023 05:32:01 -0400
Received: from cmccmta1.chinamobile.com (cmccmta8.chinamobile.com [111.22.67.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id C6CF8CDD;
        Thu, 31 Aug 2023 02:31:53 -0700 (PDT)
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG: 00000000
Received: from spf.mail.chinamobile.com (unknown[10.188.0.87])
        by rmmx-syy-dmz-app02-12002 (RichMail) with SMTP id 2ee264f05dffa56-789d2;
        Thu, 31 Aug 2023 17:31:45 +0800 (CST)
X-RM-TRANSID: 2ee264f05dffa56-789d2
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG: 00000000
Received: from localhost.localdomain (unknown[223.108.79.97])
        by rmsmtp-syy-appsvr09-12009 (RichMail) with SMTP id 2ee964f05e0058a-1e81b;
        Thu, 31 Aug 2023 17:31:44 +0800 (CST)
X-RM-TRANSID: 2ee964f05e0058a-1e81b
From:   Ding Xiang <dingxiang@cmss.chinamobile.com>
To:     akpm@linux-foundation.org, shuah@kernel.org
Cc:     linux-mm@kvack.org, linux-kselftest@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] selftests/mm: gup_longterm: fix a resource leak
Date:   Thu, 31 Aug 2023 17:31:44 +0800
Message-Id: <20230831093144.7520-1-dingxiang@cmss.chinamobile.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kselftest.vger.kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org

The opened file should be closed in run_with_tmpfile(),
otherwise resource leak will occur

Signed-off-by: Ding Xiang <dingxiang@cmss.chinamobile.com>
---
 tools/testing/selftests/mm/gup_longterm.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/mm/gup_longterm.c b/tools/testing/selftests/mm/gup_longterm.c
index d33d3e68ffab..ad168d35b23b 100644
--- a/tools/testing/selftests/mm/gup_longterm.c
+++ b/tools/testing/selftests/mm/gup_longterm.c
@@ -265,10 +265,11 @@ static void run_with_tmpfile(test_fn fn, const char *desc)
 	fd = fileno(file);
 	if (fd < 0) {
 		ksft_test_result_fail("fileno() failed\n");
-		return;
+		goto close;
 	}
 
 	fn(fd, pagesize);
+close:
 	fclose(file);
 }
 
-- 
2.38.1



