From: linuxram@us.ibm.com (Ram Pai)
Date: Mon, 22 Jan 2018 10:52:00 -0800
Subject: [Linux-kselftest-mirror] [PATCH v10 07/24] selftests/vm: fixed bugs
	in pkey_disable_clear()
In-Reply-To: <1516647137-11174-1-git-send-email-linuxram@us.ibm.com>
References: <1516647137-11174-1-git-send-email-linuxram@us.ibm.com>
Message-ID: <1516647137-11174-8-git-send-email-linuxram@us.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180122185200.q97cGNjEreqXf6oRHGVdpvT4pWlHzdMjqhNHfa23X2I@z>

instead of clearing the bits, pkey_disable_clear() was setting
the bits. Fixed it.

Also fixed a wrong assertion in that function. When bits are
cleared, the resulting bit value will be less than the original.

Signed-off-by: Ram Pai <linuxram at us.ibm.com>
---
 tools/testing/selftests/vm/protection_keys.c |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/vm/protection_keys.c b/tools/testing/selftests/vm/protection_keys.c
index 0109388..ca54a95 100644
--- a/tools/testing/selftests/vm/protection_keys.c
+++ b/tools/testing/selftests/vm/protection_keys.c
@@ -461,7 +461,7 @@ void pkey_disable_clear(int pkey, int flags)
 			pkey, pkey, pkey_rights);
 	pkey_assert(pkey_rights >= 0);
 
-	pkey_rights |= flags;
+	pkey_rights &= ~flags;
 
 	ret = pkey_set(pkey, pkey_rights, 0);
 	/* pkey_reg and flags have the same format */
@@ -475,7 +475,7 @@ void pkey_disable_clear(int pkey, int flags)
 	dprintf1("%s(%d) pkey_reg: 0x%016lx\n", __func__,
 			pkey, rdpkey_reg());
 	if (flags)
-		assert(rdpkey_reg() > orig_pkey_reg);
+		assert(rdpkey_reg() < orig_pkey_reg);
 }
 
 void pkey_write_allow(int pkey)
-- 
1.7.1

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
