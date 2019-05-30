From: vincenzo.frascino@arm.com (Vincenzo Frascino)
Date: Thu, 30 May 2019 15:15:18 +0100
Subject: [PATCH v6 06/19] arm64: compat: Add missing syscall numbers
In-Reply-To: <20190530141531.43462-1-vincenzo.frascino@arm.com>
References: <20190530141531.43462-1-vincenzo.frascino@arm.com>
Message-ID: <20190530141531.43462-7-vincenzo.frascino@arm.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190530141518.M4bCmu20yY_bEzi-n4YaLVI6kJSqEqnnnZTVqKxvUPI@z>

vDSO requires gettimeofday and clock_gettime syscalls to implement the
fallback mechanism.

Add the missing syscall numbers to unistd.h for arm64.

Cc: Catalin Marinas <catalin.marinas at arm.com>
Cc: Will Deacon <will.deacon at arm.com>
Cc: Arnd Bergmann <arnd at arndb.de>
Signed-off-by: Vincenzo Frascino <vincenzo.frascino at arm.com>
---
 arch/arm64/include/asm/unistd.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/include/asm/unistd.h b/arch/arm64/include/asm/unistd.h
index 70e6882853c0..81cc05acccc9 100644
--- a/arch/arm64/include/asm/unistd.h
+++ b/arch/arm64/include/asm/unistd.h
@@ -33,8 +33,13 @@
 #define __NR_compat_exit		1
 #define __NR_compat_read		3
 #define __NR_compat_write		4
+#define __NR_compat_gettimeofday	78
 #define __NR_compat_sigreturn		119
 #define __NR_compat_rt_sigreturn	173
+#define __NR_compat_clock_getres	247
+#define __NR_compat_clock_gettime	263
+#define __NR_compat_clock_gettime64	403
+#define __NR_compat_clock_getres_time64	406
 
 /*
  * The following SVCs are ARM private.
-- 
2.21.0
