From: shuah@kernel.org (Shuah Khan (Samsung OSG))
Date: Fri,  4 May 2018 19:13:06 -0600
Subject: [PATCH 02/24] selftests: breakpoints: return Kselftest Skip code for
 skipped tests
In-Reply-To: <20180505011328.32078-1-shuah@kernel.org>
References: <20180505011328.32078-1-shuah@kernel.org>
Message-ID: <20180505011328.32078-2-shuah@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180505011306.cnX8Uf3wLAMqCc6OveXQ3IHjAfoZ2TlEnFPCxkHODkU@z>

When step_after_suspend_test is skipped because of unmet dependencies
and/or unsupported configuration, it exits with error which is treated
as a fail by the Kselftest framework. This leads to false negative result
even when the test could not be run.

Change it to return kselftest skip code when a test gets skipped to clearly
report that the test could not be run.

Change it to use ksft_exit_skip() when a non-root user runs the test and
add an explicit check for root and a clear message, instead of failing
the test when /sys/power/state file open fails.

Signed-off-by: Shuah Khan (Samsung OSG) <shuah at kernel.org>
---
 tools/testing/selftests/breakpoints/step_after_suspend_test.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/breakpoints/step_after_suspend_test.c b/tools/testing/selftests/breakpoints/step_after_suspend_test.c
index 3fece06e9f64..f82dcc1f8841 100644
--- a/tools/testing/selftests/breakpoints/step_after_suspend_test.c
+++ b/tools/testing/selftests/breakpoints/step_after_suspend_test.c
@@ -143,10 +143,14 @@ void suspend(void)
 	int err;
 	struct itimerspec spec = {};
 
+	if (getuid() != 0)
+		ksft_exit_skip("Please run the test as root - Exiting.\n");
+
 	power_state_fd = open("/sys/power/state", O_RDWR);
 	if (power_state_fd < 0)
 		ksft_exit_fail_msg(
-			"open(\"/sys/power/state\") failed (is this test running as root?)\n");
+			"open(\"/sys/power/state\") failed %s)\n",
+			strerror(errno));
 
 	timerfd = timerfd_create(CLOCK_BOOTTIME_ALARM, 0);
 	if (timerfd < 0)
-- 
2.14.1

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
