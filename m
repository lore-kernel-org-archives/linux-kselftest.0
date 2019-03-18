From: andreyknvl at google.com (Andrey Konovalov)
Date: Mon, 18 Mar 2019 18:17:43 +0100
Subject: [PATCH v12 11/13] uprobes,
 arm64: untag user pointers in find_active_uprobe
In-Reply-To: <cover.1552929301.git.andreyknvl@google.com>
References: <cover.1552929301.git.andreyknvl@google.com>
Message-ID: <b24adf53a968b50ba84630f86136ee1251e12a9d.1552929301.git.andreyknvl@google.com>

This patch is a part of a series that extends arm64 kernel ABI to allow to
pass tagged user pointers (with the top byte set to something else other
than 0x00) as syscall arguments.

find_active_uprobe() uses provided user pointer (obtained via
instruction_pointer(regs)) for vma lookups, which can only by done with
untagged pointers.

Untag the user pointer in this function.

Signed-off-by: Andrey Konovalov <andreyknvl at google.com>
---
 kernel/events/uprobes.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/kernel/events/uprobes.c b/kernel/events/uprobes.c
index c5cde87329c7..d3a2716a813a 100644
--- a/kernel/events/uprobes.c
+++ b/kernel/events/uprobes.c
@@ -1992,6 +1992,8 @@ static struct uprobe *find_active_uprobe(unsigned long bp_vaddr, int *is_swbp)
 	struct uprobe *uprobe = NULL;
 	struct vm_area_struct *vma;
 
+	bp_vaddr = untagged_addr(bp_vaddr);
+
 	down_read(&mm->mmap_sem);
 	vma = find_vma(mm, bp_vaddr);
 	if (vma && vma->vm_start <= bp_vaddr) {
-- 
2.21.0.225.g810b269d1ac-goog
