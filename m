From: colin.king@canonical.com (Colin King)
Date: Sun, 29 Apr 2018 12:54:25 +0100
Subject: [PATCH] selftests: fix spelling mistake: "desciptor" -> "descriptor"
Message-ID: <20180429115425.9378-1-colin.king@canonical.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180429115425.ep4DK1UjrlqDObYp3JRNH468nUUjrhHJBz1QDsyyOLs@z>

From: Colin Ian King <colin.king@canonical.com>

Trivial fix to spelling mistake in message text

Signed-off-by: Colin Ian King <colin.king at canonical.com>
---
 tools/testing/selftests/filesystems/devpts_pts.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/filesystems/devpts_pts.c b/tools/testing/selftests/filesystems/devpts_pts.c
index b9055e974289..ea5de8271521 100644
--- a/tools/testing/selftests/filesystems/devpts_pts.c
+++ b/tools/testing/selftests/filesystems/devpts_pts.c
@@ -279,7 +279,7 @@ int main(int argc, char *argv[])
 	int ret;
 
 	if (!isatty(STDIN_FILENO)) {
-		fprintf(stderr, "Standard input file desciptor is not attached "
+		fprintf(stderr, "Standard input file descriptor is not attached "
 				"to a terminal. Skipping test\n");
 		exit(EXIT_FAILURE);
 	}
-- 
2.17.0

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
