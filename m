Return-Path: <linux-kselftest-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E7C8C07E9D
	for <linux-kselftest@archiver.kernel.org>; Tue, 27 Sep 2022 03:32:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229630AbiI0Dcu (ORCPT
        <rfc822;linux-kselftest@archiver.kernel.org>);
        Mon, 26 Sep 2022 23:32:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42074 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229619AbiI0Dct (ORCPT
        <rfc822;linux-kselftest@vger.kernel.org>);
        Mon, 26 Sep 2022 23:32:49 -0400
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8D802A5700;
        Mon, 26 Sep 2022 20:32:46 -0700 (PDT)
Received: from canpemm500005.china.huawei.com (unknown [172.30.72.55])
        by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4Mc4qy0mZGzpTgj;
        Tue, 27 Sep 2022 11:29:50 +0800 (CST)
Received: from ubuntu1804.huawei.com (10.67.174.63) by
 canpemm500005.china.huawei.com (7.192.104.229) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 27 Sep 2022 11:32:44 +0800
From:   Zhao Gongyi <zhaogongyi@huawei.com>
To:     <linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-mm@kvack.org>, <linux-kselftest@vger.kernel.org>
CC:     <akinobu.mita@gmail.com>, <corbet@lwn.net>, <david@redhat.com>,
        <osalvador@suse.de>, <shuah@kernel.org>, <zhaogongyi@huawei.com>
Subject: [PATCH -next v4 0/3] Optimize and bugfix for memory-hotplug
Date:   Tue, 27 Sep 2022 11:28:48 +0800
Message-ID: <20220927032851.128174-1-zhaogongyi@huawei.com>
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

1. Add checking after online or offline
2. Restore memory before exit
3. Correct test's name

Changes in v4:
  - Remove redundant log information

Changes in v3:
  - Remove 2 obselute patches

Zhao Gongyi (3):
  selftests/memory-hotplug: Add checking after online or offline
  selftests/memory-hotplug: Restore memory before exit
  docs: notifier-error-inject: Correct test's name

 .../fault-injection/notifier-error-inject.rst |  4 +--
 .../memory-hotplug/mem-on-off-test.sh         | 27 +++++++++++++++----
 2 files changed, 24 insertions(+), 7 deletions(-)

--
2.17.1

