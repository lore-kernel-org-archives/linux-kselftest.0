From: linuxram@us.ibm.com (Ram Pai)
Date: Mon, 22 Jan 2018 10:52:02 -0800
Subject: [Linux-kselftest-mirror] [PATCH v10 09/24] selftests/vm: fix
	alloc_random_pkey() to make it really random
In-Reply-To: <1516647137-11174-1-git-send-email-linuxram@us.ibm.com>
References: <1516647137-11174-1-git-send-email-linuxram@us.ibm.com>
Message-ID: <1516647137-11174-10-git-send-email-linuxram@us.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180122185202.9n2rakW5sYC9kFbmz-68lTNjJaCwFWLpm_cLZismEaI@z>

alloc_random_pkey() was allocating the same pkey every time.
Not all pkeys were geting tested. fixed it.

Signed-off-by: Ram Pai <linuxram at us.ibm.com>
---
 tools/testing/selftests/vm/protection_keys.c |   10 +++++++---
 1 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/tools/testing/selftests/vm/protection_keys.c b/tools/testing/selftests/vm/protection_keys.c
index aaf9f09..2e4b636 100644
--- a/tools/testing/selftests/vm/protection_keys.c
+++ b/tools/testing/selftests/vm/protection_keys.c
@@ -24,6 +24,7 @@
 #define _GNU_SOURCE
 #include <errno.h>
 #include <linux/futex.h>
+#include <time.h>
 #include <sys/time.h>
 #include <sys/syscall.h>
 #include <string.h>
@@ -602,13 +603,15 @@ int alloc_random_pkey(void)
 	int alloced_pkeys[NR_PKEYS];
 	int nr_alloced = 0;
 	int random_index;
+
 	memset(alloced_pkeys, 0, sizeof(alloced_pkeys));
+	srand((unsigned int)time(NULL));
 
 	/* allocate every possible key and make a note of which ones we got */
 	max_nr_pkey_allocs = NR_PKEYS;
-	max_nr_pkey_allocs = 1;
 	for (i = 0; i < max_nr_pkey_allocs; i++) {
 		int new_pkey = alloc_pkey();
+
 		if (new_pkey < 0)
 			break;
 		alloced_pkeys[nr_alloced++] = new_pkey;
@@ -624,13 +627,14 @@ int alloc_random_pkey(void)
 	/* go through the allocated ones that we did not want and free them */
 	for (i = 0; i < nr_alloced; i++) {
 		int free_ret;
+
 		if (!alloced_pkeys[i])
 			continue;
 		free_ret = sys_pkey_free(alloced_pkeys[i]);
 		pkey_assert(!free_ret);
 	}
-	dprintf1("%s()::%d, ret: %d pkey_reg: 0x%x shadow: 0x%x\n", __func__,
-			__LINE__, ret, __rdpkey_reg(), shadow_pkey_reg);
+	dprintf1("%s()::%d, ret: %d pkey_reg: 0x%x shadow: 0x%016lx\n",
+		__func__, __LINE__, ret, __rdpkey_reg(), shadow_pkey_reg);
 	return ret;
 }
 
-- 
1.7.1

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
