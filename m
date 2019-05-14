From: brendanhiggins at google.com (Brendan Higgins)
Date: Tue, 14 May 2019 15:17:11 -0700
Subject: [PATCH v4 18/18] MAINTAINERS: add proc sysctl KUnit test to PROC
 SYSCTL section
In-Reply-To: <20190514221711.248228-1-brendanhiggins@google.com>
References: <20190514221711.248228-1-brendanhiggins@google.com>
Message-ID: <20190514221711.248228-19-brendanhiggins@google.com>

Add entry for the new proc sysctl KUnit test to the PROC SYSCTL section.

Signed-off-by: Brendan Higgins <brendanhiggins at google.com>
Reviewed-by: Greg Kroah-Hartman <gregkh at linuxfoundation.org>
Reviewed-by: Logan Gunthorpe <logang at deltatee.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 8a91887c8d541..2e539647589fd 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -12526,6 +12526,7 @@ S:	Maintained
 F:	fs/proc/proc_sysctl.c
 F:	include/linux/sysctl.h
 F:	kernel/sysctl.c
+F:	kernel/sysctl-test.c
 F:	tools/testing/selftests/sysctl/
 
 PS3 NETWORK SUPPORT
-- 
2.21.0.1020.gf2820cf01a-goog
