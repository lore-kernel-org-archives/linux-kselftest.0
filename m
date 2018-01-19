From: linuxram at us.ibm.com (Ram Pai)
Date: Thu, 18 Jan 2018 17:50:39 -0800
Subject: [Linux-kselftest-mirror] [PATCH v10 18/27] powerpc: implementation
	for arch_vma_access_permitted()
In-Reply-To: <1516326648-22775-1-git-send-email-linuxram@us.ibm.com>
References: <1516326648-22775-1-git-send-email-linuxram@us.ibm.com>
Message-ID: <1516326648-22775-19-git-send-email-linuxram@us.ibm.com>

This patch provides the implementation for
arch_vma_access_permitted(). Returns true if the
requested access is allowed by pkey associated with the
vma.

Signed-off-by: Ram Pai <linuxram at us.ibm.com>
---
 arch/powerpc/include/asm/mmu_context.h |    5 +++-
 arch/powerpc/mm/pkeys.c                |   34 ++++++++++++++++++++++++++++++++
 2 files changed, 38 insertions(+), 1 deletions(-)

diff --git a/arch/powerpc/include/asm/mmu_context.h b/arch/powerpc/include/asm/mmu_context.h
index 209f127..cd2bd73 100644
--- a/arch/powerpc/include/asm/mmu_context.h
+++ b/arch/powerpc/include/asm/mmu_context.h
@@ -186,6 +186,10 @@ static inline void arch_bprm_mm_init(struct mm_struct *mm,
 {
 }
 
+#ifdef CONFIG_PPC_MEM_KEYS
+bool arch_vma_access_permitted(struct vm_area_struct *vma, bool write,
+			       bool execute, bool foreign);
+#else /* CONFIG_PPC_MEM_KEYS */
 static inline bool arch_vma_access_permitted(struct vm_area_struct *vma,
 		bool write, bool execute, bool foreign)
 {
@@ -193,7 +197,6 @@ static inline bool arch_vma_access_permitted(struct vm_area_struct *vma,
 	return true;
 }
 
-#ifndef CONFIG_PPC_MEM_KEYS
 #define pkey_mm_init(mm)
 #define thread_pkey_regs_save(thread)
 #define thread_pkey_regs_restore(new_thread, old_thread)
diff --git a/arch/powerpc/mm/pkeys.c b/arch/powerpc/mm/pkeys.c
index 0e044ea..0701aa3 100644
--- a/arch/powerpc/mm/pkeys.c
+++ b/arch/powerpc/mm/pkeys.c
@@ -390,3 +390,37 @@ bool arch_pte_access_permitted(u64 pte, bool write, bool execute)
 
 	return pkey_access_permitted(pte_to_pkey_bits(pte), write, execute);
 }
+
+/*
+ * We only want to enforce protection keys on the current thread because we
+ * effectively have no access to AMR/IAMR for other threads or any way to tell
+ * which AMR/IAMR in a threaded process we could use.
+ *
+ * So do not enforce things if the VMA is not from the current mm, or if we are
+ * in a kernel thread.
+ */
+static inline bool vma_is_foreign(struct vm_area_struct *vma)
+{
+	if (!current->mm)
+		return true;
+
+	/* if it is not our ->mm, it has to be foreign */
+	if (current->mm != vma->vm_mm)
+		return true;
+
+	return false;
+}
+
+bool arch_vma_access_permitted(struct vm_area_struct *vma, bool write,
+			       bool execute, bool foreign)
+{
+	if (static_branch_likely(&pkey_disabled))
+		return true;
+	/*
+	 * Do not enforce our key-permissions on a foreign vma.
+	 */
+	if (foreign || vma_is_foreign(vma))
+		return true;
+
+	return pkey_access_permitted(vma_pkey(vma), write, execute);
+}
-- 
1.7.1

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
