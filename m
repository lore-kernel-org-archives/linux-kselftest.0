From: gorcunov at gmail.com (Cyrill Gorcunov)
Date: Fri, 9 Nov 2018 21:04:07 +0300
Subject: [PATCH] proc: fix and merge proc-self-map-file tests
In-Reply-To: <1541764873.3286172.1571234624.727F6284@webmail.messagingengine.com>
References: <20181108111105.GC13195@uranus.lan>
 <20181109113036.21512-1-rafael.tinoco@linaro.org>
 <20181109114123.GK13195@uranus.lan>
 <1541763936.3280758.1571224480.76F1EF1C@webmail.messagingengine.com>
 <20181109114850.GL13195@uranus.lan>
 <1541764873.3286172.1571234624.727F6284@webmail.messagingengine.com>
Message-ID: <20181109180407.GO13195@uranus.lan>

On Fri, Nov 09, 2018 at 10:01:13AM -0200, Rafael David Tinoco wrote:
> 
> Alright, I'm fixing membarrier_test before, so.. I guess we have a competition.. =o)

Rafael, Alexey, what about simply wrap the test code with x86 and extend later
with all archs which support zero address mapping?
---
 tools/testing/selftests/proc/proc-self-map-files-002.c |   14 ++++++++++++++
 1 file changed, 14 insertions(+)

Index: linux-ml.git/tools/testing/selftests/proc/proc-self-map-files-002.c
===================================================================
--- linux-ml.git.orig/tools/testing/selftests/proc/proc-self-map-files-002.c
+++ linux-ml.git/tools/testing/selftests/proc/proc-self-map-files-002.c
@@ -23,6 +23,11 @@
 #include <sys/mman.h>
 #include <stdlib.h>
 
+/*
+ * Should run on archs which support zero address mapping.
+ */
+#if defined(__i386) || defined(__x86_64)
+
 static void pass(const char *fmt, unsigned long a, unsigned long b)
 {
 	char name[64];
@@ -83,3 +88,12 @@ int main(void)
 
 	return 0;
 }
+
+#else
+
+int main(void)
+{
+	return 0;
+}
+
+#endif
