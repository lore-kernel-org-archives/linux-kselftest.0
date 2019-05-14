From: brendanhiggins@google.com (Brendan Higgins)
Date: Mon, 13 May 2019 22:42:39 -0700
Subject: [PATCH v3 06/18] kbuild: enable building KUnit
In-Reply-To: <20190514054251.186196-1-brendanhiggins@google.com>
References: <20190514054251.186196-1-brendanhiggins@google.com>
Message-ID: <20190514054251.186196-7-brendanhiggins@google.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190514054239.UYIKH5k5MZVIpKCvbxPqku31eZ-Qxu-PeFaQxq4HRmY@z>

Add KUnit to root Kconfig and Makefile allowing it to actually be built.

Signed-off-by: Brendan Higgins <brendanhiggins at google.com>
Reviewed-by: Greg Kroah-Hartman <gregkh at linuxfoundation.org>
Reviewed-by: Logan Gunthorpe <logang at deltatee.com>
---
Changes Since Last Revision:
 - Masahiro reported a number of issues here on the previous revision;
   however, all of the changes actually needed to happen on earlier or
   later patches.
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
