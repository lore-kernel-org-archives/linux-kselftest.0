From: colin.king at canonical.com (Colin King)
Date: Wed,  2 May 2018 16:00:10 +0100
Subject: [PATCH] selftests: media_tests: fix spelling mistake: "iternations"
 -> "iterations"
Message-ID: <20180502150010.32333-1-colin.king@canonical.com>

From: Colin Ian King <colin.king at canonical.com>

Trivial fix to spelling mistake in message text

Signed-off-by: Colin Ian King <colin.king at canonical.com>
---
 tools/testing/selftests/media_tests/media_device_test.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/media_tests/media_device_test.c b/tools/testing/selftests/media_tests/media_device_test.c
index 421a367e4bb3..d8bb1e15d1d9 100644
--- a/tools/testing/selftests/media_tests/media_device_test.c
+++ b/tools/testing/selftests/media_tests/media_device_test.c
@@ -88,7 +88,7 @@ int main(int argc, char **argv)
 	       "other Oops in the dmesg. Enable KaSan kernel\n"
 	       "config option for use-after-free error detection.\n\n");
 
-	printf("Running test for %d iternations\n", count);
+	printf("Running test for %d iterations\n", count);
 
 	while (count > 0) {
 		ret = ioctl(fd, MEDIA_IOC_DEVICE_INFO, &mdi);
-- 
2.17.0

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
