From: linuxram@us.ibm.com (Ram Pai)
Date: Thu, 18 Jan 2018 17:50:30 -0800
Subject: [Linux-kselftest-mirror] [PATCH v10 09/27] powerpc: ability to
	create execute-disabled pkeys
In-Reply-To: <1516326648-22775-1-git-send-email-linuxram@us.ibm.com>
References: <1516326648-22775-1-git-send-email-linuxram@us.ibm.com>
Message-ID: <1516326648-22775-10-git-send-email-linuxram@us.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180119015030.VCU2Gc0Dfxtie7wx99SonJs7xpdhjG6yx_1CleI8jWM@z>

powerpc has hardware support to disable execute on a pkey.
This patch enables the ability to create execute-disabled
keys.

Signed-off-by: Ram Pai <linuxram at us.ibm.com>
---
 arch/powerpc/include/uapi/asm/mman.h |    6 ++++++
 arch/powerpc/mm/pkeys.c              |   16 ++++++++++++++++
 2 files changed, 22 insertions(+), 0 deletions(-)

diff --git a/arch/powerpc/include/uapi/asm/mman.h b/arch/powerpc/include/uapi/asm/mman.h
index e63bc37..65065ce 100644
--- a/arch/powerpc/include/uapi/asm/mman.h
+++ b/arch/powerpc/include/uapi/asm/mman.h
@@ -30,4 +30,10 @@
 #define MAP_STACK	0x20000		/* give out an address that is best suited for process/thread stacks */
 #define MAP_HUGETLB	0x40000		/* create a huge page mapping */
 
+/* Override any generic PKEY permission defines */
+#define PKEY_DISABLE_EXECUTE   0x4
+#undef PKEY_ACCESS_MASK
+#define PKEY_ACCESS_MASK       (PKEY_DISABLE_ACCESS |\
+				PKEY_DISABLE_WRITE  |\
+				PKEY_DISABLE_EXECUTE)
 #endif /* _UAPI_ASM_POWERPC_MMAN_H */
diff --git a/arch/powerpc/mm/pkeys.c b/arch/powerpc/mm/pkeys.c
index eca04cd..39e9814 100644
--- a/arch/powerpc/mm/pkeys.c
+++ b/arch/powerpc/mm/pkeys.c
@@ -29,6 +29,14 @@ int pkey_initialize(void)
 	int os_reserved, i;
 
 	/*
+	 * We define PKEY_DISABLE_EXECUTE in addition to the arch-neutral
+	 * generic defines for PKEY_DISABLE_ACCESS and PKEY_DISABLE_WRITE.
+	 * Ensure that the bits a distinct.
+	 */
+	BUILD_BUG_ON(PKEY_DISABLE_EXECUTE &
+		     (PKEY_DISABLE_ACCESS | PKEY_DISABLE_WRITE));
+
+	/*
 	 * Disable the pkey system till everything is in place. A subsequent
 	 * patch will enable it.
 	 */
@@ -181,10 +189,18 @@ int __arch_set_user_pkey_access(struct task_struct *tsk, int pkey,
 				unsigned long init_val)
 {
 	u64 new_amr_bits = 0x0ul;
+	u64 new_iamr_bits = 0x0ul;
 
 	if (!is_pkey_enabled(pkey))
 		return -EINVAL;
 
+	if (init_val & PKEY_DISABLE_EXECUTE) {
+		if (!pkey_execute_disable_supported)
+			return -EINVAL;
+		new_iamr_bits |= IAMR_EX_BIT;
+	}
+	init_iamr(pkey, new_iamr_bits);
+
 	/* Set the bits we need in AMR: */
 	if (init_val & PKEY_DISABLE_ACCESS)
 		new_amr_bits |= AMR_RD_BIT | AMR_WR_BIT;
-- 
1.7.1

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
