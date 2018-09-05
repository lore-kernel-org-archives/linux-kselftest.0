From: Lei.Yang at windriver.com (Lei Yang)
Date: Wed, 5 Sep 2018 10:20:44 +0800
Subject: [PATCH] sysctl: kselftests: use kernel module instead of built-in
Message-ID: <1536114044-31236-1-git-send-email-Lei.Yang@windriver.com>

It uses modprobe $TEST_DRIVER in sysctl.sh, so update
config to use "m" instead

Signed-off-by: Lei Yang <Lei.Yang at windriver.com>
---
 tools/testing/selftests/sysctl/config | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/sysctl/config b/tools/testing/selftests/sysctl/config
index 6ca1480..fc263ef 100644
--- a/tools/testing/selftests/sysctl/config
+++ b/tools/testing/selftests/sysctl/config
@@ -1 +1 @@
-CONFIG_TEST_SYSCTL=y
+CONFIG_TEST_SYSCTL=m
-- 
1.9.1
