Return-Path: <linux-kselftest-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98F31ECAAD3
	for <linux-kselftest@archiver.kernel.org>; Mon,  5 Sep 2022 13:39:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237725AbiIENj6 (ORCPT
        <rfc822;linux-kselftest@archiver.kernel.org>);
        Mon, 5 Sep 2022 09:39:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43302 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230314AbiIENj4 (ORCPT
        <rfc822;linux-kselftest@vger.kernel.org>);
        Mon, 5 Sep 2022 09:39:56 -0400
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E72DB1A810;
        Mon,  5 Sep 2022 06:39:52 -0700 (PDT)
Received: from canpemm500005.china.huawei.com (unknown [172.30.72.53])
        by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4MLqM23GjSznV3Q;
        Mon,  5 Sep 2022 21:37:18 +0800 (CST)
Received: from ubuntu1804.huawei.com (10.67.174.63) by
 canpemm500005.china.huawei.com (7.192.104.229) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Mon, 5 Sep 2022 21:39:44 +0800
From:   Zhao Gongyi <zhaogongyi@huawei.com>
To:     <linux-kernel@vger.kernel.org>, <linux-kselftest@vger.kernel.org>
CC:     <shuah@kernel.org>, <akpm@linux-foundation.org>,
        <akinobu.mita@gmail.com>, Zhao Gongyi <zhaogongyi@huawei.com>
Subject: [PATCH -next v3 0/5] Optimize and bugfix for cpu-on-off-test.sh
Date:   Mon, 5 Sep 2022 21:36:10 +0800
Message-ID: <20220905133615.139026-1-zhaogongyi@huawei.com>
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

Changes in v3:
  - Remove config file for patch 2
  - Update information of cover letter

Changes in v2:
  - Update change log of patch 2
  - Update exiting value to avoid incorrect report for patch 2
  - Keep online_cpu_expect_fail() and offline_cpu_expect_fail() for
    patch 3

Zhao Gongyi (5):
  selftests/cpu-hotplug: Correct log info
  selftests/cpu-hotplug: Use return instead of exit
  selftests/cpu-hotplug: Delete fault injection related code
  selftests/cpu-hotplug: Reserve one cpu online at least
  selftests/cpu-hotplug: Add log info when test success

 tools/testing/selftests/cpu-hotplug/Makefile  |   2 +-
 tools/testing/selftests/cpu-hotplug/config    |   1 -
 .../selftests/cpu-hotplug/cpu-on-off-test.sh  | 140 +++++-------------
 3 files changed, 37 insertions(+), 106 deletions(-)
 delete mode 100644 tools/testing/selftests/cpu-hotplug/config

--
2.17.1

