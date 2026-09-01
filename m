Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D359F418348;
	Tue,  1 Sep 2026 17:09:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788282582; cv=none; b=UckEc0d8jESnHLXKH0FpAvKsRxrZdK0mYHxzx1ojARgKeu97aMRfQIjgrA1Gl3jNg/van3hrgC4PfiP9Q07Ve3mPSDShtFYWMmYdcTh5fhjz9xbvRFYLX95cTUC4X6FZ0Cj5fLIhuwm4+0NwKfScHehx+UaPwmTkPlb1DN5gwEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788282582; c=relaxed/simple;
	bh=snKqfqgpbLGblFFfDtlaIFqBjQdPY6+ur0ZqOXC1eJo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tEeUMGhVcyf3E7JYjo7n8B6us1scGWf9+sXZS3ji+TgwuZDcbWQoSCUWRDlxNN9HdHF5+vOcE656jjYyOiFRSnlPvEPb2zKIV60N0PALng+otyjmjOTitkiHRnU0UeL2CeLbdjSu51OIOL21LU+1jrSCscPVvjV8aw9Vx3J4LLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GfccV3vh; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GfccV3vh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C6D91F00A3A;
	Tue,  1 Sep 2026 17:09:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788282580;
	bh=HULJndtp0Tjhll/Q5SWktZ6wE7CK9FfHbxH2HGfHzI0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=GfccV3vhxqpptjn1zxNTpPWoJOV3Atdg1depCPnGYPVctGKiKAA697Lr7jZVHjr2K
	 0g/xiZxJs+ElWWJNKebsZNjTF/DuB9UwUhBb6H9mprvTZT5VpEy5hIBnaO7fcI4/Te
	 KuSXLPR404IFX3kAgli/U0DAXgPHeOIsFlOKdzv2K9GUnYVSne+JQPOnDLL/MY/Xcx
	 tsZaHNa40MWFZUJLiDS55LTbD+pZOhv5eWBHud8JfZcItLV7TXivpPN/FjUi3omaX2
	 z55a/Q9kIlSmuh33k0kmiDDn4UkeX2Xb+0jjUGdVSDg3fHTkm3hIXwuJy7fIuxg+9P
	 EOr85rtwwBFuQ==
From: Mark Brown <broonie@kernel.org>
Date: Tue, 01 Sep 2026 18:06:41 +0100
Subject: [PATCH 01/11] kselftest/arm64: Factor Linux syscalls out of
 asm-utils.S
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260901-arm64-fp-stress-kvm-v1-1-31bce995b49b@kernel.org>
References: <20260901-arm64-fp-stress-kvm-v1-0-31bce995b49b@kernel.org>
In-Reply-To: <20260901-arm64-fp-stress-kvm-v1-0-31bce995b49b@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Shuah Khan <shuah@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, 
 Fuad Tabba <fuad.tabba@linux.dev>, Mark Rutland <mark.rutland@arm.com>, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kselftest@vger.kernel.org, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=4894; i=broonie@kernel.org;
 h=from:subject:message-id; bh=snKqfqgpbLGblFFfDtlaIFqBjQdPY6+ur0ZqOXC1eJo=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqlwbFyvxRgj5yarSWfYu94qZF9l6oHxKOlnEtY
 5f/dVPnsm6JATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCapcGxQAKCRAk1otyXVSH
 0HNnB/9g5R84rfeuTXzwQkrVqKRjsMHwxgvoL7Lyt1ZPR8rV5/TccRuzRs0a66TBDAwt3erBsj8
 53vI6g2K2BhCdogP65GC4lyK2w1dcWXujK9aaV160czAp8e6YXwrbtOXTQOGBboz+2MjrWKJouT
 Mxt7FpVdo5Zi2z9egSyhGT1OzycedqYvZ12o0oTa0poJoK1R3UD3NjN0Louy69Ylp3mMqLHDHku
 d+iZAhv5E7PztctUD6KDRx+7cBGF6fuPNsswlcjB/CRaLSf7+XVu5NizsHcd5EyxQ3fk2eE9adE
 7/mTP+LxtsJVswom8iQxSWKN9YZ19hTgUEYfrGd0Egz1Q74x
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

In preparation for building versions of the load programs for fp-stress
that run as KVM guests move the functions that perform syscalls out of
the shared code assembly code in asm-utils.S into a new Linux specific
file asm-utils-linux.S.

No functional change.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 tools/testing/selftests/arm64/fp/Makefile          | 17 +++++----
 tools/testing/selftests/arm64/fp/asm-utils-linux.S | 43 ++++++++++++++++++++++
 tools/testing/selftests/arm64/fp/asm-utils.S       | 36 ------------------
 3 files changed, 53 insertions(+), 43 deletions(-)

diff --git a/tools/testing/selftests/arm64/fp/Makefile b/tools/testing/selftests/arm64/fp/Makefile
index d171021e4cdd..183e9d319b65 100644
--- a/tools/testing/selftests/arm64/fp/Makefile
+++ b/tools/testing/selftests/arm64/fp/Makefile
@@ -22,21 +22,24 @@ TEST_GEN_PROGS_EXTENDED := fp-pidbench fpsimd-test \
 	vlset
 TEST_PROGS_EXTENDED := fpsimd-stress sve-stress ssve-stress za-stress
 
-EXTRA_CLEAN += $(OUTPUT)/asm-utils.o $(OUTPUT)/rdvl.o $(OUTPUT)/za-fork-asm.o
+EXTRA_CLEAN += $(OUTPUT)/asm-utils.o $(OUTPUT)/asm-utils-linux.o \
+	$(OUTPUT)/rdvl.o $(OUTPUT)/za-fork-asm.o
+
+ASM_UTILS := $(OUTPUT)/asm-utils.o $(OUTPUT)/asm-utils-linux.o
 
 # Build with nolibc to avoid effects due to libc's clone() support
-$(OUTPUT)/fp-pidbench: fp-pidbench.S $(OUTPUT)/asm-utils.o
+$(OUTPUT)/fp-pidbench: fp-pidbench.S $(ASM_UTILS)
 	$(CC) -nostdlib $^ -o $@
 $(OUTPUT)/fp-ptrace: fp-ptrace.c fp-ptrace-asm.S
-$(OUTPUT)/fpsimd-test: fpsimd-test.S $(OUTPUT)/asm-utils.o
+$(OUTPUT)/fpsimd-test: fpsimd-test.S $(ASM_UTILS)
 	$(CC) -nostdlib $^ -o $@
 $(OUTPUT)/rdvl-sve: rdvl-sve.c $(OUTPUT)/rdvl.o
 $(OUTPUT)/rdvl-sme: rdvl-sme.c $(OUTPUT)/rdvl.o
 $(OUTPUT)/sve-ptrace: sve-ptrace.c
 $(OUTPUT)/sve-probe-vls: sve-probe-vls.c $(OUTPUT)/rdvl.o
-$(OUTPUT)/sve-test: sve-test.S $(OUTPUT)/asm-utils.o
+$(OUTPUT)/sve-test: sve-test.S $(ASM_UTILS)
 	$(CC) -nostdlib $^ -o $@
-$(OUTPUT)/ssve-test: sve-test.S $(OUTPUT)/asm-utils.o
+$(OUTPUT)/ssve-test: sve-test.S $(ASM_UTILS)
 	$(CC) -DSSVE -nostdlib $^ -o $@
 $(OUTPUT)/vec-syscfg: vec-syscfg.c $(OUTPUT)/rdvl.o
 $(OUTPUT)/vlset: vlset.c
@@ -45,10 +48,10 @@ $(OUTPUT)/za-fork: za-fork.c $(OUTPUT)/za-fork-asm.o
 		-include ../../../../include/nolibc/nolibc.h -I../..\
 		-static -ffreestanding -Wall $^ -o $@
 $(OUTPUT)/za-ptrace: za-ptrace.c
-$(OUTPUT)/za-test: za-test.S $(OUTPUT)/asm-utils.o
+$(OUTPUT)/za-test: za-test.S $(ASM_UTILS)
 	$(CC) -nostdlib $^ -o $@
 $(OUTPUT)/zt-ptrace: zt-ptrace.c
-$(OUTPUT)/zt-test: zt-test.S $(OUTPUT)/asm-utils.o
+$(OUTPUT)/zt-test: zt-test.S $(ASM_UTILS)
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

