From: andreyknvl@google.com (Andrey Konovalov)
Date: Mon,  3 Jun 2019 18:55:13 +0200
Subject: [PATCH v16 11/16] drm/radeon,
 arm64: untag user pointers in radeon_gem_userptr_ioctl
In-Reply-To: <cover.1559580831.git.andreyknvl@google.com>
References: <cover.1559580831.git.andreyknvl@google.com>
Message-ID:
 <f293884fad5f741b9202a9db6006f4bfdaedc2bd.1559580831.git.andreyknvl@google.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190603165513.0wRCG8oQrvwAfuEkFVh0jdb6MJF72yp79XWsaqubzLY@z>

This patch is a part of a series that extends arm64 kernel ABI to allow to
pass tagged user pointers (with the top byte set to something else other
than 0x00) as syscall arguments.

In radeon_gem_userptr_ioctl() an MMU notifier is set up with a (tagged)
userspace pointer. The untagged address should be used so that MMU
notifiers for the untagged address get correctly matched up with the right
BO. This funcation also calls radeon_ttm_tt_pin_userptr(), which uses
provided user pointers for vma lookups, which can only by done with
untagged pointers.

This patch untags user pointers in radeon_gem_userptr_ioctl().

Suggested-by: Kuehling, Felix <Felix.Kuehling at amd.com>
Acked-by: Felix Kuehling <Felix.Kuehling at amd.com>
Signed-off-by: Andrey Konovalov <andreyknvl at google.com>
---
 drivers/gpu/drm/radeon/radeon_gem.c | 2 ++
 1 file changed, 2 insertions(+)

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
 
-- 
2.22.0.rc1.311.g5d7573a151-goog
