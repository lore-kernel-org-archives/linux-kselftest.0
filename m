From: Babu.Moger@amd.com (Moger, Babu)
Date: Fri, 18 Jan 2019 18:27:15 +0000
Subject: [PATCH v5 11/13] selftests/resctrl: Add vendor detection mechanism
In-Reply-To: <20190118182646.16594-1-babu.moger@amd.com>
References: <20190118182646.16594-1-babu.moger@amd.com>
Message-ID: <20190118182646.16594-12-babu.moger@amd.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190118182715._uGUgEO3RhOtSABGvJoaP2WEv1Vh3XnNo6KzAy4yJK8@z>

RESCTRL feature is supported both on Intel and AMD now. Some features
are implemented differently. Add vendor detection mechanism. Use the vendor
check where there are differences.

Signed-off-by: Babu Moger <babu.moger at amd.com>
---
 tools/testing/selftests/resctrl/resctrl.h       | 13 +++++
 tools/testing/selftests/resctrl/resctrl_tests.c | 68 +++++++++++++++++++++++++
 2 files changed, 81 insertions(+)

diff --git a/tools/testing/selftests/resctrl/resctrl.h b/tools/testing/selftests/resctrl/resctrl.h
index 3da2afe..1ec97d1 100644
--- a/tools/testing/selftests/resctrl/resctrl.h
+++ b/tools/testing/selftests/resctrl/resctrl.h
@@ -63,10 +63,23 @@ struct resctrl_val_param {
 
 };
 
+/**
+ * Results of CPUID operation are stored in this structure.
+ * It consists of 4x32bits IA registers: EAX, EBX, ECX and EDX.
+ */
+struct cpuid_out {
+        uint32_t eax;
+        uint32_t ebx;
+        uint32_t ecx;
+        uint32_t edx;
+};
+
 pid_t bm_pid, ppid;
 extern char cbm_mask[256];
 extern unsigned long long_mask;
 extern char llc_occup_path[1024];
+extern int genuine_intel;
+extern int authentic_amd;
 
 int remount_resctrlfs(bool mum_resctrlfs);
 int get_resource_id(int cpu_no, int *resource_id);
diff --git a/tools/testing/selftests/resctrl/resctrl_tests.c b/tools/testing/selftests/resctrl/resctrl_tests.c
index 2397c3b..e8cbcd5 100644
--- a/tools/testing/selftests/resctrl/resctrl_tests.c
+++ b/tools/testing/selftests/resctrl/resctrl_tests.c
@@ -14,6 +14,69 @@
 #define BENCHMARK_ARGS		64
 #define BENCHMARK_ARG_SIZE	64
 
+/**
+ * This variables provides information about the vendor
+ */
+int genuine_intel = 0;
+int authentic_amd = 0;
+
+void
+lcpuid(const unsigned leaf,
+       const unsigned subleaf,
+       struct cpuid_out *out)
+{
+        if (out == NULL)
+                return;
+
+#ifdef __x86_64__
+        asm volatile("mov %4, %%eax\n\t"
+                     "mov %5, %%ecx\n\t"
+                     "cpuid\n\t"
+                     "mov %%eax, %0\n\t"
+                     "mov %%ebx, %1\n\t"
+                     "mov %%ecx, %2\n\t"
+                     "mov %%edx, %3\n\t"
+                     : "=g" (out->eax), "=g" (out->ebx), "=g" (out->ecx),
+                       "=g" (out->edx)
+                     : "g" (leaf), "g" (subleaf)
+                     : "%eax", "%ebx", "%ecx", "%edx");
+#else
+        asm volatile("push %%ebx\n\t"
+                     "mov %4, %%eax\n\t"
+                     "mov %5, %%ecx\n\t"
+                     "cpuid\n\t"
+                     "mov %%eax, %0\n\t"
+                     "mov %%ebx, %1\n\t"
+                     "mov %%ecx, %2\n\t"
+                     "mov %%edx, %3\n\t"
+                     "pop %%ebx\n\t"
+                     : "=g" (out->eax), "=g" (out->ebx), "=g" (out->ecx),
+                       "=g" (out->edx)
+                     : "g" (leaf), "g" (subleaf)
+                     : "%eax", "%ecx", "%edx");
+#endif
+}
+
+int detect_vendor(void)
+{
+        int ret = 0;
+        struct cpuid_out vendor;
+
+        lcpuid(0x0, 0x0, &vendor);
+        if (vendor.ebx == 0x756e6547 && vendor.edx == 0x49656e69 &&
+            vendor.ecx == 0x6c65746e) {
+                genuine_intel = 1;
+        } else if (vendor.ebx == 0x68747541 && vendor.edx == 0x69746E65 &&
+                   vendor.ecx ==   0x444D4163) {
+                authentic_amd = 1;
+        } else {
+                ret = -EFAULT;
+        }
+
+        return ret;
+}
+
+
 static void cmd_help(void)
 {
 	printf("usage: resctrl_tests [-h] [-b \"benchmark_cmd [options]\"] [-t test list] [-n no_of_bits]\n");
@@ -109,6 +172,11 @@ int main(int argc, char **argv)
 		return errno;
 	}
 
+	/*
+         * Detect vendor 
+	 */
+	detect_vendor();
+
 	if (has_ben) {
 		/* Extract benchmark command from command line. */
 		for (i = ben_ind; i < argc; i++) {
-- 
1.8.3.1
