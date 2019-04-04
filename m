From: brendanhiggins at google.com (Brendan Higgins)
Date: Thu,  4 Apr 2019 15:06:41 -0700
Subject: [PATCH v1 06/17] kbuild: enable building KUnit
In-Reply-To: <20190404220652.19765-1-brendanhiggins@google.com>
References: <20190404220652.19765-1-brendanhiggins@google.com>
Message-ID: <20190404220652.19765-7-brendanhiggins@google.com>

Add KUnit to root Kconfig and Makefile allowing it to actually be built.

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
index c0a34064c5744..639d353f98ca9 100644
--- a/Makefile
+++ b/Makefile
@@ -964,7 +964,7 @@ endif
 PHONY += prepare0
 
 ifeq ($(KBUILD_EXTMOD),)
-core-y		+= kernel/ certs/ mm/ fs/ ipc/ security/ crypto/ block/
+core-y		+= kernel/ certs/ mm/ fs/ ipc/ security/ crypto/ block/ kunit/
 
 vmlinux-dirs	:= $(patsubst %/,%,$(filter %/, $(init-y) $(init-m) \
 		     $(core-y) $(core-m) $(drivers-y) $(drivers-m) \
-- 
2.21.0.392.gf8f6787159e-goog
