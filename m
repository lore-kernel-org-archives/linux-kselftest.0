Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27E3B3F1ABE;
	Thu, 20 Aug 2026 09:33:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787218398; cv=none; b=m/kNJ72IVj/NMimjSNKmR9Fk0fSUe54QaFms6MJU0K7S87Le/fgRXngHrNqL/7PAMWlxtIGK6s932G6RnoUOdMAz47MqctBuNqUDff8uaOe8g3lQKrxD3lTqZCRW+qIWKYfzGg8ha3lYFcgLg/ir4Zkd5vXiJWe3fmHW2+f6Am4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787218398; c=relaxed/simple;
	bh=zgr4eDgXLAVe+4mr7A52LtvAYplKN2jo5J8VlOvkHvU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=OrgQUIBOmREeP0m/JJQ/PI6Sq3QMKB6hZVz5Hy5wxQxm+Fm34s4TK5+6C3Jg2eKUzXUO4X0vdAN23DU4Oh4YOeshdTEhXqtSIYmYUqV/UdZlOrrM9zn/YmrZjD+ljc3Ml22Q3IlhIQsH1NrZ7VpO/AhsIKpZLI960W4X6A9PN6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=Ac0Paq2t; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="Ac0Paq2t"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1787218386;
	bh=zgr4eDgXLAVe+4mr7A52LtvAYplKN2jo5J8VlOvkHvU=;
	h=From:Date:Subject:To:Cc:From;
	b=Ac0Paq2tsfHWnaqswDCM/A6YcYDqlx5kzPqw1JbguqlMpTGhcLr0X25AnPM3/UhXZ
	 AYcEYBW+E09rwzrftqAVmbPqkNg4VvEgpkpPTeEdJuj9fDNqeoK2wSu1tn8XegCB/i
	 9YYssy+ZASF3q/gSmYFjI52Nf0kDGlxbYFMmPXa4=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Thu, 20 Aug 2026 11:32:50 +0200
Subject: [PATCH] tools/nolibc: add 64-bit parisc support
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260820-nolibc-parisc64-v1-1-067ebe7c8efb@weissschuh.net>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/y2NQQqDMBBFryKzbiCmUbFXKV3E6agjJdoZLQXx7
 qbV5YP3319BSZgUbtkKQh9WHmOC/JIB9iF2ZPiZGJx1pfW2MnF8cYNmCsKKpTdXDLbwFbrQ1pB
 Wk1DL33/x/jhYl2YgnH+Z0xB6L+lqPrVt2wGVgMWbiAAAAA==
X-Change-ID: 20260407-nolibc-parisc64-3ca0547c2af9
To: Willy Tarreau <w@1wt.eu>, Shuah Khan <shuah@kernel.org>, 
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, 
 Helge Deller <deller@gmx.de>
Cc: linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 linux-parisc@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787218385; l=6851;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=zgr4eDgXLAVe+4mr7A52LtvAYplKN2jo5J8VlOvkHvU=;
 b=9WrlKBNfxYXSfOX/XHaOy0KUIyeXxJmzl3wKcPAbkWtl3mVkCKiMoscPH4LxUkVg6ayP1bcKt
 56eZmDmc0r/ALANC3hGulO1prK0LVV5wK5PdtRiT/s3Z4RAnu3Z+Ac3
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=

Extend the existing parisc support to also handle 64-bit mode.

Some peculiarities:
* The nonstandard ftruncate64 system call requires a workaround.
* The linker defaults to main() as entry point, which needs to be
  switched to _start() explicitly.
* The linker defaults to dynamic linking, which needs to be disabled
  explicitly.
* With the default -Os, gcc does not use 64-bit multiplication
  instructions, requiring libgcc. Use -O2 instead.
* There is no qemu-user available.
* CONFIG_COMPAT needs to be disabled to avoid build errors due to a
  missing 32-bit vDSO compiler.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
 tools/include/nolibc/arch-parisc.h             | 26 +++++++++++++++++++++++---
 tools/include/nolibc/stdlib.h                  |  2 +-
 tools/testing/selftests/nolibc/Makefile.nolibc |  5 +++++
 tools/testing/selftests/nolibc/run-tests.sh    |  7 ++++---
 4 files changed, 33 insertions(+), 7 deletions(-)

diff --git a/tools/include/nolibc/arch-parisc.h b/tools/include/nolibc/arch-parisc.h
index 417043ecbc53..fd0d1dccabf3 100644
--- a/tools/include/nolibc/arch-parisc.h
+++ b/tools/include/nolibc/arch-parisc.h
@@ -7,9 +7,7 @@
 #ifndef _NOLIBC_ARCH_PARISC_H
 #define _NOLIBC_ARCH_PARISC_H
 
-#if defined(__LP64__)
-#error 64-bit not supported
-#endif
+#include <linux/unistd.h>
 
 #include "compiler.h"
 #include "crt.h"
@@ -167,9 +165,15 @@
 void __attribute__((weak, noreturn)) __nolibc_entrypoint __nolibc_no_stack_protector _start(void)
 {
 	__asm__ volatile (
+#ifdef __LP64__
+		".import __gp\n"               /* Set up the dp register */
+		"ldil L%__gp, %dp\n"
+		"ldo R%__gp(%r27), %dp\n"
+#else
 		".import $global$\n"           /* Set up the dp register */
 		"ldil L%$global$, %dp\n"
 		"ldo R%$global$(%r27), %dp\n"
+#endif
 
 		"b _start_c\n"                 /* Call _start_c, the load below is executed first */
 
@@ -182,4 +186,20 @@ void __attribute__((weak, noreturn)) __nolibc_entrypoint __nolibc_no_stack_prote
 }
 #endif /* NOLIBC_NO_RUNTIME */
 
+#ifdef __LP64__
+/*
+ * This override is normally only meant for 32-bit architectures.
+ * Put parisc 64-bit has __NR_ftruncate64, so this path is taken.
+ * Add an unused second argument to satisfy the calling convention.
+ */
+static __attribute__((unused))
+int _sys_ftruncate64(int fd, uint64_t length, uint64_t unused)
+{
+	(void)unused;
+
+	return __nolibc_syscall2(__NR_ftruncate64, fd, length);
+}
+#define _sys_ftruncate64 _sys_ftruncate64
+#endif
+
 #endif /* _NOLIBC_ARCH_PARISC_H */
diff --git a/tools/include/nolibc/stdlib.h b/tools/include/nolibc/stdlib.h
index 1816c2368b68..6c3c620a04cf 100644
--- a/tools/include/nolibc/stdlib.h
+++ b/tools/include/nolibc/stdlib.h
@@ -230,7 +230,7 @@ int _nolibc_u64toa_base(uint64_t in, char *buffer, unsigned int base, uint64_t r
 
 	/* Generate least significant digit first */
 	do {
-#if defined(__SIZEOF_INT128__) && !defined(__mips__) && !defined(__sparc__)
+#if defined(__SIZEOF_INT128__) && !defined(__mips__) && !defined(__sparc__) && !defined(__hppa__)
 		q = ((unsigned __int128)in * recip) >> 64;
 #else
 		uint64_t p = (uint32_t)in * (recip >> 32);
diff --git a/tools/testing/selftests/nolibc/Makefile.nolibc b/tools/testing/selftests/nolibc/Makefile.nolibc
index d8b71cbfc173..3ca473ec35ef 100644
--- a/tools/testing/selftests/nolibc/Makefile.nolibc
+++ b/tools/testing/selftests/nolibc/Makefile.nolibc
@@ -65,6 +65,7 @@ ARCH_sparc32     = sparc
 ARCH_sparc64     = sparc
 ARCH_sh4         = sh
 ARCH_parisc32    = parisc
+ARCH_parisc64    = parisc64
 ARCH            := $(or $(ARCH_$(XARCH)),$(XARCH))
 
 # kernel image names by architecture
@@ -113,6 +114,7 @@ EXTRACONFIG_sparc32   = -e CONFIG_TMPFS
 EXTRACONFIG_m68k      = -e CONFIG_BLK_DEV_INITRD
 EXTRACONFIG_sh4       = -e CONFIG_BLK_DEV_INITRD -e CONFIG_CMDLINE_FROM_BOOTLOADER
 EXTRACONFIG_alpha     = -e CONFIG_BLK_DEV_INITRD
+EXTRACONFIG_parisc64  = -d CONFIG_COMPAT
 EXTRACONFIG           = $(EXTRACONFIG_$(XARCH))
 
 # optional tests to run (default = all)
@@ -134,6 +136,7 @@ QEMU_ARCH_loongarch  = loongarch64
 QEMU_ARCH_sparc32    = sparc
 QEMU_ARCH_openrisc   = or1k
 QEMU_ARCH_parisc32   = hppa
+QEMU_ARCH_parisc64   = hppa
 QEMU_ARCH            = $(or $(QEMU_ARCH_$(XARCH)),$(XARCH))
 
 QEMU_ARCH_USER_ppc64le = ppc64le
@@ -175,6 +178,7 @@ QEMU_ARGS_m68k       = -M virt -append "console=ttyGF0,115200 panic=-1 $(TEST:%=
 QEMU_ARGS_sh4        = -M r2d -serial file:/dev/stdout -append "console=ttySC1,115200 panic=-1 $(TEST:%=NOLIBC_TEST=%)"
 QEMU_ARGS_openrisc   = -M virt -m 512M -append "console=ttyS0 panic=-1 $(TEST:%=NOLIBC_TEST=%)"
 QEMU_ARGS_parisc32   = -M B160L -append "console=ttyS0 panic=-1 $(TEST:%=NOLIBC_TEST=%)"
+QEMU_ARGS_parisc64   = -M C3700 -append "console=ttyS0 panic=-1 $(TEST:%=NOLIBC_TEST=%)"
 QEMU_ARGS_alpha      = -M clipper -append "console=ttyS0 panic=-1 $(TEST:%=NOLIBC_TEST=%)"
 QEMU_ARGS            = -m 1G $(QEMU_ARGS_$(XARCH)) $(QEMU_ARGS_BIOS) $(QEMU_ARGS_EXTRA)
 
@@ -193,6 +197,7 @@ CFLAGS_x32 = -mx32
 CFLAGS_arm = -marm
 CFLAGS_armthumb = -mthumb -march=armv6t2
 CFLAGS_parisc32 = -mfast-indirect-calls
+CFLAGS_parisc64 = -Wl,--no-dynamic-linker -Wl,--entry=_start -O2
 CFLAGS_ppc = -m32 -mbig-endian -mno-vsx $(call cc-option,-mmultiple)
 CFLAGS_ppc64 = -m64 -mbig-endian -mno-vsx $(call cc-option,-mmultiple)
 CFLAGS_ppc64le = -m64 -mlittle-endian -mno-vsx $(call cc-option,-mabi=elfv2)
diff --git a/tools/testing/selftests/nolibc/run-tests.sh b/tools/testing/selftests/nolibc/run-tests.sh
index 3da806e2b302..a50a47d9df2c 100755
--- a/tools/testing/selftests/nolibc/run-tests.sh
+++ b/tools/testing/selftests/nolibc/run-tests.sh
@@ -29,7 +29,7 @@ all_archs=(
 	sparc32 sparc64
 	m68k
 	sh4
-	parisc32
+	parisc32 parisc64
 	alpha
 	hexagon
 )
@@ -122,6 +122,7 @@ crosstool_arch() {
 	sparc*) echo sparc64;;
 	x32*) echo x86_64;;
 	parisc32) echo hppa;;
+	parisc64) echo hppa64;;
 	*) echo "$1";;
 	esac
 }
@@ -206,11 +207,11 @@ test_arch() {
 			exit 1
 	esac
 	printf '%-15s' "$arch:"
-	if [ "$arch" = "m68k" -o "$arch" = "sh4" -o "$arch" = "openrisc" -o "$arch" = "parisc32" -o "$arch" = "alpha" ] && [ "$llvm" = "1" ]; then
+	if [ "$arch" = "m68k" -o "$arch" = "sh4" -o "$arch" = "openrisc" -o "$arch" = "parisc*" -o "$arch" = "alpha" ] && [ "$llvm" = "1" ]; then
 		echo "Unsupported configuration"
 		return
 	fi
-	if [ "$arch" = "x32" ] && [ "$test_mode" = "user" ]; then
+	if [ "$arch" = "x32" -o "$arch" = "parisc64" ] && [ "$test_mode" = "user" ]; then
 		echo "Unsupported configuration"
 		return
 	fi

---
base-commit: 7f4233794df172ab1d286dc0fbd70da2cc837654
change-id: 20260407-nolibc-parisc64-3ca0547c2af9

Best regards,
--  
Thomas Weißschuh <linux@weissschuh.net>

