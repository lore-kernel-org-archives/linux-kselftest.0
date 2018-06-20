From: anders.roxell at linaro.org (Anders Roxell)
Date: Thu, 21 Jun 2018 00:43:44 +0200
Subject: [PATCH] selftests: net: add tcp_inq to gitignore
Message-ID: <20180620224344.6425-1-anders.roxell@linaro.org>

sha: 702353b538f5 ("selftest: add test for TCP_INQ") forgot to add
tcp_inq to .gitignore.

Signed-off-by: Anders Roxell <anders.roxell at linaro.org>
---
 tools/testing/selftests/net/.gitignore | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tools/testing/selftests/net/.gitignore b/tools/testing/selftests/net/.gitignore
index 128e548aa377..1a0ac3a29ec5 100644
--- a/tools/testing/selftests/net/.gitignore
+++ b/tools/testing/selftests/net/.gitignore
@@ -12,3 +12,4 @@ tcp_mmap
 udpgso
 udpgso_bench_rx
 udpgso_bench_tx
+tcp_inq
-- 
2.17.1

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
