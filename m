From: andreyknvl@google.com (Andrey Konovalov)
Date: Tue, 30 Apr 2019 15:25:03 +0200
Subject: [PATCH v14 07/17] mm, arm64: untag user pointers in mm/gup.c
In-Reply-To: <cover.1556630205.git.andreyknvl@google.com>
References: <cover.1556630205.git.andreyknvl@google.com>
Message-ID:
 <373d33e4cb0087da32ad019fd212414292ce04c8.1556630205.git.andreyknvl@google.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190430132503.qzGLZd_zpNqdpOqFDIl1J8GEB7UYg5I2t66X9-O6bRg@z>

This patch is a part of a series that extends arm64 kernel ABI to allow to
pass tagged user pointers (with the top byte set to something else other
than 0x00) as syscall arguments.

mm/gup.c provides a kernel interface that accepts user addresses and
manipulates user pages directly (for example get_user_pages, that is used
by the futex syscall). Since a user can provided tagged addresses, we need
to handle this case.

Add untagging to gup.c functions that use user addresses for vma lookups.

Signed-off-by: Andrey Konovalov <andreyknvl at google.com>
---
 mm/gup.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/mm/gup.c b/mm/gup.c
index 91819b8ad9cc..2f477a0a7180 100644
--- a/mm/gup.c
+++ b/mm/gup.c
@@ -696,6 +696,8 @@ static long __get_user_pages(struct task_struct *tsk, struct mm_struct *mm,
 	if (!nr_pages)
 		return 0;
 
+	start = untagged_addr(start);
+
 	VM_BUG_ON(!!pages != !!(gup_flags & FOLL_GET));
 
 	/*
@@ -858,6 +860,8 @@ int fixup_user_fault(struct task_struct *tsk, struct mm_struct *mm,
 	struct vm_area_struct *vma;
 	vm_fault_t ret, major = 0;
 
+	address = untagged_addr(address);
+
 	if (unlocked)
 		fault_flags |= FAULT_FLAG_ALLOW_RETRY;
 
-- 
2.21.0.593.g511ec345e18-goog
