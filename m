From: andreyknvl at google.com (Andrey Konovalov)
Date: Fri, 22 Feb 2019 13:53:22 +0100
Subject: [PATCH v10 10/12] tracing,
 arm64: untag user pointers in seq_print_user_ip
In-Reply-To: <cover.1550839937.git.andreyknvl@google.com>
References: <cover.1550839937.git.andreyknvl@google.com>
Message-ID: <99b59c349ed81d4b204353f54b89f930f01d6ee3.1550839937.git.andreyknvl@google.com>

seq_print_user_ip() uses provided user pointers for vma lookups, which
can only by done with untagged pointers.

Untag user pointers in this function.

Signed-off-by: Andrey Konovalov <andreyknvl at google.com>
---
 kernel/trace/trace_output.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/trace/trace_output.c b/kernel/trace/trace_output.c
index 54373d93e251..7c893328f97b 100644
--- a/kernel/trace/trace_output.c
+++ b/kernel/trace/trace_output.c
@@ -379,7 +379,7 @@ static int seq_print_user_ip(struct trace_seq *s, struct mm_struct *mm,
 		const struct vm_area_struct *vma;
 
 		down_read(&mm->mmap_sem);
-		vma = find_vma(mm, ip);
+		vma = find_vma(mm, untagged_addr(ip));
 		if (vma) {
 			file = vma->vm_file;
 			vmstart = vma->vm_start;
-- 
2.21.0.rc0.258.g878e2cd30e-goog
