From: zohar at linux.ibm.com (Mimi Zohar)
Date: Mon, 11 Mar 2019 07:41:13 -0400
Subject: [PATCH v3 7/7] selftests/ima: Add missing '=y' to config options
In-Reply-To: <1552304473-3966-1-git-send-email-zohar@linux.ibm.com>
References: <1552304473-3966-1-git-send-email-zohar@linux.ibm.com>
Message-ID: <1552304473-3966-8-git-send-email-zohar@linux.ibm.com>

From: Petr Vorel <pvorel at suse.cz>

so the file can be used as kernel config snippet.

Signed-off-by: Petr Vorel <pvorel at suse.cz>
[zohar at linux.ibm.com: remove CONFIG_KEXEC_VERIFY_SIG from config]
Signed-off-by: Mimi Zohar <zohar at linux.ibm.com>
---
 tools/testing/selftests/ima/config | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/tools/testing/selftests/ima/config b/tools/testing/selftests/ima/config
index 6bc86d4d9bb4..8962e862b2b8 100644
--- a/tools/testing/selftests/ima/config
+++ b/tools/testing/selftests/ima/config
@@ -1,4 +1,3 @@
-CONFIG_IMA_APPRAISE
-CONFIG_IMA_ARCH_POLICY
-CONFIG_SECURITYFS
-CONFIG_KEXEC_VERIFY_SIG
+CONFIG_IMA_APPRAISE=y
+CONFIG_IMA_ARCH_POLICY=y
+CONFIG_SECURITYFS=y
-- 
2.7.5
