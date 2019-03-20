From: andreyknvl at google.com (Andrey Konovalov)
Date: Wed, 20 Mar 2019 15:51:19 +0100
Subject: [PATCH v13 05/20] mm, arm64: untag user pointers in mm/gup.c
In-Reply-To: <cover.1553093420.git.andreyknvl@google.com>
References: <cover.1553093420.git.andreyknvl@google.com>
Message-ID: <a8766f523b5b46b7fa55a87ef55cd3fe6ab2d345.1553093421.git.andreyknvl@google.com>

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
index f84e22685aaa..3192741e0b3a 100644
--- a/mm/gup.c
+++ b/mm/gup.c
@@ -686,6 +686,8 @@ static long __get_user_pages(struct task_struct *tsk, struct mm_struct *mm,
 	if (!nr_pages)
 		return 0;
 
+	start = untagged_addr(start);
+
 	VM_BUG_ON(!!pages != !!(gup_flags & FOLL_GET));
 
 	/*
@@ -848,6 +850,8 @@ int fixup_user_fault(struct task_struct *tsk, struct mm_struct *mm,
 	struct vm_area_struct *vma;
 	vm_fault_t ret, major = 0;
 
+	address = untagged_addr(address);
+
 	if (unlocked)
 		fault_flags |= FAULT_FLAG_ALLOW_RETRY;
 
-- 
2.21.0.225.g810b269d1ac-goog
