From: anders.roxell@linaro.org (Anders Roxell)
Date: Mon, 23 Apr 2018 15:50:57 +0200
Subject: [PATCH] selftests: bpf: update .gitignore with missing file
Message-ID: <20180423135057.951-1-anders.roxell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180423135057.Lvdxwuax1EjIy3vB3HJ9QhfCuBBxUALvGmm_OEra0X4@z>

Fixes: c0fa1b6c3efc ("bpf: btf: Add BTF tests")
Signed-off-by: Anders Roxell <anders.roxell at linaro.org>
---
 tools/testing/selftests/bpf/.gitignore | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tools/testing/selftests/bpf/.gitignore b/tools/testing/selftests/bpf/.gitignore
index 5e1ab2f0eb79..3e3b3ced3f7c 100644
--- a/tools/testing/selftests/bpf/.gitignore
+++ b/tools/testing/selftests/bpf/.gitignore
@@ -15,3 +15,4 @@ test_libbpf_open
 test_sock
 test_sock_addr
 urandom_read
+test_btf
-- 
2.17.0

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
