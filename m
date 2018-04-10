From: anders.roxell@linaro.org (Anders Roxell)
Date: Tue, 10 Apr 2018 14:24:21 +0200
Subject: [PATCH] selftests: bpf: update .gitignore with missing generated files
Message-ID: <20180410122421.25393-1-anders.roxell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180410122421.YFChPeLuqP5qWo6n8DB5kW8Jqvdq2O-9TyIHadZAoNQ@z>

Signed-off-by: Anders Roxell <anders.roxell at linaro.org>
---
 tools/testing/selftests/bpf/.gitignore | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/tools/testing/selftests/bpf/.gitignore b/tools/testing/selftests/bpf/.gitignore
index 9cf83f895d98..5e1ab2f0eb79 100644
--- a/tools/testing/selftests/bpf/.gitignore
+++ b/tools/testing/selftests/bpf/.gitignore
@@ -12,3 +12,6 @@ test_tcpbpf_user
 test_verifier_log
 feature
 test_libbpf_open
+test_sock
+test_sock_addr
+urandom_read
-- 
2.16.3

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
