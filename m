From: sashal at kernel.org (Sasha Levin)
Date: Wed,  5 Dec 2018 04:35:52 -0500
Subject: [PATCH AUTOSEL 4.19 120/123] proc: fixup map_files test on arm
In-Reply-To: <20181205093555.5386-1-sashal@kernel.org>
References: <20181205093555.5386-1-sashal@kernel.org>
Message-ID: <20181205093555.5386-120-sashal@kernel.org>

From: Alexey Dobriyan <adobriyan at gmail.com>

[ Upstream commit dbd4af54745fc0c805217693c807a3928b2d408b ]

https://bugs.linaro.org/show_bug.cgi?id=3782

Turns out arm doesn't permit mapping address 0, so try minimum virtual
address instead.

Link: http://lkml.kernel.org/r/20181113165446.GA28157 at avx2
Signed-off-by: Alexey Dobriyan <adobriyan at gmail.com>
Reported-by: Rafael David Tinoco <rafael.tinoco at linaro.org>
Tested-by: Rafael David Tinoco <rafael.tinoco at linaro.org>
Acked-by: Cyrill Gorcunov <gorcunov at gmail.com>
Cc: Shuah Khan <shuah at kernel.org>
Signed-off-by: Andrew Morton <akpm at linux-foundation.org>
Signed-off-by: Linus Torvalds <torvalds at linux-foundation.org>
Signed-off-by: Sasha Levin <sashal at kernel.org>
---
 tools/testing/selftests/proc/proc-self-map-files-002.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/proc/proc-self-map-files-002.c b/tools/testing/selftests/proc/proc-self-map-files-002.c
index 6f1f4a6e1ecb..85744425b08d 100644
--- a/tools/testing/selftests/proc/proc-self-map-files-002.c
+++ b/tools/testing/selftests/proc/proc-self-map-files-002.c
@@ -13,7 +13,7 @@
  * ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF
  * OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
  */
-/* Test readlink /proc/self/map_files/... with address 0. */
+/* Test readlink /proc/self/map_files/... with minimum address. */
 #include <errno.h>
 #include <sys/types.h>
 #include <sys/stat.h>
@@ -47,6 +47,11 @@ static void fail(const char *fmt, unsigned long a, unsigned long b)
 int main(void)
 {
 	const unsigned int PAGE_SIZE = sysconf(_SC_PAGESIZE);
+#ifdef __arm__
+	unsigned long va = 2 * PAGE_SIZE;
+#else
+	unsigned long va = 0;
+#endif
 	void *p;
 	int fd;
 	unsigned long a, b;
@@ -55,7 +60,7 @@ int main(void)
 	if (fd == -1)
 		return 1;
 
-	p = mmap(NULL, PAGE_SIZE, PROT_NONE, MAP_PRIVATE|MAP_FILE|MAP_FIXED, fd, 0);
+	p = mmap((void *)va, PAGE_SIZE, PROT_NONE, MAP_PRIVATE|MAP_FILE|MAP_FIXED, fd, 0);
 	if (p == MAP_FAILED) {
 		if (errno == EPERM)
 			return 2;
-- 
2.17.1
