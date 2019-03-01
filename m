From: smuckle at google.com (Steve Muckle)
Date: Thu, 28 Feb 2019 16:18:06 -0800
Subject: [PATCH] selftests: x86: add version check in test_syscall_vdso
Message-ID: <20190301001806.154271-1-smuckle@google.com>

Since 4.17 registers r8-r11 are not clobbered/zeroed by a 64-bit kernel
handling a 32-bit syscall and this behavior is enforced by the
test_syscall_vdso testcase. See commit 8bb2610bc496
("x86/entry/64/compat: Preserve r8-r11 in int $0x80").

Permit the old behavior in the testcase for kernels prior to 4.17.

Signed-off-by: Steve Muckle <smuckle at google.com>
---
 .../testing/selftests/x86/test_syscall_vdso.c | 30 +++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/tools/testing/selftests/x86/test_syscall_vdso.c b/tools/testing/selftests/x86/test_syscall_vdso.c
index c9c3281077bc..f7284dc4c32b 100644
--- a/tools/testing/selftests/x86/test_syscall_vdso.c
+++ b/tools/testing/selftests/x86/test_syscall_vdso.c
@@ -30,6 +30,7 @@
 #include <sys/time.h>
 #include <elf.h>
 #include <sys/ptrace.h>
+#include <sys/utsname.h>
 #include <sys/wait.h>
 
 #if !defined(__i386__)
@@ -71,6 +72,7 @@ struct regs64 {
 };
 struct regs64 regs64;
 int kernel_is_64bit;
+int clobber_ok;
 
 asm (
 	"	.pushsection .text\n"
@@ -130,6 +132,28 @@ void print_regs64(void)
 	printf("12:%016llx 13:%016llx 14:%016llx 15:%016llx\n", regs64.r12,  regs64.r13,  regs64.r14,  regs64.r15);
 }
 
+static void get_kernel_version(int *version, int *patchlevel)
+{
+	int ret, sublevel;
+	struct utsname utsname;
+
+	ret = uname(&utsname);
+	if (ret) {
+		perror("uname");
+		exit(1);
+	}
+
+	ret = sscanf(utsname.release, "%d.%d.%d", version, patchlevel,
+		     &sublevel);
+	if (ret < 0) {
+		perror("sscanf");
+		exit(1);
+	} else if (ret != 3) {
+		printf("Malformed kernel version %s\n", &utsname.release);
+		exit(1);
+	}
+}
+
 int check_regs64(void)
 {
 	int err = 0;
@@ -166,6 +190,8 @@ int check_regs64(void)
 			 * Historically (and probably unintentionally), they
 			 * were clobbered or zeroed.
 			 */
+			if (clobber_ok && *r64 == 0 && num <= 11)
+				continue;
 		}
 		printf("[FAIL]\tR%d has changed:%016llx\n", num, *r64);
 		err++;
@@ -385,6 +411,7 @@ int main(int argc, char **argv, char **envp)
 {
 	int exitcode = 0;
 	int cs;
+	int version, patchlevel;
 
 	asm("\n"
 	"	movl	%%cs, %%eax\n"
@@ -394,6 +421,9 @@ int main(int argc, char **argv, char **envp)
 	if (!kernel_is_64bit)
 		printf("[NOTE]\tNot a 64-bit kernel, won't test R8..R15 leaks\n");
 
+	get_kernel_version(&version, &patchlevel);
+	clobber_ok = version < 4 || (version == 4 && patchlevel < 17);
+
 	/* This only works for non-static builds:
 	 * syscall_addr = dlsym(dlopen("linux-gate.so.1", RTLD_NOW), "__kernel_vsyscall");
 	 */
-- 
2.21.0.352.gf09ad66450-goog
