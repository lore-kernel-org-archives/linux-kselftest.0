Return-Path: <linux-kselftest-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3467C4332F
	for <linux-kselftest@archiver.kernel.org>; Thu,  8 Dec 2022 13:11:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229781AbiLHNLK (ORCPT
        <rfc822;linux-kselftest@archiver.kernel.org>);
        Thu, 8 Dec 2022 08:11:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35536 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229573AbiLHNLJ (ORCPT
        <rfc822;linux-kselftest@vger.kernel.org>);
        Thu, 8 Dec 2022 08:11:09 -0500
Received: from szxga03-in.huawei.com (szxga03-in.huawei.com [45.249.212.189])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EEF7083E81;
        Thu,  8 Dec 2022 05:11:06 -0800 (PST)
Received: from canpemm500005.china.huawei.com (unknown [172.30.72.53])
        by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4NSZFJ5D4zzJp2y;
        Thu,  8 Dec 2022 21:07:32 +0800 (CST)
Received: from ubuntu1804.huawei.com (10.67.174.63) by
 canpemm500005.china.huawei.com (7.192.104.229) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 8 Dec 2022 21:11:04 +0800
From:   Zhao Gongyi <zhaogongyi@huawei.com>
To:     <linux-kselftest@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <shuah@kernel.org>
CC:     <zhaogongyi@huawei.com>
Subject: [PATCH -next 1/2] selftests/intel_pstate: Add saving and restore of scaling_governor
Date:   Thu, 8 Dec 2022 21:08:04 +0800
Message-ID: <20221208130805.66660-2-zhaogongyi@huawei.com>
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

Add saving and restore of scaling_governor for cpus, otherwise the
cpus will run in the policy of powersave, and it would reduce the
performance as unexpected.

Signed-off-by: Zhao Gongyi <zhaogongyi@huawei.com>
---
 tools/testing/selftests/intel_pstate/run.sh | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/tools/testing/selftests/intel_pstate/run.sh b/tools/testing/selftests/intel_pstate/run.sh
index e7008f614ad7..ee78c61cccb9 100755
--- a/tools/testing/selftests/intel_pstate/run.sh
+++ b/tools/testing/selftests/intel_pstate/run.sh
@@ -46,6 +46,12 @@ fi

 max_cpus=$(($(nproc)-1))

+# Save the scaling_governor
+for i in `seq 0 $max_cpus`
+do
+	cat /sys/devices/system/cpu/cpu$i/cpufreq/scaling_governor >> /tmp/governor
+done
+
 function run_test () {

 	file_ext=$1
@@ -125,4 +131,14 @@ done
 # print the table
 pr -aTt -5 < /tmp/result.tab

+# restore the scaling_governor
+i=0
+while read line
+do
+	echo $line > /sys/devices/system/cpu/cpu$i/cpufreq/scaling_governor
+	let i=$i+1
+done < /tmp/governor
+
+rm -f /tmp/governor
+
 exit 0
--
2.17.1

