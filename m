From: mathieu.desnoyers at efficios.com (Mathieu Desnoyers)
Date: Mon, 29 Jan 2018 15:20:20 -0500
Subject: [Linux-kselftest-mirror] [PATCH for 4.16 11/11] membarrier:
	selftest: Test private expedited sync core cmd
In-Reply-To: <20180129202020.8515-1-mathieu.desnoyers@efficios.com>
References: <20180129202020.8515-1-mathieu.desnoyers@efficios.com>
Message-ID: <20180129202020.8515-12-mathieu.desnoyers@efficios.com>

Test the new MEMBARRIER_CMD_PRIVATE_EXPEDITED_SYNC_CORE and
MEMBARRIER_CMD_REGISTER_PRIVATE_EXPEDITED_SYNC_CORE commands.

Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers at efficios.com>
Acked-by: Shuah Khan <shuahkh at osg.samsung.com>
Acked-by: Peter Zijlstra (Intel) <peterz at infradead.org>
CC: Greg Kroah-Hartman <gregkh at linuxfoundation.org>
CC: Paul E. McKenney <paulmck at linux.vnet.ibm.com>
CC: Boqun Feng <boqun.feng at gmail.com>
CC: Andrew Hunter <ahh at google.com>
CC: Maged Michael <maged.michael at gmail.com>
CC: Avi Kivity <avi at scylladb.com>
CC: Benjamin Herrenschmidt <benh at kernel.crashing.org>
CC: Paul Mackerras <paulus at samba.org>
CC: Michael Ellerman <mpe at ellerman.id.au>
CC: Dave Watson <davejwatson at fb.com>
CC: Alan Stern <stern at rowland.harvard.edu>
CC: Will Deacon <will.deacon at arm.com>
CC: Andy Lutomirski <luto at kernel.org>
CC: Alice Ferrazzi <alice.ferrazzi at gmail.com>
CC: Paul Elder <paul.elder at pitt.edu>
CC: linux-kselftest at vger.kernel.org
CC: linux-arch at vger.kernel.org
---
 .../testing/selftests/membarrier/membarrier_test.c | 73 ++++++++++++++++++++++
 1 file changed, 73 insertions(+)

diff --git a/tools/testing/selftests/membarrier/membarrier_test.c b/tools/testing/selftests/membarrier/membarrier_test.c
index eec39a0e1f77..22bffd55a523 100644
--- a/tools/testing/selftests/membarrier/membarrier_test.c
+++ b/tools/testing/selftests/membarrier/membarrier_test.c
@@ -132,6 +132,63 @@ static int test_membarrier_private_expedited_success(void)
 	return 0;
 }
 
+static int test_membarrier_private_expedited_sync_core_fail(void)
+{
+	int cmd = MEMBARRIER_CMD_PRIVATE_EXPEDITED_SYNC_CORE, flags = 0;
+	const char *test_name = "sys membarrier MEMBARRIER_CMD_PRIVATE_EXPEDITED_SYNC_CORE not registered failure";
+
+	if (sys_membarrier(cmd, flags) != -1) {
+		ksft_exit_fail_msg(
+			"%s test: flags = %d. Should fail, but passed\n",
+			test_name, flags);
+	}
+	if (errno != EPERM) {
+		ksft_exit_fail_msg(
+			"%s test: flags = %d. Should return (%d: \"%s\"), but returned (%d: \"%s\").\n",
+			test_name, flags, EPERM, strerror(EPERM),
+			errno, strerror(errno));
+	}
+
+	ksft_test_result_pass(
+		"%s test: flags = %d, errno = %d\n",
+		test_name, flags, errno);
+	return 0;
+}
+
+static int test_membarrier_register_private_expedited_sync_core_success(void)
+{
+	int cmd = MEMBARRIER_CMD_REGISTER_PRIVATE_EXPEDITED_SYNC_CORE, flags = 0;
+	const char *test_name = "sys membarrier MEMBARRIER_CMD_REGISTER_PRIVATE_EXPEDITED_SYNC_CORE";
+
+	if (sys_membarrier(cmd, flags) != 0) {
+		ksft_exit_fail_msg(
+			"%s test: flags = %d, errno = %d\n",
+			test_name, flags, errno);
+	}
+
+	ksft_test_result_pass(
+		"%s test: flags = %d\n",
+		test_name, flags);
+	return 0;
+}
+
+static int test_membarrier_private_expedited_sync_core_success(void)
+{
+	int cmd = MEMBARRIER_CMD_PRIVATE_EXPEDITED, flags = 0;
+	const char *test_name = "sys membarrier MEMBARRIER_CMD_PRIVATE_EXPEDITED_SYNC_CORE";
+
+	if (sys_membarrier(cmd, flags) != 0) {
+		ksft_exit_fail_msg(
+			"%s test: flags = %d, errno = %d\n",
+			test_name, flags, errno);
+	}
+
+	ksft_test_result_pass(
+		"%s test: flags = %d\n",
+		test_name, flags);
+	return 0;
+}
+
 static int test_membarrier_register_global_expedited_success(void)
 {
 	int cmd = MEMBARRIER_CMD_REGISTER_GLOBAL_EXPEDITED, flags = 0;
@@ -188,6 +245,22 @@ static int test_membarrier(void)
 	status = test_membarrier_private_expedited_success();
 	if (status)
 		return status;
+	status = sys_membarrier(MEMBARRIER_CMD_QUERY, 0);
+	if (status < 0) {
+		ksft_test_result_fail("sys_membarrier() failed\n");
+		return status;
+	}
+	if (status & MEMBARRIER_CMD_PRIVATE_EXPEDITED_SYNC_CORE) {
+		status = test_membarrier_private_expedited_sync_core_fail();
+		if (status)
+			return status;
+		status = test_membarrier_register_private_expedited_sync_core_success();
+		if (status)
+			return status;
+		status = test_membarrier_private_expedited_sync_core_success();
+		if (status)
+			return status;
+	}
 	/*
 	 * It is valid to send a global membarrier from a non-registered
 	 * process.
-- 
2.11.0

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
