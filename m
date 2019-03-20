From: andreyknvl at google.com (Andrey Konovalov)
Date: Wed, 20 Mar 2019 15:51:29 +0100
Subject: [PATCH v13 15/20] drm/radeon,
 arm64: untag user pointers in radeon_ttm_tt_pin_userptr
In-Reply-To: <cover.1553093420.git.andreyknvl@google.com>
References: <cover.1553093420.git.andreyknvl@google.com>
Message-ID: <038360a0a9dc0abaaaf3ad84a2d07fd544abce1a.1553093421.git.andreyknvl@google.com>

This patch is a part of a series that extends arm64 kernel ABI to allow to
pass tagged user pointers (with the top byte set to something else other
than 0x00) as syscall arguments.

radeon_ttm_tt_pin_userptr() uses provided user pointers for vma
lookups, which can only by done with untagged pointers.

Untag user pointers in this function.

Signed-off-by: Andrey Konovalov <andreyknvl at google.com>
---
 drivers/gpu/drm/radeon/radeon_ttm.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/radeon/radeon_ttm.c b/drivers/gpu/drm/radeon/radeon_ttm.c
index 9920a6fc11bf..872a98796117 100644
--- a/drivers/gpu/drm/radeon/radeon_ttm.c
+++ b/drivers/gpu/drm/radeon/radeon_ttm.c
@@ -497,9 +497,10 @@ static int radeon_ttm_tt_pin_userptr(struct ttm_tt *ttm)
 	if (gtt->userflags & RADEON_GEM_USERPTR_ANONONLY) {
 		/* check that we only pin down anonymous memory
 		   to prevent problems with writeback */
-		unsigned long end = gtt->userptr + ttm->num_pages * PAGE_SIZE;
+		unsigned long userptr = untagged_addr(gtt->userptr);
+		unsigned long end = userptr + ttm->num_pages * PAGE_SIZE;
 		struct vm_area_struct *vma;
-		vma = find_vma(gtt->usermm, gtt->userptr);
+		vma = find_vma(gtt->usermm, userptr);
 		if (!vma || vma->vm_file || vma->vm_end < end)
 			return -EPERM;
 	}
-- 
2.21.0.225.g810b269d1ac-goog
