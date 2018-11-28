From: brendanhiggins at google.com (Brendan Higgins)
Date: Wed, 28 Nov 2018 11:36:33 -0800
Subject: [RFC v3 16/19] arch: um: make UML unflatten device tree when testing
In-Reply-To: <20181128193636.254378-1-brendanhiggins@google.com>
References: <20181128193636.254378-1-brendanhiggins@google.com>
Message-ID: <20181128193636.254378-17-brendanhiggins@google.com>

Make UML unflatten any present device trees when running KUnit tests.

Signed-off-by: Brendan Higgins <brendanhiggins at google.com>
---
 arch/um/kernel/um_arch.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/um/kernel/um_arch.c b/arch/um/kernel/um_arch.c
index a818ccef30ca2..bd58ae3bf4148 100644
--- a/arch/um/kernel/um_arch.c
+++ b/arch/um/kernel/um_arch.c
@@ -13,6 +13,7 @@
 #include <linux/sched.h>
 #include <linux/sched/task.h>
 #include <linux/kmsg_dump.h>
+#include <linux/of_fdt.h>
 
 #include <asm/pgtable.h>
 #include <asm/processor.h>
@@ -347,6 +348,9 @@ void __init setup_arch(char **cmdline_p)
 	read_initrd();
 
 	paging_init();
+#if IS_ENABLED(CONFIG_OF_UNITTEST)
+	unflatten_device_tree();
+#endif
 	strlcpy(boot_command_line, command_line, COMMAND_LINE_SIZE);
 	*cmdline_p = command_line;
 	setup_hostinfo(host_info, sizeof host_info);
-- 
2.20.0.rc0.387.gc7a69e6b6c-goog
