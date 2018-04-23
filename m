From: anders.roxell at linaro.org (Anders Roxell)
Date: Mon, 23 Apr 2018 15:57:25 +0200
Subject: [PATCH] selftests: kvm: update .gitignore with missing file
Message-ID: <20180423135725.3753-1-anders.roxell@linaro.org>

Fixes: d5edb7f8e7ab ("kvm: selftests: add vmx_tsc_adjust_test")
Signed-off-by: Anders Roxell <anders.roxell at linaro.org>
---
 tools/testing/selftests/kvm/.gitignore | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tools/testing/selftests/kvm/.gitignore b/tools/testing/selftests/kvm/.gitignore
index a546e052d19a..63fc1ab9248f 100644
--- a/tools/testing/selftests/kvm/.gitignore
+++ b/tools/testing/selftests/kvm/.gitignore
@@ -1,2 +1,3 @@
 set_sregs_test
 sync_regs_test
+vmx_tsc_adjust_test
-- 
2.17.0

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
