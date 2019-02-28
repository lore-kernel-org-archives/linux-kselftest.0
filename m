From: pvorel at suse.cz (Petr Vorel)
Date: Fri,  1 Mar 2019 00:30:30 +0100
Subject: [PATCH] selftests/ima: Add missing '=y' to config options
Message-ID: <20190228233030.10480-1-pvorel@suse.cz>

so the file can be used as kernel config snippet.

Signed-off-by: Petr Vorel <pvorel at suse.cz>
---
 tools/testing/selftests/ima/config | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/tools/testing/selftests/ima/config b/tools/testing/selftests/ima/config
index 6bc86d4d9bb4..9b968cd55199 100644
--- a/tools/testing/selftests/ima/config
+++ b/tools/testing/selftests/ima/config
@@ -1,4 +1,4 @@
-CONFIG_IMA_APPRAISE
-CONFIG_IMA_ARCH_POLICY
-CONFIG_SECURITYFS
-CONFIG_KEXEC_VERIFY_SIG
+CONFIG_IMA_APPRAISE=y
+CONFIG_IMA_ARCH_POLICY=y
+CONFIG_SECURITYFS=y
+CONFIG_KEXEC_VERIFY_SIG=y
-- 
2.20.1
