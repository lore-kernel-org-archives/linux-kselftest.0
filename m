From: linux at dominikbrodowski.net (Dominik Brodowski)
Date: Sun, 11 Feb 2018 21:59:24 +0100
Subject: [Linux-kselftest-mirror] [PATCH] selftests/x86: clarify that there
 is no buffer overflow on sscanf usage
In-Reply-To: <20180211182428.e7isprkt6hbuq3dk@gmail.com>
References: <20180211111013.16888-1-linux@dominikbrodowski.net>
 <20180211111013.16888-3-linux@dominikbrodowski.net>
 <20180211112153.f2ni5mcuut6f6zvq@gmail.com>
 <20180211121714.GA11096@isilmar-4.linta.de>
 <20180211130029.GA23754@light.dominikbrodowski.net>
 <20180211182428.e7isprkt6hbuq3dk@gmail.com>
Message-ID: <20180211205924.GA23210@light.dominikbrodowski.net>


Suggested-by: Ingo Molnar <mingo at kernel.org>
CC: Andy Lutomirski <luto at kernel.org>
Signed-off-by: Dominik Brodowski <linux at dominikbrodowski.net>

---

> Yeah, probably - but still, this connection and the sscanf() guarantee is not 
> obvious at first sight, so please improve this to derive from the same value 
> (define a LINE_MAX size or such), plus maybe add a comment to the sscanf() line 
> that this is safe because strlen(name) >= strlen(line).

Sounds reasonable. Patch (which applies on top of the five patches for
selftests/x86 I sent out earlier today) is attached.

Thanks,
	Dominik

diff --git a/tools/testing/selftests/x86/test_vdso.c b/tools/testing/selftests/x86/test_vdso.c
index 558c8207e7b9..7ade625f10ed 100644
--- a/tools/testing/selftests/x86/test_vdso.c
+++ b/tools/testing/selftests/x86/test_vdso.c
@@ -26,6 +26,9 @@
 # endif
 #endif
 
+/* max length of lines in /proc/self/maps - anything longer is skipped here */
+#define MAPS_LINE_LEN 128
+
 int nerrs = 0;
 
 typedef long (*getcpu_t)(unsigned *, unsigned *, void *);
@@ -37,17 +40,19 @@ static void *vsyscall_getcpu(void)
 {
 #ifdef __x86_64__
 	FILE *maps;
-	char line[128];
+	char line[MAPS_LINE_LEN];
 	bool found = false;
 
 	maps = fopen("/proc/self/maps", "r");
 	if (!maps) /* might still be present, but ignore it here, as we test vDSO not vsyscall */
 		return NULL;
 
-	while (fgets(line, sizeof(line), maps)) {
+	while (fgets(line, MAPS_LINE_LEN, maps)) {
 		char r, x;
 		void *start, *end;
-		char name[128];
+		char name[MAPS_LINE_LEN];
+
+		/* sscanf is safe here as strlen(name) >= strlen(line) */
 		if (sscanf(line, "%p-%p %c-%cp %*x %*x:%*x %*u %s",
 			   &start, &end, &r, &x, name) != 5)
 			continue;
diff --git a/tools/testing/selftests/x86/test_vsyscall.c b/tools/testing/selftests/x86/test_vsyscall.c
index 7a744fa7b786..ee92e4727f18 100644
--- a/tools/testing/selftests/x86/test_vsyscall.c
+++ b/tools/testing/selftests/x86/test_vsyscall.c
@@ -33,6 +33,9 @@
 # endif
 #endif
 
+/* max length of lines in /proc/self/maps - anything longer is skipped here */
+#define MAPS_LINE_LEN 128
+
 static void sethandler(int sig, void (*handler)(int, siginfo_t *, void *),
 		       int flags)
 {
@@ -98,7 +101,7 @@ static int init_vsys(void)
 #ifdef __x86_64__
 	int nerrs = 0;
 	FILE *maps;
-	char line[128];
+	char line[MAPS_LINE_LEN];
 	bool found = false;
 
 	maps = fopen("/proc/self/maps", "r");
@@ -108,10 +111,12 @@ static int init_vsys(void)
 		return 0;
 	}
 
-	while (fgets(line, sizeof(line), maps)) {
+	while (fgets(line, MAPS_LINE_LEN, maps)) {
 		char r, x;
 		void *start, *end;
-		char name[128];
+		char name[MAPS_LINE_LEN];
+
+		/* sscanf is safe here as strlen(name) >= strlen(line) */
 		if (sscanf(line, "%p-%p %c-%cp %*x %*x:%*x %*u %s",
 			   &start, &end, &r, &x, name) != 5)
 			continue;
--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
