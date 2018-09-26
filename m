From: shuah@kernel.org (Shuah Khan (Samsung OSG))
Date: Wed, 26 Sep 2018 13:18:46 -0600
Subject: [PATCH] selftests: watchdog: fix message when /dev/watchdog open fails
Message-ID: <20180926191846.23984-1-shuah@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180926191846.0l7qdX0vwsriTzsY3hMb67derqNNuK_uTjDp7Jdfw5M@z>

When /dev/watchdog open fails, watchdog exits with "watchdog not enabled"
message. This is incorrect when open fails due to insufficient privilege.

Fix message to clearly state the reason when open fails with EACCESS when
a non-root user runs it.

Signed-off-by: Shuah Khan (Samsung OSG) <shuah at kernel.org>
---
 tools/testing/selftests/watchdog/watchdog-test.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/watchdog/watchdog-test.c b/tools/testing/selftests/watchdog/watchdog-test.c
index 6e290874b70e..e029e2017280 100644
--- a/tools/testing/selftests/watchdog/watchdog-test.c
+++ b/tools/testing/selftests/watchdog/watchdog-test.c
@@ -89,7 +89,13 @@ int main(int argc, char *argv[])
 	fd = open("/dev/watchdog", O_WRONLY);
 
 	if (fd == -1) {
-		printf("Watchdog device not enabled.\n");
+		if (errno == ENOENT)
+			printf("Watchdog device not enabled.\n");
+		else if (errno == EACCES)
+			printf("Run watchdog as root.\n");
+		else
+			printf("Watchdog device open failed %s\n",
+				strerror(errno));
 		exit(-1);
 	}
 
-- 
2.17.0
