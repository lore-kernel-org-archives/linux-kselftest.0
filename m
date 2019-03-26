From: zohar at linux.ibm.com (Mimi Zohar)
Date: Tue, 26 Mar 2019 09:34:16 -0400
Subject: [PATCH v5 8/9] selftests/kexec: check kexec_load and kexec_file_load
 are enabled
In-Reply-To: <1553607257-18906-1-git-send-email-zohar@linux.ibm.com>
References: <1553607257-18906-1-git-send-email-zohar@linux.ibm.com>
Message-ID: <1553607257-18906-9-git-send-email-zohar@linux.ibm.com>

Skip the kexec_load and kexec_file_load tests, if they aren't configured
in the kernel.  This change adds a new requirement that ikconfig is
configured in the kexec_load test.

Suggested-by: Dave Young <dyoung at redhat.com>
Signed-off-by: Mimi Zohar <zohar at linux.ibm.com>
---
 tools/testing/selftests/kexec/test_kexec_file_load.sh | 5 +++++
 tools/testing/selftests/kexec/test_kexec_load.sh      | 8 ++++++++
 2 files changed, 13 insertions(+)

diff --git a/tools/testing/selftests/kexec/test_kexec_file_load.sh b/tools/testing/selftests/kexec/test_kexec_file_load.sh
index 4603282dd8b6..fa7c24e8eefb 100755
--- a/tools/testing/selftests/kexec/test_kexec_file_load.sh
+++ b/tools/testing/selftests/kexec/test_kexec_file_load.sh
@@ -163,6 +163,11 @@ require_root_privileges
 # get the kernel config
 get_kconfig
 
+kconfig_enabled "CONFIG_KEXEC_FILE=y" "kexec_file_load is enabled"
+if [ $? -eq 0 ]; then
+	log_skip "kexec_file_load is not enabled"
+fi
+
 # Determine which kernel config options are enabled
 kconfig_enabled "CONFIG_IMA_APPRAISE=y" "IMA enabled"
 ima_appraise=$?
diff --git a/tools/testing/selftests/kexec/test_kexec_load.sh b/tools/testing/selftests/kexec/test_kexec_load.sh
index afd440ee23cb..2a66c8897f55 100755
--- a/tools/testing/selftests/kexec/test_kexec_load.sh
+++ b/tools/testing/selftests/kexec/test_kexec_load.sh
@@ -10,6 +10,14 @@ TEST="$0"
 # kexec requires root privileges
 require_root_privileges
 
+# get the kernel config
+get_kconfig
+
+kconfig_enabled "CONFIG_KEXEC=y" "kexec_load is enabled"
+if [ $? -eq 0 ]; then
+	log_skip "kexec_load is not enabled"
+fi
+
 get_secureboot_mode
 secureboot=$?
 
-- 
2.7.5
