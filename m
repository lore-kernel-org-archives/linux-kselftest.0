From: linuxram@us.ibm.com (Ram Pai)
Date: Mon, 22 Jan 2018 10:51:59 -0800
Subject: [Linux-kselftest-mirror] [PATCH v10 06/24] selftests/vm: fix the
	wrong assert in pkey_disable_set()
In-Reply-To: <1516647137-11174-1-git-send-email-linuxram@us.ibm.com>
References: <1516647137-11174-1-git-send-email-linuxram@us.ibm.com>
Message-ID: <1516647137-11174-7-git-send-email-linuxram@us.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180122185159.9iVpnH1xmXx5piTQmG3XYY2xSCYL3yfCuZsXWkDE76Y@z>

If the flag is 0, no bits will be set. Hence we cant expect
the resulting bitmap to have a higher value than what it
was earlier.

Signed-off-by: Ram Pai <linuxram at us.ibm.com>
---
 tools/testing/selftests/vm/protection_keys.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/tools/testing/selftests/vm/protection_keys.c b/tools/testing/selftests/vm/protection_keys.c
index 83216c5..0109388 100644
--- a/tools/testing/selftests/vm/protection_keys.c
+++ b/tools/testing/selftests/vm/protection_keys.c
@@ -443,7 +443,7 @@ void pkey_disable_set(int pkey, int flags)
 	dprintf1("%s(%d) pkey_reg: 0x%lx\n",
 		__func__, pkey, rdpkey_reg());
 	if (flags)
-		pkey_assert(rdpkey_reg() > orig_pkey_reg);
+		pkey_assert(rdpkey_reg() >= orig_pkey_reg);
 	dprintf1("END<---%s(%d, 0x%x)\n", __func__,
 		pkey, flags);
 }
-- 
1.7.1

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
