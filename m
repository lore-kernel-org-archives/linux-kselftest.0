From: sashal@kernel.org (Sasha Levin)
Date: Thu, 28 Feb 2019 10:13:19 -0500
Subject: [PATCH AUTOSEL 4.14 18/36] bpf,
 selftests: fix handling of sparse CPU allocations
In-Reply-To: <20190228151337.12176-1-sashal@kernel.org>
References: <20190228151337.12176-1-sashal@kernel.org>
Message-ID: <20190228151337.12176-18-sashal@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190228151319.G3tPE861KpNQv0ezySViB6EUXuAyMSqCMMEjLpdewHg@z>

From: Martynas Pumputis <m@lambda.lt>

[ Upstream commit 1bb54c4071f585ebef56ce8fdfe6026fa2cbcddd ]

Previously, bpf_num_possible_cpus() had a bug when calculating a
number of possible CPUs in the case of sparse CPU allocations, as
it was considering only the first range or element of
/sys/devices/system/cpu/possible.

E.g. in the case of "0,2-3" (CPU 1 is not available), the function
returned 1 instead of 3.

This patch fixes the function by making it parse all CPU ranges and
elements.

Signed-off-by: Martynas Pumputis <m at lambda.lt>
Acked-by: Yonghong Song <yhs at fb.com>
Signed-off-by: Daniel Borkmann <daniel at iogearbox.net>
Signed-off-by: Sasha Levin <sashal at kernel.org>
---
 tools/testing/selftests/bpf/bpf_util.h | 30 +++++++++++++++++---------
 1 file changed, 20 insertions(+), 10 deletions(-)

diff --git a/tools/testing/selftests/bpf/bpf_util.h b/tools/testing/selftests/bpf/bpf_util.h
index d0811b3d6a6f1..4bf7203649344 100644
--- a/tools/testing/selftests/bpf/bpf_util.h
+++ b/tools/testing/selftests/bpf/bpf_util.h
@@ -13,7 +13,7 @@ static inline unsigned int bpf_num_possible_cpus(void)
 	unsigned int start, end, possible_cpus = 0;
 	char buff[128];
 	FILE *fp;
-	int n;
+	int len, n, i, j = 0;
 
 	fp = fopen(fcpu, "r");
 	if (!fp) {
@@ -21,17 +21,27 @@ static inline unsigned int bpf_num_possible_cpus(void)
 		exit(1);
 	}
 
-	while (fgets(buff, sizeof(buff), fp)) {
-		n = sscanf(buff, "%u-%u", &start, &end);
-		if (n == 0) {
-			printf("Failed to retrieve # possible CPUs!\n");
-			exit(1);
-		} else if (n == 1) {
-			end = start;
+	if (!fgets(buff, sizeof(buff), fp)) {
+		printf("Failed to read %s!\n", fcpu);
+		exit(1);
+	}
+
+	len = strlen(buff);
+	for (i = 0; i <= len; i++) {
+		if (buff[i] == ',' || buff[i] == '\0') {
+			buff[i] = '\0';
+			n = sscanf(&buff[j], "%u-%u", &start, &end);
+			if (n <= 0) {
+				printf("Failed to retrieve # possible CPUs!\n");
+				exit(1);
+			} else if (n == 1) {
+				end = start;
+			}
+			possible_cpus += end - start + 1;
+			j = i + 1;
 		}
-		possible_cpus = start == 0 ? end + 1 : 0;
-		break;
 	}
+
 	fclose(fp);
 
 	return possible_cpus;
-- 
2.19.1
