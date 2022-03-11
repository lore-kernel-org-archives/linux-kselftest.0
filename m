Return-Path: <linux-kselftest-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E58EC433EF
	for <linux-kselftest@archiver.kernel.org>; Fri, 11 Mar 2022 07:24:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347160AbiCKHZG (ORCPT
        <rfc822;linux-kselftest@archiver.kernel.org>);
        Fri, 11 Mar 2022 02:25:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41020 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347135AbiCKHZC (ORCPT
        <rfc822;linux-kselftest@vger.kernel.org>);
        Fri, 11 Mar 2022 02:25:02 -0500
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9B59E1B65C1;
        Thu, 10 Mar 2022 23:23:58 -0800 (PST)
X-IronPort-AV: E=McAfee;i="6200,9189,10282"; a="65903863"
X-IronPort-AV: E=Sophos;i="5.90,173,1643641200"; 
   d="scan'208";a="65903863"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP; 11 Mar 2022 16:23:55 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
        by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 31545C68AA;
        Fri, 11 Mar 2022 16:23:55 +0900 (JST)
Received: from yto-om4.fujitsu.com (yto-om4.o.css.fujitsu.com [10.128.89.165])
        by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 8B86B14254;
        Fri, 11 Mar 2022 16:23:54 +0900 (JST)
Received: from cn-r05-10.example.com (n3235113.np.ts.nmh.cs.fujitsu.co.jp [10.123.235.113])
        by yto-om4.fujitsu.com (Postfix) with ESMTP id 5B9AB401110B3;
        Fri, 11 Mar 2022 16:23:54 +0900 (JST)
From:   Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
To:     Fenghua Yu <fenghua.yu@intel.com>,
        Reinette Chatre <reinette.chatre@intel.com>,
        Shuah Khan <shuah@kernel.org>
Cc:     linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
        tan.shaopeng@jp.fujitsu.com
Subject: [PATCH v5 6/6] selftests/resctrl: Add missing SPDX license to Makefile
Date:   Fri, 11 Mar 2022 16:21:47 +0900
Message-Id: <20220311072147.3301525-7-tan.shaopeng@jp.fujitsu.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220311072147.3301525-1-tan.shaopeng@jp.fujitsu.com>
References: <20220311072147.3301525-1-tan.shaopeng@jp.fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
Precedence: bulk
List-ID: <linux-kselftest.vger.kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org

Add the missing SPDX(SPDX-License-Identifier) license header to
tools/testing/selftests/resctrl/Makefile.

Signed-off-by: Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
---
 tools/testing/selftests/resctrl/Makefile | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tools/testing/selftests/resctrl/Makefile b/tools/testing/selftests/resctrl/Makefile
index 30af27b07d21..71e80bb19dd6 100644
--- a/tools/testing/selftests/resctrl/Makefile
+++ b/tools/testing/selftests/resctrl/Makefile
@@ -1,3 +1,5 @@
+# SPDX-License-Identifier: GPL-2.0
+
 TEST_GEN_PROGS := resctrl_tests
 
 include ../lib.mk
-- 
2.27.0

