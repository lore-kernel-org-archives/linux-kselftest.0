From: shuah@kernel.org (Shuah Khan)
Date: Thu, 31 Jan 2019 13:10:39 -0700
Subject: [PATCH] selftests: ir: skip when lirc device doesn't exist.
Message-ID: <20190131201039.20602-1-shuah@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190131201039.goqE_0XmuQbLeWo-LAzZwFZ99wfv9Vj4iaCrOIonmWk@z>

Skip instead of fail when lirc device doesn't exist.

Signed-off-by: Shuah Khan <shuah at kernel.org>
---
 tools/testing/selftests/ir/ir_loopback.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/ir/ir_loopback.c b/tools/testing/selftests/ir/ir_loopback.c
index 8cdf1b89ac9c..ff351bb7c163 100644
--- a/tools/testing/selftests/ir/ir_loopback.c
+++ b/tools/testing/selftests/ir/ir_loopback.c
@@ -76,7 +76,7 @@ int lirc_open(const char *rc)
 	}
 
 	if (!dent)
-		ksft_exit_fail_msg("cannot find lirc device for %s\n", rc);
+		ksft_exit_skip("cannot find lirc device for %s\n", rc);
 
 	closedir(d);
 
-- 
2.17.1
