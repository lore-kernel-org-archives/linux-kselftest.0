Return-Path: <linux-kselftest-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60C8DEB64DC
	for <linux-kselftest@archiver.kernel.org>; Sun, 25 Jun 2023 16:35:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231381AbjFYQff (ORCPT
        <rfc822;linux-kselftest@archiver.kernel.org>);
        Sun, 25 Jun 2023 12:35:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36556 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230192AbjFYQfc (ORCPT
        <rfc822;linux-kselftest@vger.kernel.org>);
        Sun, 25 Jun 2023 12:35:32 -0400
Received: from bg4.exmail.qq.com (bg4.exmail.qq.com [43.155.65.254])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1AC7F119;
        Sun, 25 Jun 2023 09:35:09 -0700 (PDT)
X-QQ-mid: bizesmtp79t1687710859tqxiqm8q
Received: from linux-lab-host.localdomain ( [116.30.129.193])
        by bizesmtp.qq.com (ESMTP) with 
        id ; Mon, 26 Jun 2023 00:34:18 +0800 (CST)
X-QQ-SSF: 01200000000000D0V000000A0000000
X-QQ-FEAT: k0mQ4ihyJQOTuhpss9scD3ORA7HKx+iDT2vgzMbOMHbCOBVM+4lja0YIoyg57
        mGvpXZCoXiOqeclB7d/EcpYmus7bMLSlYJ1eE/eKkh/qjwS09IAIsVQ2wRLmZzRF7/dFNr2
        oZCbeqr+xhAGQyHU2YJ8b2BlykzXaME7H09r8es2lfMeDwwUsDLFvWknZq/yuRqSfSINUqA
        xvDCGR45cEsV3By50UOGQB+HG8M7F6e+B/Ao4PwV/1bDP2zivVn+XPL2dqBzWPU9HwQPEsQ
        JR8h+bAe/pOvbatOxNWnHrmGaevw0Erj9mn0H9mOlg+vFnmXjrWkliSyKtlccRK8zn363mQ
        ORbWVVBnVidFO2QvJCOxQaRmhje8MrZ4pt7FrLPQMz8umtgxQyPO+35kkx/fQ==
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 4357656909882141855
From:   Zhangjin Wu <falcon@tinylab.org>
To:     thomas@t-8ch.de, w@1wt.eu
Cc:     falcon@tinylab.org, arnd@arndb.de, linux-kernel@vger.kernel.org,
        linux-kselftest@vger.kernel.org
Subject: [PATCH v1 15/22] selftests/nolibc: add extra configs for riscv32
Date:   Mon, 26 Jun 2023 00:34:12 +0800
Message-Id: <4937593aec1f39fbc44231a874a787eb29d7a47f.1687706332.git.falcon@tinylab.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1687706332.git.falcon@tinylab.org>
References: <cover.1687706332.git.falcon@tinylab.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:tinylab.org:qybglogicsvrsz:qybglogicsvrsz3a-3
Precedence: bulk
List-ID: <linux-kselftest.vger.kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org

Enable minimal configs for the riscv32 virt board of qemu.

Add 8250 console for test result print.

Signed-off-by: Zhangjin Wu <falcon@tinylab.org>
---
 tools/testing/selftests/nolibc/Makefile | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tools/testing/selftests/nolibc/Makefile b/tools/testing/selftests/nolibc/Makefile
index 234abf54cac5..3ba2c25eaa8e 100644
--- a/tools/testing/selftests/nolibc/Makefile
+++ b/tools/testing/selftests/nolibc/Makefile
@@ -64,6 +64,7 @@ EXTCONFIG_x86        = -e 64BIT -e SERIAL_8250 -e SERIAL_8250_CONSOLE
 EXTCONFIG_arm64      = -e SERIAL_AMBA_PL011 -e SERIAL_AMBA_PL011_CONSOLE
 EXTCONFIG_arm        = $(addprefix -e ,COMPAT_32BIT_TIME MMU ARCH_MULTIPLATFORM ARCH_MULTI_V7 ARM_PATCH_PHYS_VIRT ARCH_VIRT SERIAL_AMBA_PL011 SERIAL_AMBA_PL011_CONSOLE)
 EXTCONFIG_mips       = $(addprefix -e ,COMPAT_32BIT_TIME MIPS_MALTA CPU_LITTLE_ENDIAN CPU_MIPS32_R2 SERIAL_8250 SERIAL_8250_CONSOLE)
+EXTCONFIG_riscv32    = $(addprefix -e ,MMU ARCH_RV32I NONPORTABLE SERIAL_8250 SERIAL_8250_CONSOLE SERIAL_OF_PLATFORM)
 EXTCONFIG_ARCH       = $(EXTCONFIG_$(ARCH))
 
 # extra kernel configs, include common + architecture specific
-- 
2.25.1

