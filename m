From: linux@dominikbrodowski.net (Dominik Brodowski)
Date: Sun, 11 Feb 2018 12:10:10 +0100
Subject: [Linux-kselftest-mirror] [PATCH 2/5] selftests/x86: fix vDSO
	selftest segfault for vsyscall=none
In-Reply-To: <20180211111013.16888-1-linux@dominikbrodowski.net>
References: <20180211111013.16888-1-linux@dominikbrodowski.net>
Message-ID: <20180211111013.16888-3-linux@dominikbrodowski.net>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180211111010.MjMhAZRYQgevNbQv-6W35zbhOETXojmBvLbWlzZt7Lk@z>

The vDSO selftest tries to execute a vsyscall unconditionally, even if it
is not present on the test system (e.g. if booted with vsyscall=none or
with CONFIG_LEGACY_VSYSCALL_NONE=y set. Fix this by copying (and tweaking)
the vsyscall check from test_vsyscall.c

CC: Andrew Lutomirski <luto at kernel.org>
Signed-off-by: Dominik Brodowski <linux at dominikbrodowski.net>
---
 tools/testing/selftests/x86/test_vdso.c | 50 ++++++++++++++++++++++++++++-----
 1 file changed, 43 insertions(+), 7 deletions(-)

diff --git a/tools/testing/selftests/x86/test_vdso.c b/tools/testing/selftests/x86/test_vdso.c
index 29973cde06d3..558c8207e7b9 100644
--- a/tools/testing/selftests/x86/test_vdso.c
+++ b/tools/testing/selftests/x86/test_vdso.c
@@ -28,18 +28,52 @@
 
 int nerrs = 0;
 
+typedef long (*getcpu_t)(unsigned *, unsigned *, void *);
+
+getcpu_t vgetcpu;
+getcpu_t vdso_getcpu;
+
+static void *vsyscall_getcpu(void)
+{
 #ifdef __x86_64__
-# define VSYS(x) (x)
+	FILE *maps;
+	char line[128];
+	bool found = false;
+
+	maps = fopen("/proc/self/maps", "r");
+	if (!maps) /* might still be present, but ignore it here, as we test vDSO not vsyscall */
+		return NULL;
+
+	while (fgets(line, sizeof(line), maps)) {
+		char r, x;
+		void *start, *end;
+		char name[128];
+		if (sscanf(line, "%p-%p %c-%cp %*x %*x:%*x %*u %s",
+			   &start, &end, &r, &x, name) != 5)
+			continue;
+
+		if (strcmp(name, "[vsyscall]"))
+			continue;
+
+		/* assume entries are OK, as we test vDSO here not vsyscall */
+		found = true;
+		break;
+	}
+
+	fclose(maps);
+
+	if (!found) {
+		printf("Warning: failed to find vsyscall getcpu\n");
+		return NULL;
+	}
+	return (void *) (0xffffffffff600800);
 #else
-# define VSYS(x) 0
+	return NULL;
 #endif
+}
 
-typedef long (*getcpu_t)(unsigned *, unsigned *, void *);
-
-const getcpu_t vgetcpu = (getcpu_t)VSYS(0xffffffffff600800);
-getcpu_t vdso_getcpu;
 
-void fill_function_pointers()
+static void fill_function_pointers()
 {
 	void *vdso = dlopen("linux-vdso.so.1",
 			    RTLD_LAZY | RTLD_LOCAL | RTLD_NOLOAD);
@@ -54,6 +88,8 @@ void fill_function_pointers()
 	vdso_getcpu = (getcpu_t)dlsym(vdso, "__vdso_getcpu");
 	if (!vdso_getcpu)
 		printf("Warning: failed to find getcpu in vDSO\n");
+
+	vgetcpu = (getcpu_t) vsyscall_getcpu();
 }
 
 static long sys_getcpu(unsigned * cpu, unsigned * node,
-- 
2.16.1

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
