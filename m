Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EDE93B9930;
	Tue, 21 Jul 2026 22:07:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784671631; cv=none; b=VYuYqZ3QZC0j9/DxcGkKfS/3iw4sbRcP9Swcgmef4Ss3XQB2fbo0EGQIwre3fDNXf9VicLg3C3cb0uFcUAD2jcysdsL6mCg6MQwXU069aH3w/RqDWrcRtsEsz7v8XE3BrA6+GMzLLNIzmF0rfer6vXNpSrU4Msh1IU0aWQy5Mf8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784671631; c=relaxed/simple;
	bh=TTp1xDbkUb96djWCbF2mmA33y9oUbQERvW25a3o74WA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=NzVqEnyUf0004qNm5XnF5TF8q3dXa9z4tjmNNJ4Irp644WsSkAVXMHMzQ31uaUzdxoRQVGuuqdCLehP9VD2np8esesYX3nzdAP2QrgAu4sCsAqzf2BO9gTBtccLvv0RFdJX1VoIFyBTRGBXtp/ThbC1254CWfDguqhZhady/7vg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=MW4eYlAe; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="MW4eYlAe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1784671627;
	bh=TTp1xDbkUb96djWCbF2mmA33y9oUbQERvW25a3o74WA=;
	h=From:Date:Subject:To:Cc:From;
	b=MW4eYlAeZkYVy95ZqN4MXHWsKw4Z7oUPrZWNRhngPlEZtF/Br7mr+0rwokLWgDyEB
	 qhPiMvbYKNwipxQfBVe3rbudQyzNISaqurQa0Gy2Ugwx1efxLaF+rJeYP+9eauADth
	 f7RRUcmQJZ/AXgRJS285cgwUaXnjAuHEiw8vHFqQ=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Wed, 22 Jul 2026 00:07:05 +0200
Subject: [PATCH v2] tools/nolibc: add support for Alpha
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260722-nolibc-alpha-v2-1-4970e48eb7bf@weissschuh.net>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/1XMwQ6CMAzG8VcxPTuzrQPEk+9hOOCorgkZZEXUE
 N7diSfT07/J91tAKDEJnHYLJJpZeIg57H4HPrTxToq73GC1LXSpaxWHnq9etf0YWoVIVV06Vzj
 nIU/GRDd+bdylyR1YpiG9N3023+8Pqgz+Q7NR+bQ1JSJ2qI/nJ7GI+PAIh0gTNOu6fgAeOsy0r
 QAAAA==
X-Change-ID: 20250609-nolibc-alpha-33e79644544c
To: Willy Tarreau <w@1wt.eu>, Shuah Khan <shuah@kernel.org>, 
 Richard Henderson <richard.henderson@linaro.org>, 
 Matt Turner <mattst88@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 linux-alpha@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, 
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784671626; l=14964;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=TTp1xDbkUb96djWCbF2mmA33y9oUbQERvW25a3o74WA=;
 b=n6RyVcj3912gMDEhNVm20W2RIjEuVdj6Eu1AwF1F0HgLOKYznEX7/4kYjgvqWGMDOSC+xgGSw
 yNItns4IjSEBzvQ4xM3l4+NZ8uiSHxV2l5wHAPQnmdNH1iEwTRkx/TB
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=

A straightforward new architecture.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
Only tested on QEMU so far.
Testing on real hardware would be very welcome.

Test instructions:
$ cd tools/testings/selftests/nolibc/
$ make -f Makefile.nolibc ARCH=alpha CROSS_COMPILE=alpha-linux- nolibc-test
$ file nolibc-test
nolibc-test: ELF 64-bit LSB executable, Alpha (unofficial), version 1 (SYSV), statically linked, not stripped
$ ./nolibc-test
Running test 'startup'
0 argc = 1                                                        [OK]
...
Total number of errors: 0
Exiting with status 0
---
Changes in v2:
- Add clobbers to system call arguments
- Adapt to new system call wrapper names
- Avoid multiple register variables with same register
- Expand comment about special brk handling
- Rebase on latest nolibc/for-next
- Link to v1: https://lore.kernel.org/r/20250713-nolibc-alpha-v1-1-10216333d308@weissschuh.net
---
 tools/include/nolibc/Makefile                  |   2 +-
 tools/include/nolibc/arch-alpha.h              | 162 +++++++++++++++++++++++++
 tools/include/nolibc/arch.h                    |   2 +
 tools/testing/selftests/nolibc/Makefile.nolibc |   2 +
 tools/testing/selftests/nolibc/nolibc-test.c   |   4 +
 tools/testing/selftests/nolibc/run-tests.sh    |   3 +-
 6 files changed, 173 insertions(+), 2 deletions(-)

diff --git a/tools/include/nolibc/Makefile b/tools/include/nolibc/Makefile
index 00fd2e566d75..6d213d372bf8 100644
--- a/tools/include/nolibc/Makefile
+++ b/tools/include/nolibc/Makefile
@@ -17,7 +17,7 @@ endif
 # it defaults to this nolibc directory.
 OUTPUT ?= $(CURDIR)/
 
-architectures := arm arm64 loongarch m68k mips openrisc parisc powerpc riscv s390 sh sparc x86
+architectures := alpha arm arm64 loongarch m68k mips openrisc parisc powerpc riscv s390 sh sparc x86
 arch_files := arch.h $(addsuffix .h, $(addprefix arch-, $(architectures)))
 all_files := \
 		alloca.h \
diff --git a/tools/include/nolibc/arch-alpha.h b/tools/include/nolibc/arch-alpha.h
new file mode 100644
index 000000000000..f6c0b905f594
--- /dev/null
+++ b/tools/include/nolibc/arch-alpha.h
@@ -0,0 +1,162 @@
+/* SPDX-License-Identifier: LGPL-2.1 OR MIT */
+/*
+ * Alpha specific definitions for NOLIBC
+ * Copyright (C) 2025 Thomas Weißschuh <linux@weissschuh.net>
+ */
+
+#ifndef _NOLIBC_ARCH_ALPHA_H
+#define _NOLIBC_ARCH_ALPHA_H
+
+#include "compiler.h"
+#include "crt.h"
+
+/*
+ * Syscalls for Alpha:
+ *   - registers are 64-bit
+ *   - syscall number is passed in $0/v0
+ *   - the system call is performed by calling callsys
+ *   - syscall return comes in $0/v0, error flag in $19/a4
+ *   - arguments are passed in $16/a0 to $21/a5
+ *   - GCC does not support symbol register names
+ */
+
+#define _NOLIBC_SYSCALL_CLOBBERLIST \
+	"$1", "$2", "$3", "$4", "$5", "$6", "$7", "$8", \
+	"$22", "$23", "$24", "$25", "$27", "$28", "memory", "cc"
+
+#define __nolibc_syscall0(num)                                                \
+({                                                                            \
+	register long _num __asm__ ("$0") = (num);                            \
+	register long _err __asm__ ("$19");                                   \
+                                                                              \
+	__asm__ volatile (                                                    \
+		"callsys"                                                     \
+		: "+r"(_num), "=r"(_err)                                      \
+		:                                                             \
+		: _NOLIBC_SYSCALL_CLOBBERLIST,                                \
+		  "$16", "$17", "$18", "$20", "$21"                           \
+	);                                                                    \
+	_err ? -_num : _num;                                                  \
+})
+
+#define __nolibc_syscall1(num, arg1)                                          \
+({                                                                            \
+	register long _num __asm__ ("$0") = (num);                            \
+	register long _err __asm__ ("$19");                                   \
+	register long _arg1 __asm__ ("$16") = (long)(arg1);                   \
+                                                                              \
+	__asm__ volatile (                                                    \
+		"callsys"                                                     \
+		: "+r"(_num), "=r"(_err)                                      \
+		: "r"(_arg1)                                                  \
+		: _NOLIBC_SYSCALL_CLOBBERLIST, "$17", "$18", "$20", "$21"     \
+	);                                                                    \
+	_err ? -_num : _num;                                                  \
+})
+
+#define __nolibc_syscall2(num, arg1, arg2)                                    \
+({                                                                            \
+	register long _num __asm__ ("$0") = (num);                            \
+	register long _err __asm__ ("$19");                                   \
+	register long _arg1 __asm__ ("$16") = (long)(arg1);                   \
+	register long _arg2 __asm__ ("$17") = (long)(arg2);                   \
+                                                                              \
+	__asm__ volatile (                                                    \
+		"callsys"                                                     \
+		: "+r"(_num), "=r"(_err)                                      \
+		: "r"(_arg1), "r"(_arg2)                                      \
+		: _NOLIBC_SYSCALL_CLOBBERLIST, "$18", "$20", "$21"            \
+	);                                                                    \
+	_err ? -_num : _num;                                                  \
+})
+
+#define __nolibc_syscall3(num, arg1, arg2, arg3)                              \
+({                                                                            \
+	register long _num __asm__ ("$0") = (num);                            \
+	register long _err __asm__ ("$19");                                   \
+	register long _arg1 __asm__ ("$16") = (long)(arg1);                   \
+	register long _arg2 __asm__ ("$17") = (long)(arg2);                   \
+	register long _arg3 __asm__ ("$18") = (long)(arg3);                   \
+                                                                              \
+	__asm__ volatile (                                                    \
+		"callsys"                                                     \
+		: "+r"(_num), "=r"(_err)                                      \
+		: "r"(_arg1), "r"(_arg2), "r"(_arg3)                          \
+		: _NOLIBC_SYSCALL_CLOBBERLIST, "$20", "$21"                   \
+	);                                                                    \
+	_err ? -_num : _num;                                                  \
+})
+
+#define __nolibc_syscall4(num, arg1, arg2, arg3, arg4)                        \
+({                                                                            \
+	register long _num __asm__ ("$0") = (num);                            \
+	register long _err __asm__ ("$19");                                   \
+	register long _arg1 __asm__ ("$16") = (long)(arg1);                   \
+	register long _arg2 __asm__ ("$17") = (long)(arg2);                   \
+	register long _arg3 __asm__ ("$18") = (long)(arg3);                   \
+	register long _arg4 __asm__ ("$19") = (long)(arg4);                   \
+                                                                              \
+	__asm__ volatile (                                                    \
+		"callsys"                                                     \
+		: "+r"(_num), "=r"(_err)                                      \
+		: "r"(_arg1), "r"(_arg2), "r"(_arg3), "r"(_arg4)              \
+		: _NOLIBC_SYSCALL_CLOBBERLIST, "$20", "$21"                   \
+	);                                                                    \
+	_err ? -_num : _num;                                                  \
+})
+
+#define __nolibc_syscall5(num, arg1, arg2, arg3, arg4, arg5)                  \
+({                                                                            \
+	register long _num __asm__ ("$0") = (num);                            \
+	register long _err __asm__ ("$19");                                   \
+	register long _arg1 __asm__ ("$16") = (long)(arg1);                   \
+	register long _arg2 __asm__ ("$17") = (long)(arg2);                   \
+	register long _arg3 __asm__ ("$18") = (long)(arg3);                   \
+	register long _arg4 __asm__ ("$19") = (long)(arg4);                   \
+	register long _arg5 __asm__ ("$20") = (long)(arg5);                   \
+                                                                              \
+	__asm__ volatile (                                                    \
+		"callsys"                                                     \
+		: "+r"(_num), "=r"(_err)                                      \
+		: "r"(_arg1), "r"(_arg2), "r"(_arg3), "r"(_arg4), "r"(_arg5)  \
+		: _NOLIBC_SYSCALL_CLOBBERLIST, "$21"                          \
+	);                                                                    \
+	_err ? -_num : _num;                                                  \
+})
+
+#define __nolibc_syscall6(num, arg1, arg2, arg3, arg4, arg5, arg6)            \
+({                                                                            \
+	register long _num __asm__ ("$0") = (num);                            \
+	register long _err __asm__ ("$19");                                   \
+	register long _arg1 __asm__ ("$16") = (long)(arg1);                   \
+	register long _arg2 __asm__ ("$17") = (long)(arg2);                   \
+	register long _arg3 __asm__ ("$18") = (long)(arg3);                   \
+	register long _arg4 __asm__ ("$19") = (long)(arg4);                   \
+	register long _arg5 __asm__ ("$20") = (long)(arg5);                   \
+	register long _arg6 __asm__ ("$21") = (long)(arg6);                   \
+                                                                              \
+	__asm__ volatile (                                                    \
+		"callsys"                                                     \
+		: "+r"(_num), "=r"(_err)                                      \
+		: "r"(_arg1), "r"(_arg2), "r"(_arg3), "r"(_arg4), "r"(_arg5), \
+		  "r"(_arg6)                                                  \
+		: _NOLIBC_SYSCALL_CLOBBERLIST                                 \
+	);                                                                    \
+	_err ? -_num : _num;                                                  \
+})
+
+/* startup code */
+void __attribute__((weak, noreturn)) __nolibc_entrypoint __nolibc_no_stack_protector
+_start(void)
+{
+	__asm__ volatile (
+		"br $gp, 0f\n"               /* setup $gp, so that 'lda' works                */
+		"0: ldgp $gp, 0($gp)\n"
+		"lda $27, _start_c\n"        /* setup current function address for _start_c   */
+		"mov $sp, $16\n"             /* save argc pointer to $16, as arg1 of _start_c */
+		"br  _start_c\n"             /* transfer to c runtime                         */
+	);
+	__nolibc_entrypoint_epilogue();
+}
+
+#endif /* _NOLIBC_ARCH_ALPHA_H */
diff --git a/tools/include/nolibc/arch.h b/tools/include/nolibc/arch.h
index b69d9c5ec5c6..06cc2dbe7a33 100644
--- a/tools/include/nolibc/arch.h
+++ b/tools/include/nolibc/arch.h
@@ -32,6 +32,8 @@
 #include "arch-openrisc.h"
 #elif defined(__hppa__)
 #include "arch-parisc.h"
+#elif defined(__alpha__)
+#include "arch-alpha.h"
 #else
 #error Unsupported Architecture
 #endif
diff --git a/tools/testing/selftests/nolibc/Makefile.nolibc b/tools/testing/selftests/nolibc/Makefile.nolibc
index 06f881e2e90c..f70c8dfca018 100644
--- a/tools/testing/selftests/nolibc/Makefile.nolibc
+++ b/tools/testing/selftests/nolibc/Makefile.nolibc
@@ -112,6 +112,7 @@ EXTRACONFIG_armthumb  = -e CONFIG_NAMESPACES
 EXTRACONFIG_sparc32   = -e CONFIG_TMPFS
 EXTRACONFIG_m68k      = -e CONFIG_BLK_DEV_INITRD
 EXTRACONFIG_sh4       = -e CONFIG_BLK_DEV_INITRD -e CONFIG_CMDLINE_FROM_BOOTLOADER
+EXTRACONFIG_alpha     = -e CONFIG_BLK_DEV_INITRD
 EXTRACONFIG           = $(EXTRACONFIG_$(XARCH))
 
 # optional tests to run (default = all)
@@ -174,6 +175,7 @@ QEMU_ARGS_m68k       = -M virt -append "console=ttyGF0,115200 panic=-1 $(TEST:%=
 QEMU_ARGS_sh4        = -M r2d -serial file:/dev/stdout -append "console=ttySC1,115200 panic=-1 $(TEST:%=NOLIBC_TEST=%)"
 QEMU_ARGS_openrisc   = -M virt -m 512M -append "console=ttyS0 panic=-1 $(TEST:%=NOLIBC_TEST=%)"
 QEMU_ARGS_parisc32   = -M B160L -append "console=ttyS0 panic=-1 $(TEST:%=NOLIBC_TEST=%)"
+QEMU_ARGS_alpha      = -M clipper -append "console=ttyS0 panic=-1 $(TEST:%=NOLIBC_TEST=%)"
 QEMU_ARGS            = -m 1G $(QEMU_ARGS_$(XARCH)) $(QEMU_ARGS_BIOS) $(QEMU_ARGS_EXTRA)
 
 # OUTPUT is only set when run from the main makefile, otherwise
diff --git a/tools/testing/selftests/nolibc/nolibc-test.c b/tools/testing/selftests/nolibc/nolibc-test.c
index 996e8d13508e..66accf99f560 100644
--- a/tools/testing/selftests/nolibc/nolibc-test.c
+++ b/tools/testing/selftests/nolibc/nolibc-test.c
@@ -756,6 +756,10 @@ int run_startup(int min, int max)
 	/* checking NULL for argv/argv0, environ and _auxv is not enough, let's compare with sbrk(0) or &end */
 	extern char end;
 	char *brk = sbrk(0) != (void *)-1 ? sbrk(0) : &end;
+#if defined(__alpha__)
+	/* the ordering above does not work on an alpha kernel due to STACK_TOP != TASK_SIZEi */
+	brk = NULL;
+#endif
 	/* differ from nolibc, both glibc and musl have no global _auxv */
 	const unsigned long *test_auxv = (void *)-1;
 #ifdef NOLIBC
diff --git a/tools/testing/selftests/nolibc/run-tests.sh b/tools/testing/selftests/nolibc/run-tests.sh
index 6460e25001de..dc0b1649c641 100755
--- a/tools/testing/selftests/nolibc/run-tests.sh
+++ b/tools/testing/selftests/nolibc/run-tests.sh
@@ -30,6 +30,7 @@ all_archs=(
 	m68k
 	sh4
 	parisc32
+	alpha
 )
 archs="${all_archs[@]}"
 
@@ -193,7 +194,7 @@ test_arch() {
 			exit 1
 	esac
 	printf '%-15s' "$arch:"
-	if [ "$arch" = "m68k" -o "$arch" = "sh4" -o "$arch" = "openrisc" -o "$arch" = "parisc32" ] && [ "$llvm" = "1" ]; then
+	if [ "$arch" = "m68k" -o "$arch" = "sh4" -o "$arch" = "openrisc" -o "$arch" = "parisc32" -o "$arch" = "alpha" ] && [ "$llvm" = "1" ]; then
 		echo "Unsupported configuration"
 		return
 	fi

---
base-commit: 070cf03f5ec454eec9c42827ee9f3c0b3fad09f1
change-id: 20250609-nolibc-alpha-33e79644544c

Best regards,
--  
Thomas Weißschuh <linux@weissschuh.net>

