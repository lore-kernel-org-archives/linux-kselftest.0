Return-Path: <linux-kselftest-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDE8BEB64DC
	for <linux-kselftest@archiver.kernel.org>; Sun, 25 Jun 2023 16:36:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231247AbjFYQgR (ORCPT
        <rfc822;linux-kselftest@archiver.kernel.org>);
        Sun, 25 Jun 2023 12:36:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37188 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230389AbjFYQgJ (ORCPT
        <rfc822;linux-kselftest@vger.kernel.org>);
        Sun, 25 Jun 2023 12:36:09 -0400
Received: from bg4.exmail.qq.com (bg4.exmail.qq.com [43.155.65.254])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 523C210E7;
        Sun, 25 Jun 2023 09:35:53 -0700 (PDT)
X-QQ-mid: bizesmtp91t1687710943ty5a4ucc
Received: from linux-lab-host.localdomain ( [116.30.129.193])
        by bizesmtp.qq.com (ESMTP) with 
        id ; Mon, 26 Jun 2023 00:35:42 +0800 (CST)
X-QQ-SSF: 01200000000000D0V000000A0000000
X-QQ-FEAT: QHkcO4X2U8hovBxPmn/3fLiGx7agNworDtGVv7Cb7ihBg5UWBCc18OSIeh6Le
        IUaG7oTsKmsWdN1jJ/6vOl4WQLNgLuIDGG/hDmNprRW4tddA/UyU3VrCx+lV/TrEcfe2toy
        3THX4LXODQSQIUcCLGglclpDWQmf6kaxY2P3Yh57UDj8LCOzSUewZDs0oJxvSl2Ij4LPVIX
        /C5rzPXH5Om7hLdMuQyXxaG5h0x6GtzMKzNTt+vV1nToUxls/iqBOi2FHxnGesLy3V0hb0t
        35tnaExf9PXCWSBfW4hYoeu+6Xbs+ieFNMKQhl6dBm2B+Z9oVw4ZRbGMI7gQZaUV3Hw05fg
        Igf18mJeZsxb0XR233Xhfd0qNd85MZP7Epeo46AKIPmMCO/VVk=
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 13129285188948517709
From:   Zhangjin Wu <falcon@tinylab.org>
To:     thomas@t-8ch.de, w@1wt.eu
Cc:     falcon@tinylab.org, arnd@arndb.de, linux-kernel@vger.kernel.org,
        linux-kselftest@vger.kernel.org
Subject: [PATCH v1 16/22] selftests/nolibc: add extra configs for riscv64
Date:   Mon, 26 Jun 2023 00:35:23 +0800
Message-Id: <0bea7430b0c9e1fbc77ddbdbd91d698634726e3d.1687706332.git.falcon@tinylab.org>
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

riscv implies riscv64, so, the same config options added for riscv and
riscv64.

Add 8250 console for test result print.

Signed-off-by: Zhangjin Wu <falcon@tinylab.org>
---
 tools/testing/selftests/nolibc/Makefile | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tools/testing/selftests/nolibc/Makefile b/tools/testing/selftests/nolibc/Makefile
index 3ba2c25eaa8e..8f9cb118cefe 100644
--- a/tools/testing/selftests/nolibc/Makefile
+++ b/tools/testing/selftests/nolibc/Makefile
@@ -65,6 +65,8 @@ EXTCONFIG_arm64      = -e SERIAL_AMBA_PL011 -e SERIAL_AMBA_PL011_CONSOLE
 EXTCONFIG_arm        = $(addprefix -e ,COMPAT_32BIT_TIME MMU ARCH_MULTIPLATFORM ARCH_MULTI_V7 ARM_PATCH_PHYS_VIRT ARCH_VIRT SERIAL_AMBA_PL011 SERIAL_AMBA_PL011_CONSOLE)
 EXTCONFIG_mips       = $(addprefix -e ,COMPAT_32BIT_TIME MIPS_MALTA CPU_LITTLE_ENDIAN CPU_MIPS32_R2 SERIAL_8250 SERIAL_8250_CONSOLE)
 EXTCONFIG_riscv32    = $(addprefix -e ,MMU ARCH_RV32I NONPORTABLE SERIAL_8250 SERIAL_8250_CONSOLE SERIAL_OF_PLATFORM)
+EXTCONFIG_riscv64    = -e SERIAL_8250 -e SERIAL_8250_CONSOLE -e SERIAL_OF_PLATFORM
+EXTCONFIG_riscv      = -e SERIAL_8250 -e SERIAL_8250_CONSOLE -e SERIAL_OF_PLATFORM
 EXTCONFIG_ARCH       = $(EXTCONFIG_$(ARCH))
 
 # extra kernel configs, include common + architecture specific
-- 
2.25.1

