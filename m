Return-Path: <linux-kselftest-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 146A6C433EF
	for <linux-kselftest@archiver.kernel.org>; Sun, 22 May 2022 14:19:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346703AbiEVOTE (ORCPT
        <rfc822;linux-kselftest@archiver.kernel.org>);
        Sun, 22 May 2022 10:19:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32828 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240313AbiEVOTD (ORCPT
        <rfc822;linux-kselftest@vger.kernel.org>);
        Sun, 22 May 2022 10:19:03 -0400
Received: from smtp.smtpout.orange.fr (smtp01.smtpout.orange.fr [80.12.242.123])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B2513393F2
        for <linux-kselftest@vger.kernel.org>; Sun, 22 May 2022 07:18:59 -0700 (PDT)
Received: from pop-os.home ([86.243.180.246])
        by smtp.orange.fr with ESMTPA
        id smQ0ncTUqeg3psmQ1nn8Nq; Sun, 22 May 2022 16:18:57 +0200
X-ME-Helo: pop-os.home
X-ME-Auth: YWZlNiIxYWMyZDliZWIzOTcwYTEyYzlhMmU3ZiQ1M2U2MzfzZDfyZTMxZTBkMTYyNDBjNDJlZmQ3ZQ==
X-ME-Date: Sun, 22 May 2022 16:18:57 +0200
X-ME-IP: 86.243.180.246
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To:     dan.carpenter@oracle.com, Johannes Weiner <hannes@cmpxchg.org>,
        Michal Hocko <mhocko@kernel.org>,
        Roman Gushchin <roman.gushchin@linux.dev>,
        Shakeel Butt <shakeelb@google.com>,
        Muchun Song <songmuchun@bytedance.com>,
        Tejun Heo <tj@kernel.org>, Zefan Li <lizefan.x@bytedance.com>,
        Shuah Khan <shuah@kernel.org>,
        David Vernet <void@manifault.com>,
        Andrew Morton <akpm@linux-foundation.org>
Cc:     linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        cgroups@vger.kernel.org, linux-mm@kvack.org,
        linux-kselftest@vger.kernel.org
Subject: [PATCH] cgroup: Fix an error handling path in alloc_pagecache_max_30M()
Date:   Sun, 22 May 2022 16:18:51 +0200
Message-Id: <628312312eb40e0e39463a2c06415fde5295c716.1653229120.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kselftest.vger.kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org

If the first goto is taken, 'fd' is not opened yet (and is un-initialized).
So a direct return is safer.

Fixes: c1a31a2f7a9c ("cgroup: fix racy check in alloc_pagecache_max_30M() helper function")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 tools/testing/selftests/cgroup/test_memcontrol.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/cgroup/test_memcontrol.c b/tools/testing/selftests/cgroup/test_memcontrol.c
index c3d0d5f7b19c..8833359556f3 100644
--- a/tools/testing/selftests/cgroup/test_memcontrol.c
+++ b/tools/testing/selftests/cgroup/test_memcontrol.c
@@ -448,7 +448,7 @@ static int alloc_pagecache_max_30M(const char *cgroup, void *arg)
 	high = cg_read_long(cgroup, "memory.high");
 	max = cg_read_long(cgroup, "memory.max");
 	if (high != MB(30) && max != MB(30))
-		goto cleanup;
+		return -1;
 
 	fd = get_temp_fd();
 	if (fd < 0)
-- 
2.34.1

