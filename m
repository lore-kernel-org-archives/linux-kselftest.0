From: jerry.hoemann@hpe.com (Jerry Hoemann)
Date: Mon, 24 Sep 2018 13:36:07 -0600
Subject: [V2 PATCH] selftests: watchdog: Add gettimeout and get|set pretimeout
In-Reply-To: <1537817767-78918-1-git-send-email-jerry.hoemann@hpe.com>
References: <1537817767-78918-1-git-send-email-jerry.hoemann@hpe.com>
Message-ID: <1537817767-78918-2-git-send-email-jerry.hoemann@hpe.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180924193607.T-SIUksJbbjl7vb0N3U2fC9vpZKeSswTRVrzciIqsFY@z>

Add command line arguments to call ioctl WDIOC_GETTIMEOUT,
WDIOC_GETPRETIMEOUT and WDIOC_SETPRETIMEOUT.

Signed-off-by: Jerry Hoemann <jerry.hoemann at hpe.com>
---
 tools/testing/selftests/watchdog/watchdog-test.c | 33 +++++++++++++++++++++++-
 1 file changed, 32 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/watchdog/watchdog-test.c b/tools/testing/selftests/watchdog/watchdog-test.c
index 6e29087..3e8e393 100644
--- a/tools/testing/selftests/watchdog/watchdog-test.c
+++ b/tools/testing/selftests/watchdog/watchdog-test.c
@@ -19,7 +19,7 @@
 
 int fd;
 const char v = 'V';
-static const char sopts[] = "bdehp:t:";
+static const char sopts[] = "bdehp:t:Tn:N";
 static const struct option lopts[] = {
 	{"bootstatus",          no_argument, NULL, 'b'},
 	{"disable",             no_argument, NULL, 'd'},
@@ -27,6 +27,9 @@
 	{"help",                no_argument, NULL, 'h'},
 	{"pingrate",      required_argument, NULL, 'p'},
 	{"timeout",       required_argument, NULL, 't'},
+	{"gettimeout",          no_argument, NULL, 'T'},
+	{"pretimeout",    required_argument, NULL, 'n'},
+	{"getpretimeout",       no_argument, NULL, 'N'},
 	{NULL,                  no_argument, NULL, 0x0}
 };
 
@@ -71,9 +74,13 @@ static void usage(char *progname)
 	printf(" -h, --help          Print the help message\n");
 	printf(" -p, --pingrate=P    Set ping rate to P seconds (default %d)\n", DEFAULT_PING_RATE);
 	printf(" -t, --timeout=T     Set timeout to T seconds\n");
+	printf(" -T, --gettimeout    Get the timeout\n");
+	printf(" -n, --pretimeout=T  Set the pretimeout to T seconds\n");
+	printf(" -N, --getpretimeout Get the pretimeout\n");
 	printf("\n");
 	printf("Parameters are parsed left-to-right in real-time.\n");
 	printf("Example: %s -d -t 10 -p 5 -e\n", progname);
+	printf("Example: %s -t 12 -T -n 7 -N\n", progname);
 }
 
 int main(int argc, char *argv[])
@@ -135,6 +142,30 @@ int main(int argc, char *argv[])
 			else
 				printf("WDIOC_SETTIMEOUT errno '%s'\n", strerror(errno));
 			break;
+		case 'T':
+			oneshot = 1;
+			ret = ioctl(fd, WDIOC_GETTIMEOUT, &flags);
+			if (!ret)
+				printf("WDIOC_GETTIMEOUT returns %u seconds.\n", flags);
+			else
+				printf("WDIOC_GETTIMEOUT errno '%s'\n", strerror(errno));
+			break;
+		case 'n':
+			flags = strtoul(optarg, NULL, 0);
+			ret = ioctl(fd, WDIOC_SETPRETIMEOUT, &flags);
+			if (!ret)
+				printf("Watchdog pretimeout set to %u seconds.\n", flags);
+			else
+				printf("WDIOC_SETPRETIMEOUT errno '%s'\n", strerror(errno));
+			break;
+		case 'N':
+			oneshot = 1;
+			ret = ioctl(fd, WDIOC_GETPRETIMEOUT, &flags);
+			if (!ret)
+				printf("WDIOC_GETPRETIMEOUT returns %u seconds.\n", flags);
+			else
+				printf("WDIOC_GETPRETIMEOUT errno '%s'\n", strerror(errno));
+			break;
 		default:
 			usage(argv[0]);
 			goto end;
-- 
1.8.3.1
