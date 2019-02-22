From: andreyknvl at google.com (Andrey Konovalov)
Date: Fri, 22 Feb 2019 13:53:13 +0100
Subject: [PATCH v10 01/12] uaccess: add untagged_addr definition for other
 arches
In-Reply-To: <cover.1550839937.git.andreyknvl@google.com>
References: <cover.1550839937.git.andreyknvl@google.com>
Message-ID: <2b5a5d7d7a36a75a2a796f0c2b9b30669d81d470.1550839937.git.andreyknvl@google.com>

To allow arm64 syscalls to accept tagged pointers from userspace, we must
untag them when they are passed to the kernel. Since untagging is done in
generic parts of the kernel, the untagged_addr macro needs to be defined
for all architectures.

Define it as a noop for architectures other than arm64.

Acked-by: Catalin Marinas <catalin.marinas at arm.com>
Signed-off-by: Andrey Konovalov <andreyknvl at google.com>
---
 include/linux/memory.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/include/linux/memory.h b/include/linux/memory.h
index a6ddefc60517..fc383bc39ab8 100644
--- a/include/linux/memory.h
+++ b/include/linux/memory.h
@@ -21,6 +21,10 @@
 #include <linux/mutex.h>
 #include <linux/notifier.h>
 
+#ifndef untagged_addr
+#define untagged_addr(addr) (addr)
+#endif
+
 #define MIN_MEMORY_BLOCK_SIZE     (1UL << SECTION_SIZE_BITS)
 
 struct memory_block {
-- 
2.21.0.rc0.258.g878e2cd30e-goog
