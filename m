Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793888048;
	b=nVMHsdFyDQTamP+Ei22r2yjlObgNmBnlLiAtr0pDgGqHJUTOrntZy1LTn7Gdvx+Jqq+g
	 6Qy3AYizjZQFDJI7MS0m+0rtWFvW+rSwbHUaq47IjhifuQRZr8zmH8qbmLiYGkosQaH13
	 olpO+20VkEtrL0rYtXQkkj0300ZFDsyOMECE6SqksJ+EAYa4sR9dJXc0oV03f0oTC8syW
	 7YEtIY1ynni8dP4V5ldrtkzaMdKuF/G+WuBuNVgkRKO6FGcn4lwcAaXMnzozOncwVppS2
	 JmMpl5crWa8xGu5RGyzJARtOGxEN1arJdalyRy/Ru62dn1F9PK3aM9GZsPJ40BgHjgg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793888048;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=1eNs2HQmPLiDjSiZ3s0FNJwEwtww+7IyFoHujvnoR4M=;
	b=f1gIuqiQy/2OstClEoyRR19Rfxop2avegnsEdBQyrR7XsJ2bo6mS22n13nIpJzqms2wr
	 DtBZ5SFaRT6A82WoZQ4lwkBke1cxYKNTMGBhrhkAtfHWinX4HiMWJcWPLsJiIY2BzPG8P
	 V+aA2vzDmOxEBzqKxRQuPfo39nOxr83Xf/Wn8vvPjLnyz+Djdfyob4OTV4CKc4///UjXm
	 XKDwEtX63IrnA35lY1DUgwWj3nIAqxlqRREF7/LxEjp0euKlceLRHRFqDaf52wCnaaSsA
	 FFDi+KbtKxM75lDn6C3Huw+8Z1/lokzmAbGwn/j04Vd8tycmKalU8y8rIb1gliE7RRQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dd7Sla9k;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35A7B606A331;
	Thu,  5 Nov 2026 14:14:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dd7Sla9k
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BDFF01F000C1;
	Thu,  5 Nov 2026 14:14:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793888047;
	bh=1eNs2HQmPLiDjSiZ3s0FNJwEwtww+7IyFoHujvnoR4M=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=dd7Sla9k/M51jfVSL6DdmbOgXz246kcXWwyrecE/1nULnakRnhleRokQO48/Aq/X3
	 ZqnMqsLKtocQ50yvrabfbOrUxtWq/AjL0p3XUEHGEHAPmD6yno919h6pghhnSXKUtA
	 D2xGNrEe5dt7f9/Diq6Vds3WghQuE7lH0k90Bnz/8p8Qb2Ntsgut/uR+CKBse4qb2/
	 SC1MaUspAeCY4OXsvPcQJwt2Zbv/61YtiEe5iG9ZWIN5NcJ+4zDZ+SeIXTl/+G+7sb
	 ElfIZLJE/m0HubPCkihkVnutcOSgj9XVTMIGu/qMSv9X2y/j0w0THibYKnv61iInl0
	 N7VUkDrVUKynw==
From: Mark Brown <broonie@kernel.org>
Date: Thu, 05 Nov 2026 14:01:14 +0000
Subject: [PATCH v2 01/11] kselftest/arm64: Factor Linux syscalls out of
 asm-utils.S
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261105-arm64-fp-stress-kvm-v2-1-81a5172468f0@kernel.org>
References: <20261105-arm64-fp-stress-kvm-v2-0-81a5172468f0@kernel.org>
In-Reply-To: <20261105-arm64-fp-stress-kvm-v2-0-81a5172468f0@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Shuah Khan <shuah@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, 
 Fuad Tabba <fuad.tabba@linux.dev>, Mark Rutland <mark.rutland@arm.com>, 
 Lorenzo Stoakes <ljs@kernel.org>, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kselftest@vger.kernel.org, 
 Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=5000; i=broonie@kernel.org;
 h=from:subject:message-id; bh=Y+BTJzhHc/37sRLFKtDWKMLORopVyDJW0jaxke4d/qg=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLLe9Gt4/J+8+US56wOzAs4Xywr4Yxal8RhqrNjxNeXw0
 gTDa11SHaUsDGJcDLJiiixxWdwv60ter+E7uLANZg4rE8gQBi5OAZhI2ROGfwbHbjlFvzbs9l+g
 +iw+0/5D8E4Nr1C9M7OtnHc8Vtw2ZQ/D//zEjB7mhfWOdu94twprTPlX/e31YeGi5y8y++RPcpr
 osQMA
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

In preparation for building versions of the load programs for fp-stress
that run as bare metal KVM guests move the functions that perform
syscalls out of the shared code assembly code in asm-utils.S into a new
Linux specific file asm-utils-linux.S.

No functional change.

Reviewed-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 tools/testing/selftests/arm64/fp/Makefile          | 17 +++++----
 tools/testing/selftests/arm64/fp/asm-utils-linux.S | 43 ++++++++++++++++++++++
 tools/testing/selftests/arm64/fp/asm-utils.S       | 36 ------------------
 3 files changed, 53 insertions(+), 43 deletions(-)

diff --git a/tools/testing/selftests/arm64/fp/Makefile b/tools/testing/selftests/arm64/fp/Makefile
index d171021e4cdd..d92a755837ff 100644
--- a/tools/testing/selftests/arm64/fp/Makefile
+++ b/tools/testing/selftests/arm64/fp/Makefile
@@ -22,21 +22,24 @@ TEST_GEN_PROGS_EXTENDED := fp-pidbench fpsimd-test \
 	vlset
 TEST_PROGS_EXTENDED := fpsimd-stress sve-stress ssve-stress za-stress
 
-EXTRA_CLEAN += $(OUTPUT)/asm-utils.o $(OUTPUT)/rdvl.o $(OUTPUT)/za-fork-asm.o
+EXTRA_CLEAN += $(OUTPUT)/asm-utils.o $(OUTPUT)/asm-utils-linux.o \
+	$(OUTPUT)/rdvl.o $(OUTPUT)/za-fork-asm.o
+
+ASM_UTILS_LINUX := $(OUTPUT)/asm-utils.o $(OUTPUT)/asm-utils-linux.o
 
 # Build with nolibc to avoid effects due to libc's clone() support
-$(OUTPUT)/fp-pidbench: fp-pidbench.S $(OUTPUT)/asm-utils.o
+$(OUTPUT)/fp-pidbench: fp-pidbench.S $(ASM_UTILS_LINUX)
 	$(CC) -nostdlib $^ -o $@
 $(OUTPUT)/fp-ptrace: fp-ptrace.c fp-ptrace-asm.S
-$(OUTPUT)/fpsimd-test: fpsimd-test.S $(OUTPUT)/asm-utils.o
+$(OUTPUT)/fpsimd-test: fpsimd-test.S $(ASM_UTILS_LINUX)
 	$(CC) -nostdlib $^ -o $@
 $(OUTPUT)/rdvl-sve: rdvl-sve.c $(OUTPUT)/rdvl.o
 $(OUTPUT)/rdvl-sme: rdvl-sme.c $(OUTPUT)/rdvl.o
 $(OUTPUT)/sve-ptrace: sve-ptrace.c
 $(OUTPUT)/sve-probe-vls: sve-probe-vls.c $(OUTPUT)/rdvl.o
-$(OUTPUT)/sve-test: sve-test.S $(OUTPUT)/asm-utils.o
+$(OUTPUT)/sve-test: sve-test.S $(ASM_UTILS_LINUX)
 	$(CC) -nostdlib $^ -o $@
-$(OUTPUT)/ssve-test: sve-test.S $(OUTPUT)/asm-utils.o
+$(OUTPUT)/ssve-test: sve-test.S $(ASM_UTILS_LINUX)
 	$(CC) -DSSVE -nostdlib $^ -o $@
 $(OUTPUT)/vec-syscfg: vec-syscfg.c $(OUTPUT)/rdvl.o
 $(OUTPUT)/vlset: vlset.c
@@ -45,10 +48,10 @@ $(OUTPUT)/za-fork: za-fork.c $(OUTPUT)/za-fork-asm.o
 		-include ../../../../include/nolibc/nolibc.h -I../..\
 		-static -ffreestanding -Wall $^ -o $@
 $(OUTPUT)/za-ptrace: za-ptrace.c
-$(OUTPUT)/za-test: za-test.S $(OUTPUT)/asm-utils.o
+$(OUTPUT)/za-test: za-test.S $(ASM_UTILS_LINUX)
 	$(CC) -nostdlib $^ -o $@
 $(OUTPUT)/zt-ptrace: zt-ptrace.c
-$(OUTPUT)/zt-test: zt-test.S $(OUTPUT)/asm-utils.o
+$(OUTPUT)/zt-test: zt-test.S $(ASM_UTILS_LINUX)
 	$(CC) -nostdlib $^ -o $@
 
 include ../../lib.mk
diff --git a/tools/testing/selftests/arm64/fp/asm-utils-linux.S b/tools/testing/selftests/arm64/fp/asm-utils-linux.S
new file mode 100644
index 000000000000..e6c22b41dc5e
--- /dev/null
+++ b/tools/testing/selftests/arm64/fp/asm-utils-linux.S
@@ -0,0 +1,43 @@
+// SPDX-License-Identifier: GPL-2.0-only
+// Copyright (C) 2015-2021 ARM Limited.
+// Original author: Dave Martin <Dave.Martin@arm.com>
+//
+// Utility functions for assembly code which use Linux syscalls.
+
+#include <asm/unistd.h>
+#include "assembler.h"
+
+// Print a single character x0 to stdout
+// Clobbers x0-x2,x8
+function putc
+	str	x0, [sp, #-16]!
+
+	mov	x0, #1			// STDOUT_FILENO
+	mov	x1, sp
+	mov	x2, #1
+	mov	x8, #__NR_write
+	svc	#0
+
+	add	sp, sp, #16
+	ret
+endfunction
+.globl	putc
+
+// Print a NUL-terminated string starting at address x0 to stdout
+// Clobbers x0-x3,x8
+function puts
+	mov	x1, x0
+
+	mov	x2, #0
+0:	ldrb	w3, [x0], #1
+	cbz	w3, 1f
+	add	x2, x2, #1
+	b	0b
+
+1:	mov	w0, #1			// STDOUT_FILENO
+	mov	x8, #__NR_write
+	svc	#0
+
+	ret
+endfunction
+.globl	puts
diff --git a/tools/testing/selftests/arm64/fp/asm-utils.S b/tools/testing/selftests/arm64/fp/asm-utils.S
index 4b9728efc18d..6d43eb10e01f 100644
--- a/tools/testing/selftests/arm64/fp/asm-utils.S
+++ b/tools/testing/selftests/arm64/fp/asm-utils.S
@@ -4,44 +4,8 @@
 //
 // Utility functions for assembly code.
 
-#include <asm/unistd.h>
 #include "assembler.h"
 
-// Print a single character x0 to stdout
-// Clobbers x0-x2,x8
-function putc
-	str	x0, [sp, #-16]!
-
-	mov	x0, #1			// STDOUT_FILENO
-	mov	x1, sp
-	mov	x2, #1
-	mov	x8, #__NR_write
-	svc	#0
-
-	add	sp, sp, #16
-	ret
-endfunction
-.globl	putc
-	
-// Print a NUL-terminated string starting at address x0 to stdout
-// Clobbers x0-x3,x8
-function puts
-	mov	x1, x0
-
-	mov	x2, #0
-0:	ldrb	w3, [x0], #1
-	cbz	w3, 1f
-	add	x2, x2, #1
-	b	0b
-
-1:	mov	w0, #1			// STDOUT_FILENO
-	mov	x8, #__NR_write
-	svc	#0
-
-	ret
-endfunction
-.globl	puts
-
 // Print an unsigned decimal number x0 to stdout
 // Clobbers x0-x4,x8
 function putdec

-- 
2.47.3

