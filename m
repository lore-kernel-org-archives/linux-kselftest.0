From: sashal@kernel.org (Sasha Levin)
Date: Thu, 14 Feb 2019 21:10:39 -0500
Subject: [PATCH AUTOSEL 4.19 23/65] selftests: gpio-mockup-chardev: Check
 asprintf() for error
In-Reply-To: <20190215021121.177674-1-sashal@kernel.org>
References: <20190215021121.177674-1-sashal@kernel.org>
Message-ID: <20190215021121.177674-23-sashal@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190215021039.SLv53pMRARjmUyA9LwjpXmnknBwrW7-pXQu7VjT8bzU@z>

From: Geert Uytterhoeven <geert+renesas@glider.be>

[ Upstream commit 508cacd7da6659ae7b7bdd0a335f675422277758 ]

With gcc 7.3.0:

    gpio-mockup-chardev.c: In function ‘get_debugfs’:
    gpio-mockup-chardev.c:62:3: warning: ignoring return value of ‘asprintf’, declared with attribute warn_unused_result [-Wunused-result]
       asprintf(path, "%s/gpio", mnt_fs_get_target(fs));
       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Handle asprintf() failures to fix this.

Signed-off-by: Geert Uytterhoeven <geert+renesas at glider.be>
Signed-off-by: Shuah Khan <shuah at kernel.org>
Signed-off-by: Sasha Levin <sashal at kernel.org>
---
 tools/testing/selftests/gpio/gpio-mockup-chardev.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/tools/testing/selftests/gpio/gpio-mockup-chardev.c b/tools/testing/selftests/gpio/gpio-mockup-chardev.c
index f8d468f54e98..aaa1e9f083c3 100644
--- a/tools/testing/selftests/gpio/gpio-mockup-chardev.c
+++ b/tools/testing/selftests/gpio/gpio-mockup-chardev.c
@@ -37,7 +37,7 @@ static int get_debugfs(char **path)
 	struct libmnt_table *tb;
 	struct libmnt_iter *itr = NULL;
 	struct libmnt_fs *fs;
-	int found = 0;
+	int found = 0, ret;
 
 	cxt = mnt_new_context();
 	if (!cxt)
@@ -58,8 +58,11 @@ static int get_debugfs(char **path)
 			break;
 		}
 	}
-	if (found)
-		asprintf(path, "%s/gpio", mnt_fs_get_target(fs));
+	if (found) {
+		ret = asprintf(path, "%s/gpio", mnt_fs_get_target(fs));
+		if (ret < 0)
+			err(EXIT_FAILURE, "failed to format string");
+	}
 
 	mnt_free_iter(itr);
 	mnt_free_context(cxt);
-- 
2.19.1
