From: anders.roxell at linaro.org (Anders Roxell)
Date: Wed, 21 Feb 2018 22:30:01 +0100
Subject: [PATCH] selftests/bpf: update gitignore with test_libbpf_open
Message-ID: <20180221213001.18682-1-anders.roxell@linaro.org>

bpf builds a test program for loading BPF ELF files. Add the executable
to the .gitignore list.

Signed-off-by: Anders Roxell <anders.roxell at linaro.org>
---
 tools/testing/selftests/bpf/.gitignore | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tools/testing/selftests/bpf/.gitignore b/tools/testing/selftests/bpf/.gitignore
index cc15af2e54fe..9cf83f895d98 100644
--- a/tools/testing/selftests/bpf/.gitignore
+++ b/tools/testing/selftests/bpf/.gitignore
@@ -11,3 +11,4 @@ test_progs
 test_tcpbpf_user
 test_verifier_log
 feature
+test_libbpf_open
-- 
2.11.0

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
