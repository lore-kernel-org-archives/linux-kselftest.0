From: andreyknvl at google.com (Andrey Konovalov)
Date: Mon, 10 Dec 2018 13:50:59 +0100
Subject: [PATCH v9 2/8] uaccess: add untagged_addr definition for other arches
In-Reply-To: <cover.1544445454.git.andreyknvl@google.com>
References: <cover.1544445454.git.andreyknvl@google.com>
Message-ID: <35f97a89d5cc881f0f4052f43d56b3b7ed736581.1544445454.git.andreyknvl@google.com>

To allow arm64 syscalls accept tagged pointers from userspace, we must
untag them when they are passed to the kernel. Since untagging is done in
generic parts of the kernel, the untagged_addr macro needs to be defined
for all architectures.

Define it as a noop for other architectures besides arm64.

Acked-by: Catalin Marinas <catalin.marinas at arm.com>
Signed-off-by: Andrey Konovalov <andreyknvl at google.com>
---
 include/linux/uaccess.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/include/linux/uaccess.h b/include/linux/uaccess.h
index efe79c1cdd47..42b7a4ac65e2 100644
--- a/include/linux/uaccess.h
+++ b/include/linux/uaccess.h
@@ -13,6 +13,10 @@
 
 #include <asm/uaccess.h>
 
+#ifndef untagged_addr
+#define untagged_addr(addr) (addr)
+#endif
+
 /*
  * Architectures should provide two primitives (raw_copy_{to,from}_user())
  * and get rid of their private instances of copy_{to,from}_user() and
-- 
2.20.0.rc2.403.gdbc3b29805-goog
