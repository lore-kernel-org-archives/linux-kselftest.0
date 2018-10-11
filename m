From: rafael.tinoco at linaro.org (Rafael David Tinoco)
Date: Thu, 11 Oct 2018 15:43:59 -0300
Subject: [PATCH] proc: fix proc-self-map-files selftest for arm
Message-ID: <20181011184359.15627-1-rafael.tinoco@linaro.org>

MAP_FIXED is important for this test but, unfortunately, lowest virtual
address for user space mapping on arm is (PAGE_SIZE * 2) and NULL hint
does not seem to guarantee that when MAP_FIXED is given. This patch sets
the virtual address that will hold the mapping for the test, fixing the
issue.

Link: https://bugs.linaro.org/show_bug.cgi?id=3782
Signed-off-by: Rafael David Tinoco <rafael.tinoco at linaro.org>
---
 tools/testing/selftests/proc/proc-self-map-files-002.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/proc/proc-self-map-files-002.c b/tools/testing/selftests/proc/proc-self-map-files-002.c
index 6f1f4a6e1ecb..0a47eaca732a 100644
--- a/tools/testing/selftests/proc/proc-self-map-files-002.c
+++ b/tools/testing/selftests/proc/proc-self-map-files-002.c
@@ -55,7 +55,9 @@ int main(void)
 	if (fd == -1)
 		return 1;
 
-	p = mmap(NULL, PAGE_SIZE, PROT_NONE, MAP_PRIVATE|MAP_FILE|MAP_FIXED, fd, 0);
+	p = mmap((void *) (2 * PAGE_SIZE), PAGE_SIZE, PROT_NONE,
+			MAP_PRIVATE|MAP_FILE|MAP_FIXED, fd, 0);
+
 	if (p == MAP_FAILED) {
 		if (errno == EPERM)
 			return 2;
-- 
2.19.1
