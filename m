From: linuxram at us.ibm.com (Ram Pai)
Date: Wed, 21 Feb 2018 17:55:38 -0800
Subject: [PATCH v12 19/22] selftests/vm: detect write violation on a mapped
 access-denied-key page
In-Reply-To: <1519264541-7621-1-git-send-email-linuxram@us.ibm.com>
References: <1519264541-7621-1-git-send-email-linuxram@us.ibm.com>
Message-ID: <1519264541-7621-20-git-send-email-linuxram@us.ibm.com>

detect write-violation on a page to which access-disabled
key is associated much after the page is mapped.

cc: Dave Hansen <dave.hansen at intel.com>
cc: Florian Weimer <fweimer at redhat.com>
Signed-off-by: Ram Pai <linuxram at us.ibm.com>
---
 tools/testing/selftests/vm/protection_keys.c |   13 +++++++++++++
 1 files changed, 13 insertions(+), 0 deletions(-)

diff --git a/tools/testing/selftests/vm/protection_keys.c b/tools/testing/selftests/vm/protection_keys.c
index b685e26..437ee74 100644
--- a/tools/testing/selftests/vm/protection_keys.c
+++ b/tools/testing/selftests/vm/protection_keys.c
@@ -1059,6 +1059,18 @@ void test_write_of_access_disabled_region(int *ptr, u16 pkey)
 	*ptr = __LINE__;
 	expected_pkey_fault(pkey);
 }
+
+void test_write_of_access_disabled_region_with_page_already_mapped(int *ptr,
+			u16 pkey)
+{
+	*ptr = __LINE__;
+	dprintf1("disabling access; after accessing the page, "
+		" to PKEY[%02d], doing write\n", pkey);
+	pkey_access_deny(pkey);
+	*ptr = __LINE__;
+	expected_pkey_fault(pkey);
+}
+
 void test_kernel_write_of_access_disabled_region(int *ptr, u16 pkey)
 {
 	int ret;
@@ -1343,6 +1355,7 @@ void test_mprotect_pkey_on_unsupported_cpu(int *ptr, u16 pkey)
 	test_write_of_write_disabled_region,
 	test_write_of_write_disabled_region_with_page_already_mapped,
 	test_write_of_access_disabled_region,
+	test_write_of_access_disabled_region_with_page_already_mapped,
 	test_kernel_write_of_access_disabled_region,
 	test_kernel_write_of_write_disabled_region,
 	test_kernel_gup_of_access_disabled_region,
-- 
1.7.1

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
