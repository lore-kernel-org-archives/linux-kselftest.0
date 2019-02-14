From: brendanhiggins at google.com (Brendan Higgins)
Date: Thu, 14 Feb 2019 13:37:18 -0800
Subject: [RFC v4 06/17] kbuild: enable building KUnit
In-Reply-To: <20190214213729.21702-1-brendanhiggins@google.com>
References: <20190214213729.21702-1-brendanhiggins@google.com>
Message-ID: <20190214213729.21702-7-brendanhiggins@google.com>

Add KUnit to root Kconfig and Makefile allowing it to actually be built.

Signed-off-by: Brendan Higgins <brendanhiggins at google.com>
---
Changes Since Last Version
 - Rewrote patch description. This was previously called "[RFC v3 06/19]
   arch: um: enable running kunit from User Mode Linux," which was
   incorrect since this patch does not have any UML specific bits in it.
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
index 3142e67d03f1b..d10308eb7f214 100644
--- a/Makefile
+++ b/Makefile
@@ -958,7 +958,7 @@ endif
 PHONY += prepare0
 
 ifeq ($(KBUILD_EXTMOD),)
-core-y		+= kernel/ certs/ mm/ fs/ ipc/ security/ crypto/ block/
+core-y		+= kernel/ certs/ mm/ fs/ ipc/ security/ crypto/ block/ kunit/
 
 vmlinux-dirs	:= $(patsubst %/,%,$(filter %/, $(init-y) $(init-m) \
 		     $(core-y) $(core-m) $(drivers-y) $(drivers-m) \
-- 
2.21.0.rc0.258.g878e2cd30e-goog
