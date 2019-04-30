From: andreyknvl@google.com (Andrey Konovalov)
Date: Tue, 30 Apr 2019 15:25:02 +0200
Subject: [PATCH v14 06/17] mm: untag user pointers in do_pages_move
In-Reply-To: <cover.1556630205.git.andreyknvl@google.com>
References: <cover.1556630205.git.andreyknvl@google.com>
Message-ID:
 <80f7d6a2f68adb1c41ef5baf8973537380c681b0.1556630205.git.andreyknvl@google.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190430132502.m9dGEiFEJJ0SW6wUGZ-TdbKcjRXdR6QuZd8-wEOLaho@z>

This patch is a part of a series that extends arm64 kernel ABI to allow to
pass tagged user pointers (with the top byte set to something else other
than 0x00) as syscall arguments.

do_pages_move() is used in the implementation of the move_pages syscall.

Untag user pointers in this function.

Signed-off-by: Andrey Konovalov <andreyknvl at google.com>
---
 mm/migrate.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/mm/migrate.c b/mm/migrate.c
index 663a5449367a..c014a07135f0 100644
--- a/mm/migrate.c
+++ b/mm/migrate.c
@@ -1617,6 +1617,7 @@ static int do_pages_move(struct mm_struct *mm, nodemask_t task_nodes,
 		if (get_user(node, nodes + i))
 			goto out_flush;
 		addr = (unsigned long)p;
+		addr = untagged_addr(addr);
 
 		err = -ENODEV;
 		if (node < 0 || node >= MAX_NUMNODES)
-- 
2.21.0.593.g511ec345e18-goog
