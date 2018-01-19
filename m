From: linuxram at us.ibm.com (Ram Pai)
Date: Thu, 18 Jan 2018 17:50:36 -0800
Subject: [Linux-kselftest-mirror] [PATCH v10 15/27] powerpc: Program HPTE
	key protection bits
In-Reply-To: <1516326648-22775-1-git-send-email-linuxram@us.ibm.com>
References: <1516326648-22775-1-git-send-email-linuxram@us.ibm.com>
Message-ID: <1516326648-22775-16-git-send-email-linuxram@us.ibm.com>

Map the PTE protection key bits to the HPTE key protection bits,
while creating HPTE  entries.

Acked-by: Balbir Singh <bsingharora at gmail.com>
Signed-off-by: Ram Pai <linuxram at us.ibm.com>
---
 arch/powerpc/include/asm/book3s/64/mmu-hash.h |    5 +++++
 arch/powerpc/include/asm/mmu_context.h        |    6 ++++++
 arch/powerpc/include/asm/pkeys.h              |    9 +++++++++
 arch/powerpc/mm/hash_utils_64.c               |    1 +
 4 files changed, 21 insertions(+), 0 deletions(-)

diff --git a/arch/powerpc/include/asm/book3s/64/mmu-hash.h b/arch/powerpc/include/asm/book3s/64/mmu-hash.h
index e91e115..50ed64f 100644
--- a/arch/powerpc/include/asm/book3s/64/mmu-hash.h
+++ b/arch/powerpc/include/asm/book3s/64/mmu-hash.h
@@ -90,6 +90,8 @@
 #define HPTE_R_PP0		ASM_CONST(0x8000000000000000)
 #define HPTE_R_TS		ASM_CONST(0x4000000000000000)
 #define HPTE_R_KEY_HI		ASM_CONST(0x3000000000000000)
+#define HPTE_R_KEY_BIT0		ASM_CONST(0x2000000000000000)
+#define HPTE_R_KEY_BIT1		ASM_CONST(0x1000000000000000)
 #define HPTE_R_RPN_SHIFT	12
 #define HPTE_R_RPN		ASM_CONST(0x0ffffffffffff000)
 #define HPTE_R_RPN_3_0		ASM_CONST(0x01fffffffffff000)
@@ -104,6 +106,9 @@
 #define HPTE_R_C		ASM_CONST(0x0000000000000080)
 #define HPTE_R_R		ASM_CONST(0x0000000000000100)
 #define HPTE_R_KEY_LO		ASM_CONST(0x0000000000000e00)
+#define HPTE_R_KEY_BIT2		ASM_CONST(0x0000000000000800)
+#define HPTE_R_KEY_BIT3		ASM_CONST(0x0000000000000400)
+#define HPTE_R_KEY_BIT4		ASM_CONST(0x0000000000000200)
 #define HPTE_R_KEY		(HPTE_R_KEY_LO | HPTE_R_KEY_HI)
 
 #define HPTE_V_1TB_SEG		ASM_CONST(0x4000000000000000)
diff --git a/arch/powerpc/include/asm/mmu_context.h b/arch/powerpc/include/asm/mmu_context.h
index 3ba571d..209f127 100644
--- a/arch/powerpc/include/asm/mmu_context.h
+++ b/arch/powerpc/include/asm/mmu_context.h
@@ -203,6 +203,12 @@ static inline int vma_pkey(struct vm_area_struct *vma)
 {
 	return 0;
 }
+
+static inline u64 pte_to_hpte_pkey_bits(u64 pteflags)
+{
+	return 0x0UL;
+}
+
 #endif /* CONFIG_PPC_MEM_KEYS */
 
 #endif /* __KERNEL__ */
diff --git a/arch/powerpc/include/asm/pkeys.h b/arch/powerpc/include/asm/pkeys.h
index f65dedd..523d66c 100644
--- a/arch/powerpc/include/asm/pkeys.h
+++ b/arch/powerpc/include/asm/pkeys.h
@@ -73,6 +73,15 @@ static inline int vma_pkey(struct vm_area_struct *vma)
 
 #define arch_max_pkey() pkeys_total
 
+static inline u64 pte_to_hpte_pkey_bits(u64 pteflags)
+{
+	return (((pteflags & H_PTE_PKEY_BIT0) ? HPTE_R_KEY_BIT0 : 0x0UL) |
+		((pteflags & H_PTE_PKEY_BIT1) ? HPTE_R_KEY_BIT1 : 0x0UL) |
+		((pteflags & H_PTE_PKEY_BIT2) ? HPTE_R_KEY_BIT2 : 0x0UL) |
+		((pteflags & H_PTE_PKEY_BIT3) ? HPTE_R_KEY_BIT3 : 0x0UL) |
+		((pteflags & H_PTE_PKEY_BIT4) ? HPTE_R_KEY_BIT4 : 0x0UL));
+}
+
 #define pkey_alloc_mask(pkey) (0x1 << pkey)
 
 #define mm_pkey_allocation_map(mm) (mm->context.pkey_allocation_map)
diff --git a/arch/powerpc/mm/hash_utils_64.c b/arch/powerpc/mm/hash_utils_64.c
index 8bd841a..dc0f76e 100644
--- a/arch/powerpc/mm/hash_utils_64.c
+++ b/arch/powerpc/mm/hash_utils_64.c
@@ -233,6 +233,7 @@ unsigned long htab_convert_pte_flags(unsigned long pteflags)
 		 */
 		rflags |= HPTE_R_M;
 
+	rflags |= pte_to_hpte_pkey_bits(pteflags);
 	return rflags;
 }
 
-- 
1.7.1

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
