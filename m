From: linuxram@us.ibm.com (Ram Pai)
Date: Tue, 17 Jul 2018 06:49:11 -0700
Subject: [PATCH v14 08/22] selftests/vm: fix the wrong assert in
 pkey_disable_set()
In-Reply-To: <1531835365-32387-1-git-send-email-linuxram@us.ibm.com>
References: <1531835365-32387-1-git-send-email-linuxram@us.ibm.com>
Message-ID: <1531835365-32387-9-git-send-email-linuxram@us.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180717134911.bpJ2-MnRN1ubU7EXTx7Bt0ZwjPNDLt8mwxuLa_9D9Jw@z>

If the flag is 0, no bits will be set. Hence we cant expect
the resulting bitmap to have a higher value than what it
was earlier.

cc: Dave Hansen <dave.hansen at intel.com>
cc: Florian Weimer <fweimer at redhat.com>
Signed-off-by: Ram Pai <linuxram at us.ibm.com>
---
 tools/testing/selftests/vm/protection_keys.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/tools/testing/selftests/vm/protection_keys.c b/tools/testing/selftests/vm/protection_keys.c
index fb7dd32..2dd94c3 100644
--- a/tools/testing/selftests/vm/protection_keys.c
+++ b/tools/testing/selftests/vm/protection_keys.c
@@ -415,7 +415,7 @@ void pkey_disable_set(int pkey, int flags)
 	dprintf1("%s(%d) pkey_reg: 0x"PKEY_REG_FMT"\n",
 		__func__, pkey, read_pkey_reg());
 	if (flags)
-		pkey_assert(read_pkey_reg() > orig_pkey_reg);
+		pkey_assert(read_pkey_reg() >= orig_pkey_reg);
 	dprintf1("END<---%s(%d, 0x%x)\n", __func__,
 		pkey, flags);
 }
-- 
1.7.1

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
