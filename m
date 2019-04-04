From: brendanhiggins at google.com (Brendan Higgins)
Date: Thu,  4 Apr 2019 15:06:50 -0700
Subject: [PATCH v1 15/17] MAINTAINERS: add entry for KUnit the unit testing
 framework
In-Reply-To: <20190404220652.19765-1-brendanhiggins@google.com>
References: <20190404220652.19765-1-brendanhiggins@google.com>
Message-ID: <20190404220652.19765-16-brendanhiggins@google.com>

Add myself as maintainer of KUnit, the Linux kernel's unit testing
framework.

Signed-off-by: Brendan Higgins <brendanhiggins at google.com>
---
 MAINTAINERS | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 3e5a5d263f299..fc2cedbd9b43e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -8448,6 +8448,16 @@ S:	Maintained
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
2.21.0.392.gf8f6787159e-goog
