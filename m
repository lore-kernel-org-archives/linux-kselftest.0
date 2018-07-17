From: linuxram at us.ibm.com (Ram Pai)
Date: Tue, 17 Jul 2018 06:49:15 -0700
Subject: [PATCH v14 12/22] selftests/vm: pkey register should match shadow pkey
In-Reply-To: <1531835365-32387-1-git-send-email-linuxram@us.ibm.com>
References: <1531835365-32387-1-git-send-email-linuxram@us.ibm.com>
Message-ID: <1531835365-32387-13-git-send-email-linuxram@us.ibm.com>

expected_pkey_fault() is comparing the contents of pkey
register with 0. This may not be true all the time. There
could be bits set by default by the architecture
which can never be changed. Hence compare the value against
shadow pkey register, which is supposed to track the bits
accurately all throughout

cc: Dave Hansen <dave.hansen at intel.com>
cc: Florian Weimer <fweimer at redhat.com>
Signed-off-by: Ram Pai <linuxram at us.ibm.com>
---
 tools/testing/selftests/vm/protection_keys.c |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/vm/protection_keys.c b/tools/testing/selftests/vm/protection_keys.c
index 2e448e0..f50cce8 100644
--- a/tools/testing/selftests/vm/protection_keys.c
+++ b/tools/testing/selftests/vm/protection_keys.c
@@ -913,10 +913,10 @@ void expected_pkey_fault(int pkey)
 		pkey_assert(last_si_pkey == pkey);
 
 	/*
-	 * The signal handler shold have cleared out PKEY register to let the
+	 * The signal handler should have cleared out pkey-register to let the
 	 * test program continue.  We now have to restore it.
 	 */
-	if (__read_pkey_reg() != 0)
+	if (__read_pkey_reg() != shadow_pkey_reg)
 		pkey_assert(0);
 
 	__write_pkey_reg(shadow_pkey_reg);
-- 
1.7.1

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
