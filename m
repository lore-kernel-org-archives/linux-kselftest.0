From: linuxram@us.ibm.com (Ram Pai)
Date: Thu, 18 Jan 2018 17:50:27 -0800
Subject: [Linux-kselftest-mirror] [PATCH v10 06/27] powerpc: helper
	functions to initialize AMR, IAMR and UAMOR registers
In-Reply-To: <1516326648-22775-1-git-send-email-linuxram@us.ibm.com>
References: <1516326648-22775-1-git-send-email-linuxram@us.ibm.com>
Message-ID: <1516326648-22775-7-git-send-email-linuxram@us.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180119015027.RyMoV-pILIEwKgoWnIPuKaj2HJxxoXr1zFZ6WRZD79s@z>

Introduce  helper functions that can initialize the bits in the AMR,
IAMR and UAMOR register; the bits that correspond to the given pkey.

Reviewed-by: Thiago Jung Bauermann <bauerman at linux.vnet.ibm.com>
Signed-off-by: Ram Pai <linuxram at us.ibm.com>
---
 arch/powerpc/mm/pkeys.c |   47 +++++++++++++++++++++++++++++++++++++++++++++++
 1 files changed, 47 insertions(+), 0 deletions(-)

diff --git a/arch/powerpc/mm/pkeys.c b/arch/powerpc/mm/pkeys.c
index 6e8df6e..e1dc45b 100644
--- a/arch/powerpc/mm/pkeys.c
+++ b/arch/powerpc/mm/pkeys.c
@@ -16,6 +16,10 @@
 int  pkeys_total;		/* Total pkeys as per device tree */
 u32  initial_allocation_mask;	/* Bits set for reserved keys */
 
+#define AMR_BITS_PER_PKEY 2
+#define PKEY_REG_BITS (sizeof(u64)*8)
+#define pkeyshift(pkey) (PKEY_REG_BITS - ((pkey+1) * AMR_BITS_PER_PKEY))
+
 int pkey_initialize(void)
 {
 	int os_reserved, i;
@@ -107,3 +111,46 @@ static inline void write_uamor(u64 value)
 {
 	mtspr(SPRN_UAMOR, value);
 }
+
+static inline void init_amr(int pkey, u8 init_bits)
+{
+	u64 new_amr_bits = (((u64)init_bits & 0x3UL) << pkeyshift(pkey));
+	u64 old_amr = read_amr() & ~((u64)(0x3ul) << pkeyshift(pkey));
+
+	write_amr(old_amr | new_amr_bits);
+}
+
+static inline void init_iamr(int pkey, u8 init_bits)
+{
+	u64 new_iamr_bits = (((u64)init_bits & 0x1UL) << pkeyshift(pkey));
+	u64 old_iamr = read_iamr() & ~((u64)(0x1ul) << pkeyshift(pkey));
+
+	write_iamr(old_iamr | new_iamr_bits);
+}
+
+static void pkey_status_change(int pkey, bool enable)
+{
+	u64 old_uamor;
+
+	/* Reset the AMR and IAMR bits for this key */
+	init_amr(pkey, 0x0);
+	init_iamr(pkey, 0x0);
+
+	/* Enable/disable key */
+	old_uamor = read_uamor();
+	if (enable)
+		old_uamor |= (0x3ul << pkeyshift(pkey));
+	else
+		old_uamor &= ~(0x3ul << pkeyshift(pkey));
+	write_uamor(old_uamor);
+}
+
+void __arch_activate_pkey(int pkey)
+{
+	pkey_status_change(pkey, true);
+}
+
+void __arch_deactivate_pkey(int pkey)
+{
+	pkey_status_change(pkey, false);
+}
-- 
1.7.1

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
