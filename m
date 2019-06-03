From: andreyknvl@google.com (Andrey Konovalov)
Date: Mon,  3 Jun 2019 18:55:06 +0200
Subject: [PATCH v16 04/16] mm: untag user pointers in do_pages_move
In-Reply-To: <cover.1559580831.git.andreyknvl@google.com>
References: <cover.1559580831.git.andreyknvl@google.com>
Message-ID:
 <e410843d00a4ecd7e525a7a949e605ffc6c394c4.1559580831.git.andreyknvl@google.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190603165506.pdbmNLPNAHLa1qjFiVHd15f9sDzYhFF-ehrp7DUEAkk@z>

This patch is a part of a series that extends arm64 kernel ABI to allow to
pass tagged user pointers (with the top byte set to something else other
than 0x00) as syscall arguments.

do_pages_move() is used in the implementation of the move_pages syscall.

Untag user pointers in this function.

Reviewed-by: Catalin Marinas <catalin.marinas at arm.com>
Signed-off-by: Andrey Konovalov <andreyknvl at google.com>
---
 mm/migrate.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/mm/migrate.c b/mm/migrate.c
index f2ecc2855a12..3930bb6fa656 100644
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
2.22.0.rc1.311.g5d7573a151-goog
