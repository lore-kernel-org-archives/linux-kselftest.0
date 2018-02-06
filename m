From: daniel.diaz@linaro.org (=?UTF-8?q?Daniel=20D=C3=ADaz?=)
Date: Tue,  6 Feb 2018 16:20:44 -0600
Subject: [Linux-kselftest-mirror] [PATCH] selftests: memfd: add config
	fragment for fuse
Message-ID: <1517955648-11186-1-git-send-email-daniel.diaz@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180206222044.F91H1wtnn7ihYbKMma_FerCr6G8asNxLICNM7mFOxV4@z>

From: Anders Roxell <anders.roxell@linaro.org>

The memfd test requires to insert the fuse module (CONFIG_FUSE_FS).

Signed-off-by: Anders Roxell <anders.roxell at linaro.org>
Signed-off-by: Daniel Díaz <daniel.diaz at linaro.org>
---
 tools/testing/selftests/memfd/config | 1 +
 1 file changed, 1 insertion(+)
 create mode 100644 tools/testing/selftests/memfd/config

diff --git a/tools/testing/selftests/memfd/config b/tools/testing/selftests/memfd/config
new file mode 100644
index 0000000..835c7f4
--- /dev/null
+++ b/tools/testing/selftests/memfd/config
@@ -0,0 +1 @@
+CONFIG_FUSE_FS=m
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
