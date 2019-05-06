From: andreyknvl@google.com (Andrey Konovalov)
Date: Mon,  6 May 2019 18:30:52 +0200
Subject: [PATCH v15 06/17] mm: untag user pointers in do_pages_move
In-Reply-To: <cover.1557160186.git.andreyknvl@google.com>
References: <cover.1557160186.git.andreyknvl@google.com>
Message-ID:
 <474b3c113edae1f2fa679dc7237ec070ff4efb70.1557160186.git.andreyknvl@google.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190506163052.YywHS3HvT65pI1r36oRm4n5JK5hY1k_M9wzBJMeiQnY@z>

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
2.21.0.1020.gf2820cf01a-goog
