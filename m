From: anders.roxell@linaro.org (Anders Roxell)
Date: Tue,  8 Jan 2019 10:22:23 +0100
Subject: [PATCH] selftests: bpf: add missing executables to .gitignore
Message-ID: <20190108092223.12467-1-anders.roxell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190108092223.bZzvOGoYnITLhSGkxd8UwZM2OsP9FFG6xGaxGx8XBzw@z>

Fixes: 8c4905b995c6 ("libbpf: make sure bpf headers are c++ include-able")
Signed-off-by: Anders Roxell <anders.roxell at linaro.org>
---
 tools/testing/selftests/bpf/.gitignore | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tools/testing/selftests/bpf/.gitignore b/tools/testing/selftests/bpf/.gitignore
index 4a9785043a39..6c17b6557e5d 100644
--- a/tools/testing/selftests/bpf/.gitignore
+++ b/tools/testing/selftests/bpf/.gitignore
@@ -11,6 +11,7 @@ test_progs
 test_tcpbpf_user
 test_verifier_log
 feature
+test_libbpf
 test_libbpf_open
 test_sock
 test_sock_addr
-- 
2.20.1
