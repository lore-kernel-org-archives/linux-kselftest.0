From: anders.roxell at linaro.org (Anders Roxell)
Date: Tue, 26 Jun 2018 17:32:13 +0200
Subject: [PATCH] selftests: mount: remove no longer needed config option
Message-ID: <20180626153213.676-1-anders.roxell@linaro.org>

Since commit eedf265aa003 ("devpts: Make each mount of devpts an
independent filesystem.") CONFIG_DEVPTS_MULTIPLE_INSTANCES isn't needed
in the defconfig anymore.

Signed-off-by: Anders Roxell <anders.roxell at linaro.org>
---
 tools/testing/selftests/mount/config | 1 -
 1 file changed, 1 deletion(-)

diff --git a/tools/testing/selftests/mount/config b/tools/testing/selftests/mount/config
index b5d881e48548..416bd53ce982 100644
--- a/tools/testing/selftests/mount/config
+++ b/tools/testing/selftests/mount/config
@@ -1,2 +1 @@
 CONFIG_USER_NS=y
-CONFIG_DEVPTS_MULTIPLE_INSTANCES=y
-- 
2.18.0

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
