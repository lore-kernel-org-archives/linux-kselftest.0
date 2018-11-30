From: jerry.hoemann at hpe.com (Jerry Hoemann)
Date: Fri, 30 Nov 2018 10:35:41 -0700
Subject: [PATCH 1/1] selftests: watchdog: Add gettimeleft command line arg
Message-ID: <1543599341-29615-1-git-send-email-jerry.hoemann@hpe.com>

Add command line argument to call and display the results
of ioctl WDIOC_GETTIMELEFT.

Signed-off-by: Jerry Hoemann <jerry.hoemann at hpe.com>
---
 tools/testing/selftests/watchdog/watchdog-test.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/watchdog/watchdog-test.c b/tools/testing/selftests/watchdog/watchdog-test.c
index c6bd9a6..dac907a 100644
--- a/tools/testing/selftests/watchdog/watchdog-test.c
+++ b/tools/testing/selftests/watchdog/watchdog-test.c
@@ -19,7 +19,7 @@
 
 int fd;
 const char v = 'V';
-static const char sopts[] = "bdehp:t:Tn:N";
+static const char sopts[] = "bdehp:t:Tn:NL";
 static const struct option lopts[] = {
 	{"bootstatus",          no_argument, NULL, 'b'},
 	{"disable",             no_argument, NULL, 'd'},
@@ -30,6 +30,7 @@
 	{"gettimeout",          no_argument, NULL, 'T'},
 	{"pretimeout",    required_argument, NULL, 'n'},
 	{"getpretimeout",       no_argument, NULL, 'N'},
+	{"gettimeleft",		no_argument, NULL, 'L'},
 	{NULL,                  no_argument, NULL, 0x0}
 };
 
@@ -77,6 +78,7 @@ static void usage(char *progname)
 	printf(" -T, --gettimeout    Get the timeout\n");
 	printf(" -n, --pretimeout=T  Set the pretimeout to T seconds\n");
 	printf(" -N, --getpretimeout Get the pretimeout\n");
+	printf(" -L, --gettimeleft   Get the time left until timer experies\n");
 	printf("\n");
 	printf("Parameters are parsed left-to-right in real-time.\n");
 	printf("Example: %s -d -t 10 -p 5 -e\n", progname);
@@ -180,6 +182,15 @@ int main(int argc, char *argv[])
 			else
 				printf("WDIOC_GETPRETIMEOUT error '%s'\n", strerror(errno));
 			break;
+		case 'L':
+			oneshot = 1;
+			ret = ioctl(fd, WDIOC_GETTIMELEFT, &flags);
+			if (!ret)
+				printf("WDIOC_GETTIMELEFT returns %u seconds.\n", flags);
+			else
+				printf("WDIOC_GETTIMELEFT error '%s'\n", strerror(errno));
+			break;
+
 		default:
 			usage(argv[0]);
 			goto end;
-- 
1.8.3.1
