From: linuxram@us.ibm.com (Ram Pai)
Date: Wed, 13 Jun 2018 17:45:04 -0700
Subject: [PATCH v13 13/24] selftests/vm: pkey register should match shadow pkey
In-Reply-To: <1528937115-10132-1-git-send-email-linuxram@us.ibm.com>
References: <1528937115-10132-1-git-send-email-linuxram@us.ibm.com>
Message-ID: <1528937115-10132-14-git-send-email-linuxram@us.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180614004504.5ydJj1hyWzRWLNlUlqxcrkYnivhnmS9omO1Msa_yWPY@z>

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
index 9afe894..adcae4a 100644
--- a/tools/testing/selftests/vm/protection_keys.c
+++ b/tools/testing/selftests/vm/protection_keys.c
@@ -916,10 +916,10 @@ void expected_pkey_fault(int pkey)
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
