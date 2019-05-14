From: brendanhiggins@google.com (Brendan Higgins)
Date: Mon, 13 May 2019 22:42:50 -0700
Subject: [PATCH v3 16/18] MAINTAINERS: add entry for KUnit the unit testing
 framework
In-Reply-To: <20190514054251.186196-1-brendanhiggins@google.com>
References: <20190514054251.186196-1-brendanhiggins@google.com>
Message-ID: <20190514054251.186196-17-brendanhiggins@google.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190514054250.XxhBA1TIjPo1G0g0-dIX5uQW5hFktO4hW9S3V9mfFg4@z>

Add myself as maintainer of KUnit, the Linux kernel's unit testing
framework.

Signed-off-by: Brendan Higgins <brendanhiggins at google.com>
Reviewed-by: Greg Kroah-Hartman <gregkh at linuxfoundation.org>
Reviewed-by: Logan Gunthorpe <logang at deltatee.com>
---
Changes Since Last Revision:
 - Added linux-kselftest@ as a mailing list entry for KUnit as requested
   by Shuah.
---
 MAINTAINERS | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 2c2fce72e694f..8a91887c8d541 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -8448,6 +8448,17 @@ S:	Maintained
 F:	tools/testing/selftests/
 F:	Documentation/dev-tools/kselftest*
 
+KERNEL UNIT TESTING FRAMEWORK (KUnit)
+M:	Brendan Higgins <brendanhiggins at google.com>
+L:	linux-kselftest at vger.kernel.org
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
2.21.0.1020.gf2820cf01a-goog
