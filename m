Return-Path: <linux-kselftest-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B895C433E0
	for <linux-kselftest@archiver.kernel.org>; Fri, 26 Mar 2021 06:35:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6299561A36
	for <linux-kselftest@archiver.kernel.org>; Fri, 26 Mar 2021 06:35:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230093AbhCZGep (ORCPT
        <rfc822;linux-kselftest@archiver.kernel.org>);
        Fri, 26 Mar 2021 02:34:45 -0400
Received: from szxga05-in.huawei.com ([45.249.212.191]:14556 "EHLO
        szxga05-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229812AbhCZGe1 (ORCPT
        <rfc822;linux-kselftest@vger.kernel.org>);
        Fri, 26 Mar 2021 02:34:27 -0400
Received: from DGGEMS408-HUB.china.huawei.com (unknown [172.30.72.58])
        by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4F6Bvq71pKzNqWc;
        Fri, 26 Mar 2021 14:31:51 +0800 (CST)
Received: from localhost.localdomain (10.175.104.82) by
 DGGEMS408-HUB.china.huawei.com (10.3.19.208) with Microsoft SMTP Server id
 14.3.498.0; Fri, 26 Mar 2021 14:34:15 +0800
From:   Zheng Yongjun <zhengyongjun3@huawei.com>
To:     <zhengyongjun3@huawei.com>, Michael Ellerman <mpe@ellerman.id.au>,
        "Shuah Khan" <shuah@kernel.org>
CC:     <linuxppc-dev@lists.ozlabs.org>, <linux-kselftest@vger.kernel.org>,
        <kernel-janitors@vger.kernel.org>, Hulk Robot <hulkci@huawei.com>
Subject: [PATCH -next] selftests/powerpc: Remove duplicated include from tm-poison.c
Date:   Fri, 26 Mar 2021 14:48:08 +0800
Message-ID: <20210326064808.3262568-1-zhengyongjun3@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type:   text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7BIT
X-Originating-IP: [10.175.104.82]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-kselftest.vger.kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org

Remove duplicated include.

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Zheng Yongjun <zhengyongjun3@huawei.com>
---
 tools/testing/selftests/powerpc/tm/tm-poison.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/tools/testing/selftests/powerpc/tm/tm-poison.c b/tools/testing/selftests/powerpc/tm/tm-poison.c
index 29e5f26af7b9..27c083a03d1f 100644
--- a/tools/testing/selftests/powerpc/tm/tm-poison.c
+++ b/tools/testing/selftests/powerpc/tm/tm-poison.c
@@ -20,7 +20,6 @@
 #include <sched.h>
 #include <sys/types.h>
 #include <signal.h>
-#include <inttypes.h>
 
 #include "tm.h"
 

