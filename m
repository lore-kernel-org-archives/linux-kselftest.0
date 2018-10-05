From: shuah at kernel.org (Shuah Khan (Samsung OSG))
Date: Fri,  5 Oct 2018 16:17:43 -0600
Subject: [PATCH] selftests: usbip: add wait after attach and before checking
 port status
Message-ID: <20181005221744.21605-1-shuah@kernel.org>

Add sleep between attach and "usbip port" check to make sure status is
updated. Running attach and query back shows incorrect status.

Signed-off-by: Shuah Khan (Samsung OSG) <shuah at kernel.org>
---
 tools/testing/selftests/drivers/usb/usbip/usbip_test.sh | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tools/testing/selftests/drivers/usb/usbip/usbip_test.sh b/tools/testing/selftests/drivers/usb/usbip/usbip_test.sh
index a72df93cf1f8..128f0ab24307 100755
--- a/tools/testing/selftests/drivers/usb/usbip/usbip_test.sh
+++ b/tools/testing/selftests/drivers/usb/usbip/usbip_test.sh
@@ -141,6 +141,10 @@ echo "Import devices from localhost - should work"
 src/usbip attach -r localhost -b $busid;
 echo "=============================================================="
 
+# Wait for sysfs file to be updated. Without this sleep, usbip port
+# shows no imported devices.
+sleep 3;
+
 echo "List imported devices - expect to see imported devices";
 src/usbip port;
 echo "=============================================================="
-- 
2.17.0
