From: zohar at linux.ibm.com (Mimi Zohar)
Date: Thu, 14 Mar 2019 14:41:13 -0400
Subject: [PATCH v4 5/8] kselftest/kexec: define "require_root_privileges"
In-Reply-To: <1552588876-28481-1-git-send-email-zohar@linux.ibm.com>
References: <1552588876-28481-1-git-send-email-zohar@linux.ibm.com>
Message-ID: <1552588876-28481-6-git-send-email-zohar@linux.ibm.com>

Many tests require root privileges.  Define a common function.

Suggested-by: Petr Vorel <pvorel at suse.cz>
Signed-off-by: Mimi Zohar <zohar at linux.ibm.com>
Reviewed-by: Petr Vorel <pvorel at suse.cz>
---
 tools/testing/selftests/kexec/kexec_common_lib.sh | 7 +++++++
 tools/testing/selftests/kexec/test_kexec_load.sh  | 4 +---
 2 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/tools/testing/selftests/kexec/kexec_common_lib.sh b/tools/testing/selftests/kexec/kexec_common_lib.sh
index d108ac538f14..1af892cee726 100755
--- a/tools/testing/selftests/kexec/kexec_common_lib.sh
+++ b/tools/testing/selftests/kexec/kexec_common_lib.sh
@@ -67,3 +67,10 @@ get_secureboot_mode()
 	log_info "secure boot mode not enabled"
 	return 0;
 }
+
+require_root_privileges()
+{
+	if [ $(id -ru) -ne 0 ]; then
+		log_skip "requires root privileges"
+	fi
+}
diff --git a/tools/testing/selftests/kexec/test_kexec_load.sh b/tools/testing/selftests/kexec/test_kexec_load.sh
index cbf598a380d2..49545fcdc646 100755
--- a/tools/testing/selftests/kexec/test_kexec_load.sh
+++ b/tools/testing/selftests/kexec/test_kexec_load.sh
@@ -8,9 +8,7 @@ TEST="$0"
 . ./kexec_common_lib.sh
 
 # kexec requires root privileges
-if [ $(id -ru) -ne 0 ]; then
-	log_skip "requires root privileges"
-fi
+require_root_privileges
 
 get_secureboot_mode
 secureboot=$?
-- 
2.7.5
