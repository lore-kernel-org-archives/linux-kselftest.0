Return-Path: <SRS0=HnTg=46=vger.kernel.org=linux-kselftest-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD59CC4CECE
	for <linux-kselftest@archiver.kernel.org>; Fri, 13 Mar 2020 21:24:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id A46F420767
	for <linux-kselftest@archiver.kernel.org>; Fri, 13 Mar 2020 21:24:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1584134652;
	bh=gsKkEKc6d0k39o7jrA19JOlTMKCw+3VuNguQ2GPAzd0=;
	h=From:To:Cc:Subject:Date:List-ID:From;
	b=gZVsZUwUKpNjVmEZndFUg9pW+y3xxF0IykTf+4DgBINI4ku/3NDflg5ipmrioCrDZ
	 crW1Q454abR3DoKpp6bBm8bS2GL1AzCiTAemLDCDi2zX40TMRAlPrUOrajNKqNOpVw
	 nn6+eze1Z50Mxa7VUeF/dg61VtnVlPG9L2YXn7Gk=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727198AbgCMVYM (ORCPT
        <rfc822;linux-kselftest@archiver.kernel.org>);
        Fri, 13 Mar 2020 17:24:12 -0400
Received: from mail-il1-f194.google.com ([209.85.166.194]:45837 "EHLO
        mail-il1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727422AbgCMVYI (ORCPT
        <rfc822;linux-kselftest@vger.kernel.org>);
        Fri, 13 Mar 2020 17:24:08 -0400
Received: by mail-il1-f194.google.com with SMTP id p1so10459678ils.12
        for <linux-kselftest@vger.kernel.org>; Fri, 13 Mar 2020 14:24:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=nh1n7M+VPSrWcMXPYIV91GLW2l6TAX14rIs4m1q72Xw=;
        b=Efks9xuN/oML/BqvA8mL5/SGY7ASxmBkfpBAscYoHao8obdSNy14z5ctKJ/W9oel+D
         Y/vAz9m+Efw7hAsy6BcaEKiS4tQFLBGtQGmLVLAm2ZFhf8eGvlu38VJ8OF6T30m5TzyH
         SAu2lauGOxX81iwxVtgjsYUKlVbdYx57cgbj4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=nh1n7M+VPSrWcMXPYIV91GLW2l6TAX14rIs4m1q72Xw=;
        b=OXOoFkJ9gC0mVSbx946JDzjsY1VoHDm+3sicIULZTmWECerAZcIR2dPRsAmV2zsmj9
         qU6cpAymjgMXQecP/MbMmg+eTTdSpwd5IhPlO58zBRjm16GGuhjtU9E/gPnO2EBxd/lY
         zgEt+PPkYUatcA+/lbhZtO/g8Z6InWexT2fajAOtGxFTB6qDSAZmPi34MFrBd/zPVlfT
         ItIhnzqeObQL6/ArV25nXlbltMlYDpJ+gtucfT2XJi53/jfm9SdK9uclUy4I7vyXtDVk
         jrf31njO1LBpelxFmBP95mSan5hxPXGk0N+cAxUYUwjC1gk950WbDnhQGU8bwwLYkW43
         qk0w==
X-Gm-Message-State: ANhLgQ3kj4iSlBsIUYpgWmxT2uEJoC9CDpoLkXW1SHba+lJMX8oV5sYv
        0q/Zzws5Rps4q7DsQhEzfOWq2Q==
X-Google-Smtp-Source: ADFU+vuNMKlTjRy366EcWR9ptiTfmLmVzeHxrmdb75AGQiAghLVYgPBSaZofsKRoLtZ4NCp+pGIgbw==
X-Received: by 2002:a92:5fc5:: with SMTP id i66mr15532167ill.303.1584134646641;
        Fri, 13 Mar 2020 14:24:06 -0700 (PDT)
Received: from shuah-t480s.internal (c-24-9-64-241.hsd1.co.comcast.net. [24.9.64.241])
        by smtp.gmail.com with ESMTPSA id y8sm6824029iot.14.2020.03.13.14.24.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2020 14:24:05 -0700 (PDT)
From:   Shuah Khan <skhan@linuxfoundation.org>
To:     shuah@kernel.org, keescook@chromium.org, luto@amacapital.net,
        wad@chromium.org, daniel@iogearbox.net, kafai@fb.com, yhs@fb.com,
        andriin@fb.com, gregkh@linuxfoundation.org, tglx@linutronix.de
Cc:     Shuah Khan <skhan@linuxfoundation.org>, khilman@baylibre.com,
        mpe@ellerman.id.au, linux-kselftest@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        bpf@vger.kernel.org
Subject: [PATCH v3] selftests: Fix seccomp to support relocatable build (O=objdir)
Date:   Fri, 13 Mar 2020 15:24:04 -0600
Message-Id: <20200313212404.24552-1-skhan@linuxfoundation.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kselftest-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kselftest.vger.kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org

Fix seccomp relocatable builds. This is a simple fix to use the right
lib.mk variable TEST_GEN_PROGS with dependency on kselftest_harness.h
header, and defining LDFLAGS for pthread lib.

Removes custom clean rule which is no longer necessary with the use of
TEST_GEN_PROGS. 

Uses $(OUTPUT) defined in lib.mk to handle build relocation.

The following use-cases work with this change:

In seccomp directory:
make all and make clean

From top level from main Makefile:
make kselftest-install O=objdir ARCH=arm64 HOSTCC=gcc \
 CROSS_COMPILE=aarch64-linux-gnu- TARGETS=seccomp

Signed-off-by: Shuah Khan <skhan@linuxfoundation.org>
---

Changes since v2:
-- Using TEST_GEN_PROGS is sufficient to generate objects.
   Addresses review comments from Kees Cook.

 tools/testing/selftests/seccomp/Makefile | 18 ++++++++----------
 1 file changed, 8 insertions(+), 10 deletions(-)

diff --git a/tools/testing/selftests/seccomp/Makefile b/tools/testing/selftests/seccomp/Makefile
index 1760b3e39730..a0388fd2c3f2 100644
--- a/tools/testing/selftests/seccomp/Makefile
+++ b/tools/testing/selftests/seccomp/Makefile
@@ -1,17 +1,15 @@
 # SPDX-License-Identifier: GPL-2.0
-all:
-
-include ../lib.mk
+CFLAGS += -Wl,-no-as-needed -Wall
+LDFLAGS += -lpthread
 
 .PHONY: all clean
 
-BINARIES := seccomp_bpf seccomp_benchmark
-CFLAGS += -Wl,-no-as-needed -Wall
+include ../lib.mk
+
+# OUTPUT set by lib.mk
+TEST_GEN_PROGS := $(OUTPUT)/seccomp_bpf $(OUTPUT)/seccomp_benchmark
 
-seccomp_bpf: seccomp_bpf.c ../kselftest_harness.h
-	$(CC) $(CFLAGS) $(LDFLAGS) $< -lpthread -o $@
+$(TEST_GEN_PROGS): ../kselftest_harness.h
 
-TEST_PROGS += $(BINARIES)
-EXTRA_CLEAN := $(BINARIES)
+all: $(TEST_GEN_PROGS)
 
-all: $(BINARIES)
-- 
2.20.1

