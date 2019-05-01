From: brendanhiggins@google.com (Brendan Higgins)
Date: Wed,  1 May 2019 16:01:15 -0700
Subject: [PATCH v2 06/17] kbuild: enable building KUnit
In-Reply-To: <20190501230126.229218-1-brendanhiggins@google.com>
References: <20190501230126.229218-1-brendanhiggins@google.com>
Message-ID: <20190501230126.229218-7-brendanhiggins@google.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190501230115.2ws-zz0Wg3m34NmMfHgvc5u45-7R9CbZ_9i_DQA9N0M@z>

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
index 2b99679148dc7..77368f498d84c 100644
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
2.21.0.593.g511ec345e18-goog
