From: linuxram at us.ibm.com (Ram Pai)
Date: Tue, 17 Jul 2018 06:49:23 -0700
Subject: [PATCH v14 20/22] selftests/vm: testcases must restore
 pkey-permissions
In-Reply-To: <1531835365-32387-1-git-send-email-linuxram@us.ibm.com>
References: <1531835365-32387-1-git-send-email-linuxram@us.ibm.com>
Message-ID: <1531835365-32387-21-git-send-email-linuxram@us.ibm.com>

Generally the signal handler restores the state of the pkey register
before returning. However there are times when the read/write operation
can legitamely fail without invoking the signal handler.  Eg: A
sys_read() operaton to a write-protected page should be disallowed.  In
such a case the state of the pkey register is not restored to its
original state.  Test cases may not remember to restoring the key
register state. During cleanup generically restore the key permissions.

cc: Dave Hansen <dave.hansen at intel.com>
cc: Florian Weimer <fweimer at redhat.com>
Signed-off-by: Ram Pai <linuxram at us.ibm.com>
---
 tools/testing/selftests/vm/protection_keys.c |    5 +++++
 1 files changed, 5 insertions(+), 0 deletions(-)

diff --git a/tools/testing/selftests/vm/protection_keys.c b/tools/testing/selftests/vm/protection_keys.c
index 8a6afdd..ea3cf04 100644
--- a/tools/testing/selftests/vm/protection_keys.c
+++ b/tools/testing/selftests/vm/protection_keys.c
@@ -1476,8 +1476,13 @@ void run_tests_once(void)
 		pkey_tests[test_nr](ptr, pkey);
 		dprintf1("freeing test memory: %p\n", ptr);
 		free_pkey_malloc(ptr);
+
+		/* restore the permission on the key after use */
+		pkey_access_allow(pkey);
+		pkey_write_allow(pkey);
 		sys_pkey_free(pkey);
 
+
 		dprintf1("pkey_faults: %d\n", pkey_faults);
 		dprintf1("orig_pkey_faults: %d\n", orig_pkey_faults);
 
-- 
1.7.1

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
