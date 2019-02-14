From: brendanhiggins@google.com (Brendan Higgins)
Date: Thu, 14 Feb 2019 13:37:26 -0800
Subject: [RFC v4 14/17] MAINTAINERS: add entry for KUnit the unit testing
 framework
In-Reply-To: <20190214213729.21702-1-brendanhiggins@google.com>
References: <20190214213729.21702-1-brendanhiggins@google.com>
Message-ID: <20190214213729.21702-15-brendanhiggins@google.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190214213726.Ebs7m49ym8yXyAsuq482FjuLeP0nM9CIySjv6w6gJnI@z>

Add myself as maintainer of KUnit, the Linux kernel's unit testing
framework.

Signed-off-by: Brendan Higgins <brendanhiggins at google.com>
---
 MAINTAINERS | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 8c68de3cfd80e..ff2cc9fcb49ad 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -8267,6 +8267,16 @@ S:	Maintained
 F:	tools/testing/selftests/
 F:	Documentation/dev-tools/kselftest*
 
+KERNEL UNIT TESTING FRAMEWORK (KUnit)
+M:	Brendan Higgins <brendanhiggins at google.com>
+L:	kunit-dev at googlegroups.com
+W:	https://google.github.io/kunit-docs/third_party/kernel/docs/
+S:	Maintained
+F:	Documentation/kunit/
+F:	include/kunit/
+F:	kunit/
+F:	tools/testing/kunit/
+
 KERNEL USERMODE HELPER
 M:	Luis Chamberlain <mcgrof at kernel.org>
 L:	linux-kernel at vger.kernel.org
-- 
2.21.0.rc0.258.g878e2cd30e-goog
