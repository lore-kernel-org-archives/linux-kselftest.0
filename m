From: labbott@redhat.com (Laura Abbott)
Date: Thu, 15 Feb 2018 17:24:45 -0800
Subject: [PATCH 2/2] selftests: ion: Add simple test with the vgem driver
In-Reply-To: <20180216012445.17264-1-labbott@redhat.com>
References: <20180216012445.17264-1-labbott@redhat.com>
Message-ID: <20180216012445.17264-3-labbott@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180216012445.VOjV52xciSFgUKjjza2Lup18ChjoOlypkEKu6jyxczc@z>

Ion is designed to be a framework used by other clients who perform
operations on the buffer. Use the DRM vgem client as a simple consumer.
In conjunction with the dma-buf sync ioctls, this tests the full attach/map
path for the system heap.

Signed-off-by: Laura Abbott <labbott at redhat.com>
---
 tools/testing/selftests/android/ion/Makefile      |   3 +-
 tools/testing/selftests/android/ion/config        |   1 +
 tools/testing/selftests/android/ion/ionmap_test.c | 136 ++++++++++++++++++++++
 3 files changed, 139 insertions(+), 1 deletion(-)
 create mode 100644 tools/testing/selftests/android/ion/ionmap_test.c

diff --git a/tools/testing/selftests/android/ion/Makefile b/tools/testing/selftests/android/ion/Makefile
index 96e0c448b39d..d23b6d537d8b 100644
--- a/tools/testing/selftests/android/ion/Makefile
+++ b/tools/testing/selftests/android/ion/Makefile
@@ -2,7 +2,7 @@
 INCLUDEDIR := -I. -I../../../../../drivers/staging/android/uapi/
 CFLAGS := $(CFLAGS) $(INCLUDEDIR) -Wall -O2 -g
 
-TEST_GEN_FILES := ionapp_export ionapp_import
+TEST_GEN_FILES := ionapp_export ionapp_import ionmap_test
 
 all: $(TEST_GEN_FILES)
 
@@ -14,3 +14,4 @@ include ../../lib.mk
 
 $(OUTPUT)/ionapp_export: ionapp_export.c ipcsocket.c ionutils.c
 $(OUTPUT)/ionapp_import: ionapp_import.c ipcsocket.c ionutils.c
+$(OUTPUT)/ionmap_test: ionmap_test.c ionutils.c
diff --git a/tools/testing/selftests/android/ion/config b/tools/testing/selftests/android/ion/config
index 19db6ca9aa2b..b4ad748a9dd9 100644
--- a/tools/testing/selftests/android/ion/config
+++ b/tools/testing/selftests/android/ion/config
@@ -2,3 +2,4 @@ CONFIG_ANDROID=y
 CONFIG_STAGING=y
 CONFIG_ION=y
 CONFIG_ION_SYSTEM_HEAP=y
+CONFIG_DRM_VGEM=y
diff --git a/tools/testing/selftests/android/ion/ionmap_test.c b/tools/testing/selftests/android/ion/ionmap_test.c
new file mode 100644
index 000000000000..dab36b06b37d
--- /dev/null
+++ b/tools/testing/selftests/android/ion/ionmap_test.c
@@ -0,0 +1,136 @@
+#include <errno.h>
+#include <fcntl.h>
+#include <stdio.h>
+#include <stdint.h>
+#include <string.h>
+#include <unistd.h>
+
+#include <sys/ioctl.h>
+#include <sys/types.h>
+#include <sys/stat.h>
+
+#include <linux/dma-buf.h>
+
+#include <drm/drm.h>
+
+#include "ion.h"
+#include "ionutils.h"
+
+int check_vgem(int fd)
+{
+	drm_version_t version = { 0 };
+	char name[5];
+	int ret;
+
+	version.name_len = 4;
+	version.name = name;
+
+	ret = ioctl(fd, DRM_IOCTL_VERSION, &version);
+	if (ret)
+		return 1;
+
+	return strcmp(name, "vgem");
+}
+
+int open_vgem(void)
+{
+	int i, fd;
+	const char *drmstr = "/dev/dri/card";
+
+	fd = -1;
+	for (i = 0; i < 16; i++) {
+		char name[80];
+
+		sprintf(name, "%s%u", drmstr, i);
+
+		fd = open(name, O_RDWR);
+		if (fd < 0)
+			continue;
+
+		if (check_vgem(fd)) {
+			close(fd);
+			continue;
+		} else {
+			break;
+		}
+
+	}
+	return fd;
+}
+
+int import_vgem_fd(int vgem_fd, int dma_buf_fd, uint32_t *handle)
+{
+	struct drm_prime_handle import_handle = { 0 };
+	int ret;
+
+	import_handle.fd = dma_buf_fd;
+	import_handle.flags = 0;
+	import_handle.handle = 0;
+
+	ret = ioctl(vgem_fd, DRM_IOCTL_PRIME_FD_TO_HANDLE, &import_handle);
+	if (ret == 0)
+		*handle = import_handle.handle;
+	return ret;
+}
+
+void close_handle(int vgem_fd, uint32_t handle)
+{
+	struct drm_gem_close close = { 0 };
+
+	close.handle = handle;
+	ioctl(vgem_fd, DRM_IOCTL_GEM_CLOSE, &close);
+}
+
+int main()
+{
+	int ret, vgem_fd;
+	struct ion_buffer_info info;
+	uint32_t handle = 0;
+	struct dma_buf_sync sync = { 0 };
+
+	info.heap_type = ION_HEAP_TYPE_SYSTEM;
+	info.heap_size = 4096;
+	info.flag_type = ION_FLAG_CACHED;
+
+	ret = ion_export_buffer_fd(&info);
+	if (ret < 0) {
+		printf("ion buffer alloc failed\n");
+		return -1;
+	}
+
+	vgem_fd = open_vgem();
+	if (vgem_fd < 0) {
+		ret = vgem_fd;
+		printf("Failed to open vgem\n");
+		goto out_ion;
+	}
+
+	ret = import_vgem_fd(vgem_fd, info.buffd, &handle);
+
+	if (ret < 0) {
+		printf("Failed to import buffer\n");
+		goto out_vgem;
+	}
+
+	sync.flags = DMA_BUF_SYNC_START | DMA_BUF_SYNC_RW;
+	ret = ioctl(info.buffd, DMA_BUF_IOCTL_SYNC, &sync);
+	if (ret)
+		printf("sync start failed %d\n", errno);
+
+	memset(info.buffer, 0xff, 4096);
+
+	sync.flags = DMA_BUF_SYNC_END | DMA_BUF_SYNC_RW;
+	ret = ioctl(info.buffd, DMA_BUF_IOCTL_SYNC, &sync);
+	if (ret)
+		printf("sync end failed %d\n", errno);
+
+	close_handle(vgem_fd, handle);
+	ret = 0;
+
+out_vgem:
+	close(vgem_fd);
+out_ion:
+	ion_close_buffer_fd(&info);
+	printf("done.\n");
+	return ret;
+}
-- 
2.14.3

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
