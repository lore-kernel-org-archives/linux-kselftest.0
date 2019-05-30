From: vincenzo.frascino at arm.com (Vincenzo Frascino)
Date: Thu, 30 May 2019 15:15:27 +0100
Subject: [PATCH v6 15/19] arm64: Add vDSO compat support
In-Reply-To: <20190530141531.43462-1-vincenzo.frascino@arm.com>
References: <20190530141531.43462-1-vincenzo.frascino@arm.com>
Message-ID: <20190530141531.43462-16-vincenzo.frascino@arm.com>

Add vDSO compat support to the arm64 building system.

Cc: Catalin Marinas <catalin.marinas at arm.com>
Cc: Will Deacon <will.deacon at arm.com>
Signed-off-by: Vincenzo Frascino <vincenzo.frascino at arm.com>
---
 arch/arm64/Kconfig         |  1 +
 arch/arm64/Makefile        | 23 +++++++++++++++++++++--
 arch/arm64/kernel/Makefile |  6 +++++-
 3 files changed, 27 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index 952c9f8cf3b8..3e1d4f8347f4 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -108,6 +108,7 @@ config ARM64
 	select GENERIC_STRNLEN_USER
 	select GENERIC_TIME_VSYSCALL
 	select GENERIC_GETTIMEOFDAY
+	select GENERIC_COMPAT_VDSO if !CPU_BIG_ENDIAN
 	select HANDLE_DOMAIN_IRQ
 	select HARDIRQS_SW_RESEND
 	select HAVE_PCI
diff --git a/arch/arm64/Makefile b/arch/arm64/Makefile
index b025304bde46..4db50d4b2476 100644
--- a/arch/arm64/Makefile
+++ b/arch/arm64/Makefile
@@ -49,9 +49,25 @@ $(warning Detected assembler with broken .inst; disassembly will be unreliable)
   endif
 endif
 
-KBUILD_CFLAGS	+= -mgeneral-regs-only $(lseinstr) $(brokengasinst)
+ifeq ($(CONFIG_GENERIC_COMPAT_VDSO), y)
+  CROSS_COMPILE_COMPAT ?= $(CONFIG_CROSS_COMPILE_COMPAT_VDSO:"%"=%)
+
+  ifeq ($(CONFIG_CC_IS_CLANG), y)
+    $(warning CROSS_COMPILE_COMPAT is clang, the compat vDSO will not be built)
+  else ifeq ($(CROSS_COMPILE_COMPAT),)
+    $(warning CROSS_COMPILE_COMPAT not defined or empty, the compat vDSO will not be built)
+  else ifeq ($(shell which $(CROSS_COMPILE_COMPAT)gcc 2> /dev/null),)
+    $(error $(CROSS_COMPILE_COMPAT)gcc not found, check CROSS_COMPILE_COMPAT)
+  else
+    export CROSS_COMPILE_COMPAT
+    export CONFIG_COMPAT_VDSO := y
+    compat_vdso := -DCONFIG_COMPAT_VDSO=1
+  endif
+endif
+
+KBUILD_CFLAGS	+= -mgeneral-regs-only $(lseinstr) $(brokengasinst) $(compat_vdso)
 KBUILD_CFLAGS	+= -fno-asynchronous-unwind-tables
-KBUILD_AFLAGS	+= $(lseinstr) $(brokengasinst)
+KBUILD_AFLAGS	+= $(lseinstr) $(brokengasinst) $(compat_vdso)
 
 KBUILD_CFLAGS	+= $(call cc-option,-mabi=lp64)
 KBUILD_AFLAGS	+= $(call cc-option,-mabi=lp64)
@@ -163,6 +179,9 @@ ifeq ($(KBUILD_EXTMOD),)
 prepare: vdso_prepare
 vdso_prepare: prepare0
 	$(Q)$(MAKE) $(build)=arch/arm64/kernel/vdso include/generated/vdso-offsets.h
+	$(if $(CONFIG_COMPAT_VDSO),$(Q)$(MAKE) \
+		$(build)=arch/arm64/kernel/vdso32  \
+		include/generated/vdso32-offsets.h)
 endif
 
 define archhelp
diff --git a/arch/arm64/kernel/Makefile b/arch/arm64/kernel/Makefile
index 9e7dcb2c31c7..478491f07b4f 100644
--- a/arch/arm64/kernel/Makefile
+++ b/arch/arm64/kernel/Makefile
@@ -28,7 +28,10 @@ $(obj)/%.stub.o: $(obj)/%.o FORCE
 	$(call if_changed,objcopy)
 
 obj-$(CONFIG_COMPAT)			+= sys32.o signal32.o			\
-					   sigreturn32.o sys_compat.o
+					   sys_compat.o
+ifneq ($(CONFIG_COMPAT_VDSO), y)
+obj-$(CONFIG_COMPAT)			+= sigreturn32.o
+endif
 obj-$(CONFIG_KUSER_HELPERS)		+= kuser32.o
 obj-$(CONFIG_FUNCTION_TRACER)		+= ftrace.o entry-ftrace.o
 obj-$(CONFIG_MODULES)			+= module.o
@@ -62,6 +65,7 @@ obj-$(CONFIG_ARM64_SSBD)		+= ssbd.o
 obj-$(CONFIG_ARM64_PTR_AUTH)		+= pointer_auth.o
 
 obj-y					+= vdso/ probes/
+obj-$(CONFIG_COMPAT_VDSO)		+= vdso32/
 head-y					:= head.o
 extra-y					+= $(head-y) vmlinux.lds
 
-- 
2.21.0
