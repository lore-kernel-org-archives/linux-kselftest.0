From: adobriyan at gmail.com (Alexey Dobriyan)
Date: Tue, 13 Nov 2018 19:54:46 +0300
Subject: [PATCH v2] proc: fixup map_files test on arm
In-Reply-To: <f1805813-62b7-8572-d906-bc49b62d1bf3@linaro.org>
References: <20181110184920.GA18252@avx2>
 <1541904527.857883.1572718104.2AE8D0DA@webmail.messagingengine.com>
 <20181112141456.GA15690@avx2> <20181112155559.GV13195@uranus.lan>
 <f1805813-62b7-8572-d906-bc49b62d1bf3@linaro.org>
Message-ID: <20181113165446.GA28157@avx2>

https://bugs.linaro.org/show_bug.cgi?id=3782

Turns out arm doesn't allow to map address 0, so try minimum virtual
address instead.

Reported-by: Rafael David Tinoco <rafael.tinoco at linaro.org>
Tested-by: Rafael David Tinoco <rafael.tinoco at linaro.org>
Signed-off-by: Alexey Dobriyan <adobriyan at gmail.com>
---

 tools/testing/selftests/proc/proc-self-map-files-002.c |    9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

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
