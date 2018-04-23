From: anders.roxell at linaro.org (Anders Roxell)
Date: Tue, 24 Apr 2018 00:53:05 +0200
Subject: [PATCH v2] selftests: bpf: update .gitignore with missing file
In-Reply-To: <065a8bc2-6065-3d43-8b03-35ed693de7ce@iogearbox.net>
References: <065a8bc2-6065-3d43-8b03-35ed693de7ce@iogearbox.net>
Message-ID: <20180423225305.18947-1-anders.roxell@linaro.org>

Fixes: c0fa1b6c3efc ("bpf: btf: Add BTF tests")
Signed-off-by: Anders Roxell <anders.roxell at linaro.org>
---
Rebased against bpf-next.

 tools/testing/selftests/bpf/.gitignore | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tools/testing/selftests/bpf/.gitignore b/tools/testing/selftests/bpf/.gitignore
index 9cf83f895d98..da19f0562bf8 100644
--- a/tools/testing/selftests/bpf/.gitignore
+++ b/tools/testing/selftests/bpf/.gitignore
@@ -12,3 +12,4 @@ test_tcpbpf_user
 test_verifier_log
 feature
 test_libbpf_open
+test_btf
-- 
2.17.0

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
