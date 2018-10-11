From: peng.hao2 at zte.com.cn (Peng Hao)
Date: Fri, 12 Oct 2018 03:53:50 +0800
Subject: [PATCH]  selftests: fix warning: "_GNU_SOURCE" redefined
Message-ID: <1539287630-92982-1-git-send-email-peng.hao2@zte.com.cn>

Makefile contains -D_GNU_SOURCE. remove define "_GNU_SOURCE"
in c files.

Signed-off-by: Peng Hao <peng.hao2 at zte.com.cn>
---
 tools/testing/selftests/proc/fd-001-lookup.c  | 2 +-
 tools/testing/selftests/proc/fd-003-kthread.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/proc/fd-001-lookup.c b/tools/testing/selftests/proc/fd-001-lookup.c
index a2010df..60d7948 100644
--- a/tools/testing/selftests/proc/fd-001-lookup.c
+++ b/tools/testing/selftests/proc/fd-001-lookup.c
@@ -14,7 +14,7 @@
  * OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
  */
 // Test /proc/*/fd lookup.
-#define _GNU_SOURCE
+
 #undef NDEBUG
 #include <assert.h>
 #include <dirent.h>
diff --git a/tools/testing/selftests/proc/fd-003-kthread.c b/tools/testing/selftests/proc/fd-003-kthread.c
index 1d659d5..dc591f9 100644
--- a/tools/testing/selftests/proc/fd-003-kthread.c
+++ b/tools/testing/selftests/proc/fd-003-kthread.c
@@ -14,7 +14,7 @@
  * OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
  */
 // Test that /proc/$KERNEL_THREAD/fd/ is empty.
-#define _GNU_SOURCE
+
 #undef NDEBUG
 #include <sys/syscall.h>
 #include <assert.h>
-- 
1.8.3.1
