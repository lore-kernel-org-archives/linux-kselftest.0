From: Lei.Yang at windriver.com (Lei Yang)
Date: Wed, 5 Sep 2018 17:57:15 +0800
Subject: [PATCH] selftests: memory-hotplug: add required configs
Message-ID: <1536141435-10097-1-git-send-email-Lei.Yang@windriver.com>

add CONFIG_MEMORY_HOTREMOVE=y in config
without this config, /sys/devices/system/memory/memory*/removable
always return 0, I endup getting an early skip during test

Signed-off-by: Lei Yang <Lei.Yang at windriver.com>
---
 tools/testing/selftests/memory-hotplug/config | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tools/testing/selftests/memory-hotplug/config b/tools/testing/selftests/memory-hotplug/config
index 2fde301..a7e8cd5 100644
--- a/tools/testing/selftests/memory-hotplug/config
+++ b/tools/testing/selftests/memory-hotplug/config
@@ -2,3 +2,4 @@ CONFIG_MEMORY_HOTPLUG=y
 CONFIG_MEMORY_HOTPLUG_SPARSE=y
 CONFIG_NOTIFIER_ERROR_INJECTION=y
 CONFIG_MEMORY_NOTIFIER_ERROR_INJECT=m
+CONFIG_MEMORY_HOTREMOVE=y
-- 
1.9.1
