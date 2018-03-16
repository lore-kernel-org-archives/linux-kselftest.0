From: colin.king@canonical.com (Colin King)
Date: Fri, 16 Mar 2018 14:23:40 +0000
Subject: [PATCH][next] selftests: fix spelling mistake: "desciptor" ->
 "descriptor"
Message-ID: <20180316142340.11346-1-colin.king@canonical.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180316142340.JBSQiLUX_K-j3gGDixIRjTFW2cp2kZbf180JL61eSKY@z>

From: Colin Ian King <colin.king@canonical.com>

Trivial fix to spelling mistake in error message text and re-adjust
break in literal string to fit into 80 char wide format.

Signed-off-by: Colin Ian King <colin.king at canonical.com>
---
 tools/testing/selftests/filesystems/devpts_pts.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/filesystems/devpts_pts.c b/tools/testing/selftests/filesystems/devpts_pts.c
index b9055e974289..32addb696150 100644
--- a/tools/testing/selftests/filesystems/devpts_pts.c
+++ b/tools/testing/selftests/filesystems/devpts_pts.c
@@ -279,8 +279,8 @@ int main(int argc, char *argv[])
 	int ret;
 
 	if (!isatty(STDIN_FILENO)) {
-		fprintf(stderr, "Standard input file desciptor is not attached "
-				"to a terminal. Skipping test\n");
+		fprintf(stderr, "Standard input file descriptor is not "
+				"attached to a terminal. Skipping test\n");
 		exit(EXIT_FAILURE);
 	}
 
-- 
2.15.1

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
