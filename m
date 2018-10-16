From: brendanhiggins at google.com (Brendan Higgins)
Date: Tue, 16 Oct 2018 16:50:55 -0700
Subject: [RFC v1 06/31] arch: um: enabled running kunit from User Mode Linux
In-Reply-To: <20181016235120.138227-1-brendanhiggins@google.com>
References: <20181016235120.138227-1-brendanhiggins@google.com>
Message-ID: <20181016235120.138227-7-brendanhiggins@google.com>

Makes minimum number of changes outside of the KUnit directories for
KUnit to build and run using UML.

Signed-off-by: Brendan Higgins <brendanhiggins at google.com>
---
 Makefile             | 2 +-
 arch/um/Kconfig.rest | 3 +++
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index 863f58503beed..c8e659468ed49 100644
--- a/Makefile
+++ b/Makefile
@@ -944,7 +944,7 @@ endif
 
 
 ifeq ($(KBUILD_EXTMOD),)
-core-y		+= kernel/ certs/ mm/ fs/ ipc/ security/ crypto/ block/
+core-y		+= kernel/ certs/ mm/ fs/ ipc/ security/ crypto/ block/ kunit/
 
 vmlinux-dirs	:= $(patsubst %/,%,$(filter %/, $(init-y) $(init-m) \
 		     $(core-y) $(core-m) $(drivers-y) $(drivers-m) \
diff --git a/arch/um/Kconfig.rest b/arch/um/Kconfig.rest
index 08327b9c0cbea..484c4cfcad1ef 100644
--- a/arch/um/Kconfig.rest
+++ b/arch/um/Kconfig.rest
@@ -1,4 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0
+
+source "kunit/Kconfig"
+
 source "init/Kconfig"
 
 source "kernel/Kconfig.freezer"
-- 
2.19.1.331.ge82ca0e54c-goog
