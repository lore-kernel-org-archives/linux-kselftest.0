Return-Path: <linux-kselftest-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99F92C3A5A7
	for <linux-kselftest@archiver.kernel.org>; Thu,  8 Dec 2022 13:11:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229601AbiLHNLJ (ORCPT
        <rfc822;linux-kselftest@archiver.kernel.org>);
        Thu, 8 Dec 2022 08:11:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35538 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229558AbiLHNLJ (ORCPT
        <rfc822;linux-kselftest@vger.kernel.org>);
        Thu, 8 Dec 2022 08:11:09 -0500
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 994E08AAFC;
        Thu,  8 Dec 2022 05:11:07 -0800 (PST)
Received: from canpemm500005.china.huawei.com (unknown [172.30.72.54])
        by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4NSZDZ5NMjzqSsR;
        Thu,  8 Dec 2022 21:06:54 +0800 (CST)
Received: from ubuntu1804.huawei.com (10.67.174.63) by
 canpemm500005.china.huawei.com (7.192.104.229) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 8 Dec 2022 21:11:05 +0800
From:   Zhao Gongyi <zhaogongyi@huawei.com>
To:     <linux-kselftest@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <shuah@kernel.org>
CC:     <zhaogongyi@huawei.com>
Subject: [PATCH -next 2/2] selftests/intel_pstate: do cleanup at exit
Date:   Thu, 8 Dec 2022 21:08:05 +0800
Message-ID: <20221208130805.66660-3-zhaogongyi@huawei.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20221208130805.66660-1-zhaogongyi@huawei.com>
References: <20221208130805.66660-1-zhaogongyi@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.67.174.63]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 canpemm500005.china.huawei.com (7.192.104.229)
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-kselftest.vger.kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org

Remove the tmp files before the test exit.

Signed-off-by: Zhao Gongyi <zhaogongyi@huawei.com>
---
 tools/testing/selftests/intel_pstate/run.sh | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tools/testing/selftests/intel_pstate/run.sh b/tools/testing/selftests/intel_pstate/run.sh
index ee78c61cccb9..3e187e54af16 100755
--- a/tools/testing/selftests/intel_pstate/run.sh
+++ b/tools/testing/selftests/intel_pstate/run.sh
@@ -140,5 +140,6 @@ do
 done < /tmp/governor

 rm -f /tmp/governor
+rm -f /tmp/result\.*

 exit 0
--
2.17.1

