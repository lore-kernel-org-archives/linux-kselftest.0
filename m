Return-Path: <linux-kselftest-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42296C07E9D
	for <linux-kselftest@archiver.kernel.org>; Tue, 27 Sep 2022 03:32:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229804AbiI0Dcz (ORCPT
        <rfc822;linux-kselftest@archiver.kernel.org>);
        Mon, 26 Sep 2022 23:32:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42148 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229846AbiI0Dcx (ORCPT
        <rfc822;linux-kselftest@vger.kernel.org>);
        Mon, 26 Sep 2022 23:32:53 -0400
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D496AA3D15;
        Mon, 26 Sep 2022 20:32:49 -0700 (PDT)
Received: from canpemm500005.china.huawei.com (unknown [172.30.72.54])
        by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4Mc4pg4SNQzWgsB;
        Tue, 27 Sep 2022 11:28:43 +0800 (CST)
Received: from ubuntu1804.huawei.com (10.67.174.63) by
 canpemm500005.china.huawei.com (7.192.104.229) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 27 Sep 2022 11:32:47 +0800
From:   Zhao Gongyi <zhaogongyi@huawei.com>
To:     <linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-mm@kvack.org>, <linux-kselftest@vger.kernel.org>
CC:     <akinobu.mita@gmail.com>, <corbet@lwn.net>, <david@redhat.com>,
        <osalvador@suse.de>, <shuah@kernel.org>, <zhaogongyi@huawei.com>
Subject: [PATCH -next v4 3/3] docs: notifier-error-inject: Correct test's name
Date:   Tue, 27 Sep 2022 11:28:51 +0800
Message-ID: <20220927032851.128174-4-zhaogongyi@huawei.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220927032851.128174-1-zhaogongyi@huawei.com>
References: <20220927032851.128174-1-zhaogongyi@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.67.174.63]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 canpemm500005.china.huawei.com (7.192.104.229)
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-kselftest.vger.kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org

Correct test's name for mem-on-off-test.sh/cpu-on-off-test.sh.

Signed-off-by: Zhao Gongyi <zhaogongyi@huawei.com>
Reviewed-by: David Hildenbrand <david@redhat.com>
---
 Documentation/fault-injection/notifier-error-inject.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/fault-injection/notifier-error-inject.rst b/Documentation/fault-injection/notifier-error-inject.rst
index 1668b6e48d3a..fdf2dc433ead 100644
--- a/Documentation/fault-injection/notifier-error-inject.rst
+++ b/Documentation/fault-injection/notifier-error-inject.rst
@@ -91,8 +91,8 @@ For more usage examples
 There are tools/testing/selftests using the notifier error injection features
 for CPU and memory notifiers.

- * tools/testing/selftests/cpu-hotplug/on-off-test.sh
- * tools/testing/selftests/memory-hotplug/on-off-test.sh
+ * tools/testing/selftests/cpu-hotplug/cpu-on-off-test.sh
+ * tools/testing/selftests/memory-hotplug/mem-on-off-test.sh

 These scripts first do simple online and offline tests and then do fault
 injection tests if notifier error injection module is available.
--
2.17.1

