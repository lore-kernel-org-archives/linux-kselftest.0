Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.248
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793782166;
	b=iQKFXi6ZkNarAMjbL9CDrt2CngGZ+/Oo7m/Gp42BRrClwNx7hJz4/6+MrQBbez/M0IZ9
	 t9zaCftu4/kpR4dWYK8sm+gHYRJa91yprF/h2EWjM9Gr5gQa+hiPgG9lKWJJXAKEqIhTp
	 hCSVQJPOOQ4qi/+7+QyOMchDHpg+86WTPgu5LIBB/tZxmM/u/uoaeX73UUkM0sDaBYaxZ
	 aEOZMUBUnDtFGLO9CGLRUVwcwS1PJhjahHeP3CjpOY7RDIG0Vmqb7iaCnzsle7D8ts3AM
	 ujcXnixrj7gMEfFXw9sgVPJjut0IgXGnWiDwXO2fTisghurWjOOZG0sNPtzX3foJucw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793782166;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=+I8WsWq8sOV3vmMpd+YGpjvAylkwSh0OS20sHp+B9Hg=;
	b=sE431jQhCu52TEyi8EpqFJql3q2kACBBtZJEeXns8tDG3vSZu5QVJ8Yh9Bk4CZ1aiNM0
	 5C6DvsGaTADexr8RR2uTspFhKASaoS1I9XJPZ45BRqoc4XYOSJgEqlTZZ8V6eeuDWEMoT
	 kn7ynW8gEqhnUAEhMoi+1gNldf+FyqRKdCWFkQ7lI7sGcNiAGRTNmImTil5wCpvGPkjxf
	 +nuaH1tENeKdaZVbq2MWs1kfnn6rJy/a8InEHozOXUNiSqiKOzwkH2sWhXQu3Sff2UdDo
	 BXu6oP5x24e9F82rpzrwbuDXtUv7AeNTPI1fNFnO/yORS/xuUJVOWgzMAeNT8F1myew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=Re8e8P37;
	arc=none smtp.remote-ip=91.218.175.248
Received: from mta0.migadu.com (out-248.mta0.migadu.com [91.218.175.248])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0A0A606A32C
	for <linux-kselftest@vger.kernel.org>; Wed,  4 Nov 2026 08:49:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C0A0A606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=Re8e8P37
X-Envelope-To: linux-kselftest@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=M1WgL78C/PeM5M+WNp+VOjJqiHQWWo3nIhv9yVnKYys=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793782163; v=1; x=1794386963;
 b=Re8e8P371aXSCmNSw4SybGFUxb9Du0Njsj85r4XVLq6Rj1KosAY+/8l9nk8onP4V/H3+yo6l
 l9tl3ltcAwAN5iBc20lKSSjuJK/Y3+gQRw1/18F3a/lvI6StZQGqJRqeTpCbf0Uf7POhFtyA4Kp
 T2+KevjAhp7Db9jPdvujQWkE=
X-Envelope-To: linux-kselftest@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id ed74dff9d1c5d370;
	Wed, 04 Nov 2026 08:49:23 +0000
X-Mizu-Trace-ID: ed74dff9d1c5d370
X-Migadu-Flow: FLOW_OUT
From: Fuad Tabba <fuad.tabba@linux.dev>
To: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>
Cc: Will Deacon <will@kernel.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Sean Christopherson <seanjc@google.com>,
	Shuah Khan <shuah@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Vincent Donnefort <vdonnefort@google.com>,
	Quentin Perret <qperret@google.com>,
	Fuad Tabba <tabba@google.com>,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 05/16] KVM: arm64: selftests: Add protected-VM boot trampoline
Date: Wed,  4 Nov 2026 08:48:31 +0000
Message-ID: <20261104084842.132944-6-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261104084842.132944-1-fuad.tabba@linux.dev>
References: <20261104084842.132944-1-fuad.tabba@linux.dev>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

EL2 takes only PC and X0 from the host when it boots a protected vCPU,
and resets everything else. So the registers the selftest library sets
before the first run never reach the guest.

Boot a protected guest through a trampoline that restores X0-X7, seven
EL1 system registers and the stack pointer from a block X0 points to,
then enables the MMU and branches to the guest's entry point.

Co-developed-by: Will Deacon <will@kernel.org>
Signed-off-by: Will Deacon <will@kernel.org>
Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---
 tools/testing/selftests/kvm/Makefile.kvm      |  1 +
 .../selftests/kvm/include/arm64/pkvm.h        | 50 ++++++++++++++++
 .../selftests/kvm/lib/arm64/pvm-entry.S       | 58 +++++++++++++++++++
 3 files changed, 109 insertions(+)
 create mode 100644 tools/testing/selftests/kvm/include/arm64/pkvm.h
 create mode 100644 tools/testing/selftests/kvm/lib/arm64/pvm-entry.S

diff --git a/tools/testing/selftests/kvm/Makefile.kvm b/tools/testing/selftests/kvm/Makefile.kvm
index 17a4256e90819..c254e82f9a786 100644
--- a/tools/testing/selftests/kvm/Makefile.kvm
+++ b/tools/testing/selftests/kvm/Makefile.kvm
@@ -35,6 +35,7 @@ LIBKVM_arm64 += lib/arm64/gic_v3.c
 LIBKVM_arm64 += lib/arm64/gic_v3_its.c
 LIBKVM_arm64 += lib/arm64/handlers.S
 LIBKVM_arm64 += lib/arm64/processor.c
+LIBKVM_arm64 += lib/arm64/pvm-entry.S
 LIBKVM_arm64 += lib/arm64/spinlock.c
 LIBKVM_arm64 += lib/arm64/ucall.c
 LIBKVM_arm64 += lib/arm64/vgic.c
diff --git a/tools/testing/selftests/kvm/include/arm64/pkvm.h b/tools/testing/selftests/kvm/include/arm64/pkvm.h
new file mode 100644
index 0000000000000..6ef769b8ff977
--- /dev/null
+++ b/tools/testing/selftests/kvm/include/arm64/pkvm.h
@@ -0,0 +1,50 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (C) 2025 Google LLC
+ * Author: Fuad Tabba <fuad.tabba@linux.dev>
+ * Author: Will Deacon <will@kernel.org>
+ */
+
+#ifndef SELFTEST_KVM_ARM64_PKVM_H
+#define SELFTEST_KVM_ARM64_PKVM_H
+
+#ifndef __ASSEMBLER__
+/*
+ * Register state the boot trampoline (pvm-entry.S) restores. Only PC and X0
+ * survive to a protected guest's first run, so X0 points at this block.
+ */
+struct pvm_boot_args {
+	u64	jump_tgt;
+
+	u64	regs[8];
+	u64	cpacr_el1;
+	u64	sctlr_el1;
+	u64	tcr_el1;
+	u64	mair_el1;
+	u64	ttbr0_el1;
+	u64	vbar_el1;
+
+	u64	tpidr_el1;
+	u64	sp_el1;
+};
+#endif
+
+#define PVM_BOOT_ARGS_OFF_JUMP_TGT	0
+#define PVM_BOOT_ARGS_OFF_X0		(PVM_BOOT_ARGS_OFF_JUMP_TGT + 8)
+#define PVM_BOOT_ARGS_OFF_X1		(PVM_BOOT_ARGS_OFF_X0 + 8)
+#define PVM_BOOT_ARGS_OFF_X2		(PVM_BOOT_ARGS_OFF_X1 + 8)
+#define PVM_BOOT_ARGS_OFF_X3		(PVM_BOOT_ARGS_OFF_X2 + 8)
+#define PVM_BOOT_ARGS_OFF_X4		(PVM_BOOT_ARGS_OFF_X3 + 8)
+#define PVM_BOOT_ARGS_OFF_X5		(PVM_BOOT_ARGS_OFF_X4 + 8)
+#define PVM_BOOT_ARGS_OFF_X6		(PVM_BOOT_ARGS_OFF_X5 + 8)
+#define PVM_BOOT_ARGS_OFF_X7		(PVM_BOOT_ARGS_OFF_X6 + 8)
+#define PVM_BOOT_ARGS_OFF_CPACR_EL1	(PVM_BOOT_ARGS_OFF_X7 + 8)
+#define PVM_BOOT_ARGS_OFF_SCTLR_EL1	(PVM_BOOT_ARGS_OFF_CPACR_EL1 + 8)
+#define PVM_BOOT_ARGS_OFF_TCR_EL1	(PVM_BOOT_ARGS_OFF_SCTLR_EL1 + 8)
+#define PVM_BOOT_ARGS_OFF_MAIR_EL1	(PVM_BOOT_ARGS_OFF_TCR_EL1 + 8)
+#define PVM_BOOT_ARGS_OFF_TTBR0_EL1	(PVM_BOOT_ARGS_OFF_MAIR_EL1 + 8)
+#define PVM_BOOT_ARGS_OFF_VBAR_EL1	(PVM_BOOT_ARGS_OFF_TTBR0_EL1 + 8)
+#define PVM_BOOT_ARGS_OFF_TPIDR_EL1	(PVM_BOOT_ARGS_OFF_VBAR_EL1 + 8)
+#define PVM_BOOT_ARGS_OFF_SP_EL1	(PVM_BOOT_ARGS_OFF_TPIDR_EL1 + 8)
+
+#endif /* SELFTEST_KVM_ARM64_PKVM_H */
diff --git a/tools/testing/selftests/kvm/lib/arm64/pvm-entry.S b/tools/testing/selftests/kvm/lib/arm64/pvm-entry.S
new file mode 100644
index 0000000000000..a0974cde78da6
--- /dev/null
+++ b/tools/testing/selftests/kvm/lib/arm64/pvm-entry.S
@@ -0,0 +1,58 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (C) 2025 Google LLC
+ * Author: Fuad Tabba <fuad.tabba@linux.dev>
+ * Author: Will Deacon <will@kernel.org>
+ */
+
+#include "pkvm.h"
+
+	.text
+	.balign 16
+	.globl	pvm_entry_start
+pvm_entry_start:
+	mov	x30, x0
+
+	ldr	x0, [x30, #PVM_BOOT_ARGS_OFF_X0]
+	ldr	x1, [x30, #PVM_BOOT_ARGS_OFF_X1]
+	ldr	x2, [x30, #PVM_BOOT_ARGS_OFF_X2]
+	ldr	x3, [x30, #PVM_BOOT_ARGS_OFF_X3]
+	ldr	x4, [x30, #PVM_BOOT_ARGS_OFF_X4]
+	ldr	x5, [x30, #PVM_BOOT_ARGS_OFF_X5]
+	ldr	x6, [x30, #PVM_BOOT_ARGS_OFF_X6]
+	ldr	x7, [x30, #PVM_BOOT_ARGS_OFF_X7]
+
+	ldr	x8, [x30, #PVM_BOOT_ARGS_OFF_JUMP_TGT]
+
+	ldr	x9, [x30, #PVM_BOOT_ARGS_OFF_CPACR_EL1]
+	msr	cpacr_el1, x9
+
+	ldr	x9, [x30, #PVM_BOOT_ARGS_OFF_TCR_EL1]
+	msr	tcr_el1, x9
+
+	ldr	x9, [x30, #PVM_BOOT_ARGS_OFF_MAIR_EL1]
+	msr	mair_el1, x9
+
+	ldr	x9, [x30, #PVM_BOOT_ARGS_OFF_TTBR0_EL1]
+	msr	ttbr0_el1, x9
+
+	ldr	x9, [x30, #PVM_BOOT_ARGS_OFF_VBAR_EL1]
+	msr	vbar_el1, x9
+
+	ldr	x9, [x30, #PVM_BOOT_ARGS_OFF_TPIDR_EL1]
+	msr	tpidr_el1, x9
+
+	ldr	x9, [x30, #PVM_BOOT_ARGS_OFF_SP_EL1]
+	mov	sp, x9
+
+	/* No stale TLB entries, and the writes above in effect, before the MMU is on. */
+	tlbi	vmalle1
+	dsb	nsh
+	isb
+	ldr	x9, [x30, #PVM_BOOT_ARGS_OFF_SCTLR_EL1]
+	msr	sctlr_el1, x9
+	isb
+
+	br	x8
+	.globl	pvm_entry_end
+pvm_entry_end:
-- 
2.47.3

