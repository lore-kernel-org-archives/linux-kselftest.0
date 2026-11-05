Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793888068;
	b=1IjX29dWv7JykWTYS3KjcN0Q8lgClEVhMsLVJqoCnDnOpH5EVvPn661B4NyJGOJP//Lb
	 qvZmriq1mtaxQe+wf76eojNvuY5z2Fl5qd40feky1ctcb0mb/BworWxj59mGJ/PUJ5gCX
	 R4EVK8s2Qdqr8SY+hMPVYDXBF1a029r1LPmJtxHl8kyxDmGGLVQOluZlO77wVUeYFyTy3
	 VRR720Kw4OzpHkEJcdY33Wi7gvt8DN/qWae5jgBLQKMvIHO34QSc9YEmTTcqX3IqCSIIk
	 fdwUln05iOGtiYH/anoOwgBT0Oo4kOxAW7S0zGK/KQn5xtTMB9yTn0jS+BHVbUZMVJg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793888068;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=VAmS04xeYV1OsMCZLWdQe0EQeZQvg91KfjTAgajmxx0=;
	b=YeQM1IjCObYS71lVfLco0XlOJsZc2XLTkwJoywxJXfofDN6J7d9AN+ORppuWR2IPDT+1
	 akbWqstRYJZOO37taBuoaKVHSIM5QBqsNM0tExMKIbvU91PnbptpS5kkRITHkNP9A2H5C
	 wb0Ny2s3zfneBBGIRKERvgmuMr22RaYZav+/0zeQVDN5JTBVIKl86OGwF0N6M26R2JhmP
	 YlcvcjFl/eOv/GYwAOyov9rYXyoP5vXBMp6MLtdC3bMvcbWH24iud4hXm6VVlgVHabzPk
	 wJ9HJYXd6gpuiiIgvsRaBIJWGiqo4crije5VODmQXtT/bKQHgokN1ok+P8QC8rMqDCw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MfAZgIL7;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EFCB606EEA7;
	Thu,  5 Nov 2026 14:14:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MfAZgIL7
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 005231F00A18;
	Thu,  5 Nov 2026 14:14:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793888068;
	bh=VAmS04xeYV1OsMCZLWdQe0EQeZQvg91KfjTAgajmxx0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=MfAZgIL7ValIpKvgHV7umEFNW95xE9tRBhAEKwaARwLRHLELckSJPgpDFza8hpjqO
	 qgxq0hiedervbrmkCl3gr0DMNu3PASdzyDfLlPzgWBpSr10FURYlHx/TVlAhHi9EIA
	 JQ5IlG19fYSg3FgmtWoxboRo5S2K+w43LWxHjrFSU6W3cfh7k5m0EKPrDfBtzEajg7
	 uGFj2CIFr/2oHM/21hf/sma1y9RQOIj09FMWXYDg5D4xd+Tlc7NcNB4CI2V8doV+vK
	 x9lnxjUfJO86g3oxEmq/t2bvlUJgKzeW2JgrOucKy6uR63JZ57ZYi6VP9e50atS8AU
	 prCrq3ThoNFMg==
From: Mark Brown <broonie@kernel.org>
Date: Thu, 05 Nov 2026 14:01:22 +0000
Subject: [PATCH v2 09/11] kselftest/arm64: Build KVM guest versions of the
 fp-stress loads
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
Message-Id: <20261105-arm64-fp-stress-kvm-v2-9-81a5172468f0@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=8803; i=broonie@kernel.org;
 h=from:subject:message-id; bh=W8nCS+dbnEBwk5Ir7p2TWTVjhzMA+eDc+af9TPLIz0o=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLLe9GtuMe4Qn7rmYuDu+M2HXq2N2+xR6hlYd3pvZuUHm
 Yff471dO0pZGMS4GGTFFFnisrhf1pe8XsN3cGEbzBxWJpAhDFycAjCR1SsYGd6f9bgot8T//pZL
 r30XKvG8E+DvXjurWkNyk+Alj0PKN9UZ/um7BsYG720TmL76EOsRLv+9bPfnBEUvvh3BP+9A3ua
 uWfwA
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

Now that all the Linux specifics have been factored out of the load
programs that fp-stress uses and we have a simple VMM we can build
versions for running with that VMM.  Provide an asm-utils-kvm.S with
startup code that's easier in the guest and implementations of the
functions that the programs call, writing output to the fixed address
expected by the VMM and using PSCI to shut down on error.

The programs are built into flat binaries to simplify the VMM, this is a
bit more Makefile effort but it's all fairly standard for bare metal
programming.

We install single instruction BRK handlers for all exceptions with the
expectation that the VMM will trap BRKs and log exception state, we do
not expect to trigger any exceptions in normal operation.

We log the current EL to help with diagnostics.

Since we're constantly reading and writing the contents of the floating
point registers to and from memory there is fairly heavy memory traffic.
We do not currently turn the MMU on so on hardware the number of
iterations a test does will be very much lower that that seen on the
host, this can be addressed in future.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 tools/testing/selftests/arm64/fp/.gitignore        |  3 +
 tools/testing/selftests/arm64/fp/Makefile          | 42 +++++++++-
 tools/testing/selftests/arm64/fp/asm-utils-kvm.S   | 93 ++++++++++++++++++++++
 .../testing/selftests/arm64/fp/fp-stress-kvm.lds.S | 65 +++++++++++++++
 4 files changed, 202 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/arm64/fp/.gitignore b/tools/testing/selftests/arm64/fp/.gitignore
index 229a5c65b65f..7a788b23ae76 100644
--- a/tools/testing/selftests/arm64/fp/.gitignore
+++ b/tools/testing/selftests/arm64/fp/.gitignore
@@ -1,6 +1,7 @@
 fp-pidbench
 fp-ptrace
 fp-stress
+fp-stress-kvm.lds
 fp-stress-vmm
 fpsimd-test
 kernel-test
@@ -17,3 +18,5 @@ za-ptrace
 za-test
 zt-ptrace
 zt-test
+*-kvm.bin
+*-kvm.elf
diff --git a/tools/testing/selftests/arm64/fp/Makefile b/tools/testing/selftests/arm64/fp/Makefile
index 3c4e17a34776..dbe0fcd4a722 100644
--- a/tools/testing/selftests/arm64/fp/Makefile
+++ b/tools/testing/selftests/arm64/fp/Makefile
@@ -3,6 +3,8 @@
 # A proper top_srcdir is needed by KSFT(lib.mk)
 top_srcdir = $(realpath ../../../../../)
 
+include ../../../../build/Build.include
+
 CFLAGS += $(KHDR_INCLUDES)
 
 TEST_GEN_PROGS := \
@@ -21,17 +23,41 @@ TEST_GEN_PROGS_EXTENDED := fp-pidbench fp-stress-vmm fpsimd-test \
 	zt-test \
 	vlset
 TEST_PROGS_EXTENDED := fpsimd-stress sve-stress ssve-stress za-stress
+TEST_GEN_FILES := \
+	fpsimd-test-kvm.bin \
+	sve-test-kvm.bin \
+	ssve-test-kvm.bin \
+	za-test-kvm.bin \
+	zt-test-kvm.bin
 
 EXTRA_CLEAN += $(OUTPUT)/asm-utils.o $(OUTPUT)/asm-utils-linux.o \
-	$(OUTPUT)/rdvl.o $(OUTPUT)/za-fork-asm.o
+	$(OUTPUT)/rdvl.o $(OUTPUT)/za-fork-asm.o \
+	$(patsubst %.bin,%.elf,$(TEST_GEN_FILES)) \
+	$(KVM_LDS)
 
 ASM_UTILS_LINUX := $(OUTPUT)/asm-utils.o $(OUTPUT)/asm-utils-linux.o
+ASM_UTILS_KVM := asm-utils.S asm-utils-kvm.S
+
+ifneq ($(LLVM),)
+OBJCOPY ?= $(LLVM_PREFIX)llvm-objcopy$(LLVM_SUFFIX)
+else
+OBJCOPY ?= $(CROSS_COMPILE)objcopy
+endif
 
 # For sysreg definitons
 ARCH_INCLUDES := $(KHDR_INCLUDES) -I$(top_srcdir)/tools/arch/arm64/include \
 	-I$(top_srcdir)/tools/include \
 	-I$(top_srcdir)/tools/include/generated
 
+# The guests run with no OS under them at all, link them as flat binaries
+# with the link script placing them where fp-stress-vmm puts their RAM.
+KVM_LDS := $(OUTPUT)/fp-stress-kvm.lds
+KVM_LDFLAGS := -nostdlib -static $(ARCH_INCLUDES) -D__ASSEMBLY__ \
+	-Wl,-T,$(KVM_LDS)
+
+$(KVM_LDS): fp-stress-kvm.lds.S fp-stress-vmm.h
+	$(CC) -E -P -x c $< -o $@
+
 $(OUTPUT)/fp-stress-vmm: CFLAGS += $(ARCH_INCLUDES)
 
 # Build with nolibc to avoid effects due to libc's clone() support
@@ -61,4 +87,18 @@ $(OUTPUT)/zt-ptrace: zt-ptrace.c
 $(OUTPUT)/zt-test: zt-test.S $(ASM_UTILS_LINUX)
 	$(CC) -nostdlib $^ -o $@
 
+$(OUTPUT)/fpsimd-test-kvm.elf: fpsimd-test.S $(ASM_UTILS_KVM) $(KVM_LDS)
+	$(CC) $(KVM_LDFLAGS) $(filter %.S,$^) -o $@
+$(OUTPUT)/sve-test-kvm.elf: sve-test.S $(ASM_UTILS_KVM) $(KVM_LDS)
+	$(CC) $(KVM_LDFLAGS) $(filter %.S,$^) -o $@
+$(OUTPUT)/ssve-test-kvm.elf: sve-test.S $(ASM_UTILS_KVM) $(KVM_LDS)
+	$(CC) -DSSVE $(KVM_LDFLAGS) $(filter %.S,$^) -o $@
+$(OUTPUT)/za-test-kvm.elf: za-test.S $(ASM_UTILS_KVM) $(KVM_LDS)
+	$(CC) $(KVM_LDFLAGS) $(filter %.S,$^) -o $@
+$(OUTPUT)/zt-test-kvm.elf: zt-test.S $(ASM_UTILS_KVM) $(KVM_LDS)
+	$(CC) $(KVM_LDFLAGS) $(filter %.S,$^) -o $@
+
+$(OUTPUT)/%-kvm.bin: $(OUTPUT)/%-kvm.elf
+	$(OBJCOPY) -O binary $< $@
+
 include ../../lib.mk
diff --git a/tools/testing/selftests/arm64/fp/asm-utils-kvm.S b/tools/testing/selftests/arm64/fp/asm-utils-kvm.S
new file mode 100644
index 000000000000..89a6385a5768
--- /dev/null
+++ b/tools/testing/selftests/arm64/fp/asm-utils-kvm.S
@@ -0,0 +1,93 @@
+// SPDX-License-Identifier: GPL-2.0-only
+//
+// Utility functions for assembly code programs run under fp-stress-vmm.
+//
+// Copyright 2026, Arm Ltd
+
+#include <asm/sysreg.h>
+
+#include "assembler.h"
+#include "asm-offsets.h"
+#include "fp-stress-vmm.h"
+
+#define PSCI_0_2_FN_SYSTEM_OFF		0x84000008
+
+// Print a single character x0 to the console
+// Clobbers x1
+function putc
+	movz	x1, #(CONSOLE_BASE >> 16), lsl #16
+	strb	w0, [x1]
+	ret
+endfunction
+.globl	putc
+
+// Print a \0 terminated string starting at address x0 to the console.
+// Doesn't use putc as a slight optimisation.
+// Clobbers x0-x3
+function puts
+	mov	x2, x0
+	movz	x3, #(CONSOLE_BASE >> 16), lsl #16
+
+0:	ldrb	w0, [x2], #1
+	cbz	w0, 1f
+	strb	w0, [x3]
+	b	0b
+
+1:	ret
+endfunction
+.globl	puts
+
+// Report errors to the host by shutting down, there is no other reason one
+// of these test programs should exit.
+function exit_error
+	movz	x0, #(PSCI_0_2_FN_SYSTEM_OFF >> 16), lsl #16
+	movk	x0, #(PSCI_0_2_FN_SYSTEM_OFF & 0xffff)
+
+	// PSCI uses SMC at EL2 and HVC at EL1.
+	mrs	x1, CurrentEL
+	cmp	x1, #(2 << 2)
+	b.eq	1f
+	hvc	#0
+	b	2f
+
+1:	smc	#0
+2:	b	2b		// PSCI should not have returned
+endfunction
+.globl	exit_error
+
+// Exception vectors.  We have no handlers for anything so each entry
+// just BRKs with its own number.
+	.balign	2048
+vectors:
+	.irp	vector, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15
+	.balign	0x80
+	brk	#\vector
+	.endr
+
+// Main program entry point.
+//
+// The VMM starts us at the very start of the image so the link script
+// places .text.boot first.
+	.section .text.boot, "ax"
+.globl _start
+function _start
+	// Vectors that report any exception we take to the VMM.
+	adr	x0, vectors
+	msr	VBAR_EL1, x0
+
+	// The VMM sizes our RAM as the image plus GUEST_EXTRA_RAM, put the
+	// stack at the top of that so it grows down away from the image.
+	ldr	x0, =_end
+	ldr	x1, =GUEST_EXTRA_RAM
+	add	x0, x0, x1
+	and	x0, x0, #~15
+	mov	sp, x0
+
+	// Log the current EL for diagnostic purposes.
+	puts	"EL:\t\tEL"
+	mrs	x0, CurrentEL
+	ubfx	x0, x0, #2, #2
+	bl	putdecn
+
+	b	main
+endfunction
diff --git a/tools/testing/selftests/arm64/fp/fp-stress-kvm.lds.S b/tools/testing/selftests/arm64/fp/fp-stress-kvm.lds.S
new file mode 100644
index 000000000000..ecb904bbf4ec
--- /dev/null
+++ b/tools/testing/selftests/arm64/fp/fp-stress-kvm.lds.S
@@ -0,0 +1,65 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Link script for the flat binary builds of the fp-stress loads which run
+ * as guests under fp-stress-vmm.
+ *
+ * The VMM loads the image at the start of the guest RAM and starts the
+ * guest there so the startup code has to be first in the image, it is in
+ * .text.boot for that.
+ */
+
+#include "fp-stress-vmm.h"
+
+OUTPUT_ARCH(aarch64)
+ENTRY(_start)
+
+PHDRS
+{
+	text PT_LOAD FLAGS(5); /* PF_R | PF_X */
+	rodata PT_LOAD FLAGS(4); /* PF_R */
+	data PT_LOAD FLAGS(6); /* PF_R | PF_W */
+}
+
+SECTIONS
+{
+	. = GUEST_RAM_BASE;
+
+	.text : {
+		*(.text.boot)
+		*(.text)
+		*(.text.*)
+	} :text
+
+	.rodata : {
+		*(.rodata)
+		*(.rodata.*)
+	} :rodata
+
+	.data : {
+		*(.data)
+		*(.data.*)
+	} :data
+
+	.bss : {
+		*(.bss)
+		*(.bss.*)
+		*(COMMON)
+	} :data
+
+	. = ALIGN(16);
+	_end = .;
+
+	/DISCARD/ : {
+		*(.note*)
+		*(.comment)
+		*(.eh_frame*)
+	}
+}
+
+/*
+ * The VMM sizes the guest RAM from the size of the image file and the
+ * guest puts its stack immediately above _end, anything allocated but not
+ * present in the file would leave the two disagreeing about where the RAM
+ * ends.
+ */
+ASSERT(SIZEOF(.bss) == 0, "fp-stress guests must not have a .bss")

-- 
2.47.3

