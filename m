Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15B52379981
	for <linux-kselftest@vger.kernel.org>; Wed,  8 Jul 2026 03:36:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783481790; cv=none; b=D5XkncexLKcnmJp9yxURSuC8RBKhgLTD6Ukp+n+70rwcL69CMyQkxtfIFbVUBclNP6YVDKEN5t2cYxu7/hdEQFsAT/wS9wT6Vs1h8JiU2y+fz4zBXVSY16p/AooG/9xMh0xVmX4Eo9km477L2tOD9p/g9CYhaNiBGwrDRbeHwXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783481790; c=relaxed/simple;
	bh=+jKWnHeDczH8xoiHIK3Lygi5Gw6AxgY9uMrA5zkeP54=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YZ/r6sEFI4au+vItgQZGMGIaKjaVE6zvPjaTWuoiXlI7F2CiY8d4aNzhQHjEBVjENr17WgEipwYp5WNp6jzPR3HwLROtR1YWW33ynfOTzIQdyT9cwTFMuPEzyMxnR4JuVu3Awy+2tkJ8WxCv64tqz+W/qt0uwtK0uB4rsQaHiIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Cd5CNaks; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Cd5CNaks"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-385b78b44a0so228932a91.0
        for <linux-kselftest@vger.kernel.org>; Tue, 07 Jul 2026 20:36:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783481786; x=1784086586; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZUKSVyGeuLfaXKowCYVvUoCbvCT/dFsVHPlSOpbXK9I=;
        b=Cd5CNaksbgaiiGzChFwq2o7BfqDf2aDQtXvW7vele/1fQq9q24Tkxi+cVvy9dlODcB
         +E/KYp72Osd31/6N34T/+UIegvhFDCo+/rey5pNnXJsYQg5BbsaBDpspPFlpr5BJZzY8
         xQ3vti5/uibARQMheDmcnWcsmcKb8lyfIqnZSTnToW1QL4B62R82R+H7fhfOnve+5+dN
         +1cVWxmMURKcCYLOSHsMN7frSdlqkyM+rrdTvQcT8VozgDKw9wCv0U8WL3n4exEU5tUM
         IOKiyePsqWuRVWU64tpDMGeU93+yH1TBBE6VZ8qEScIoFQQ2BdzIjNHtK4618ZbYCNBC
         K9Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783481786; x=1784086586;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZUKSVyGeuLfaXKowCYVvUoCbvCT/dFsVHPlSOpbXK9I=;
        b=tWpJ5hwePe2PEuQBINl1dTQx435LjNs93V73rQaZznQHpP839LaX6+pu7uye2xjqpw
         TC72ER8+CicWtp+mrNx8WKrj8SHX4bqK+g2fOHAluELRSASLQ1TNS99PtcFLC4Ad6OMe
         FNwWNky87IqrHlei/RT1pOvuac4xkEa0WMCrP8OEB7uMy8H1BVHRNB7/I7V5oLSgJ7TZ
         a/TMR8vuyvrqNxi/+/udXHzxqJrkcf59aY2g5Uy1JFctdip3C5DCJChG1WD7ycp5V8R4
         E3HIa5v7MNIMaSlbLZMI1LPk4UtkVQmKee0dHtyCqrxxRXxSibAvXoGxpirXFHhNa6Pr
         ERGQ==
X-Forwarded-Encrypted: i=1; AHgh+RrkupRyp12A9+aocxkQrFU6wB0GJrenXVnkjn6Uhyssa6FOw1x4ukbEGLOBjSH4qMLtMQUU1vKZwf27ZOGnbRw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6kto7z4siuSgdGWn+w+XIIBocC9gjeRkt9EvDq84H4uPYyzTH
	zGyKtSvjJBBUCnMj1jpuJzXEY/0N9NoK8ku1DdLbhwz4DnVkEuzG43w8Dsn8UFOS
X-Gm-Gg: AfdE7clLschkmBqJDkXy41QvqvhQ/4Jtaez9TpK7kNWvUoDaFO2XCGf7cx6arkh6Tfd
	ehAV0+6lUDCzNJgJYclyG/Urv3qJ7hbYoBVB8rvJzWU9cpNclYC6YYsBqPgPVi1v3rAYnuYUDCX
	Z+WVII+d0JaCLf9xmY2ZgoMC+QIigzKeXYr+mIXSVbXUUeikPPa+eoJZ2aL8FtWNGC7lQn50yFS
	1g2msqWcEfnPpg0Itw9xdDo74M6Zp697KktlKfslsQdwLZVhC01qpuHePp7PhdUmvf8BjebioT9
	cnYDe3rgaiyGYXuTswcNHZNJNNAxJcW0DWZP8nD6K4OLPsychwkZ/1HaOhMKYREyt/0TrSzleX8
	xaTG/U8dPagwXFLgbsN18ukLgym1Bmg23QpFgSmJpqWHBQmV8EoSUGx+DE+CifSMGCeOCU4EsP6
	C6PCZzpzfm6A0aGYdGeP/udc5a4DeqTO50FgdznEpzaVOyZ/HcPw==
X-Received: by 2002:a17:90b:554e:b0:37f:ceed:e1d8 with SMTP id 98e67ed59e1d1-389406352cemr605706a91.12.1783481786113;
        Tue, 07 Jul 2026 20:36:26 -0700 (PDT)
Received: from [10.0.0.65] ([2601:647:6700:64d0::94ac])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31174accae5sm21092850eec.29.2026.07.07.20.36.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 20:36:25 -0700 (PDT)
From: Charlie Jenkins <thecharlesjenkins@gmail.com>
Date: Tue, 07 Jul 2026 20:34:27 -0700
Subject: [PATCH v3 04/17] riscv: Add kprobes instruction simulation KUnit
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260707-riscv_insn_table-v3-4-3f8e5f75ba97@gmail.com>
References: <20260707-riscv_insn_table-v3-0-3f8e5f75ba97@gmail.com>
In-Reply-To: <20260707-riscv_insn_table-v3-0-3f8e5f75ba97@gmail.com>
To: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Nam Cao <namcao@linutronix.de>, Alexandre Ghiti <alex@ghiti.fr>, 
 Anup Patel <anup@brainfault.org>, Atish Patra <atish.patra@linux.dev>, 
 Conor Dooley <conor@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>, 
 Andrew Morton <akpm@linux-foundation.org>, Shuah Khan <shuah@kernel.org>, 
 =?utf-8?q?Radim_Kr=C4=8Dm=C3=A1=C5=99?= <radim.krcmar@oss.qualcomm.com>, 
 Jesse Taube <jtaubepe@redhat.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
 linux-kselftest@vger.kernel.org, 
 Charlie Jenkins <thecharlesjenkins@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783481777; l=11557;
 i=thecharlesjenkins@gmail.com; s=20260605; h=from:subject:message-id;
 bh=+jKWnHeDczH8xoiHIK3Lygi5Gw6AxgY9uMrA5zkeP54=;
 b=OEGtZbdzniXuamjk7UknOatyi5ik6a+CReQ9hyBxYkkSKj8T8Q50R03Ihf2+46Gi5d1ZP5Fad
 xr1u1q6MLveDcOz7cpzeb2OiK3xtP57QKtJbMPmmwMLNYXYDUcBH+UC
X-Developer-Key: i=thecharlesjenkins@gmail.com; a=ed25519;
 pk=ajnnRQ98PIdwKp4HeMkq9U32okYbnh6Zb4G3o5XXvkg=

This KUnit iterates through all 32-bit integers and validates that the
simulation code for kprobes simulates properly. These tests are very
slow so they are gated behind a new kconfig option
CONFIG_RISCV_KPROBES_SIMULATE_KUNIT.

Signed-off-by: Charlie Jenkins <thecharlesjenkins@gmail.com>
---
 arch/riscv/kernel/tests/Kconfig.debug              |  13 ++
 arch/riscv/kernel/tests/kprobes/Makefile           |   2 +
 .../kernel/tests/kprobes/test-kprobes-simulate.c   | 250 +++++++++++++++++++++
 arch/riscv/kernel/tests/kprobes/test-kprobes.h     |   6 +
 4 files changed, 271 insertions(+)

diff --git a/arch/riscv/kernel/tests/Kconfig.debug b/arch/riscv/kernel/tests/Kconfig.debug
index 40f8dafffa0a..9eda8938ec15 100644
--- a/arch/riscv/kernel/tests/Kconfig.debug
+++ b/arch/riscv/kernel/tests/Kconfig.debug
@@ -42,6 +42,19 @@ config RISCV_KPROBES_KUNIT
 
          If unsure, say N.
 
+config RISCV_KPROBES_SIMULATE_KUNIT
+       tristate "KUnit test for riscv kprobes instruction simulation" if !KUNIT_ALL_TESTS
+       depends on KUNIT
+       depends on KPROBES
+       default KUNIT_ALL_TESTS
+       help
+         Enable testing for riscv kprobes instruction simulation. Useful for
+         riscv and/or kprobes development. The test verifies that kprobes
+         instruction simulation properly simulates the instructions. These tests
+         are very slow.
+
+         If unsure, say N.
+
 endif # RUNTIME_TESTING_MENU
 
 endmenu # "arch/riscv/kernel runtime Testing"
diff --git a/arch/riscv/kernel/tests/kprobes/Makefile b/arch/riscv/kernel/tests/kprobes/Makefile
index df7256f62313..34db6044e87f 100644
--- a/arch/riscv/kernel/tests/kprobes/Makefile
+++ b/arch/riscv/kernel/tests/kprobes/Makefile
@@ -1,3 +1,5 @@
 obj-$(CONFIG_RISCV_KPROBES_KUNIT) += kprobes_riscv_kunit.o
+obj-$(CONFIG_RISCV_KPROBES_SIMULATE_KUNIT) += kprobes_simulate_riscv_kunit.o
 
 kprobes_riscv_kunit-objs := test-kprobes.o test-kprobes-asm.o
+kprobes_simulate_riscv_kunit-objs := test-kprobes-simulate.o
diff --git a/arch/riscv/kernel/tests/kprobes/test-kprobes-simulate.c b/arch/riscv/kernel/tests/kprobes/test-kprobes-simulate.c
new file mode 100644
index 000000000000..d82706685823
--- /dev/null
+++ b/arch/riscv/kernel/tests/kprobes/test-kprobes-simulate.c
@@ -0,0 +1,250 @@
+// SPDX-License-Identifier: GPL-2.0+
+
+#include <linux/kernel.h>
+#include <linux/kprobes.h>
+#include <kunit/test.h>
+
+#include "../../probes/simulate-insn.h"
+
+#include <asm/insn.h>
+#include <asm/text-patching.h>
+
+static void test_kprobe_simulate_riscv(struct kunit *test)
+{
+	unsigned int addr = 0xdeadbeef;
+	unsigned int i = 0;
+
+	do {
+		struct pt_regs regs = { 0 };
+
+		if (riscv_insn_is_jal(i)) {
+			s32 offset = riscv_insn_jal_extract_imm(i);
+			u32 xd_index = riscv_insn_jal_extract_xd(i);
+
+			simulate_jal(i, addr, &regs);
+
+			KUNIT_EXPECT_EQ_MSG(test, regs.epc, addr + offset,
+					    "jal instruction (0x%x) incorrectly simulated", i);
+
+			if (xd_index)
+				KUNIT_EXPECT_EQ_MSG(
+					test,
+					riscv_insn_reg_get_val((unsigned long *)&regs, xd_index),
+					addr + 4, "jal instruction (0x%x) incorrectly simulated",
+					i);
+		}
+		if (riscv_insn_is_jalr(i)) {
+			unsigned long reg_addr = 0xffff;
+			s32 offset = riscv_insn_jalr_extract_imm(i);
+			u32 rd_index = riscv_insn_jalr_extract_xd(i);
+			u32 rs1_index = riscv_insn_jalr_extract_xs1(i);
+
+			if (rs1_index)
+				riscv_insn_reg_set_val((unsigned long *)&regs, rs1_index, reg_addr);
+			else
+				reg_addr = 0;
+
+			simulate_jalr(i, addr, &regs);
+
+			KUNIT_EXPECT_EQ_MSG(test, regs.epc, (reg_addr + offset) & ~1,
+					    "jalr instruction (0x%x) incorrectly simulated", i);
+
+			if (rd_index)
+				KUNIT_EXPECT_EQ_MSG(
+					test,
+					riscv_insn_reg_get_val((unsigned long *)&regs, rd_index),
+					addr + 4, "jalr instruction (0x%x) incorrectly simulated",
+					i);
+		} else if (riscv_insn_is_auipc(i)) {
+			s32 offset = riscv_insn_auipc_extract_imm(i);
+			u32 rd_index = riscv_insn_auipc_extract_xd(i);
+
+			simulate_auipc(i, addr, &regs);
+
+			KUNIT_EXPECT_EQ_MSG(test, regs.epc, addr + 4,
+					    "auipc instruction (0x%x) incorrectly simulated", i);
+
+			if (rd_index)
+				KUNIT_EXPECT_EQ_MSG(
+					test,
+					riscv_insn_reg_get_val((unsigned long *)&regs, rd_index),
+					(unsigned long)addr + offset,
+					"auipc instruction (0x%x) incorrectly simulated", i);
+		} else if (riscv_insn_is_beq(i)) {
+			s32 offset = riscv_insn_beq_extract_imm(i);
+			u32 rs1_index = riscv_insn_beq_extract_xs1(i);
+			u32 rs2_index = riscv_insn_beq_extract_xs2(i);
+
+			simulate_beq(i, addr, &regs);
+
+			if (riscv_insn_reg_get_val((unsigned long *)&regs, rs1_index) ==
+			    riscv_insn_reg_get_val((unsigned long *)&regs, rs2_index)) {
+				KUNIT_EXPECT_EQ_MSG(test, regs.epc, addr + offset,
+						    "beq instruction (0x%x) incorrectly simulated",
+						    i);
+			} else {
+				KUNIT_EXPECT_EQ_MSG(test, regs.epc, addr + 4,
+						    "beq instruction (0x%x) incorrectly simulated",
+						    i);
+			}
+		} else if (riscv_insn_is_bne(i)) {
+			s32 offset = riscv_insn_bne_extract_imm(i);
+			u32 rs1_index = riscv_insn_bne_extract_xs1(i);
+			u32 rs2_index = riscv_insn_bne_extract_xs2(i);
+
+			simulate_bne(i, addr, &regs);
+
+			if (riscv_insn_reg_get_val((unsigned long *)&regs, rs1_index) !=
+			    riscv_insn_reg_get_val((unsigned long *)&regs, rs2_index)) {
+				KUNIT_EXPECT_EQ_MSG(test, regs.epc, addr + offset,
+						    "bne instruction (0x%x) incorrectly simulated",
+						    i);
+			} else {
+				KUNIT_EXPECT_EQ_MSG(test, regs.epc, addr + 4,
+						    "bne instruction (0x%x) incorrectly simulated",
+						    i);
+			}
+		} else if (riscv_insn_is_blt(i)) {
+			s32 offset = riscv_insn_blt_extract_imm(i);
+			u32 rs1_index = riscv_insn_blt_extract_xs1(i);
+			u32 rs2_index = riscv_insn_blt_extract_xs2(i);
+
+			simulate_blt(i, addr, &regs);
+
+			if ((long)riscv_insn_reg_get_val((unsigned long *)&regs, rs1_index) <
+			    (long)riscv_insn_reg_get_val((unsigned long *)&regs, rs2_index)) {
+				KUNIT_EXPECT_EQ_MSG(test, regs.epc, addr + offset,
+						    "blt instruction (0x%x) incorrectly simulated",
+						    i);
+			} else {
+				KUNIT_EXPECT_EQ_MSG(test, regs.epc, addr + 4,
+						    "blt instruction (0x%x) incorrectly simulated",
+						    i);
+			}
+		} else if (riscv_insn_is_bge(i)) {
+			s32 offset = riscv_insn_bge_extract_imm(i);
+			u32 rs1_index = riscv_insn_bge_extract_xs1(i);
+			u32 rs2_index = riscv_insn_bge_extract_xs2(i);
+
+			simulate_bge(i, addr, &regs);
+
+			if ((long)riscv_insn_reg_get_val((unsigned long *)&regs, rs1_index) >=
+			    (long)riscv_insn_reg_get_val((unsigned long *)&regs, rs2_index)) {
+				KUNIT_EXPECT_EQ_MSG(test, regs.epc, addr + offset,
+						    "bge instruction (0x%x) incorrectly simulated",
+						    i);
+			} else {
+				KUNIT_EXPECT_EQ_MSG(test, regs.epc, addr + 4,
+						    "bge instruction (0x%x) incorrectly simulated",
+						    i);
+			}
+		} else if (riscv_insn_is_bltu(i)) {
+			s32 offset = riscv_insn_bltu_extract_imm(i);
+			u32 rs1_index = riscv_insn_bltu_extract_xs1(i);
+			u32 rs2_index = riscv_insn_bltu_extract_xs2(i);
+
+			simulate_bltu(i, addr, &regs);
+
+			if (riscv_insn_reg_get_val((unsigned long *)&regs, rs1_index) <
+			    riscv_insn_reg_get_val((unsigned long *)&regs, rs2_index)) {
+				KUNIT_EXPECT_EQ_MSG(test, regs.epc, addr + offset,
+						    "bltu instruction (0x%x) incorrectly simulated",
+						    i);
+			} else {
+				KUNIT_EXPECT_EQ_MSG(test, regs.epc, addr + 4,
+						    "bltu instruction (0x%x) incorrectly simulated",
+						    i);
+			}
+		} else if (riscv_insn_is_bgeu(i)) {
+			s32 offset = riscv_insn_bgeu_extract_imm(i);
+			u32 rs1_index = riscv_insn_bgeu_extract_xs1(i);
+			u32 rs2_index = riscv_insn_bgeu_extract_xs2(i);
+
+			simulate_bgeu(i, addr, &regs);
+
+			if (riscv_insn_reg_get_val((unsigned long *)&regs, rs1_index) >=
+			    riscv_insn_reg_get_val((unsigned long *)&regs, rs2_index)) {
+				KUNIT_EXPECT_EQ_MSG(test, regs.epc, addr + offset,
+						    "bgeu instruction (0x%x) incorrectly simulated",
+						    i);
+			} else {
+				KUNIT_EXPECT_EQ_MSG(test, regs.epc, addr + 4,
+						    "bgeu instruction (0x%x) incorrectly simulated",
+						    i);
+			}
+		} else if (riscv_insn_is_c_j(i)) {
+			s32 offset = riscv_insn_c_j_extract_imm(i);
+
+			simulate_c_j(i, addr, &regs);
+
+			KUNIT_EXPECT_EQ_MSG(test, regs.epc, addr + offset,
+					    "c.j instruction (0x%x) incorrectly simulated", i);
+		} else if (riscv_insn_is_c_jr(i)) {
+			u32 rs1_index = riscv_insn_c_jr_extract_xs1(i);
+
+			simulate_c_jr(i, addr, &regs);
+
+			KUNIT_EXPECT_EQ_MSG(test, regs.epc,
+					    riscv_insn_reg_get_val((unsigned long *)&regs,
+								   rs1_index),
+					    "c.jr instruction (0x%x) incorrectly simulated", i);
+		} else if (riscv_insn_is_c_jalr(i)) {
+			unsigned long reg_addr = 0xffff;
+			u32 rs1_index = riscv_insn_c_jalr_extract_xs1(i);
+
+			if (rs1_index)
+				riscv_insn_reg_set_val((unsigned long *)&regs, rs1_index, reg_addr);
+			else
+				reg_addr = 0;
+
+			simulate_c_jalr(i, addr, &regs);
+
+			KUNIT_EXPECT_EQ_MSG(test, regs.epc, reg_addr,
+					    "c.jalr instruction (0x%x) incorrectly simulated", i);
+
+			KUNIT_EXPECT_EQ_MSG(test, regs.ra, addr + 2,
+					    "c.jalr instruction (0x%x) incorrectly simulated", i);
+		} else if (riscv_insn_is_c_bnez(i)) {
+			u32 offset;
+			u32 rs1_index = riscv_insn_c_bnez_extract_xs1(i);
+
+			simulate_c_bnez(i, addr, &regs);
+
+			if (riscv_insn_reg_get_val((unsigned long *)&regs, rs1_index + 8) != 0)
+				offset = riscv_insn_c_bnez_extract_imm(i);
+			else
+				offset = 2;
+
+			KUNIT_EXPECT_EQ_MSG(test, regs.epc, addr + offset,
+					    "c.bnez instruction (0x%x) incorrectly simulated", i);
+		} else if (riscv_insn_is_c_beqz(i)) {
+			u32 offset;
+			u32 rs1_index = riscv_insn_c_beqz_extract_xs1(i);
+
+			simulate_c_beqz(i, addr, &regs);
+
+			if (riscv_insn_reg_get_val((unsigned long *)&regs, rs1_index + 8) == 0)
+				offset = riscv_insn_c_beqz_extract_imm(i);
+			else
+				offset = 2;
+
+			KUNIT_EXPECT_EQ_MSG(test, regs.epc, addr + offset,
+					    "c.beqz instruction (0x%x) incorrectly simulated", i);
+		}
+	} while (++i > 0);
+}
+
+static struct kunit_case kprobes_simulate_testcases[] = {
+	KUNIT_CASE_SLOW(test_kprobe_simulate_riscv),
+	{}
+};
+
+static struct kunit_suite kprobes_simulate_test_suite = {
+	.name = "kprobes_simulate_riscv",
+	.test_cases = kprobes_simulate_testcases,
+};
+
+kunit_test_suites(&kprobes_simulate_test_suite);
+
+MODULE_LICENSE("GPL");
+MODULE_DESCRIPTION("KUnit test for riscv kprobes instruction simulatation");
diff --git a/arch/riscv/kernel/tests/kprobes/test-kprobes.h b/arch/riscv/kernel/tests/kprobes/test-kprobes.h
index 537f44aa9d3f..7a672de8f130 100644
--- a/arch/riscv/kernel/tests/kprobes/test-kprobes.h
+++ b/arch/riscv/kernel/tests/kprobes/test-kprobes.h
@@ -19,6 +19,12 @@ extern void *test_kprobes_addresses[];
 /* array of functions that return KPROBE_TEST_MAGIC */
 extern long (*test_kprobes_functions[])(void);
 
+void test_kprobes_arbitrary(void);
+
+extern unsigned int *test_kprobes_arbitrary_addr;
+
+extern unsigned int *test_kprobes_c_bnez_addr1;
+
 #endif /* __ASSEMBLER__ */
 
 #endif /* TEST_KPROBES_H */

-- 
2.54.0

