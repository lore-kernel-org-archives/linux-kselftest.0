From: linuxram at us.ibm.com (Ram Pai)
Date: Thu, 18 Jan 2018 17:50:26 -0800
Subject: [Linux-kselftest-mirror] [PATCH v10 05/27] powerpc: helper function
	to read, write AMR, IAMR, UAMOR registers
In-Reply-To: <1516326648-22775-1-git-send-email-linuxram@us.ibm.com>
References: <1516326648-22775-1-git-send-email-linuxram@us.ibm.com>
Message-ID: <1516326648-22775-6-git-send-email-linuxram@us.ibm.com>

Implements helper functions to read and write the key related
registers; AMR, IAMR, UAMOR.

AMR register tracks the read,write permission of a key
IAMR register tracks the execute permission of a key
UAMOR register enables and disables a key

Acked-by: Balbir Singh <bsingharora at gmail.com>
Reviewed-by: Thiago Jung Bauermann <bauerman at linux.vnet.ibm.com>
Signed-off-by: Ram Pai <linuxram at us.ibm.com>
---
 arch/powerpc/mm/pkeys.c |   36 ++++++++++++++++++++++++++++++++++++
 1 files changed, 36 insertions(+), 0 deletions(-)

diff --git a/arch/powerpc/mm/pkeys.c b/arch/powerpc/mm/pkeys.c
index e2f3992..6e8df6e 100644
--- a/arch/powerpc/mm/pkeys.c
+++ b/arch/powerpc/mm/pkeys.c
@@ -71,3 +71,39 @@ void pkey_mm_init(struct mm_struct *mm)
 		return;
 	mm_pkey_allocation_map(mm) = initial_allocation_mask;
 }
+
+static inline u64 read_amr(void)
+{
+	return mfspr(SPRN_AMR);
+}
+
+static inline void write_amr(u64 value)
+{
+	mtspr(SPRN_AMR, value);
+}
+
+static inline u64 read_iamr(void)
+{
+	if (!likely(pkey_execute_disable_supported))
+		return 0x0UL;
+
+	return mfspr(SPRN_IAMR);
+}
+
+static inline void write_iamr(u64 value)
+{
+	if (!likely(pkey_execute_disable_supported))
+		return;
+
+	mtspr(SPRN_IAMR, value);
+}
+
+static inline u64 read_uamor(void)
+{
+	return mfspr(SPRN_UAMOR);
+}
+
+static inline void write_uamor(u64 value)
+{
+	mtspr(SPRN_UAMOR, value);
+}
-- 
1.7.1

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
