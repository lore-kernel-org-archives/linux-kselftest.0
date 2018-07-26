From: anders.roxell at linaro.org (Anders Roxell)
Date: Thu, 26 Jul 2018 11:53:58 +0200
Subject: [PATCH] selftests/net: add tls to .gitignore
Message-ID: <20180726095358.30534-1-anders.roxell@linaro.org>

Add the tls binary to .gitignore

Fixes: 7f657d5bf507 ("selftests: tls: add selftests for TLS sockets")
Signed-off-by: Anders Roxell <anders.roxell at linaro.org>
---
 tools/testing/selftests/net/.gitignore | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tools/testing/selftests/net/.gitignore b/tools/testing/selftests/net/.gitignore
index 1a0ac3a29ec5..78b24cf76f40 100644
--- a/tools/testing/selftests/net/.gitignore
+++ b/tools/testing/selftests/net/.gitignore
@@ -13,3 +13,4 @@ udpgso
 udpgso_bench_rx
 udpgso_bench_tx
 tcp_inq
+tls
-- 
2.18.0

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
