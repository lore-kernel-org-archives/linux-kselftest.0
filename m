Return-Path: <linux-kselftest-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A07CC433F5
	for <linux-kselftest@archiver.kernel.org>; Thu,  3 Mar 2022 11:06:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232137AbiCCLH3 (ORCPT
        <rfc822;linux-kselftest@archiver.kernel.org>);
        Thu, 3 Mar 2022 06:07:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55084 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231575AbiCCLH2 (ORCPT
        <rfc822;linux-kselftest@vger.kernel.org>);
        Thu, 3 Mar 2022 06:07:28 -0500
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 85B8E17C41E;
        Thu,  3 Mar 2022 03:06:43 -0800 (PST)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: usama.anjum)
        with ESMTPSA id B1FAF1F45670
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1646305602;
        bh=04+GErvRLlfhBjoyh0q1PNEzVX2LD6M2KAvb8xvne10=;
        h=From:To:Cc:Subject:Date:From;
        b=nmZuTxkJ0YO9axs+PIMgA7q1yD5MiFSzwbOVNWi2UAngUsbTM9Rwj0SbZ129WrTuc
         CLs9+0kOKc5C6ZZ+pTp1bzeqpfNGanYeKeGZ3z8OiysCyy8NWOaaHlphnMS/sZMna7
         wh6bUcHFQtXmtD97VHGFl4R1vbycqhyQTUznNa4TFocxigJpFVw66xtHkGAgrYmx+O
         NC0Pe4Zvf8VBwwvFYlMfZF0vSD2CGejdRpNss9vVXrrjTjt1EKXLlQkHPngB+bBdUs
         re2/OtE6ID6xAJIpvoLl+O+ALOw8FTf6zWTXJSyA4IVGfHt3skC+jLaIGzVA7G2kWP
         qCSAzEq5maxRw==
From:   Muhammad Usama Anjum <usama.anjum@collabora.com>
To:     Shuah Khan <shuah@kernel.org>
Cc:     Muhammad Usama Anjum <usama.anjum@collabora.com>,
        kernel@collabora.com, linux-kselftest@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] selftests/interpreter: fix separate directory build
Date:   Thu,  3 Mar 2022 16:06:28 +0500
Message-Id: <20220303110629.2072927-1-usama.anjum@collabora.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kselftest.vger.kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org

Separate directory build fails of this test as headers include path isn't
set correctly in that case. Fix it by including KHDR_INCLUDES.

make -C tools/testing/selftests O=build1
gcc -Wall -O2 -I../../../../usr/include    trust_policy_test.c -lcap -o /linux_mainline/build1/kselftest/interpreter/trust_policy_test
trust_policy_test.c:14:10: fatal error: linux/trusted-for.h: No such file or directory
   14 | #include <linux/trusted-for.h>
      |          ^~~~~~~~~~~~~~~~~~~~~
compilation terminated.

Signed-off-by: Muhammad Usama Anjum <usama.anjum@collabora.com>
---
 tools/testing/selftests/interpreter/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/interpreter/Makefile b/tools/testing/selftests/interpreter/Makefile
index 7402fdb6533f..51dde8e01e32 100644
--- a/tools/testing/selftests/interpreter/Makefile
+++ b/tools/testing/selftests/interpreter/Makefile
@@ -1,6 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0
 
-CFLAGS += -Wall -O2 -I$(khdr_dir)
+CFLAGS += -Wall -O2 -I$(khdr_dir) $(KHDR_INCLUDES)
 LDLIBS += -lcap
 
 src_test := $(wildcard *_test.c)
-- 
2.30.2

