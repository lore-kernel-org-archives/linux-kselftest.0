Return-Path: <linux-kselftest-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72818C636D3
	for <linux-kselftest@archiver.kernel.org>; Fri, 27 Jan 2023 13:58:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234251AbjA0N6h (ORCPT
        <rfc822;linux-kselftest@archiver.kernel.org>);
        Fri, 27 Jan 2023 08:58:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37530 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233864AbjA0N61 (ORCPT
        <rfc822;linux-kselftest@vger.kernel.org>);
        Fri, 27 Jan 2023 08:58:27 -0500
Received: from smtpout.efficios.com (unknown [IPv6:2607:5300:203:b2ee::31e5])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A695D3C2B;
        Fri, 27 Jan 2023 05:58:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=efficios.com;
        s=smtpout1; t=1674827886;
        bh=PG/Ee5DQDuFzfrqjFpBbIaCu85R7Ezz7gm4/41lk96I=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=oEYBzX/StuCVTHU0iCdXz7e1iYqgt3TWZ5crSpWT/6F2Yc8anQeVMykmy2L1W57Ak
         0cB4dEH5/H7W+EjZrej4ygCXRymK1pRN3A9vryGaaI/GesCg9VIE+kEOCbKsxaO98H
         UZBJqLq3jr1r1uz9s+ia/u0Np2pmMDNY9RoWLB2TmHg0+H0oCDpmE7nGq2WV/LRxQ9
         e+uX3RL4HREimLcuYaNbJIdMgM4O5Wcw3rdK38jAzBft7fD5XMC4QMB1TlOdWAtcQN
         9CggsMZEaKg9M4KyiOLZLiSnBabXem/AD8DdgP5MC3hKChKzyxpGGjFWVATfVTj4wl
         PFmlBf/jxhmjA==
Received: from localhost.localdomain (192-222-180-24.qc.cable.ebox.net [192.222.180.24])
        by smtpout.efficios.com (Postfix) with ESMTPSA id 4P3K0Z08sfzhWh;
        Fri, 27 Jan 2023 08:58:06 -0500 (EST)
From:   Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
To:     Shuah Khan <shuah@kernel.org>, linux-kselftest@vger.kernel.org,
        Ingo Molnar <mingo@redhat.com>
Cc:     linux-kernel@vger.kernel.org,
        Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
        stable@vger.kernel.org
Subject: [PATCH 23/34] selftests: rseq: Fix incorrect kernel headers search path
Date:   Fri, 27 Jan 2023 08:57:44 -0500
Message-Id: <20230127135755.79929-24-mathieu.desnoyers@efficios.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230127135755.79929-1-mathieu.desnoyers@efficios.com>
References: <20230127135755.79929-1-mathieu.desnoyers@efficios.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kselftest.vger.kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org

Use $(KHDR_INCLUDES) as lookup path for kernel headers. This prevents
building against kernel headers from the build environment in scenarios
where kernel headers are installed into a specific output directory
(O=...).

Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Cc: Shuah Khan <shuah@kernel.org>
Cc: linux-kselftest@vger.kernel.org
Cc: Ingo Molnar <mingo@redhat.com>
Cc: <stable@vger.kernel.org>    [5.18+]
---
 tools/testing/selftests/rseq/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/rseq/Makefile b/tools/testing/selftests/rseq/Makefile
index 215e1067f037..3a173e184566 100644
--- a/tools/testing/selftests/rseq/Makefile
+++ b/tools/testing/selftests/rseq/Makefile
@@ -4,7 +4,7 @@ ifneq ($(shell $(CC) --version 2>&1 | head -n 1 | grep clang),)
 CLANG_FLAGS += -no-integrated-as
 endif
 
-CFLAGS += -O2 -Wall -g -I./ -I../../../../usr/include/ -L$(OUTPUT) -Wl,-rpath=./ \
+CFLAGS += -O2 -Wall -g -I./ $(KHDR_INCLUDES) -L$(OUTPUT) -Wl,-rpath=./ \
 	  $(CLANG_FLAGS)
 LDLIBS += -lpthread -ldl
 
-- 
2.25.1

