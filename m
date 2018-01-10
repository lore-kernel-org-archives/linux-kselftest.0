From: shuahkh@osg.samsung.com (Shuah Khan)
Date: Wed, 10 Jan 2018 09:35:37 -0700
Subject: [Linux-kselftest-mirror] [PATCH] selftests: gen_kselftest_tar.h:
	Add SPDX license identifier
In-Reply-To: <20180110163540.8396-1-shuahkh@osg.samsung.com>
References: <20180110163540.8396-1-shuahkh@osg.samsung.com>
Message-ID: <20180110163540.8396-3-shuahkh@osg.samsung.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180110163537.gGvBZNQK_r-e2CBRDWsb6eQYcOZMrVUPW7wgJSYElMk@z>

Replace GPL license statement with SPDX GPL-2.0 license identifier.

Signed-off-by: Shuah Khan <shuahkh at osg.samsung.com>
---
 tools/testing/selftests/gen_kselftest_tar.sh | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/tools/testing/selftests/gen_kselftest_tar.sh b/tools/testing/selftests/gen_kselftest_tar.sh
index 17d5bd0c0936..a27e2eec3586 100755
--- a/tools/testing/selftests/gen_kselftest_tar.sh
+++ b/tools/testing/selftests/gen_kselftest_tar.sh
@@ -1,13 +1,11 @@
 #!/bin/bash
 #
+# SPDX-License-Identifier: GPL-2.0
 # gen_kselftest_tar
 # Generate kselftest tarball
 # Author: Shuah Khan <shuahkh at osg.samsung.com>
 # Copyright (C) 2015 Samsung Electronics Co., Ltd.
 
-# This software may be freely redistributed under the terms of the GNU
-# General Public License (GPLv2).
-
 # main
 main()
 {
-- 
2.14.1

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
