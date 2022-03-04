Return-Path: <linux-kselftest-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74872C433EF
	for <linux-kselftest@archiver.kernel.org>; Fri,  4 Mar 2022 00:06:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232267AbiCDAHk (ORCPT
        <rfc822;linux-kselftest@archiver.kernel.org>);
        Thu, 3 Mar 2022 19:07:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55012 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232242AbiCDAHk (ORCPT
        <rfc822;linux-kselftest@vger.kernel.org>);
        Thu, 3 Mar 2022 19:07:40 -0500
Received: from mail-pg1-x54a.google.com (mail-pg1-x54a.google.com [IPv6:2607:f8b0:4864:20::54a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 347A6ECB3A
        for <linux-kselftest@vger.kernel.org>; Thu,  3 Mar 2022 16:06:53 -0800 (PST)
Received: by mail-pg1-x54a.google.com with SMTP id u74-20020a63794d000000b00373efe2ac5aso3517490pgc.14
        for <linux-kselftest@vger.kernel.org>; Thu, 03 Mar 2022 16:06:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=L2EqmECeGnDxBTpQsY7qBHnNCdpRu+0gpxLs2lR25VM=;
        b=Od6sUIoBeI6YLIHz8dugjZNkV2e1G9ybEJ+EtPnZaPldHnMI495OSQXixpu5cD8MIL
         LftkXHa1bDXNL/O7LVOgt6AQJJvJ0Z2+X/vMsRdavLJfC5JpSufc7XnPYGoIJYPFiMxt
         SAHSYAxwfxCNp+0SYsc4xSvU7KTsOv2itMiPEVdMknFAsmNfYdZJ/rWBKFh0Bnhmv5ce
         T7BDGlgmj141JJuCh9WvVnH0a0SXb+fEAuA4BXQieWuqf+pR/BtURhwmoeNU27CHClQb
         kp55gbk1n8GvC5i6hbNFSqVC5JYHoxiOtNPthp61DnahHJj9bxhC570JzV2IIQQMnQY5
         Co3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=L2EqmECeGnDxBTpQsY7qBHnNCdpRu+0gpxLs2lR25VM=;
        b=0NHO7XA2R4Aoga1aHGSQnBfaX8rk1b2WWgj0koJZ1aHuNDSzWw09ngsRDAcOtDE4WB
         /qBuDfbUkUZN1nTuglS0sPxaN8QB/ZJFqXEtlnPymsEvD64dyYCnR+Rz1jTw/c6wvv3R
         35TZu7DICXMnbOGLmRmsRQ9r0IKvYJ+0XQXjXvuiSSzZJftPw+3DIkWh/hK8yoHdyBvy
         LvlxNwAcmHBb+zU78GbI5NYBb+IwMi6LhJLgyaO8XeclUlqYcSSbD1iwnvzP64LBYRb+
         Uf7FLqDNk89Yt4ogl8yncUjLRPHAXocCLjXfBvoqMaQ7DlXjGR/umOmJqb4DT5VUeO7r
         pkFQ==
X-Gm-Message-State: AOAM530QmTwiYhTL9Ipn7wiuP8a12Q+B7Al30pRQ7dkocxgrjVozjZG/
        qZhD6eHuAGEouiXxIYDEntEygUZ02+59MtYk
X-Google-Smtp-Source: ABdhPJwf+20lur8uv++KBdcOVEbgmjgiEAuuWAsUNu0PrpdZBGP1HHD9FdhGtIOfDG0Vu8bdNEN7h6tsuFuUnliQ
X-Received: from yosry.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:2327])
 (user=yosryahmed job=sendgmr) by 2002:a05:6a00:de:b0:4e0:ca1a:9f07 with SMTP
 id e30-20020a056a0000de00b004e0ca1a9f07mr41091497pfj.11.1646352412683; Thu,
 03 Mar 2022 16:06:52 -0800 (PST)
Date:   Fri,  4 Mar 2022 00:06:45 +0000
Message-Id: <20220304000645.1888133-1-yosryahmed@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.35.1.616.g0bdcbb4464-goog
Subject: [PATCH] selftests: vm: fix clang build error multiple output files
From:   Yosry Ahmed <yosryahmed@google.com>
To:     Andrew Morton <akpm@linux-foundation.org>,
        Shuah Khan <shuah@kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>
Cc:     linux-mm@kvack.org, linux-kselftest@vger.kernel.org,
        linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
        Yosry Ahmed <yosryahmed@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kselftest.vger.kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org

When building the vm selftests using clang, some errors are seen due to
having headers in the compilation command:

clang -Wall -I ../../../../usr/include  -no-pie    gup_test.c ../../../../mm/gup_test.h -lrt -lpthread -o .../tools/testing/selftests/vm/gup_test
clang: error: cannot specify -o when generating multiple output files
make[1]: *** [../lib.mk:146: .../tools/testing/selftests/vm/gup_test] Error 1

Rework to add the header files to LOCAL_HDRS before including ../lib.mk,
since the dependency is evaluated in '$(OUTPUT)/%:%.c $(LOCAL_HDRS)' in
file lib.mk.

Signed-off-by: Yosry Ahmed <yosryahmed@google.com>
---
This patch was inspired by:
https://lore.kernel.org/lkml/20211105162530.3307666-1-anders.roxell@linaro.org/


---
 tools/testing/selftests/vm/Makefile | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/tools/testing/selftests/vm/Makefile b/tools/testing/selftests/vm/Makefile
index 1607322a112c..a14b5b800897 100644
--- a/tools/testing/selftests/vm/Makefile
+++ b/tools/testing/selftests/vm/Makefile
@@ -1,6 +1,8 @@
 # SPDX-License-Identifier: GPL-2.0
 # Makefile for vm selftests
 
+LOCAL_HDRS += $(selfdir)/vm/local_config.h $(top_srcdir)/mm/gup_test.h
+
 include local_config.mk
 
 uname_M := $(shell uname -m 2>/dev/null || echo not)
@@ -140,10 +142,6 @@ endif
 
 $(OUTPUT)/mlock-random-test $(OUTPUT)/memfd_secret: LDLIBS += -lcap
 
-$(OUTPUT)/gup_test: ../../../../mm/gup_test.h
-
-$(OUTPUT)/hmm-tests: local_config.h
-
 # HMM_EXTRA_LIBS may get set in local_config.mk, or it may be left empty.
 $(OUTPUT)/hmm-tests: LDLIBS += $(HMM_EXTRA_LIBS)
 
-- 
2.35.1.616.g0bdcbb4464-goog

