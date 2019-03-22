From: zohar@linux.ibm.com (Mimi Zohar)
Date: Fri, 22 Mar 2019 15:35:51 -0400
Subject: [PATCH v4a 2/2] selftests/kexec: testing
 CONFIG_KEXEC_BZIMAGE_VERIFY_SIG is not enough
In-Reply-To: <1553283351-6310-1-git-send-email-zohar@linux.ibm.com>
References: <1553283351-6310-1-git-send-email-zohar@linux.ibm.com>
Message-ID: <1553283351-6310-2-git-send-email-zohar@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190322193551.5kXAEUMAPEZ7yO3GkjuXi-RHpKn4WWiP8faVBNrQX8w@z>

Add support for CONFIG_KEXEC_VERIFY_SIG being enabled, but not
CONFIG_KEXEC_BZIMAGE_VERIFY_SIG.

Signed-off-by: Mimi Zohar <zohar at linux.ibm.com>
---
 tools/testing/selftests/kexec/test_kexec_file_load.sh | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/kexec/test_kexec_file_load.sh b/tools/testing/selftests/kexec/test_kexec_file_load.sh
index 57b636792086..fa7c24e8eefb 100755
--- a/tools/testing/selftests/kexec/test_kexec_file_load.sh
+++ b/tools/testing/selftests/kexec/test_kexec_file_load.sh
@@ -102,7 +102,8 @@ kexec_file_load_test()
 			log_fail "$succeed_msg (missing sig)"
 		fi
 
-		if [ $pe_sig_required -eq 1 ] && [ $pe_signed -eq 0 ]; then
+		if [ $kexec_sig_required -eq 1 -o $pe_sig_required -eq 1 ] \
+		     && [ $pe_signed -eq 0 ]; then
 			log_fail "$succeed_msg (missing PE sig)"
 		fi
 
@@ -137,7 +138,8 @@ kexec_file_load_test()
 		fi
 	fi
 
-	if [ $pe_sig_required -eq 1 ] && [ $pe_signed -eq 0 ]; then
+	if [ $kexec_sig_required -eq 1 -o $pe_sig_required -eq 1 ] \
+	     && [ $pe_signed -eq 0 ]; then
 		log_pass "$failed_msg (missing PE sig)"
 	fi
 
@@ -181,6 +183,10 @@ platform_keyring=$?
 kconfig_enabled "CONFIG_IMA_READ_POLICY=y" "reading IMA policy permitted"
 ima_read_policy=$?
 
+kconfig_enabled "CONFIG_KEXEC_SIG_FORCE=y" \
+	"kexec signed kernel image required"
+kexec_sig_required=$?
+
 kconfig_enabled "CONFIG_KEXEC_BZIMAGE_VERIFY_SIG=y" \
 	"PE signed kernel image required"
 pe_sig_required=$?
-- 
2.7.5
