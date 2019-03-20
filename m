From: andreyknvl at google.com (Andrey Konovalov)
Date: Wed, 20 Mar 2019 15:51:25 +0100
Subject: [PATCH v13 11/20] tracing,
 arm64: untag user pointers in seq_print_user_ip
In-Reply-To: <cover.1553093420.git.andreyknvl@google.com>
References: <cover.1553093420.git.andreyknvl@google.com>
Message-ID: <c9553c3a4850d43c8af0c00e97850d70428b7de7.1553093421.git.andreyknvl@google.com>

This patch is a part of a series that extends arm64 kernel ABI to allow to
pass tagged user pointers (with the top byte set to something else other
than 0x00) as syscall arguments.

seq_print_user_ip() uses provided user pointers for vma lookups, which
can only by done with untagged pointers.

Untag user pointers in this function.

Signed-off-by: Andrey Konovalov <andreyknvl at google.com>
---
 kernel/trace/trace_output.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/kernel/trace/trace_output.c b/kernel/trace/trace_output.c
index 54373d93e251..6376bee93c84 100644
--- a/kernel/trace/trace_output.c
+++ b/kernel/trace/trace_output.c
@@ -370,6 +370,7 @@ static int seq_print_user_ip(struct trace_seq *s, struct mm_struct *mm,
 {
 	struct file *file = NULL;
 	unsigned long vmstart = 0;
+	unsigned long untagged_ip = untagged_addr(ip);
 	int ret = 1;
 
 	if (s->full)
@@ -379,7 +380,7 @@ static int seq_print_user_ip(struct trace_seq *s, struct mm_struct *mm,
 		const struct vm_area_struct *vma;
 
 		down_read(&mm->mmap_sem);
-		vma = find_vma(mm, ip);
+		vma = find_vma(mm, untagged_ip);
 		if (vma) {
 			file = vma->vm_file;
 			vmstart = vma->vm_start;
@@ -388,7 +389,7 @@ static int seq_print_user_ip(struct trace_seq *s, struct mm_struct *mm,
 			ret = trace_seq_path(s, &file->f_path);
 			if (ret)
 				trace_seq_printf(s, "[+0x%lx]",
-						 ip - vmstart);
+						 untagged_ip - vmstart);
 		}
 		up_read(&mm->mmap_sem);
 	}
-- 
2.21.0.225.g810b269d1ac-goog
