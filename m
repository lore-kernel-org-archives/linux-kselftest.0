Return-Path: <linux-kselftest-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E973C433F5
	for <linux-kselftest@archiver.kernel.org>; Thu, 10 Feb 2022 22:23:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344803AbiBJWXw (ORCPT
        <rfc822;linux-kselftest@archiver.kernel.org>);
        Thu, 10 Feb 2022 17:23:52 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:49862 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344917AbiBJWXv (ORCPT
        <rfc822;linux-kselftest@vger.kernel.org>);
        Thu, 10 Feb 2022 17:23:51 -0500
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 683B6218E;
        Thu, 10 Feb 2022 14:23:52 -0800 (PST)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: usama.anjum)
        with ESMTPSA id 488F21F4697B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1644531830;
        bh=RgI9opHTA8T3KBo/qgOPw6qU7NMZ7C5YJme0G3lmwOk=;
        h=From:To:Cc:Subject:Date:From;
        b=DE8sxEwGN0RlDd3neWzxykMly3jHRT51EyVefOfc0zSRUfCOi9dP33tyE+aigzzvE
         2whaT+Dp4az2AvTHX65p5WV+dqL4ZL387Z7nKXlJ3y5m2mKMBtSV9BwMLyXq8JF/wB
         Ph33eDxmhWWylw7ZgSprEGQ8GmN0kPQKL+JBV5dx1v+y/onQ1/JDMI2XktWfcErfdI
         YPH7wMfDHVmtdVGSTPgyiHZs3765lI29T2r8aSWOdw14+7dnC5kIKEOeKQc+iTGnY9
         z+vMyb7xU2/Jr753oeVyGCH2NWpRdZVXqq9oPFED8+AiHQW/RakTAtL4jWHfDadzr0
         Zav0l3sTuLuwg==
From:   Muhammad Usama Anjum <usama.anjum@collabora.com>
To:     Eric Biederman <ebiederm@xmission.com>,
        Kees Cook <keescook@chromium.org>,
        Shuah Khan <shuah@kernel.org>
Cc:     Muhammad Usama Anjum <usama.anjum@collabora.com>,
        kernel@collabora.com, kernelci@groups.io,
        linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH V2] selftests/exec: Rename file binfmt_script to binfmt_script.py
Date:   Fri, 11 Feb 2022 03:23:19 +0500
Message-Id: <20220210222319.1864680-1-usama.anjum@collabora.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kselftest.vger.kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org

Rename file for readability purpose. Update its usage and references.

Signed-off-by: Muhammad Usama Anjum <usama.anjum@collabora.com>
---
This path was suggested while review of the following patch. Please
apply it after applying that one first:
	selftests/exec: Add non-regular to TEST_GEN_PROGS
Changes in V2:
	Remove changes from binfmt_script.py, they were wrong
---
 tools/testing/selftests/exec/Makefile                           | 2 +-
 .../testing/selftests/exec/{binfmt_script => binfmt_script.py}  | 0
 2 files changed, 1 insertion(+), 1 deletion(-)
 rename tools/testing/selftests/exec/{binfmt_script => binfmt_script.py} (100%)

diff --git a/tools/testing/selftests/exec/Makefile b/tools/testing/selftests/exec/Makefile
index a89ba6de79870..a0b8688b08369 100644
--- a/tools/testing/selftests/exec/Makefile
+++ b/tools/testing/selftests/exec/Makefile
@@ -3,7 +3,7 @@ CFLAGS = -Wall
 CFLAGS += -Wno-nonnull
 CFLAGS += -D_GNU_SOURCE
 
-TEST_PROGS := binfmt_script
+TEST_PROGS := binfmt_script.py
 TEST_GEN_PROGS := execveat load_address_4096 load_address_2097152 load_address_16777216 non-regular
 TEST_GEN_FILES := execveat.symlink execveat.denatured script subdir
 # Makefile is a run-time dependency, since it's accessed by the execveat test
diff --git a/tools/testing/selftests/exec/binfmt_script b/tools/testing/selftests/exec/binfmt_script.py
similarity index 100%
rename from tools/testing/selftests/exec/binfmt_script
rename to tools/testing/selftests/exec/binfmt_script.py
-- 
2.30.2

