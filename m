From: brendanhiggins at google.com (Brendan Higgins)
Date: Tue, 16 Oct 2018 16:51:15 -0700
Subject: [RFC v1 26/31] arch: um: added stubs for mock iomem for KUnit
In-Reply-To: <20181016235120.138227-1-brendanhiggins@google.com>
References: <20181016235120.138227-1-brendanhiggins@google.com>
Message-ID: <20181016235120.138227-27-brendanhiggins@google.com>

This mocks out some iomem functions (functions like readl and writel),
for mocking hardware interfaces.

Signed-off-by: Brendan Higgins <brendanhiggins at google.com>
---
 arch/um/Kconfig.common               |  8 +++++-
 arch/um/Kconfig.um                   |  5 ++++
 arch/um/include/asm/Kbuild           |  1 -
 arch/um/include/asm/io-mock-shared.h | 33 +++++++++++++++++++++
 arch/um/include/asm/io-mock.h        | 43 ++++++++++++++++++++++++++++
 arch/um/include/asm/io.h             |  8 ++++++
 arch/um/kernel/Makefile              |  1 +
 arch/um/kernel/io-mock.c             | 40 ++++++++++++++++++++++++++
 kunit/Kconfig                        |  1 +
 9 files changed, 138 insertions(+), 2 deletions(-)
 create mode 100644 arch/um/include/asm/io-mock-shared.h
 create mode 100644 arch/um/include/asm/io-mock.h
 create mode 100644 arch/um/kernel/io-mock.c

diff --git a/arch/um/Kconfig.common b/arch/um/Kconfig.common
index 07f84c842cc31..72e7efb74f7fd 100644
--- a/arch/um/Kconfig.common
+++ b/arch/um/Kconfig.common
@@ -19,7 +19,13 @@ config MMU
 	default y
 
 config NO_IOMEM
-	def_bool y
+	bool
+	default y if !KUNIT
+
+config HAS_IOMEM
+	bool "Turns on fake IOMEM support for KUnit"
+	depends on KUNIT
+	select MOCK_IOMEM
 
 config ISA
 	bool
diff --git a/arch/um/Kconfig.um b/arch/um/Kconfig.um
index 20da5a8ca9490..8d35e0e2c23d1 100644
--- a/arch/um/Kconfig.um
+++ b/arch/um/Kconfig.um
@@ -122,3 +122,8 @@ config SECCOMP
 	  defined by each seccomp mode.
 
 	  If unsure, say Y.
+
+config PLATFORM_MOCK
+	bool "Enable a mock architecture used for unit testing."
+	depends on KUNIT && OF
+	default n
diff --git a/arch/um/include/asm/Kbuild b/arch/um/include/asm/Kbuild
index b10dde6cb793b..9fd2827ab76d1 100644
--- a/arch/um/include/asm/Kbuild
+++ b/arch/um/include/asm/Kbuild
@@ -12,7 +12,6 @@ generic-y += ftrace.h
 generic-y += futex.h
 generic-y += hardirq.h
 generic-y += hw_irq.h
-generic-y += io.h
 generic-y += irq_regs.h
 generic-y += irq_work.h
 generic-y += kdebug.h
diff --git a/arch/um/include/asm/io-mock-shared.h b/arch/um/include/asm/io-mock-shared.h
new file mode 100644
index 0000000000000..6baf59cb17a58
--- /dev/null
+++ b/arch/um/include/asm/io-mock-shared.h
@@ -0,0 +1,33 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef _ASM_UM_IO_MOCK_SHARED_H
+#define _ASM_UM_IO_MOCK_SHARED_H
+
+#define readb readb
+u8 readb(const volatile void __iomem *);
+
+#define readw readw
+u16 readw(const volatile void __iomem *);
+
+#define readl readl
+u32 readl(const volatile void __iomem *);
+
+#ifdef CONFIG_64BIT
+#define readq readq
+u64 readq(const volatile void __iomem *);
+#endif /* CONFIG_64BIT */
+
+#define writeb writeb
+void writeb(u8, const volatile void __iomem *);
+
+#define writew writew
+void writew(u16, const volatile void __iomem *);
+
+#define writel writel
+void writel(u32, const volatile void __iomem *);
+
+#ifdef CONFIG_64BIT
+#define writeq writeq
+void writeq(u64, const volatile void __iomem *);
+#endif /* CONFIG_64BIT */
+
+#endif /* _ASM_UM_IO_MOCK_SHARED_H */
diff --git a/arch/um/include/asm/io-mock.h b/arch/um/include/asm/io-mock.h
new file mode 100644
index 0000000000000..bdc5cd1d4e33c
--- /dev/null
+++ b/arch/um/include/asm/io-mock.h
@@ -0,0 +1,43 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Mock IO functions.
+ *
+ * Copyright (C) 2018, Google LLC.
+ * Author: Brendan Higgins <brendanhiggins at google.com>
+ */
+
+#ifndef _ASM_UM_IO_MOCK_H
+#define _ASM_UM_IO_MOCK_H
+
+#include <asm/io-mock-shared.h>
+#include <kunit/mock.h>
+
+DECLARE_FUNCTION_MOCK(readb,
+		      RETURNS(u8), PARAMS(const volatile void __iomem *));
+
+DECLARE_FUNCTION_MOCK(readw,
+		      RETURNS(u16), PARAMS(const volatile void __iomem *));
+
+DECLARE_FUNCTION_MOCK(readl,
+		      RETURNS(u32), PARAMS(const volatile void __iomem *));
+
+#ifdef CONFIG_64BIT
+DECLARE_FUNCTION_MOCK(readq,
+		      RETURNS(u64), PARAMS(const volatile void __iomem *));
+#endif /* CONFIG_64BIT */
+
+DECLARE_FUNCTION_MOCK_VOID_RETURN(writeb,
+				  PARAMS(u8, const volatile void __iomem *));
+
+DECLARE_FUNCTION_MOCK_VOID_RETURN(writew,
+				  PARAMS(u16, const volatile void __iomem *));
+
+DECLARE_FUNCTION_MOCK_VOID_RETURN(writel,
+				  PARAMS(u32, const volatile void __iomem *));
+
+#ifdef CONFIG_64BIT
+DECLARE_FUNCTION_MOCK_VOID_RETURN(writeq,
+				  PARAMS(u64, const volatile void __iomem *));
+#endif /* CONFIG_64BIT */
+
+#endif /* _ASM_UM_IO_MOCK_H */
diff --git a/arch/um/include/asm/io.h b/arch/um/include/asm/io.h
index 96f77b5232aaf..a7f61cf963756 100644
--- a/arch/um/include/asm/io.h
+++ b/arch/um/include/asm/io.h
@@ -2,11 +2,19 @@
 #ifndef _ASM_UM_IO_H
 #define _ASM_UM_IO_H
 
+#include <linux/types.h>
+#include <asm/byteorder.h>
+
+#if IS_ENABLED(CONFIG_PLATFORM_MOCK)
+#include <asm/io-mock-shared.h>
+#endif
+
 #define ioremap ioremap
 static inline void __iomem *ioremap(phys_addr_t offset, size_t size)
 {
 	return (void __iomem *)(unsigned long)offset;
 }
+#define ioremap_nocache ioremap
 
 #define iounmap iounmap
 static inline void iounmap(void __iomem *addr)
diff --git a/arch/um/kernel/Makefile b/arch/um/kernel/Makefile
index 2f36d515762ec..770c480d5a101 100644
--- a/arch/um/kernel/Makefile
+++ b/arch/um/kernel/Makefile
@@ -25,6 +25,7 @@ obj-$(CONFIG_GPROF)	+= gprof_syms.o
 obj-$(CONFIG_GCOV)	+= gmon_syms.o
 obj-$(CONFIG_EARLY_PRINTK) += early_printk.o
 obj-$(CONFIG_STACKTRACE) += stacktrace.o
+obj-$(CONFIG_PLATFORM_MOCK)	+= io-mock.o
 
 USER_OBJS := config.o
 
diff --git a/arch/um/kernel/io-mock.c b/arch/um/kernel/io-mock.c
new file mode 100644
index 0000000000000..e0d4648e97a6c
--- /dev/null
+++ b/arch/um/kernel/io-mock.c
@@ -0,0 +1,40 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Mock IO functions.
+ *
+ * Copyright (C) 2018, Google LLC.
+ * Author: Brendan Higgins <brendanhiggins at google.com>
+ */
+
+#include <linux/mm.h>
+#include <linux/io.h>
+#include <linux/kernel.h>
+#include <kunit/mock.h>
+
+DEFINE_FUNCTION_MOCK(readb,
+		     RETURNS(u8), PARAMS(const volatile void __iomem *));
+
+DEFINE_FUNCTION_MOCK(readw,
+		     RETURNS(u16), PARAMS(const volatile void __iomem *));
+
+DEFINE_FUNCTION_MOCK(readl,
+		     RETURNS(u32), PARAMS(const volatile void __iomem *));
+
+#ifdef CONFIG_64BIT
+DEFINE_FUNCTION_MOCK(readq,
+		     RETURNS(u64), PARAMS(const volatile void __iomem *));
+#endif /* CONFIG_64BIT */
+
+DEFINE_FUNCTION_MOCK_VOID_RETURN(writeb,
+				 PARAMS(u8, const volatile void __iomem *));
+
+DEFINE_FUNCTION_MOCK_VOID_RETURN(writew,
+				 PARAMS(u16, const volatile void __iomem *));
+
+DEFINE_FUNCTION_MOCK_VOID_RETURN(writel,
+				 PARAMS(u32, const volatile void __iomem *));
+
+#ifdef CONFIG_64BIT
+DEFINE_FUNCTION_MOCK_VOID_RETURN(writeq,
+				 PARAMS(u64, const volatile void __iomem *));
+#endif /* CONFIG_64BIT */
diff --git a/kunit/Kconfig b/kunit/Kconfig
index 5cb500355c873..9d4b7cfff9d92 100644
--- a/kunit/Kconfig
+++ b/kunit/Kconfig
@@ -6,6 +6,7 @@ menu "KUnit support"
 
 config KUNIT
 	bool "Enable support for unit tests (KUnit)"
+	select HAS_IOMEM
 	help
 	  Enables support for kernel unit tests (KUnit), a lightweight unit
 	  testing and mocking framework for the Linux kernel. These tests are
-- 
2.19.1.331.ge82ca0e54c-goog
