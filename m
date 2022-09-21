Return-Path: <linux-kselftest-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A731C32771
	for <linux-kselftest@archiver.kernel.org>; Wed, 21 Sep 2022 12:32:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230133AbiIUMcq (ORCPT
        <rfc822;linux-kselftest@archiver.kernel.org>);
        Wed, 21 Sep 2022 08:32:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60188 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230036AbiIUMcc (ORCPT
        <rfc822;linux-kselftest@vger.kernel.org>);
        Wed, 21 Sep 2022 08:32:32 -0400
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 95CC06FA17;
        Wed, 21 Sep 2022 05:32:30 -0700 (PDT)
Received: from dggpeml500026.china.huawei.com (unknown [172.30.72.53])
        by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4MXd3R1Fg8zMnwh;
        Wed, 21 Sep 2022 20:27:47 +0800 (CST)
Received: from huawei.com (10.175.101.6) by dggpeml500026.china.huawei.com
 (7.185.36.106) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Wed, 21 Sep
 2022 20:32:28 +0800
From:   Zhengchao Shao <shaozhengchao@huawei.com>
To:     <netdev@vger.kernel.org>, <linux-kselftest@vger.kernel.org>,
        <jhs@mojatatu.com>, <xiyou.wangcong@gmail.com>, <jiri@resnulli.us>,
        <shuah@kernel.org>, <victor@mojatatu.com>
CC:     <weiyongjun1@huawei.com>, <yuehaibing@huawei.com>,
        <shaozhengchao@huawei.com>
Subject: [PATCH -next, v3 06/10] net: hinic: simplify code logic
Date:   Wed, 21 Sep 2022 20:33:54 +0800
Message-ID: <20220921123358.63442-7-shaozhengchao@huawei.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220921123358.63442-1-shaozhengchao@huawei.com>
References: <20220921123358.63442-1-shaozhengchao@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.175.101.6]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 dggpeml500026.china.huawei.com (7.185.36.106)
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-kselftest.vger.kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org

simplify code logic in hinic_ndo_set_vf_trust() and
hinic_ndo_set_vf_spoofchk().

Signed-off-by: Zhengchao Shao <shaozhengchao@huawei.com>
---
 drivers/net/ethernet/huawei/hinic/hinic_sriov.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/huawei/hinic/hinic_sriov.c b/drivers/net/ethernet/huawei/hinic/hinic_sriov.c
index a8f71a69ddcc..00a66e6e3060 100644
--- a/drivers/net/ethernet/huawei/hinic/hinic_sriov.c
+++ b/drivers/net/ethernet/huawei/hinic/hinic_sriov.c
@@ -820,7 +820,7 @@ int hinic_ndo_set_vf_trust(struct net_device *netdev, int vf, bool setting)
 
 	cur_trust = nic_io->vf_infos[vf].trust;
 	/* same request, so just return success */
-	if ((setting && cur_trust) || (!setting && !cur_trust))
+	if (setting == cur_trust)
 		return 0;
 
 	err = hinic_set_vf_trust(adapter->hwdev, vf, setting);
@@ -940,7 +940,7 @@ int hinic_ndo_set_vf_spoofchk(struct net_device *netdev, int vf, bool setting)
 	cur_spoofchk = nic_dev->hwdev->func_to_io.vf_infos[vf].spoofchk;
 
 	/* same request, so just return success */
-	if ((setting && cur_spoofchk) || (!setting && !cur_spoofchk))
+	if (setting == cur_spoofchk)
 		return 0;
 
 	err = hinic_set_vf_spoofchk(sriov_info->hwdev,
-- 
2.17.1

