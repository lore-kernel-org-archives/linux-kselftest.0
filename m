From: Lei.Yang at windriver.com (Lei Yang)
Date: Wed, 5 Sep 2018 11:14:49 +0800
Subject: [PATCH] selftests/efivarfs: add required kernel configs
Message-ID: <1536117289-15240-1-git-send-email-Lei.Yang@windriver.com>

add config file

Signed-off-by: Lei Yang <Lei.Yang at windriver.com>
---
 tools/testing/selftests/efivarfs/config | 1 +
 1 file changed, 1 insertion(+)
 create mode 100644 tools/testing/selftests/efivarfs/config

diff --git a/tools/testing/selftests/efivarfs/config b/tools/testing/selftests/efivarfs/config
new file mode 100644
index 0000000..4e151f1
--- /dev/null
+++ b/tools/testing/selftests/efivarfs/config
@@ -0,0 +1 @@
+CONFIG_EFIVAR_FS=y
-- 
1.9.1
