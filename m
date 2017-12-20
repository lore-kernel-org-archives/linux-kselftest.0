From: naresh.kamboju@linaro.org (Naresh Kamboju)
Date: Wed, 20 Dec 2017 13:05:22 +0530
Subject: [Linux-kselftest-mirror] [PATCH] selftests: pstore: Adding config
	fragment CONFIG_PSTORE_RAM=m
Message-ID: <1513755322-11791-1-git-send-email-naresh.kamboju@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20171220073522.TrgU0jPwq03dFEQCZm0IrjgStlYSaZFzT2ZfrKLyxhU@z>

pstore_tests and pstore_post_reboot_tests need CONFIG_PSTORE_RAM=m

Signed-off-by: Naresh Kamboju <naresh.kamboju at linaro.org>
---
 tools/testing/selftests/pstore/config | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tools/testing/selftests/pstore/config b/tools/testing/selftests/pstore/config
index 6a8e5a9..d148f9f 100644
--- a/tools/testing/selftests/pstore/config
+++ b/tools/testing/selftests/pstore/config
@@ -2,3 +2,4 @@ CONFIG_MISC_FILESYSTEMS=y
 CONFIG_PSTORE=y
 CONFIG_PSTORE_PMSG=y
 CONFIG_PSTORE_CONSOLE=y
+CONFIG_PSTORE_RAM=m
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
