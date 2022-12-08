Return-Path: <linux-kselftest-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C570CC63703
	for <linux-kselftest@archiver.kernel.org>; Thu,  8 Dec 2022 13:11:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229788AbiLHNLK (ORCPT
        <rfc822;linux-kselftest@archiver.kernel.org>);
        Thu, 8 Dec 2022 08:11:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35540 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229555AbiLHNLJ (ORCPT
        <rfc822;linux-kselftest@vger.kernel.org>);
        Thu, 8 Dec 2022 08:11:09 -0500
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C01A481DBD;
        Thu,  8 Dec 2022 05:11:06 -0800 (PST)
Received: from canpemm500005.china.huawei.com (unknown [172.30.72.54])
        by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4NSZJQ6lWmzJqP8;
        Thu,  8 Dec 2022 21:10:14 +0800 (CST)
Received: from ubuntu1804.huawei.com (10.67.174.63) by
 canpemm500005.china.huawei.com (7.192.104.229) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 8 Dec 2022 21:11:03 +0800
From:   Zhao Gongyi <zhaogongyi@huawei.com>
To:     <linux-kselftest@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <shuah@kernel.org>
CC:     <zhaogongyi@huawei.com>
Subject: [PATCH -next 0/2] Add setup/cleanup for run.sh
Date:   Thu, 8 Dec 2022 21:08:03 +0800
Message-ID: <20221208130805.66660-1-zhaogongyi@huawei.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.67.174.63]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 canpemm500005.china.huawei.com (7.192.104.229)
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-kselftest.vger.kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org

1. Add saving and restore of scaling_governor for cpus
2. Remove the tmp files before the test exit

Zhao Gongyi (2):
  selftests/intel_pstate: Add saving and restore of scaling_governor
  selftests/intel_pstate: do cleanup at exit

 tools/testing/selftests/intel_pstate/run.sh | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

--
2.17.1

