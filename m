From: brendanhiggins@google.com (Brendan Higgins)
Date: Wed,  1 May 2019 16:01:26 -0700
Subject: [PATCH v2 17/17] MAINTAINERS: add proc sysctl KUnit test to PROC
 SYSCTL section
In-Reply-To: <20190501230126.229218-1-brendanhiggins@google.com>
References: <20190501230126.229218-1-brendanhiggins@google.com>
Message-ID: <20190501230126.229218-18-brendanhiggins@google.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190501230126.4J-99vKSdLAvNoyvAeY20CaMVOwac1tWn1x_iWeWFug@z>

Add entry for the new proc sysctl KUnit test to the PROC SYSCTL section.

Signed-off-by: Brendan Higgins <brendanhiggins at google.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index c78ae95c56b80..23cc97332c3d7 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -12524,6 +12524,7 @@ S:	Maintained
 F:	fs/proc/proc_sysctl.c
 F:	include/linux/sysctl.h
 F:	kernel/sysctl.c
+F:	kernel/sysctl-test.c
 F:	tools/testing/selftests/sysctl/
 
 PS3 NETWORK SUPPORT
-- 
2.21.0.593.g511ec345e18-goog
