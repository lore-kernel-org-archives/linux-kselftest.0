From: brendanhiggins@google.com (Brendan Higgins)
Date: Wed,  1 May 2019 16:01:24 -0700
Subject: [PATCH v2 15/17] MAINTAINERS: add entry for KUnit the unit testing
 framework
In-Reply-To: <20190501230126.229218-1-brendanhiggins@google.com>
References: <20190501230126.229218-1-brendanhiggins@google.com>
Message-ID: <20190501230126.229218-16-brendanhiggins@google.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190501230124.-1bOXGVDag9a7ixV1gck7iBW56Mk7uuiV4HvQ6sSoro@z>

Add myself as maintainer of KUnit, the Linux kernel's unit testing
framework.

Signed-off-by: Brendan Higgins <brendanhiggins at google.com>
---
 MAINTAINERS | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 5c38f21aee787..c78ae95c56b80 100644
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
2.21.0.593.g511ec345e18-goog
