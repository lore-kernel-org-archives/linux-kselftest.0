From: linuxram at us.ibm.com (Ram Pai)
Date: Wed, 21 Feb 2018 17:55:33 -0800
Subject: [PATCH v12 14/22] selftests/vm: clear the bits in shadow reg when a
 pkey is freed.
In-Reply-To: <1519264541-7621-1-git-send-email-linuxram@us.ibm.com>
References: <1519264541-7621-1-git-send-email-linuxram@us.ibm.com>
Message-ID: <1519264541-7621-15-git-send-email-linuxram@us.ibm.com>

When a key is freed, the  key  is  no  more  effective.
Clear the bits corresponding to the pkey in the shadow
register. Otherwise  it  will carry some spurious bits
which can trigger false-positive asserts.

cc: Dave Hansen <dave.hansen at intel.com>
cc: Florian Weimer <fweimer at redhat.com>
Signed-off-by: Ram Pai <linuxram at us.ibm.com>
---
 tools/testing/selftests/vm/protection_keys.c |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/tools/testing/selftests/vm/protection_keys.c b/tools/testing/selftests/vm/protection_keys.c
index c4c73e6..e82bd88 100644
--- a/tools/testing/selftests/vm/protection_keys.c
+++ b/tools/testing/selftests/vm/protection_keys.c
@@ -586,7 +586,8 @@ int sys_pkey_free(unsigned long pkey)
 	int ret = syscall(SYS_pkey_free, pkey);
 
 	if (!ret)
-		shadow_pkey_reg &= reset_bits(pkey, PKEY_DISABLE_ACCESS);
+		shadow_pkey_reg &= reset_bits(pkey,
+				PKEY_DISABLE_ACCESS | PKEY_DISABLE_WRITE);
 	dprintf1("%s(pkey=%ld) syscall ret: %d\n", __func__, pkey, ret);
 	return ret;
 }
-- 
1.7.1

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
