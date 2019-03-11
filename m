From: zohar@linux.ibm.com (Mimi Zohar)
Date: Mon, 11 Mar 2019 07:41:10 -0400
Subject: [PATCH v3 4/7] kselftest/ima: define "require_root_privileges"
In-Reply-To: <1552304473-3966-1-git-send-email-zohar@linux.ibm.com>
References: <1552304473-3966-1-git-send-email-zohar@linux.ibm.com>
Message-ID: <1552304473-3966-5-git-send-email-zohar@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190311114110.FPSardy4qO4jNV7qNudTdARCHMV0wYPvUAL3ItLOFCw@z>

Many tests require root privileges.  Define a common function.

Suggested-by: Petr Vorel <pvorel at suse.cz>
Signed-off-by: Mimi Zohar <zohar at linux.ibm.com>
---
 tools/testing/selftests/ima/ima_common_lib.sh  | 7 +++++++
 tools/testing/selftests/ima/test_kexec_load.sh | 4 +---
 2 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/tools/testing/selftests/ima/ima_common_lib.sh b/tools/testing/selftests/ima/ima_common_lib.sh
index 59482914ac19..8ab7fcc0b221 100755
--- a/tools/testing/selftests/ima/ima_common_lib.sh
+++ b/tools/testing/selftests/ima/ima_common_lib.sh
@@ -65,3 +65,10 @@ get_secureboot_mode()
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
diff --git a/tools/testing/selftests/ima/test_kexec_load.sh b/tools/testing/selftests/ima/test_kexec_load.sh
index 99ab87b6c681..b2ecd196b382 100755
--- a/tools/testing/selftests/ima/test_kexec_load.sh
+++ b/tools/testing/selftests/ima/test_kexec_load.sh
@@ -8,9 +8,7 @@ TEST="$0"
 . ./ima_common_lib.sh
 
 # kexec requires root privileges
-if [ $(id -ru) -ne 0 ]; then
-	log_skip "requires root privileges"
-fi
+require_root_privileges
 
 get_secureboot_mode
 secureboot=$?
-- 
2.7.5
