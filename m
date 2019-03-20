From: andreyknvl at google.com (Andrey Konovalov)
Date: Wed, 20 Mar 2019 15:51:28 +0100
Subject: [PATCH v13 14/20] drm/amdgpu,
 arm64: untag user pointers in amdgpu_ttm_tt_get_user_pages
In-Reply-To: <cover.1553093420.git.andreyknvl@google.com>
References: <cover.1553093420.git.andreyknvl@google.com>
Message-ID: <017804b2198a906463d634f84777b6087c9b4a40.1553093421.git.andreyknvl@google.com>

This patch is a part of a series that extends arm64 kernel ABI to allow to
pass tagged user pointers (with the top byte set to something else other
than 0x00) as syscall arguments.

amdgpu_ttm_tt_get_user_pages() uses provided user pointers for vma
lookups, which can only by done with untagged pointers.

Untag user pointers in this function.

Signed-off-by: Andrey Konovalov <andreyknvl at google.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
index 73e71e61dc99..891b027fa33b 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
@@ -751,10 +751,11 @@ int amdgpu_ttm_tt_get_user_pages(struct ttm_tt *ttm, struct page **pages)
 		 * check that we only use anonymous memory to prevent problems
 		 * with writeback
 		 */
-		unsigned long end = gtt->userptr + ttm->num_pages * PAGE_SIZE;
+		unsigned long userptr = untagged_addr(gtt->userptr);
+		unsigned long end = userptr + ttm->num_pages * PAGE_SIZE;
 		struct vm_area_struct *vma;
 
-		vma = find_vma(mm, gtt->userptr);
+		vma = find_vma(mm, userptr);
 		if (!vma || vma->vm_file || vma->vm_end < end) {
 			up_read(&mm->mmap_sem);
 			return -EPERM;
-- 
2.21.0.225.g810b269d1ac-goog
