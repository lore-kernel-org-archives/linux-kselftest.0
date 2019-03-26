From: zohar@linux.ibm.com (Mimi Zohar)
Date: Tue, 26 Mar 2019 09:34:15 -0400
Subject: [PATCH v5 7/9] selftests/kexec: Add missing '=y' to config options
In-Reply-To: <1553607257-18906-1-git-send-email-zohar@linux.ibm.com>
References: <1553607257-18906-1-git-send-email-zohar@linux.ibm.com>
Message-ID: <1553607257-18906-8-git-send-email-zohar@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190326133415.um4KJe8QL8zhEf8kBpbE9j-osw8qDofJmPil80fEWdI@z>

From: Petr Vorel <pvorel@suse.cz>

so the file can be used as kernel config snippet.

Signed-off-by: Petr Vorel <pvorel at suse.cz>
[zohar at linux.ibm.com: remove CONFIG_KEXEC_VERIFY_SIG from config]
Signed-off-by: Mimi Zohar <zohar at linux.ibm.com>
---
 tools/testing/selftests/kexec/config | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/tools/testing/selftests/kexec/config b/tools/testing/selftests/kexec/config
index 6bc86d4d9bb4..8962e862b2b8 100644
--- a/tools/testing/selftests/kexec/config
+++ b/tools/testing/selftests/kexec/config
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
