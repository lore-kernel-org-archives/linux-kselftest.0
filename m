From: brendanhiggins@google.com (Brendan Higgins)
Date: Thu,  4 Apr 2019 15:06:52 -0700
Subject: [PATCH v1 17/17] MAINTAINERS: add proc sysctl KUnit test to PROC
 SYSCTL section
In-Reply-To: <20190404220652.19765-1-brendanhiggins@google.com>
References: <20190404220652.19765-1-brendanhiggins@google.com>
Message-ID: <20190404220652.19765-18-brendanhiggins@google.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190404220652.PCOE44jkZyzRCCACS0W7Wm53nHwmVkRyeZIBC7QigD0@z>

Add entry for the new proc sysctl KUnit test to the PROC SYSCTL section.

Signed-off-by: Brendan Higgins <brendanhiggins at google.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index fc2cedbd9b43e..03054e4c6386c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -12523,6 +12523,7 @@ S:	Maintained
 F:	fs/proc/proc_sysctl.c
 F:	include/linux/sysctl.h
 F:	kernel/sysctl.c
+F:	kernel/sysctl-test.c
 F:	tools/testing/selftests/sysctl/
 
 PS3 NETWORK SUPPORT
-- 
2.21.0.392.gf8f6787159e-goog
