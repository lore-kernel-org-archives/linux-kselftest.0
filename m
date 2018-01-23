From: mathieu.desnoyers@efficios.com (Mathieu Desnoyers)
Date: Tue, 23 Jan 2018 10:57:27 -0500
Subject: [Linux-kselftest-mirror] [PATCH 05/11] membarrier: selftest: Test
	global expedited cmd (v2)
In-Reply-To: <20180123155733.3404-1-mathieu.desnoyers@efficios.com>
References: <20180123155733.3404-1-mathieu.desnoyers@efficios.com>
Message-ID: <20180123155733.3404-6-mathieu.desnoyers@efficios.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180123155727.0YAjSAewt4J0aJw1lIB1k791TIH5My9wgphr7jhOgwU@z>

Test the new MEMBARRIER_CMD_GLOBAL_EXPEDITED and
MEMBARRIER_CMD_REGISTER_GLOBAL_EXPEDITED commands.

Adapt to the MEMBARRIER_CMD_SHARED -> MEMBARRIER_CMD_GLOBAL rename.

Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers at efficios.com>
Acked-by: Shuah Khan <shuahkh at osg.samsung.com>
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
Changes since v1:
- Rename SHARED to GLOBAL.
---
 .../testing/selftests/membarrier/membarrier_test.c | 59 ++++++++++++++++++++--
 1 file changed, 54 insertions(+), 5 deletions(-)

diff --git a/tools/testing/selftests/membarrier/membarrier_test.c b/tools/testing/selftests/membarrier/membarrier_test.c
index e6ee73d01fa1..eec39a0e1f77 100644
--- a/tools/testing/selftests/membarrier/membarrier_test.c
+++ b/tools/testing/selftests/membarrier/membarrier_test.c
@@ -59,10 +59,10 @@ static int test_membarrier_flags_fail(void)
 	return 0;
 }
 
-static int test_membarrier_shared_success(void)
+static int test_membarrier_global_success(void)
 {
-	int cmd = MEMBARRIER_CMD_SHARED, flags = 0;
-	const char *test_name = "sys membarrier MEMBARRIER_CMD_SHARED";
+	int cmd = MEMBARRIER_CMD_GLOBAL, flags = 0;
+	const char *test_name = "sys membarrier MEMBARRIER_CMD_GLOBAL";
 
 	if (sys_membarrier(cmd, flags) != 0) {
 		ksft_exit_fail_msg(
@@ -132,6 +132,40 @@ static int test_membarrier_private_expedited_success(void)
 	return 0;
 }
 
+static int test_membarrier_register_global_expedited_success(void)
+{
+	int cmd = MEMBARRIER_CMD_REGISTER_GLOBAL_EXPEDITED, flags = 0;
+	const char *test_name = "sys membarrier MEMBARRIER_CMD_REGISTER_GLOBAL_EXPEDITED";
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
+static int test_membarrier_global_expedited_success(void)
+{
+	int cmd = MEMBARRIER_CMD_GLOBAL_EXPEDITED, flags = 0;
+	const char *test_name = "sys membarrier MEMBARRIER_CMD_GLOBAL_EXPEDITED";
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
@@ -142,7 +176,7 @@ static int test_membarrier(void)
 	status = test_membarrier_flags_fail();
 	if (status)
 		return status;
-	status = test_membarrier_shared_success();
+	status = test_membarrier_global_success();
 	if (status)
 		return status;
 	status = test_membarrier_private_expedited_fail();
@@ -154,6 +188,19 @@ static int test_membarrier(void)
 	status = test_membarrier_private_expedited_success();
 	if (status)
 		return status;
+	/*
+	 * It is valid to send a global membarrier from a non-registered
+	 * process.
+	 */
+	status = test_membarrier_global_expedited_success();
+	if (status)
+		return status;
+	status = test_membarrier_register_global_expedited_success();
+	if (status)
+		return status;
+	status = test_membarrier_global_expedited_success();
+	if (status)
+		return status;
 	return 0;
 }
 
@@ -173,8 +220,10 @@ static int test_membarrier_query(void)
 		}
 		ksft_exit_fail_msg("sys_membarrier() failed\n");
 	}
-	if (!(ret & MEMBARRIER_CMD_SHARED))
+	if (!(ret & MEMBARRIER_CMD_GLOBAL)) {
+		ksft_test_result_fail("sys_membarrier() CMD_GLOBAL query failed\n");
 		ksft_exit_fail_msg("sys_membarrier is not supported.\n");
+	}
 
 	ksft_test_result_pass("sys_membarrier available\n");
 	return 0;
-- 
2.11.0

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
