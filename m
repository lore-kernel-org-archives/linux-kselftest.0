From: shuahkh@osg.samsung.com (Shuah Khan)
Date: Wed, 10 Jan 2018 09:35:38 -0700
Subject: [Linux-kselftest-mirror] [PATCH] selftests: kselftest.h: Add SPDX
	license identifier
In-Reply-To: <20180110163540.8396-1-shuahkh@osg.samsung.com>
References: <20180110163540.8396-1-shuahkh@osg.samsung.com>
Message-ID: <20180110163540.8396-4-shuahkh@osg.samsung.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180110163538.CFDgL8s-woyIxIw6AqWfjxGILXA2-DQZ2-jwFZQAwb4@z>

Replace GPL license statement with SPDX GPL-2.0 license identifier.

Signed-off-by: Shuah Khan <shuahkh at osg.samsung.com>
---
 tools/testing/selftests/kselftest.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/kselftest.h b/tools/testing/selftests/kselftest.h
index 1ae565ed9bf0..1a52b03962a3 100644
--- a/tools/testing/selftests/kselftest.h
+++ b/tools/testing/selftests/kselftest.h
@@ -1,3 +1,4 @@
+/* SPDX-License-Identifier: GPL-2.0 */
 /*
  * kselftest.h:	kselftest framework return codes to include from
  *		selftests.
@@ -5,7 +6,6 @@
  * Copyright (c) 2014 Shuah Khan <shuahkh at osg.samsung.com>
  * Copyright (c) 2014 Samsung Electronics Co., Ltd.
  *
- * This file is released under the GPLv2.
  */
 #ifndef __KSELFTEST_H
 #define __KSELFTEST_H
-- 
2.14.1

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
