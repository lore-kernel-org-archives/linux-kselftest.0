Return-Path: <linux-kselftest-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33DC6C433DB
	for <linux-kselftest@archiver.kernel.org>; Mon, 15 Mar 2021 07:51:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E0D0064E67
	for <linux-kselftest@archiver.kernel.org>; Mon, 15 Mar 2021 07:51:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229742AbhCOHue (ORCPT
        <rfc822;linux-kselftest@archiver.kernel.org>);
        Mon, 15 Mar 2021 03:50:34 -0400
Received: from out30-56.freemail.mail.aliyun.com ([115.124.30.56]:56681 "EHLO
        out30-56.freemail.mail.aliyun.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230260AbhCOHuP (ORCPT
        <rfc822;linux-kselftest@vger.kernel.org>);
        Mon, 15 Mar 2021 03:50:15 -0400
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R131e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=e01e04420;MF=jiapeng.chong@linux.alibaba.com;NM=1;PH=DS;RN=4;SR=0;TI=SMTPD_---0URx1vzQ_1615794607;
Received: from j63c13417.sqa.eu95.tbsite.net(mailfrom:jiapeng.chong@linux.alibaba.com fp:SMTPD_---0URx1vzQ_1615794607)
          by smtp.aliyun-inc.com(127.0.0.1);
          Mon, 15 Mar 2021 15:50:13 +0800
From:   Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
To:     shuah@kernel.org
Cc:     linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
Subject: [PATCH] tools/testing/selftests/vm/: fix warning comparing pointer to 0
Date:   Mon, 15 Mar 2021 15:50:06 +0800
Message-Id: <1615794606-114484-1-git-send-email-jiapeng.chong@linux.alibaba.com>
X-Mailer: git-send-email 1.8.3.1
Precedence: bulk
List-ID: <linux-kselftest.vger.kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org

Fix the following coccicheck warning:

./tools/testing/selftests/vm/map_populate.c:82:16-17: WARNING comparing
pointer to 0.

Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
---
 tools/testing/selftests/vm/map_populate.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/vm/map_populate.c b/tools/testing/selftests/vm/map_populate.c
index 6b8aeaa..fb11b9e 100644
--- a/tools/testing/selftests/vm/map_populate.c
+++ b/tools/testing/selftests/vm/map_populate.c
@@ -79,7 +79,7 @@ int main(int argc, char **argv)
 	unsigned long *smap;
 
 	ftmp = tmpfile();
-	BUG_ON(ftmp == 0, "tmpfile()");
+	BUG_ON(!ftmp, "tmpfile()");
 
 	ret = ftruncate(fileno(ftmp), MMAP_SZ);
 	BUG_ON(ret, "ftruncate()");
-- 
1.8.3.1

