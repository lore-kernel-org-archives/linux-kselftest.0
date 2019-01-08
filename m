From: anders.roxell@linaro.org (Anders Roxell)
Date: Tue,  8 Jan 2019 10:26:54 +0100
Subject: [PATCH] selftests/kvm: add missing executables to .gitignore
Message-ID: <20190108092654.13113-1-anders.roxell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190108092654.-wPC6kHIaiJKZ19DDiEwCOThmHesoyV4Zb-G_cCfNUw@z>

Fixes: 2a31b9db1535 ("kvm: introduce manual dirty log reprotect")
Fixes: 7edcb7343327 ("KVM: selftests: Add hyperv_cpuid test")
Signed-off-by: Anders Roxell <anders.roxell at linaro.org>
---
 tools/testing/selftests/kvm/.gitignore | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tools/testing/selftests/kvm/.gitignore b/tools/testing/selftests/kvm/.gitignore
index 6210ba41c29e..51ffd8a8bc38 100644
--- a/tools/testing/selftests/kvm/.gitignore
+++ b/tools/testing/selftests/kvm/.gitignore
@@ -1,8 +1,10 @@
 /x86_64/cr4_cpuid_sync_test
 /x86_64/evmcs_test
+/x86_64/hyperv_cpuid
 /x86_64/platform_info_test
 /x86_64/set_sregs_test
 /x86_64/sync_regs_test
 /x86_64/vmx_tsc_adjust_test
 /x86_64/state_test
+/clear_dirty_log_test
 /dirty_log_test
-- 
2.20.1
