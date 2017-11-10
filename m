From: mathieu.desnoyers@efficios.com (Mathieu Desnoyers)
Date: Fri, 10 Nov 2017 16:37:17 -0500
Subject: [Linux-kselftest-mirror] [RFC PATCH for 4.15 10/10] membarrier:
	selftest: Test shared expedited cmd
In-Reply-To: <20171110213717.12457-1-mathieu.desnoyers@efficios.com>
References: <20171110213717.12457-1-mathieu.desnoyers@efficios.com>
Message-ID: <20171110213717.12457-11-mathieu.desnoyers@efficios.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20171110213717.jWS8-IqHj2T8LwPzcmUlonCUg4vxQVvkRvOLJI09B_A@z>

Test the new MEMBARRIER_CMD_SHARED_EXPEDITED and
MEMBARRIER_CMD_REGISTER_SHARED_EXPEDITED commands.

Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers at efficios.com>
CC: Shuah Khan <shuahkh at osg.samsung.com>
CC: Greg Kroah-Hartman <gregkh at linuxfoundation.org>
CC: Peter Zijlstra <peterz at infradead.org>
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
 .../testing/selftests/membarrier/membarrier_test.c | 47 ++++++++++++++++++++++
 1 file changed, 47 insertions(+)

diff --git a/tools/testing/selftests/membarrier/membarrier_test.c b/tools/testing/selftests/membarrier/membarrier_test.c
index a0eae8d51e72..c699227f4d9a 100644
--- a/tools/testing/selftests/membarrier/membarrier_test.c
+++ b/tools/testing/selftests/membarrier/membarrier_test.c
@@ -189,6 +189,40 @@ static int test_membarrier_private_expedited_sync_core_success(void)
 	return 0;
 }
 
+static int test_membarrier_register_shared_expedited_success(void)
+{
+	int cmd = MEMBARRIER_CMD_REGISTER_SHARED_EXPEDITED, flags = 0;
+	const char *test_name = "sys membarrier MEMBARRIER_CMD_REGISTER_SHARED_EXPEDITED";
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
+static int test_membarrier_shared_expedited_success(void)
+{
+	int cmd = MEMBARRIER_CMD_SHARED_EXPEDITED, flags = 0;
+	const char *test_name = "sys membarrier MEMBARRIER_CMD_SHARED_EXPEDITED";
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
 static int test_membarrier(void)
 {
 	int status;
@@ -227,6 +261,19 @@ static int test_membarrier(void)
 		if (status)
 			return status;
 	}
+	/*
+	 * It is valid to send a shared membarrier from a non-registered
+	 * process.
+	 */
+	status = test_membarrier_shared_expedited_success();
+	if (status)
+		return status;
+	status = test_membarrier_register_shared_expedited_success();
+	if (status)
+		return status;
+	status = test_membarrier_shared_expedited_success();
+	if (status)
+		return status;
 	return 0;
 }
 
-- 
2.11.0

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
