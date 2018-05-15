From: shuah at kernel.org (Shuah Khan (Samsung OSG))
Date: Tue, 15 May 2018 10:44:27 -0600
Subject: [PATCH] MAINTAINERS: Add Q: entry to kselftest for patchwork project
Message-ID: <20180515164427.12201-1-shuah@kernel.org>

A new patchwork project is created to track kselftest patches. Update
the kselftest entry in the MAINTAINERS file adding Q: entry:

https://patchwork.kernel.org/project/linux-kselftest/list/

Signed-off-by: Shuah Khan (Samsung OSG) <shuah at kernel.org>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 58b9861ccf99..ab577593d80a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -7698,6 +7698,7 @@ KERNEL SELFTEST FRAMEWORK
 M:	Shuah Khan <shuah at kernel.org>
 L:	linux-kselftest at vger.kernel.org
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/shuah/linux-kselftest.git
+Q:	https://patchwork.kernel.org/project/linux-kselftest/list/
 S:	Maintained
 F:	tools/testing/selftests/
 F:	Documentation/dev-tools/kselftest*
-- 
2.14.1

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
