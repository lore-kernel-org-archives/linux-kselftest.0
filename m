From: shuahkh at osg.samsung.com (Shuah Khan)
Date: Thu, 11 Jan 2018 10:17:21 -0700
Subject: [Linux-kselftest-mirror] [PATCH v2] selftests: media_tests: Add
	SPDX license identifier
Message-ID: <20180111171721.19672-1-shuahkh@osg.samsung.com>

Replace GPL license statement with SPDX GPL-2.0 license identifier.

Signed-off-by: Shuah Khan <shuahkh at osg.samsung.com>
---
Changes since v1:
- Use corect comment format for SPDX license

 tools/testing/selftests/media_tests/media_device_open.c | 3 ++-
 tools/testing/selftests/media_tests/media_device_test.c | 3 ++-
 tools/testing/selftests/media_tests/video_device_test.c | 3 ++-
 3 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/tools/testing/selftests/media_tests/media_device_open.c b/tools/testing/selftests/media_tests/media_device_open.c
index 44343c091a20..a5ce5434bafd 100644
--- a/tools/testing/selftests/media_tests/media_device_open.c
+++ b/tools/testing/selftests/media_tests/media_device_open.c
@@ -1,10 +1,11 @@
+// SPDX-License-Identifier: GPL-2.0
+
 /*
  * media_device_open.c - Media Controller Device Open Test
  *
  * Copyright (c) 2016 Shuah Khan <shuahkh at osg.samsung.com>
  * Copyright (c) 2016 Samsung Electronics Co., Ltd.
  *
- * This file is released under the GPLv2.
  */
 
 /*
diff --git a/tools/testing/selftests/media_tests/media_device_test.c b/tools/testing/selftests/media_tests/media_device_test.c
index 5d49943e77d0..421a367e4bb3 100644
--- a/tools/testing/selftests/media_tests/media_device_test.c
+++ b/tools/testing/selftests/media_tests/media_device_test.c
@@ -1,10 +1,11 @@
+// SPDX-License-Identifier: GPL-2.0
+
 /*
  * media_device_test.c - Media Controller Device ioctl loop Test
  *
  * Copyright (c) 2016 Shuah Khan <shuahkh at osg.samsung.com>
  * Copyright (c) 2016 Samsung Electronics Co., Ltd.
  *
- * This file is released under the GPLv2.
  */
 
 /*
diff --git a/tools/testing/selftests/media_tests/video_device_test.c b/tools/testing/selftests/media_tests/video_device_test.c
index 66d419c28653..0f6aef2e2593 100644
--- a/tools/testing/selftests/media_tests/video_device_test.c
+++ b/tools/testing/selftests/media_tests/video_device_test.c
@@ -1,10 +1,11 @@
+// SPDX-License-Identifier: GPL-2.0
+
 /*
  * video_device_test - Video Device Test
  *
  * Copyright (c) 2016 Shuah Khan <shuahkh at osg.samsung.com>
  * Copyright (c) 2016 Samsung Electronics Co., Ltd.
  *
- * This file is released under the GPLv2.
  */
 
 /*
-- 
2.14.1

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
