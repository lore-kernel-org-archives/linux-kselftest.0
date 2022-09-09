Return-Path: <linux-kselftest-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94C93ECAAA1
	for <linux-kselftest@archiver.kernel.org>; Fri,  9 Sep 2022 07:57:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230474AbiIIH5S (ORCPT
        <rfc822;linux-kselftest@archiver.kernel.org>);
        Fri, 9 Sep 2022 03:57:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44244 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229862AbiIIH4w (ORCPT
        <rfc822;linux-kselftest@vger.kernel.org>);
        Fri, 9 Sep 2022 03:56:52 -0400
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CC33F10873D;
        Fri,  9 Sep 2022 00:55:34 -0700 (PDT)
Received: from canpemm500005.china.huawei.com (unknown [172.30.72.57])
        by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4MP7Vg0JzlzmV9c;
        Fri,  9 Sep 2022 15:51:55 +0800 (CST)
Received: from ubuntu1804.huawei.com (10.67.174.63) by
 canpemm500005.china.huawei.com (7.192.104.229) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Fri, 9 Sep 2022 15:55:32 +0800
From:   Zhao Gongyi <zhaogongyi@huawei.com>
To:     <linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-mm@kvack.org>, <linux-kselftest@vger.kernel.org>
CC:     <akinobu.mita@gmail.com>, <corbet@lwn.net>, <david@redhat.com>,
        <osalvador@suse.de>, <shuah@kernel.org>,
        Zhao Gongyi <zhaogongyi@huawei.com>
Subject: [PATCH -next 0/5] Optimize and bugfix for notifier error
Date:   Fri, 9 Sep 2022 15:51:55 +0800
Message-ID: <20220909075200.198363-1-zhaogongyi@huawei.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.67.174.63]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 canpemm500005.china.huawei.com (7.192.104.229)
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-kselftest.vger.kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org

1. Fix non-working usage of negative values
2. Add checking after online or offline
3. Restore memory before exit
4. Correct test's name

Zhao Gongyi (5):
  docs: notifier-error-inject: fix non-working usage of negative values
  selftests/memory-hotplug: Use 'printf' instead of 'echo'
  selftests/memory-hotplug: Add checking after online or offline
  selftests/memory-hotplug: Restore memory before exit
  docs: notifier-error-inject: Correct test's name

 .../fault-injection/notifier-error-inject.rst | 14 ++++---
 .../memory-hotplug/mem-on-off-test.sh         | 37 +++++++++++++++----
 2 files changed, 39 insertions(+), 12 deletions(-)

--
2.17.1

