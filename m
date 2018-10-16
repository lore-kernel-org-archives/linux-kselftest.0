From: brendanhiggins at google.com (Brendan Higgins)
Date: Tue, 16 Oct 2018 16:51:20 -0700
Subject: [RFC v1 31/31] MAINTAINERS: add entry for KUnit the unit testing
 framework
In-Reply-To: <20181016235120.138227-1-brendanhiggins@google.com>
References: <20181016235120.138227-1-brendanhiggins@google.com>
Message-ID: <20181016235120.138227-32-brendanhiggins@google.com>

Added myself as maintainer of KUnit, the Linux kernel's unit testing
framework.

Signed-off-by: Brendan Higgins <brendanhiggins at google.com>
---
 MAINTAINERS | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 544cac829cf44..9c3d34f0062ad 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -7801,6 +7801,21 @@ S:	Maintained
 F:	tools/testing/selftests/
 F:	Documentation/dev-tools/kselftest*
 
+KERNEL UNIT TESTING FRAMEWORK (KUnit)
+M:	Brendan Higgins <brendanhiggins at google.com>
+L:	kunit-dev at googlegroups.com
+W:	https://google.github.io/kunit-docs/third_party/kernel/docs/
+S:	Maintained
+F:	Documentation/kunit/
+F:	arch/um/include/asm/io-mock-shared.h
+F:	arch/um/include/asm/io-mock.h
+F:	arch/um/kernel/io-mock.c
+F:	drivers/base/platform-mock.c
+F:	include/linux/platform_device_mock.h
+F:	include/kunit/
+F:	kunit/
+F:	tools/testing/kunit/
+
 KERNEL USERMODE HELPER
 M:	"Luis R. Rodriguez" <mcgrof at kernel.org>
 L:	linux-kernel at vger.kernel.org
-- 
2.19.1.331.ge82ca0e54c-goog
