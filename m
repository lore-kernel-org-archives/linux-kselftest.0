From: linuxram@us.ibm.com (Ram Pai)
Date: Thu, 18 Jan 2018 17:50:37 -0800
Subject: [Linux-kselftest-mirror] [PATCH v10 16/27] powerpc: helper to
	validate key-access permissions of a pte
In-Reply-To: <1516326648-22775-1-git-send-email-linuxram@us.ibm.com>
References: <1516326648-22775-1-git-send-email-linuxram@us.ibm.com>
Message-ID: <1516326648-22775-17-git-send-email-linuxram@us.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180119015037.6vbLlUQGIXyVDK_AXZmwZ6C9dgQ3LaiD-rBqlvzXib0@z>

helper function that checks if the read/write/execute is allowed
on the pte.

Signed-off-by: Ram Pai <linuxram at us.ibm.com>
---
 arch/powerpc/include/asm/book3s/64/pgtable.h |    4 +++
 arch/powerpc/include/asm/pkeys.h             |    9 ++++++++
 arch/powerpc/mm/pkeys.c                      |   28 ++++++++++++++++++++++++++
 3 files changed, 41 insertions(+), 0 deletions(-)

diff --git a/arch/powerpc/include/asm/book3s/64/pgtable.h b/arch/powerpc/include/asm/book3s/64/pgtable.h
index e1a8bb6..e785c68 100644
--- a/arch/powerpc/include/asm/book3s/64/pgtable.h
+++ b/arch/powerpc/include/asm/book3s/64/pgtable.h
@@ -462,6 +462,10 @@ static inline void huge_ptep_set_wrprotect(struct mm_struct *mm,
 		pte_update(mm, addr, ptep, 0, _PAGE_PRIVILEGED, 1);
 }
 
+#ifdef CONFIG_PPC_MEM_KEYS
+extern bool arch_pte_access_permitted(u64 pte, bool write, bool execute);
+#endif /* CONFIG_PPC_MEM_KEYS */
+
 #define __HAVE_ARCH_PTEP_GET_AND_CLEAR
 static inline pte_t ptep_get_and_clear(struct mm_struct *mm,
 				       unsigned long addr, pte_t *ptep)
diff --git a/arch/powerpc/include/asm/pkeys.h b/arch/powerpc/include/asm/pkeys.h
index 523d66c..7c45a40 100644
--- a/arch/powerpc/include/asm/pkeys.h
+++ b/arch/powerpc/include/asm/pkeys.h
@@ -82,6 +82,15 @@ static inline u64 pte_to_hpte_pkey_bits(u64 pteflags)
 		((pteflags & H_PTE_PKEY_BIT4) ? HPTE_R_KEY_BIT4 : 0x0UL));
 }
 
+static inline u16 pte_to_pkey_bits(u64 pteflags)
+{
+	return (((pteflags & H_PTE_PKEY_BIT0) ? 0x10 : 0x0UL) |
+		((pteflags & H_PTE_PKEY_BIT1) ? 0x8 : 0x0UL) |
+		((pteflags & H_PTE_PKEY_BIT2) ? 0x4 : 0x0UL) |
+		((pteflags & H_PTE_PKEY_BIT3) ? 0x2 : 0x0UL) |
+		((pteflags & H_PTE_PKEY_BIT4) ? 0x1 : 0x0UL));
+}
+
 #define pkey_alloc_mask(pkey) (0x1 << pkey)
 
 #define mm_pkey_allocation_map(mm) (mm->context.pkey_allocation_map)
diff --git a/arch/powerpc/mm/pkeys.c b/arch/powerpc/mm/pkeys.c
index 7630c2f..0e044ea 100644
--- a/arch/powerpc/mm/pkeys.c
+++ b/arch/powerpc/mm/pkeys.c
@@ -362,3 +362,31 @@ int __arch_override_mprotect_pkey(struct vm_area_struct *vma, int prot,
 	/* Nothing to override. */
 	return vma_pkey(vma);
 }
+
+static bool pkey_access_permitted(int pkey, bool write, bool execute)
+{
+	int pkey_shift;
+	u64 amr;
+
+	if (!pkey)
+		return true;
+
+	if (!is_pkey_enabled(pkey))
+		return true;
+
+	pkey_shift = pkeyshift(pkey);
+	if (execute && !(read_iamr() & (IAMR_EX_BIT << pkey_shift)))
+		return true;
+
+	amr = read_amr(); /* Delay reading amr until absolutely needed */
+	return ((!write && !(amr & (AMR_RD_BIT << pkey_shift))) ||
+		(write &&  !(amr & (AMR_WR_BIT << pkey_shift))));
+}
+
+bool arch_pte_access_permitted(u64 pte, bool write, bool execute)
+{
+	if (static_branch_likely(&pkey_disabled))
+		return true;
+
+	return pkey_access_permitted(pte_to_pkey_bits(pte), write, execute);
+}
-- 
1.7.1

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
