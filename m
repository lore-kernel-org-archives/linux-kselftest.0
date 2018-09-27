From: shuah at kernel.org (Shuah Khan (Samsung OSG))
Date: Thu, 27 Sep 2018 09:54:12 -0600
Subject: [PATCH linux-kselftest-next] selftests: watchdog: Fix ioctl SET*
 error paths to take oneshot exit path
Message-ID: <20180927155412.11433-1-shuah@kernel.org>

When ioctls for WDIOC_SETOPTIONS (WDIOS_DISABLECARD or WDIOS_ENABLECARD),
WDIOC_SETTIMEOUT, and WDIOC_SETPRETIMEOUT fail, the error path continues
to handler watchdog timer until user terminates it. When ioctl returns
error, it might not be safe to let the watchdog tick. The error could be
due an unsupported ioctl command or some other error.

Fix it to handle error paths as oneshot to stop the watchdog ticks and
exit right away.

Signed-off-by: Shuah Khan (Samsung OSG) <shuah at kernel.org>
---
 tools/testing/selftests/watchdog/watchdog-test.c | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/tools/testing/selftests/watchdog/watchdog-test.c b/tools/testing/selftests/watchdog/watchdog-test.c
index e0f1600dc1b3..c6bd9a68306b 100644
--- a/tools/testing/selftests/watchdog/watchdog-test.c
+++ b/tools/testing/selftests/watchdog/watchdog-test.c
@@ -123,16 +123,20 @@ int main(int argc, char *argv[])
 			ret = ioctl(fd, WDIOC_SETOPTIONS, &flags);
 			if (!ret)
 				printf("Watchdog card disabled.\n");
-			else
+			else {
 				printf("WDIOS_DISABLECARD error '%s'\n", strerror(errno));
+				oneshot = 1;
+			}
 			break;
 		case 'e':
 			flags = WDIOS_ENABLECARD;
 			ret = ioctl(fd, WDIOC_SETOPTIONS, &flags);
 			if (!ret)
 				printf("Watchdog card enabled.\n");
-			else
+			else {
 				printf("WDIOS_ENABLECARD error '%s'\n", strerror(errno));
+				oneshot = 1;
+			}
 			break;
 		case 'p':
 			ping_rate = strtoul(optarg, NULL, 0);
@@ -145,8 +149,10 @@ int main(int argc, char *argv[])
 			ret = ioctl(fd, WDIOC_SETTIMEOUT, &flags);
 			if (!ret)
 				printf("Watchdog timeout set to %u seconds.\n", flags);
-			else
+			else {
 				printf("WDIOC_SETTIMEOUT error '%s'\n", strerror(errno));
+				oneshot = 1;
+			}
 			break;
 		case 'T':
 			oneshot = 1;
@@ -161,8 +167,10 @@ int main(int argc, char *argv[])
 			ret = ioctl(fd, WDIOC_SETPRETIMEOUT, &flags);
 			if (!ret)
 				printf("Watchdog pretimeout set to %u seconds.\n", flags);
-			else
+			else {
 				printf("WDIOC_SETPRETIMEOUT error '%s'\n", strerror(errno));
+				oneshot = 1;
+			}
 			break;
 		case 'N':
 			oneshot = 1;
-- 
2.17.0
