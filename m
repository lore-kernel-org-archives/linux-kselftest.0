From: shuahkh@osg.samsung.com (Shuah Khan)
Date: Wed, 10 Jan 2018 09:35:40 -0700
Subject: [Linux-kselftest-mirror] [PATCH] selftests: media_tests: Add SPDX
	license identifier
In-Reply-To: <20180110163540.8396-1-shuahkh@osg.samsung.com>
References: <20180110163540.8396-1-shuahkh@osg.samsung.com>
Message-ID: <20180110163540.8396-6-shuahkh@osg.samsung.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180110163540.EjzvF1dDCs-A2w5VFeCCkkdzce59sHQUf9gQ9ZLRkZk@z>

Replace GPL license statement with SPDX GPL-2.0 license identifier.

Signed-off-by: Shuah Khan <shuahkh at osg.samsung.com>
---
 tools/testing/selftests/media_tests/media_device_open.c | 2 +-
 tools/testing/selftests/media_tests/media_device_test.c | 2 +-
 tools/testing/selftests/media_tests/video_device_test.c | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/tools/testing/selftests/media_tests/media_device_open.c b/tools/testing/selftests/media_tests/media_device_open.c
index 44343c091a20..2a53dd1328e1 100644
--- a/tools/testing/selftests/media_tests/media_device_open.c
+++ b/tools/testing/selftests/media_tests/media_device_open.c
@@ -1,10 +1,10 @@
+/* SPDX-License-Identifier: GPL-2.0 */
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
index 5d49943e77d0..d74d10283a35 100644
--- a/tools/testing/selftests/media_tests/media_device_test.c
+++ b/tools/testing/selftests/media_tests/media_device_test.c
@@ -1,10 +1,10 @@
+/* SPDX-License-Identifier: GPL-2.0 */
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
index 66d419c28653..81bac9b34028 100644
--- a/tools/testing/selftests/media_tests/video_device_test.c
+++ b/tools/testing/selftests/media_tests/video_device_test.c
@@ -1,10 +1,10 @@
+/* SPDX-License-Identifier: GPL-2.0 */
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
