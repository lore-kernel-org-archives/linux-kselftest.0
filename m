From: jrdr.linux@gmail.com (Souptick Joarder)
Date: Mon, 4 Mar 2019 23:45:29 +0530
Subject: [PATCH] selftest/gpio: Remove duplicate header
Message-ID: <20190304181529.GA6500@jordon-HP-15-Notebook-PC>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190304181529.9s86HaYclAFWRNqkxHpt7505Pba7VOLm_wHBfjeMkm8@z>

Remove duplicate header which are included twice.

Signed-off-by: Sabyasachi Gupta <sabyasachi.linux at gmail.com>
Signed-off-by: Souptick Joarder <jrdr.linux at gmail.com>
---
 tools/testing/selftests/gpio/gpio-mockup-chardev.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/tools/testing/selftests/gpio/gpio-mockup-chardev.c b/tools/testing/selftests/gpio/gpio-mockup-chardev.c
index aaa1e9f..d587c81 100644
--- a/tools/testing/selftests/gpio/gpio-mockup-chardev.c
+++ b/tools/testing/selftests/gpio/gpio-mockup-chardev.c
@@ -12,7 +12,6 @@
 #include <unistd.h>
 #include <stdio.h>
 #include <stdlib.h>
-#include <stdio.h>
 #include <errno.h>
 #include <string.h>
 #include <fcntl.h>
-- 
1.9.1
