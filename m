From: logang at deltatee.com (Logan Gunthorpe)
Date: Mon, 22 Apr 2019 15:05:23 -0600
Subject: [PATCH v4 05/10] NTB: Rename ntb.c to support multiple source files
 in the module
In-Reply-To: <20190422210528.15289-1-logang@deltatee.com>
References: <20190422210528.15289-1-logang@deltatee.com>
Message-ID: <20190422210528.15289-6-logang@deltatee.com>

The kbuild system does not support having multiple source files in
a module if one of those source files has the same name as the module.

Therefore, we must rename ntb.c to core.c, while the module remains
ntb.ko.

This is similar to the way the nvme modules are structured.

Signed-off-by: Logan Gunthorpe <logang at deltatee.com>
Cc: Jon Mason <jdmason at kudzu.us>
Cc: Dave Jiang <dave.jiang at intel.com>
Cc: Allen Hubbe <allenbh at gmail.com>
---
 drivers/ntb/Makefile          | 2 ++
 drivers/ntb/{ntb.c => core.c} | 0
 2 files changed, 2 insertions(+)
 rename drivers/ntb/{ntb.c => core.c} (100%)

diff --git a/drivers/ntb/Makefile b/drivers/ntb/Makefile
index 1921dec1949d..537226f8e78d 100644
--- a/drivers/ntb/Makefile
+++ b/drivers/ntb/Makefile
@@ -1,2 +1,4 @@
 obj-$(CONFIG_NTB) += ntb.o hw/ test/
 obj-$(CONFIG_NTB_TRANSPORT) += ntb_transport.o
+
+ntb-y := core.o
diff --git a/drivers/ntb/ntb.c b/drivers/ntb/core.c
similarity index 100%
rename from drivers/ntb/ntb.c
rename to drivers/ntb/core.c
-- 
2.20.1
