From: linuxram@us.ibm.com (Ram Pai)
Date: Thu, 18 Jan 2018 17:50:41 -0800
Subject: [Linux-kselftest-mirror] [PATCH v10 20/27] powerpc: introduce
	get_mm_addr_key() helper
In-Reply-To: <1516326648-22775-1-git-send-email-linuxram@us.ibm.com>
References: <1516326648-22775-1-git-send-email-linuxram@us.ibm.com>
Message-ID: <1516326648-22775-21-git-send-email-linuxram@us.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180119015041.u3tU9aX1Yyrwp8-6En0vHfdwJxCbibg6-NJhf3Wi69Y@z>

get_mm_addr_key() helper returns the pkey associated with
an address corresponding to a given mm_struct.

Signed-off-by: Ram Pai <linuxram at us.ibm.com>
---
 arch/powerpc/include/asm/mmu.h  |    9 +++++++++
 arch/powerpc/mm/hash_utils_64.c |   24 ++++++++++++++++++++++++
 2 files changed, 33 insertions(+), 0 deletions(-)

diff --git a/arch/powerpc/include/asm/mmu.h b/arch/powerpc/include/asm/mmu.h
index 6364f5c..bb38312 100644
--- a/arch/powerpc/include/asm/mmu.h
+++ b/arch/powerpc/include/asm/mmu.h
@@ -260,6 +260,15 @@ static inline bool early_radix_enabled(void)
 }
 #endif
 
+#ifdef CONFIG_PPC_MEM_KEYS
+extern u16 get_mm_addr_key(struct mm_struct *mm, unsigned long address);
+#else
+static inline u16 get_mm_addr_key(struct mm_struct *mm, unsigned long address)
+{
+	return 0;
+}
+#endif /* CONFIG_PPC_MEM_KEYS */
+
 #endif /* !__ASSEMBLY__ */
 
 /* The kernel use the constants below to index in the page sizes array.
diff --git a/arch/powerpc/mm/hash_utils_64.c b/arch/powerpc/mm/hash_utils_64.c
index dc0f76e..1e1c03b 100644
--- a/arch/powerpc/mm/hash_utils_64.c
+++ b/arch/powerpc/mm/hash_utils_64.c
@@ -1573,6 +1573,30 @@ void hash_preload(struct mm_struct *mm, unsigned long ea,
 	local_irq_restore(flags);
 }
 
+#ifdef CONFIG_PPC_MEM_KEYS
+/*
+ * Return the protection key associated with the given address and the
+ * mm_struct.
+ */
+u16 get_mm_addr_key(struct mm_struct *mm, unsigned long address)
+{
+	pte_t *ptep;
+	u16 pkey = 0;
+	unsigned long flags;
+
+	if (!mm || !mm->pgd)
+		return 0;
+
+	local_irq_save(flags);
+	ptep = find_linux_pte(mm->pgd, address, NULL, NULL);
+	if (ptep)
+		pkey = pte_to_pkey_bits(pte_val(READ_ONCE(*ptep)));
+	local_irq_restore(flags);
+
+	return pkey;
+}
+#endif /* CONFIG_PPC_MEM_KEYS */
+
 #ifdef CONFIG_PPC_TRANSACTIONAL_MEM
 static inline void tm_flush_hash_page(int local)
 {
-- 
1.7.1

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
