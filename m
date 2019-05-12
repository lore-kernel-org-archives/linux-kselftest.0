From: skunberg.kelsey at gmail.com (Kelsey Skunberg)
Date: Sat, 11 May 2019 22:12:35 -0600
Subject: [PATCH] selftests: kvm: Add files generated when compiled to
 .gitignore
Message-ID: <20190512041235.29840-1-skunberg.kelsey@gmail.com>

The following files are generated in /selftests/kvm/ after compiling and
should be added to /selftests/kvm/.gitignore:

	- /x86_64/hyperv_cpuid
	- /x86_64/smm_test

Signed-off-by: Kelsey Skunberg <skunberg.kelsey at gmail.com>
---
 tools/testing/selftests/kvm/.gitignore | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tools/testing/selftests/kvm/.gitignore b/tools/testing/selftests/kvm/.gitignore
index 2689d1ea6d7a..81e9cb775ab8 100644
--- a/tools/testing/selftests/kvm/.gitignore
+++ b/tools/testing/selftests/kvm/.gitignore
@@ -6,4 +6,6 @@
 /x86_64/vmx_close_while_nested_test
 /x86_64/vmx_tsc_adjust_test
 /x86_64/state_test
+/x86_64/hyperv_cpuid
+/x86_64/smm_test
 /dirty_log_test
--
2.20.1
