From: Babu.Moger at amd.com (Moger, Babu)
Date: Fri, 18 Jan 2019 18:27:14 +0000
Subject: [PATCH v5 10/13] selftests/resctrl: Add the test in MAINTAINERS
In-Reply-To: <20190118182646.16594-1-babu.moger@amd.com>
References: <20190118182646.16594-1-babu.moger@amd.com>
Message-ID: <20190118182646.16594-11-babu.moger@amd.com>

From: Fenghua Yu <fenghua.yu at intel.com>

The resctrl selftest will be maintained by RDT maintainers.

Signed-off-by: Fenghua Yu <fenghua.yu at intel.com>
Signed-off-by: Babu Moger <babu.moger at amd.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 32d44447..16359bc 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -12815,6 +12815,7 @@ S:	Supported
 F:	arch/x86/kernel/cpu/resctrl/
 F:	arch/x86/include/asm/resctrl_sched.h
 F:	Documentation/x86/resctrl*
+F:	tools/testing/selftests/resctrl/
 
 READ-COPY UPDATE (RCU)
 M:	"Paul E. McKenney" <paulmck at linux.ibm.com>
-- 
1.8.3.1
