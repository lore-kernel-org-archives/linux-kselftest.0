From: anders.roxell@linaro.org (Anders Roxell)
Date: Mon, 23 Apr 2018 16:00:50 +0200
Subject: [PATCH] selftests: net: update .gitignore with missing test
Message-ID: <20180423140050.4508-1-anders.roxell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180423140050.CrFr-NQYkbrQWpITrcH1GAdTRplSyxMpr6UnvRFjZ1c@z>

Fixes: 192dc405f308 ("selftests: net: add tcp_mmap program")
Signed-off-by: Anders Roxell <anders.roxell at linaro.org>
---
 tools/testing/selftests/net/.gitignore | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tools/testing/selftests/net/.gitignore b/tools/testing/selftests/net/.gitignore
index c612d6e38c62..5559f6add046 100644
--- a/tools/testing/selftests/net/.gitignore
+++ b/tools/testing/selftests/net/.gitignore
@@ -7,3 +7,4 @@ reuseport_bpf_cpu
 reuseport_bpf_numa
 reuseport_dualstack
 reuseaddr_conflict
+tcp_mmap
-- 
2.17.0

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
