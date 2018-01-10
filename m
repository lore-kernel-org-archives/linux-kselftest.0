From: mathieu.desnoyers@efficios.com (Mathieu Desnoyers)
Date: Wed, 10 Jan 2018 10:46:16 -0500
Subject: [Linux-kselftest-mirror] [PATCH v2 for 4.16 02/11] membarrier:
	selftest: Test private expedited cmd
In-Reply-To: <20180110154625.4319-1-mathieu.desnoyers@efficios.com>
References: <20180110154625.4319-1-mathieu.desnoyers@efficios.com>
Message-ID: <20180110154625.4319-3-mathieu.desnoyers@efficios.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180110154616.HoWqDWLcABNjq4vHXzBf4qdauAAVJKAsM73HWrCiAgE@z>

Test the new MEMBARRIER_CMD_PRIVATE_EXPEDITED and
MEMBARRIER_CMD_REGISTER_PRIVATE_EXPEDITED commands.

Add checks expecting specific error values on system calls expected to
fail.

Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers at efficios.com>
Acked-by: Shuah Khan <shuahkh at osg.samsung.com>
Acked-by: Greg Kroah-Hartman <gregkh at linuxfoundation.org>
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
- return result of ksft_exit_pass from main(), silencing compiler
  warning about missing return value.
---
 .../testing/selftests/membarrier/membarrier_test.c | 111 ++++++++++++++++++---
 1 file changed, 95 insertions(+), 16 deletions(-)

diff --git a/tools/testing/selftests/membarrier/membarrier_test.c b/tools/testing/selftests/membarrier/membarrier_test.c
index 9e674d9514d1..e6ee73d01fa1 100644
--- a/tools/testing/selftests/membarrier/membarrier_test.c
+++ b/tools/testing/selftests/membarrier/membarrier_test.c
@@ -16,49 +16,119 @@ static int sys_membarrier(int cmd, int flags)
 static int test_membarrier_cmd_fail(void)
 {
 	int cmd = -1, flags = 0;
+	const char *test_name = "sys membarrier invalid command";
 
 	if (sys_membarrier(cmd, flags) != -1) {
 		ksft_exit_fail_msg(
-			"sys membarrier invalid command test: command = %d, flags = %d. Should fail, but passed\n",
-			cmd, flags);
+			"%s test: command = %d, flags = %d. Should fail, but passed\n",
+			test_name, cmd, flags);
+	}
+	if (errno != EINVAL) {
+		ksft_exit_fail_msg(
+			"%s test: flags = %d. Should return (%d: \"%s\"), but returned (%d: \"%s\").\n",
+			test_name, flags, EINVAL, strerror(EINVAL),
+			errno, strerror(errno));
 	}
 
 	ksft_test_result_pass(
-		"sys membarrier invalid command test: command = %d, flags = %d. Failed as expected\n",
-		cmd, flags);
+		"%s test: command = %d, flags = %d, errno = %d. Failed as expected\n",
+		test_name, cmd, flags, errno);
 	return 0;
 }
 
 static int test_membarrier_flags_fail(void)
 {
 	int cmd = MEMBARRIER_CMD_QUERY, flags = 1;
+	const char *test_name = "sys membarrier MEMBARRIER_CMD_QUERY invalid flags";
 
 	if (sys_membarrier(cmd, flags) != -1) {
 		ksft_exit_fail_msg(
-			"sys membarrier MEMBARRIER_CMD_QUERY invalid flags test: flags = %d. Should fail, but passed\n",
-			flags);
+			"%s test: flags = %d. Should fail, but passed\n",
+			test_name, flags);
+	}
+	if (errno != EINVAL) {
+		ksft_exit_fail_msg(
+			"%s test: flags = %d. Should return (%d: \"%s\"), but returned (%d: \"%s\").\n",
+			test_name, flags, EINVAL, strerror(EINVAL),
+			errno, strerror(errno));
 	}
 
 	ksft_test_result_pass(
-		"sys membarrier MEMBARRIER_CMD_QUERY invalid flags test: flags = %d. Failed as expected\n",
-		flags);
+		"%s test: flags = %d, errno = %d. Failed as expected\n",
+		test_name, flags, errno);
 	return 0;
 }
 
-static int test_membarrier_success(void)
+static int test_membarrier_shared_success(void)
 {
 	int cmd = MEMBARRIER_CMD_SHARED, flags = 0;
-	const char *test_name = "sys membarrier MEMBARRIER_CMD_SHARED\n";
+	const char *test_name = "sys membarrier MEMBARRIER_CMD_SHARED";
+
+	if (sys_membarrier(cmd, flags) != 0) {
+		ksft_exit_fail_msg(
+			"%s test: flags = %d, errno = %d\n",
+			test_name, flags, errno);
+	}
+
+	ksft_test_result_pass(
+		"%s test: flags = %d\n", test_name, flags);
+	return 0;
+}
+
+static int test_membarrier_private_expedited_fail(void)
+{
+	int cmd = MEMBARRIER_CMD_PRIVATE_EXPEDITED, flags = 0;
+	const char *test_name = "sys membarrier MEMBARRIER_CMD_PRIVATE_EXPEDITED not registered failure";
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
+static int test_membarrier_register_private_expedited_success(void)
+{
+	int cmd = MEMBARRIER_CMD_REGISTER_PRIVATE_EXPEDITED, flags = 0;
+	const char *test_name = "sys membarrier MEMBARRIER_CMD_REGISTER_PRIVATE_EXPEDITED";
 
 	if (sys_membarrier(cmd, flags) != 0) {
 		ksft_exit_fail_msg(
-			"sys membarrier MEMBARRIER_CMD_SHARED test: flags = %d\n",
-			flags);
+			"%s test: flags = %d, errno = %d\n",
+			test_name, flags, errno);
 	}
 
 	ksft_test_result_pass(
-		"sys membarrier MEMBARRIER_CMD_SHARED test: flags = %d\n",
-		flags);
+		"%s test: flags = %d\n",
+		test_name, flags);
+	return 0;
+}
+
+static int test_membarrier_private_expedited_success(void)
+{
+	int cmd = MEMBARRIER_CMD_PRIVATE_EXPEDITED, flags = 0;
+	const char *test_name = "sys membarrier MEMBARRIER_CMD_PRIVATE_EXPEDITED";
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
 	return 0;
 }
 
@@ -72,7 +142,16 @@ static int test_membarrier(void)
 	status = test_membarrier_flags_fail();
 	if (status)
 		return status;
-	status = test_membarrier_success();
+	status = test_membarrier_shared_success();
+	if (status)
+		return status;
+	status = test_membarrier_private_expedited_fail();
+	if (status)
+		return status;
+	status = test_membarrier_register_private_expedited_success();
+	if (status)
+		return status;
+	status = test_membarrier_private_expedited_success();
 	if (status)
 		return status;
 	return 0;
@@ -108,5 +187,5 @@ int main(int argc, char **argv)
 	test_membarrier_query();
 	test_membarrier();
 
-	ksft_exit_pass();
+	return ksft_exit_pass();
 }
-- 
2.11.0

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
