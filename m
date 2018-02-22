From: linuxram@us.ibm.com (Ram Pai)
Date: Wed, 21 Feb 2018 17:55:39 -0800
Subject: [PATCH v12 20/22] selftests/vm: testcases must restore
 pkey-permissions
In-Reply-To: <1519264541-7621-1-git-send-email-linuxram@us.ibm.com>
References: <1519264541-7621-1-git-send-email-linuxram@us.ibm.com>
Message-ID: <1519264541-7621-21-git-send-email-linuxram@us.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180222015539.vWPrwqvpUoBeY3SALr3XIrflBuH7wY_ftoXBktFVjjI@z>

Generally the signal handler restores the state of the pkey register
before returning. However there are times when the read/write operation
can legitamely fail without invoking the signal handler.  Eg: A
sys_read() operaton to a write-protected page should be disallowed.  In
such a case the state of the pkey register is not restored to its
original state.  The test case is responsible for restoring the key
register state to its original value.

cc: Dave Hansen <dave.hansen at intel.com>
cc: Florian Weimer <fweimer at redhat.com>
Signed-off-by: Ram Pai <linuxram at us.ibm.com>
---
 tools/testing/selftests/vm/protection_keys.c |    5 +++++
 1 files changed, 5 insertions(+), 0 deletions(-)

diff --git a/tools/testing/selftests/vm/protection_keys.c b/tools/testing/selftests/vm/protection_keys.c
index 437ee74..42c068a 100644
--- a/tools/testing/selftests/vm/protection_keys.c
+++ b/tools/testing/selftests/vm/protection_keys.c
@@ -1003,6 +1003,7 @@ void test_read_of_write_disabled_region(int *ptr, u16 pkey)
 	ptr_contents = read_ptr(ptr);
 	dprintf1("*ptr: %d\n", ptr_contents);
 	dprintf1("\n");
+	pkey_write_allow(pkey);
 }
 void test_read_of_access_disabled_region(int *ptr, u16 pkey)
 {
@@ -1082,6 +1083,7 @@ void test_kernel_write_of_access_disabled_region(int *ptr, u16 pkey)
 	ret = read(test_fd, ptr, 1);
 	dprintf1("read ret: %d\n", ret);
 	pkey_assert(ret);
+	pkey_access_allow(pkey);
 }
 void test_kernel_write_of_write_disabled_region(int *ptr, u16 pkey)
 {
@@ -1094,6 +1096,7 @@ void test_kernel_write_of_write_disabled_region(int *ptr, u16 pkey)
 	if (ret < 0 && (DEBUG_LEVEL > 0))
 		perror("verbose read result (OK for this to be bad)");
 	pkey_assert(ret);
+	pkey_write_allow(pkey);
 }
 
 void test_kernel_gup_of_access_disabled_region(int *ptr, u16 pkey)
@@ -1113,6 +1116,7 @@ void test_kernel_gup_of_access_disabled_region(int *ptr, u16 pkey)
 	vmsplice_ret = vmsplice(pipe_fds[1], &iov, 1, SPLICE_F_GIFT);
 	dprintf1("vmsplice() ret: %d\n", vmsplice_ret);
 	pkey_assert(vmsplice_ret == -1);
+	pkey_access_allow(pkey);
 
 	close(pipe_fds[0]);
 	close(pipe_fds[1]);
@@ -1133,6 +1137,7 @@ void test_kernel_gup_write_to_write_disabled_region(int *ptr, u16 pkey)
 	if (DEBUG_LEVEL > 0)
 		perror("futex");
 	dprintf1("futex() ret: %d\n", futex_ret);
+	pkey_write_allow(pkey);
 }
 
 /* Assumes that all pkeys other than 'pkey' are unallocated */
-- 
1.7.1

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
