From: logang@deltatee.com (Logan Gunthorpe)
Date: Thu, 21 Mar 2019 18:06:40 -0600
Subject: [PATCH v3 05/10] NTB: Rename ntb.c to support multiple source files
 in the module
In-Reply-To: <20190322000645.15580-1-logang@deltatee.com>
References: <20190322000645.15580-1-logang@deltatee.com>
Message-ID: <20190322000645.15580-6-logang@deltatee.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190322000640.Qgwrz6gnL40So8s3u0f9nsM1QRyJcA0qA0GcC4uSam8@z>

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
