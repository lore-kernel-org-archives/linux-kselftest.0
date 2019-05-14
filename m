From: brendanhiggins@google.com (Brendan Higgins)
Date: Tue, 14 May 2019 15:16:59 -0700
Subject: [PATCH v4 06/18] kbuild: enable building KUnit
In-Reply-To: <20190514221711.248228-1-brendanhiggins@google.com>
References: <20190514221711.248228-1-brendanhiggins@google.com>
Message-ID: <20190514221711.248228-7-brendanhiggins@google.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190514221659.hU8uYKRDYoMX6P7XFyE1BXBUysc-DB7DKWhA_OsNSpM@z>

KUnit is a new unit testing framework for the kernel and when used is
built into the kernel as a part of it. Add KUnit to the root Kconfig and
Makefile to allow it to be actually built.

Signed-off-by: Brendan Higgins <brendanhiggins at google.com>
Reviewed-by: Greg Kroah-Hartman <gregkh at linuxfoundation.org>
Reviewed-by: Logan Gunthorpe <logang at deltatee.com>
---
 Kconfig  | 2 ++
 Makefile | 2 +-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/Kconfig b/Kconfig
index 48a80beab6853..10428501edb78 100644
--- a/Kconfig
+++ b/Kconfig
@@ -30,3 +30,5 @@ source "crypto/Kconfig"
 source "lib/Kconfig"
 
 source "lib/Kconfig.debug"
+
+source "kunit/Kconfig"
diff --git a/Makefile b/Makefile
index 26c92f892d24b..2ea87a8fe770d 100644
--- a/Makefile
+++ b/Makefile
@@ -969,7 +969,7 @@ endif
 PHONY += prepare0
 
 ifeq ($(KBUILD_EXTMOD),)
-core-y		+= kernel/ certs/ mm/ fs/ ipc/ security/ crypto/ block/
+core-y		+= kernel/ certs/ mm/ fs/ ipc/ security/ crypto/ block/ kunit/
 
 vmlinux-dirs	:= $(patsubst %/,%,$(filter %/, $(init-y) $(init-m) \
 		     $(core-y) $(core-m) $(drivers-y) $(drivers-m) \
-- 
2.21.0.1020.gf2820cf01a-goog
