From: linuxram at us.ibm.com (Ram Pai)
Date: Tue, 17 Jul 2018 06:49:12 -0700
Subject: [PATCH v14 09/22] selftests/vm: fixed bugs in pkey_disable_clear()
In-Reply-To: <1531835365-32387-1-git-send-email-linuxram@us.ibm.com>
References: <1531835365-32387-1-git-send-email-linuxram@us.ibm.com>
Message-ID: <1531835365-32387-10-git-send-email-linuxram@us.ibm.com>

instead of clearing the bits, pkey_disable_clear() was setting
the bits. Fixed it.

Also fixed a wrong assertion in that function. When bits are
cleared, the resulting bit value will be less than the original.

This hasn't been a problem so far because this code isn't currently
used.

cc: Dave Hansen <dave.hansen at intel.com>
cc: Florian Weimer <fweimer at redhat.com>
Signed-off-by: Ram Pai <linuxram at us.ibm.com>
---
 tools/testing/selftests/vm/protection_keys.c |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/vm/protection_keys.c b/tools/testing/selftests/vm/protection_keys.c
index 2dd94c3..8fa4f74 100644
--- a/tools/testing/selftests/vm/protection_keys.c
+++ b/tools/testing/selftests/vm/protection_keys.c
@@ -433,7 +433,7 @@ void pkey_disable_clear(int pkey, int flags)
 			pkey, pkey, pkey_rights);
 	pkey_assert(pkey_rights >= 0);
 
-	pkey_rights |= flags;
+	pkey_rights &= ~flags;
 
 	ret = hw_pkey_set(pkey, pkey_rights, 0);
 	shadow_pkey_reg &= clear_pkey_flags(pkey, flags);
@@ -446,7 +446,7 @@ void pkey_disable_clear(int pkey, int flags)
 	dprintf1("%s(%d) pkey_reg: 0x"PKEY_REG_FMT"\n", __func__,
 			pkey, read_pkey_reg());
 	if (flags)
-		assert(read_pkey_reg() > orig_pkey_reg);
+		assert(read_pkey_reg() <= orig_pkey_reg);
 }
 
 void pkey_write_allow(int pkey)
-- 
1.7.1

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
