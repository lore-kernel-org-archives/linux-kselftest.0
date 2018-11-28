From: brendanhiggins at google.com (Brendan Higgins)
Date: Wed, 28 Nov 2018 11:36:32 -0800
Subject: [RFC v3 15/19] MAINTAINERS: add entry for KUnit the unit testing
 framework
In-Reply-To: <20181128193636.254378-1-brendanhiggins@google.com>
References: <20181128193636.254378-1-brendanhiggins@google.com>
Message-ID: <20181128193636.254378-16-brendanhiggins@google.com>

Add myself as maintainer of KUnit, the Linux kernel's unit testing
framework.

Signed-off-by: Brendan Higgins <brendanhiggins at google.com>
---
 MAINTAINERS | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index b2f710eee67a7..8c9b56dbc9645 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -7988,6 +7988,16 @@ S:	Maintained
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
 M:	"Luis R. Rodriguez" <mcgrof at kernel.org>
 L:	linux-kernel at vger.kernel.org
-- 
2.20.0.rc0.387.gc7a69e6b6c-goog
