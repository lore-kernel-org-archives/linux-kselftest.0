From: linuxram at us.ibm.com (Ram Pai)
Date: Thu, 18 Jan 2018 17:50:38 -0800
Subject: [Linux-kselftest-mirror] [PATCH v10 17/27] powerpc: check key
	protection for user page access
In-Reply-To: <1516326648-22775-1-git-send-email-linuxram@us.ibm.com>
References: <1516326648-22775-1-git-send-email-linuxram@us.ibm.com>
Message-ID: <1516326648-22775-18-git-send-email-linuxram@us.ibm.com>

Make sure that the kernel does not access user pages without
checking their key-protection.

Signed-off-by: Ram Pai <linuxram at us.ibm.com>
---
 arch/powerpc/include/asm/book3s/64/pgtable.h |   19 +++++++++++++++++++
 1 files changed, 19 insertions(+), 0 deletions(-)

diff --git a/arch/powerpc/include/asm/book3s/64/pgtable.h b/arch/powerpc/include/asm/book3s/64/pgtable.h
index e785c68..3d8186e 100644
--- a/arch/powerpc/include/asm/book3s/64/pgtable.h
+++ b/arch/powerpc/include/asm/book3s/64/pgtable.h
@@ -464,6 +464,25 @@ static inline void huge_ptep_set_wrprotect(struct mm_struct *mm,
 
 #ifdef CONFIG_PPC_MEM_KEYS
 extern bool arch_pte_access_permitted(u64 pte, bool write, bool execute);
+
+#define pte_access_permitted(pte, write) \
+	(pte_present(pte) && \
+	 ((!(write) || pte_write(pte)) && \
+	  arch_pte_access_permitted(pte_val(pte), !!write, 0)))
+
+/*
+ * We store key in pmd/pud for huge pages. Need to check for key protection.
+ */
+#define pmd_access_permitted(pmd, write) \
+	(pmd_present(pmd) && \
+	 ((!(write) || pmd_write(pmd)) && \
+	  arch_pte_access_permitted(pmd_val(pmd), !!write, 0)))
+
+#define pud_access_permitted(pud, write) \
+	(pud_present(pud) && \
+	 ((!(write) || pud_write(pud)) && \
+	  arch_pte_access_permitted(pud_val(pud), !!write, 0)))
+
 #endif /* CONFIG_PPC_MEM_KEYS */
 
 #define __HAVE_ARCH_PTEP_GET_AND_CLEAR
-- 
1.7.1

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
