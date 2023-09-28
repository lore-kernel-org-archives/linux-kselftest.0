Return-Path: <linux-kselftest-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F09ACE7B0F
	for <linux-kselftest@archiver.kernel.org>; Thu, 28 Sep 2023 09:15:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231252AbjI1JPh (ORCPT
        <rfc822;linux-kselftest@archiver.kernel.org>);
        Thu, 28 Sep 2023 05:15:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36870 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231514AbjI1JPg (ORCPT
        <rfc822;linux-kselftest@vger.kernel.org>);
        Thu, 28 Sep 2023 05:15:36 -0400
Received: from szxga03-in.huawei.com (szxga03-in.huawei.com [45.249.212.189])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 86ED4AC
        for <linux-kselftest@vger.kernel.org>; Thu, 28 Sep 2023 02:15:34 -0700 (PDT)
Received: from kwepemi500008.china.huawei.com (unknown [172.30.72.55])
        by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4Rx75c3LYgzMldN;
        Thu, 28 Sep 2023 17:11:48 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemi500008.china.huawei.com
 (7.221.188.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.31; Thu, 28 Sep
 2023 17:15:31 +0800
From:   Jinjie Ruan <ruanjinjie@huawei.com>
To:     <linux-kselftest@vger.kernel.org>, <kunit-dev@googlegroups.com>,
        <brendan.higgins@linux.dev>, <davidgow@google.com>,
        <skhan@linuxfoundation.org>, <rmoar@google.com>,
        <marpagan@redhat.com>
CC:     <ruanjinjie@huawei.com>
Subject: [PATCH RESEND 0/3] kunit: Init and run test suites in the right state
Date:   Thu, 28 Sep 2023 17:14:43 +0800
Message-ID: <20230928091446.1209703-1-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.90.53.73]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemi500008.china.huawei.com (7.221.188.139)
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-kselftest.vger.kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org

The original order of cases in kunit_module_notify() is confusing and
misleading.

And the best practice is return the err code from
MODULE_STATE_COMING func.

And the test suits should be executed when notify MODULE_STATE_LIVE.

Jinjie Ruan (3):
  kunit: Make the cases sequence more reasonable for
    kunit_module_notify()
  kunit: Return error from kunit_module_init()
  kunit: Init and run test suites in the right state

 lib/kunit/test.c | 37 +++++++++++++++++++++++--------------
 1 file changed, 23 insertions(+), 14 deletions(-)

-- 
2.34.1

