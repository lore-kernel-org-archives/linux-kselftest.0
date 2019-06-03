From: andreyknvl at google.com (Andrey Konovalov)
Date: Mon,  3 Jun 2019 18:55:09 +0200
Subject: [PATCH v16 07/16] mm, arm64: untag user pointers in get_vaddr_frames
In-Reply-To: <cover.1559580831.git.andreyknvl@google.com>
References: <cover.1559580831.git.andreyknvl@google.com>
Message-ID: <da1d0e0f6d69c15a12987379e372182f416cbc02.1559580831.git.andreyknvl@google.com>

This patch is a part of a series that extends arm64 kernel ABI to allow to
pass tagged user pointers (with the top byte set to something else other
than 0x00) as syscall arguments.

get_vaddr_frames uses provided user pointers for vma lookups, which can
only by done with untagged pointers. Instead of locating and changing
all callers of this function, perform untagging in it.

Signed-off-by: Andrey Konovalov <andreyknvl at google.com>
---
 mm/frame_vector.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/mm/frame_vector.c b/mm/frame_vector.c
index c64dca6e27c2..c431ca81dad5 100644
--- a/mm/frame_vector.c
+++ b/mm/frame_vector.c
@@ -46,6 +46,8 @@ int get_vaddr_frames(unsigned long start, unsigned int nr_frames,
 	if (WARN_ON_ONCE(nr_frames > vec->nr_allocated))
 		nr_frames = vec->nr_allocated;
 
+	start = untagged_addr(start);
+
 	down_read(&mm->mmap_sem);
 	locked = 1;
 	vma = find_vma_intersection(mm, start, start + 1);
-- 
2.22.0.rc1.311.g5d7573a151-goog
