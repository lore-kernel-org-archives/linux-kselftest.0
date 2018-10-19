From: anders.roxell@linaro.org (Anders Roxell)
Date: Fri, 19 Oct 2018 16:38:16 +0200
Subject: [PATCH] selftests/kvm: add missing executables to .gitignore
Message-ID: <20181019143816.4509-1-anders.roxell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20181019143816.PH9Sx8mh-gtsEoYIhZju06ZqtrxKeDXBWxMEUTsSgLM@z>

Fixes: 18178ff86217 ("KVM: selftests: add Enlightened VMCS test")
Signed-off-by: Anders Roxell <anders.roxell at linaro.org>
---
 tools/testing/selftests/kvm/.gitignore | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tools/testing/selftests/kvm/.gitignore b/tools/testing/selftests/kvm/.gitignore
index 552b0d9a49f4..6210ba41c29e 100644
--- a/tools/testing/selftests/kvm/.gitignore
+++ b/tools/testing/selftests/kvm/.gitignore
@@ -1,4 +1,5 @@
 /x86_64/cr4_cpuid_sync_test
+/x86_64/evmcs_test
 /x86_64/platform_info_test
 /x86_64/set_sregs_test
 /x86_64/sync_regs_test
-- 
2.19.1
