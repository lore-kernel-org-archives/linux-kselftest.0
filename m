From: shuah@kernel.org (Shuah Khan (Samsung OSG))
Date: Mon,  9 Jul 2018 13:07:04 -0600
Subject: [PATCH] selftests: usbip: remove test_bitmap noise
Message-ID: <20180709190704.20333-1-shuah@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180709190704.U-DBHYoaeDPJXBv5RUKw5_FttW89QxRB7oG_C0gO6h4@z>

Remove test_bitmap noise which is a result of cut and paste error.
There is no need for this modprobe -q -r test_bitmap noise in this
test.

Signed-off-by: Shuah Khan (Samsung OSG) <shuah at kernel.org>
---
 tools/testing/selftests/drivers/usb/usbip/usbip_test.sh | 2 --
 1 file changed, 2 deletions(-)

diff --git a/tools/testing/selftests/drivers/usb/usbip/usbip_test.sh b/tools/testing/selftests/drivers/usb/usbip/usbip_test.sh
index 1893d0f59ad7..a72df93cf1f8 100755
--- a/tools/testing/selftests/drivers/usb/usbip/usbip_test.sh
+++ b/tools/testing/selftests/drivers/usb/usbip/usbip_test.sh
@@ -46,7 +46,6 @@ if ! /sbin/modprobe -q -n usbip_host; then
 fi
 
 if /sbin/modprobe -q usbip_host; then
-	/sbin/modprobe -q -r test_bitmap
 	echo "usbip_test: module usbip_host is loaded [OK]"
 else
 	echo "usbip_test: module usbip_host failed to load [FAIL]"
@@ -56,7 +55,6 @@ fi
 
 echo "Load vhci_hcd module"
 if /sbin/modprobe -q vhci_hcd; then
-	/sbin/modprobe -q -r test_bitmap
 	echo "usbip_test: module vhci_hcd is loaded [OK]"
 else
 	echo "usbip_test: module vhci_hcd failed to load [FAIL]"
-- 
2.17.0

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
