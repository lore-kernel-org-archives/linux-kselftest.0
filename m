From: linuxram@us.ibm.com (Ram Pai)
Date: Wed, 13 Jun 2018 17:45:07 -0700
Subject: [PATCH v13 16/24] selftests/vm: clear the bits in shadow reg when a
 pkey is freed.
In-Reply-To: <1528937115-10132-1-git-send-email-linuxram@us.ibm.com>
References: <1528937115-10132-1-git-send-email-linuxram@us.ibm.com>
Message-ID: <1528937115-10132-17-git-send-email-linuxram@us.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180614004507.eznmxNNqGW76M-QwVvWY6Rjqh2v9x3Krr7Wuv5RmBSU@z>

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
index 88dfa40..ba184ca 100644
--- a/tools/testing/selftests/vm/protection_keys.c
+++ b/tools/testing/selftests/vm/protection_keys.c
@@ -577,7 +577,8 @@ int sys_pkey_free(unsigned long pkey)
 	int ret = syscall(SYS_pkey_free, pkey);
 
 	if (!ret)
-		shadow_pkey_reg &= clear_pkey_flags(pkey, PKEY_DISABLE_ACCESS);
+		shadow_pkey_reg &= clear_pkey_flags(pkey,
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
