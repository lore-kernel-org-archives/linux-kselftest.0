From: vincenzo.frascino@arm.com (Vincenzo Frascino)
Date: Thu, 30 May 2019 15:15:17 +0100
Subject: [PATCH v6 05/19] arm64: Build vDSO with -ffixed-x18
In-Reply-To: <20190530141531.43462-1-vincenzo.frascino@arm.com>
References: <20190530141531.43462-1-vincenzo.frascino@arm.com>
Message-ID: <20190530141531.43462-6-vincenzo.frascino@arm.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190530141517.XpVzIfkGINspx7pAdkBPGiVGxVV8iCX3gMRnru3R0o0@z>

From: Peter Collingbourne <pcc@google.com>

The vDSO needs to be build with x18 reserved in order to accommodate
userspace platform ABIs built on top of Linux that use the register
to carry inter-procedural state, as provided for by the AAPCS.
An example of such a platform ABI is the one that will be used by an
upcoming version of Android.

Although this change is currently a no-op due to the fact that the vDSO
is currently implemented in pure assembly on arm64, it is necessary
in order to prepare for another change [1] that will add C code to
the vDSO.

[1] https://patchwork.kernel.org/patch/10044501/

Signed-off-by: Peter Collingbourne <pcc at google.com>
Signed-off-by: Vincenzo Frascino <vincenzo.frascino at arm.com>
Cc: Mark Salyzyn <salyzyn at google.com>
Cc: Will Deacon <will.deacon at arm.com>
Cc: linux-arm-kernel at lists.infradead.org
---
 arch/arm64/kernel/vdso/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/kernel/vdso/Makefile b/arch/arm64/kernel/vdso/Makefile
index 00bcfd2672cf..d98230f70caf 100644
--- a/arch/arm64/kernel/vdso/Makefile
+++ b/arch/arm64/kernel/vdso/Makefile
@@ -20,7 +20,7 @@ obj-vdso := $(addprefix $(obj)/, $(obj-vdso))
 ldflags-y := -shared -nostdlib -soname=linux-vdso.so.1 --hash-style=sysv \
 		--build-id -n -T
 
-ccflags-y := -fno-common -fno-builtin -fno-stack-protector
+ccflags-y := -fno-common -fno-builtin -fno-stack-protector -ffixed-x18
 ccflags-y += -DDISABLE_BRANCH_PROFILING
 
 VDSO_LDFLAGS := -Bsymbolic
-- 
2.21.0
