Return-Path: <linux-kselftest-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D27CECAAA1
	for <linux-kselftest@archiver.kernel.org>; Tue, 30 Aug 2022 08:33:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231527AbiH3Id6 (ORCPT
        <rfc822;linux-kselftest@archiver.kernel.org>);
        Tue, 30 Aug 2022 04:33:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35998 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230312AbiH3Id6 (ORCPT
        <rfc822;linux-kselftest@vger.kernel.org>);
        Tue, 30 Aug 2022 04:33:58 -0400
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 30927B5E7D;
        Tue, 30 Aug 2022 01:33:56 -0700 (PDT)
Received: from canpemm500005.china.huawei.com (unknown [172.30.72.57])
        by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4MH0rw4dhqznTsG;
        Tue, 30 Aug 2022 16:31:28 +0800 (CST)
Received: from ubuntu1804.huawei.com (10.67.174.63) by
 canpemm500005.china.huawei.com (7.192.104.229) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Tue, 30 Aug 2022 16:33:53 +0800
From:   Zhao Gongyi <zhaogongyi@huawei.com>
To:     <linux-kernel@vger.kernel.org>, <linux-kselftest@vger.kernel.org>
CC:     <shuah@kernel.org>, <akpm@linux-foundation.org>,
        <akinobu.mita@gmail.com>, Zhao Gongyi <zhaogongyi@huawei.com>
Subject: [PATCH -next 0/5] Optimize and bugfix for cpu-on-off-test.sh
Date:   Tue, 30 Aug 2022 16:30:23 +0800
Message-ID: <20220830083028.45504-1-zhaogongyi@huawei.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.67.174.63]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 canpemm500005.china.huawei.com (7.192.104.229)
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-kselftest.vger.kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org

1. Correct log info
2. Replace exit with return to make the test exit gracefully
3. Delete fault injection related code
4. Reserve one cpu online when the test offline all cpus
5. Add log info when run full test successfully

Zhao Gongyi (5):
  selftests/cpu-hotplug: Correct log info
  selftests/cpu-hotplug: Replace exit with return
  selftests/cpu-hotplug: Delete fault injection related code
  selftests/cpu-hotplug: Reserve one cpu online at least
  selftests/cpu-hotplug: Add log info when test success

 tools/testing/selftests/cpu-hotplug/Makefile  |   2 +-
 tools/testing/selftests/cpu-hotplug/config    |   1 -
 .../selftests/cpu-hotplug/cpu-on-off-test.sh  | 150 ++++--------------
 3 files changed, 29 insertions(+), 124 deletions(-)
 delete mode 100644 tools/testing/selftests/cpu-hotplug/config

--
2.17.1

