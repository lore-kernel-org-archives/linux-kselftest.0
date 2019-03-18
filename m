From: andreyknvl@google.com (Andrey Konovalov)
Date: Mon, 18 Mar 2019 18:17:33 +0100
Subject: [PATCH v12 01/13] uaccess: add untagged_addr definition for other
 arches
In-Reply-To: <cover.1552929301.git.andreyknvl@google.com>
References: <cover.1552929301.git.andreyknvl@google.com>
Message-ID:
 <bee403f76b40f37c6790d144a4142f293e0a7d9f.1552929301.git.andreyknvl@google.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190318171733.WK3X8t1GTNNaG5X4e-yNQXTIrDZb6-H_2iMQIr1zm0w@z>

To allow arm64 syscalls to accept tagged pointers from userspace, we must
untag them when they are passed to the kernel. Since untagging is done in
generic parts of the kernel, the untagged_addr macro needs to be defined
for all architectures.

Define it as a noop for architectures other than arm64.

Acked-by: Catalin Marinas <catalin.marinas at arm.com>
Signed-off-by: Andrey Konovalov <andreyknvl at google.com>
---
 include/linux/mm.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index 76769749b5a5..4d674518d392 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -99,6 +99,10 @@ extern int mmap_rnd_compat_bits __read_mostly;
 #include <asm/pgtable.h>
 #include <asm/processor.h>
 
+#ifndef untagged_addr
+#define untagged_addr(addr) (addr)
+#endif
+
 #ifndef __pa_symbol
 #define __pa_symbol(x)  __pa(RELOC_HIDE((unsigned long)(x), 0))
 #endif
-- 
2.21.0.225.g810b269d1ac-goog
