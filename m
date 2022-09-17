Return-Path: <linux-kselftest-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F5FDC6FA82
	for <linux-kselftest@archiver.kernel.org>; Sat, 17 Sep 2022 05:04:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229509AbiIQFEY (ORCPT
        <rfc822;linux-kselftest@archiver.kernel.org>);
        Sat, 17 Sep 2022 01:04:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55254 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229632AbiIQFEX (ORCPT
        <rfc822;linux-kselftest@vger.kernel.org>);
        Sat, 17 Sep 2022 01:04:23 -0400
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 518AFB9595;
        Fri, 16 Sep 2022 22:04:22 -0700 (PDT)
Received: from dggpeml500026.china.huawei.com (unknown [172.30.72.56])
        by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4MTzJy6Y8LzlVln;
        Sat, 17 Sep 2022 13:00:18 +0800 (CST)
Received: from huawei.com (10.175.101.6) by dggpeml500026.china.huawei.com
 (7.185.36.106) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Sat, 17 Sep
 2022 13:04:19 +0800
From:   Zhengchao Shao <shaozhengchao@huawei.com>
To:     <netdev@vger.kernel.org>, <linux-kselftest@vger.kernel.org>,
        <jhs@mojatatu.com>, <xiyou.wangcong@gmail.com>, <jiri@resnulli.us>,
        <davem@davemloft.net>, <edumazet@google.com>, <kuba@kernel.org>,
        <pabeni@redhat.com>, <toke@toke.dk>, <vinicius.gomes@intel.com>,
        <stephen@networkplumber.org>, <shuah@kernel.org>,
        <victor@mojatatu.com>
CC:     <zhijianx.li@intel.com>, <weiyongjun1@huawei.com>,
        <yuehaibing@huawei.com>, <shaozhengchao@huawei.com>
Subject: [PATCH net-next,v2 17/18] selftests/tc-testings: add show class case for prio qdisc
Date:   Sat, 17 Sep 2022 13:06:03 +0800
Message-ID: <20220917050603.132936-1-shaozhengchao@huawei.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.175.101.6]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 dggpeml500026.china.huawei.com (7.185.36.106)
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-kselftest.vger.kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org

Test 2410: Show prio class

Signed-off-by: Zhengchao Shao <shaozhengchao@huawei.com>
---
 .../tc-testing/tc-tests/qdiscs/prio.json      | 20 +++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/tools/testing/selftests/tc-testing/tc-tests/qdiscs/prio.json b/tools/testing/selftests/tc-testing/tc-tests/qdiscs/prio.json
index 3076c02d08d6..8186de2f0dcf 100644
--- a/tools/testing/selftests/tc-testing/tc-tests/qdiscs/prio.json
+++ b/tools/testing/selftests/tc-testing/tc-tests/qdiscs/prio.json
@@ -272,5 +272,25 @@
         "teardown": [
             "$IP link del dev $DUMMY type dummy"
         ]
+    },
+    {
+        "id": "2410",
+        "name": "Show prio class",
+        "category": [
+            "qdisc",
+            "prio"
+        ],
+        "setup": [
+            "$IP link add dev $DUMMY type dummy || /bin/true"
+        ],
+        "cmdUnderTest": "$TC qdisc add dev $DUMMY handle 1: root prio",
+        "expExitCode": "0",
+        "verifyCmd": "$TC class show dev $DUMMY",
+        "matchPattern": "class prio 1:[0-9]+ parent 1:",
+        "matchCount": "3",
+        "teardown": [
+            "$TC qdisc del dev $DUMMY handle 1: root prio",
+            "$IP link del dev $DUMMY type dummy"
+        ]
     }
 ]
-- 
2.17.1

