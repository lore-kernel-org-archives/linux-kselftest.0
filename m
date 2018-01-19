From: linuxram at us.ibm.com (Ram Pai)
Date: Thu, 18 Jan 2018 17:50:29 -0800
Subject: [Linux-kselftest-mirror] [PATCH v10 08/27] powerpc: implementation
	for arch_set_user_pkey_access()
In-Reply-To: <1516326648-22775-1-git-send-email-linuxram@us.ibm.com>
References: <1516326648-22775-1-git-send-email-linuxram@us.ibm.com>
Message-ID: <1516326648-22775-9-git-send-email-linuxram@us.ibm.com>

This patch provides the detailed implementation for
a user to allocate a key and enable it in the hardware.

It provides the plumbing, but it cannot be used till
the system call is implemented. The next patch  will
do so.

Reviewed-by: Thiago Jung Bauermann <bauerman at linux.vnet.ibm.com>
Signed-off-by: Ram Pai <linuxram at us.ibm.com>
---
 arch/powerpc/include/asm/pkeys.h |    6 ++++-
 arch/powerpc/mm/pkeys.c          |   40 ++++++++++++++++++++++++++++++++++++++
 2 files changed, 45 insertions(+), 1 deletions(-)

diff --git a/arch/powerpc/include/asm/pkeys.h b/arch/powerpc/include/asm/pkeys.h
index 9964b46..2500a90 100644
--- a/arch/powerpc/include/asm/pkeys.h
+++ b/arch/powerpc/include/asm/pkeys.h
@@ -139,10 +139,14 @@ static inline int arch_override_mprotect_pkey(struct vm_area_struct *vma,
 	return 0;
 }
 
+extern int __arch_set_user_pkey_access(struct task_struct *tsk, int pkey,
+				       unsigned long init_val);
 static inline int arch_set_user_pkey_access(struct task_struct *tsk, int pkey,
 					    unsigned long init_val)
 {
-	return 0;
+	if (static_branch_likely(&pkey_disabled))
+		return -EINVAL;
+	return __arch_set_user_pkey_access(tsk, pkey, init_val);
 }
 
 extern void pkey_mm_init(struct mm_struct *mm);
diff --git a/arch/powerpc/mm/pkeys.c b/arch/powerpc/mm/pkeys.c
index e1dc45b..eca04cd 100644
--- a/arch/powerpc/mm/pkeys.c
+++ b/arch/powerpc/mm/pkeys.c
@@ -9,6 +9,7 @@
  * (at your option) any later version.
  */
 
+#include <asm/mman.h>
 #include <linux/pkeys.h>
 
 DEFINE_STATIC_KEY_TRUE(pkey_disabled);
@@ -17,6 +18,9 @@
 u32  initial_allocation_mask;	/* Bits set for reserved keys */
 
 #define AMR_BITS_PER_PKEY 2
+#define AMR_RD_BIT 0x1UL
+#define AMR_WR_BIT 0x2UL
+#define IAMR_EX_BIT 0x1UL
 #define PKEY_REG_BITS (sizeof(u64)*8)
 #define pkeyshift(pkey) (PKEY_REG_BITS - ((pkey+1) * AMR_BITS_PER_PKEY))
 
@@ -112,6 +116,20 @@ static inline void write_uamor(u64 value)
 	mtspr(SPRN_UAMOR, value);
 }
 
+static bool is_pkey_enabled(int pkey)
+{
+	u64 uamor = read_uamor();
+	u64 pkey_bits = 0x3ul << pkeyshift(pkey);
+	u64 uamor_pkey_bits = (uamor & pkey_bits);
+
+	/*
+	 * Both the bits in UAMOR corresponding to the key should be set or
+	 * reset.
+	 */
+	WARN_ON(uamor_pkey_bits && (uamor_pkey_bits != pkey_bits));
+	return !!(uamor_pkey_bits);
+}
+
 static inline void init_amr(int pkey, u8 init_bits)
 {
 	u64 new_amr_bits = (((u64)init_bits & 0x3UL) << pkeyshift(pkey));
@@ -154,3 +172,25 @@ void __arch_deactivate_pkey(int pkey)
 {
 	pkey_status_change(pkey, false);
 }
+
+/*
+ * Set the access rights in AMR IAMR and UAMOR registers for @pkey to that
+ * specified in @init_val.
+ */
+int __arch_set_user_pkey_access(struct task_struct *tsk, int pkey,
+				unsigned long init_val)
+{
+	u64 new_amr_bits = 0x0ul;
+
+	if (!is_pkey_enabled(pkey))
+		return -EINVAL;
+
+	/* Set the bits we need in AMR: */
+	if (init_val & PKEY_DISABLE_ACCESS)
+		new_amr_bits |= AMR_RD_BIT | AMR_WR_BIT;
+	else if (init_val & PKEY_DISABLE_WRITE)
+		new_amr_bits |= AMR_WR_BIT;
+
+	init_amr(pkey, new_amr_bits);
+	return 0;
+}
-- 
1.7.1

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
