From: brendanhiggins at google.com (Brendan Higgins)
Date: Wed, 28 Nov 2018 11:36:23 -0800
Subject: [RFC v3 06/19] arch: um: enable running kunit from User Mode Linux
In-Reply-To: <20181128193636.254378-1-brendanhiggins@google.com>
References: <20181128193636.254378-1-brendanhiggins@google.com>
Message-ID: <20181128193636.254378-7-brendanhiggins@google.com>

Make minimum number of changes outside of the KUnit directories for
KUnit to build and run using UML.

Signed-off-by: Brendan Higgins <brendanhiggins at google.com>
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
index 69fa5c0310d83..197f01cbddf03 100644
--- a/Makefile
+++ b/Makefile
@@ -966,7 +966,7 @@ endif
 
 
 ifeq ($(KBUILD_EXTMOD),)
-core-y		+= kernel/ certs/ mm/ fs/ ipc/ security/ crypto/ block/
+core-y		+= kernel/ certs/ mm/ fs/ ipc/ security/ crypto/ block/ kunit/
 
 vmlinux-dirs	:= $(patsubst %/,%,$(filter %/, $(init-y) $(init-m) \
 		     $(core-y) $(core-m) $(drivers-y) $(drivers-m) \
-- 
2.20.0.rc0.387.gc7a69e6b6c-goog
