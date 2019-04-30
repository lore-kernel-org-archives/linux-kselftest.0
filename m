From: andreyknvl@google.com (Andrey Konovalov)
Date: Tue, 30 Apr 2019 15:25:08 +0200
Subject: [PATCH v14 12/17] drm/radeon, arm64: untag user pointers
In-Reply-To: <cover.1556630205.git.andreyknvl@google.com>
References: <cover.1556630205.git.andreyknvl@google.com>
Message-ID:
 <9a50ef07d927cbccd9620894bda825e551168c3d.1556630205.git.andreyknvl@google.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190430132508.Tjjp3VMpySZOpr8q-6eyGHwwW2iZOlIOoSnUsY9tTNI@z>

This patch is a part of a series that extends arm64 kernel ABI to allow to
pass tagged user pointers (with the top byte set to something else other
than 0x00) as syscall arguments.

radeon_ttm_tt_pin_userptr() uses provided user pointers for vma
lookups, which can only by done with untagged pointers. This patch
untags user pointers when they are being set in
radeon_ttm_tt_pin_userptr().

In amdgpu_gem_userptr_ioctl() an MMU notifier is set up with a (tagged)
userspace pointer. The untagged address should be used so that MMU
notifiers for the untagged address get correctly matched up with the right
BO. This patch untags user pointers in radeon_gem_userptr_ioctl().

Signed-off-by: Andrey Konovalov <andreyknvl at google.com>
---
 drivers/gpu/drm/radeon/radeon_gem.c | 2 ++
 drivers/gpu/drm/radeon/radeon_ttm.c | 2 +-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/radeon/radeon_gem.c b/drivers/gpu/drm/radeon/radeon_gem.c
index 44617dec8183..90eb78fb5eb2 100644
--- a/drivers/gpu/drm/radeon/radeon_gem.c
+++ b/drivers/gpu/drm/radeon/radeon_gem.c
@@ -291,6 +291,8 @@ int radeon_gem_userptr_ioctl(struct drm_device *dev, void *data,
 	uint32_t handle;
 	int r;
 
+	args->addr = untagged_addr(args->addr);
+
 	if (offset_in_page(args->addr | args->size))
 		return -EINVAL;
 
diff --git a/drivers/gpu/drm/radeon/radeon_ttm.c b/drivers/gpu/drm/radeon/radeon_ttm.c
index 9920a6fc11bf..dce722c494c1 100644
--- a/drivers/gpu/drm/radeon/radeon_ttm.c
+++ b/drivers/gpu/drm/radeon/radeon_ttm.c
@@ -742,7 +742,7 @@ int radeon_ttm_tt_set_userptr(struct ttm_tt *ttm, uint64_t addr,
 	if (gtt == NULL)
 		return -EINVAL;
 
-	gtt->userptr = addr;
+	gtt->userptr = untagged_addr(addr);
 	gtt->usermm = current->mm;
 	gtt->userflags = flags;
 	return 0;
-- 
2.21.0.593.g511ec345e18-goog
