From: skhan@linuxfoundation.org (Shuah Khan)
Date: Thu,  2 May 2019 13:47:40 -0600
Subject: [PATCH] selftests: add sleep between detach and usbip list -l
Message-ID: <20190502194740.15344-1-skhan@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190502194740.YVqXsRkew9lvPZ_UfQVa1hvbMn9BdAeBzH5rLefblIo@z>

Add a sleep between detach and check for exportable devices to avoid
the following segfault from libc-2.27.so

[ 6268.136108] usbip[5565]: segfault at 0 ip 00007f2a947bddfd sp 00007ffd1a8705e8 error 4 in libc-2.27.so[7f2a94703000+1e7000]

Signed-off-by: Shuah Khan <skhan at linuxfoundation.org>
---
 tools/testing/selftests/drivers/usb/usbip/usbip_test.sh | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tools/testing/selftests/drivers/usb/usbip/usbip_test.sh b/tools/testing/selftests/drivers/usb/usbip/usbip_test.sh
index 128f0ab24307..beacf24a8df7 100755
--- a/tools/testing/selftests/drivers/usb/usbip/usbip_test.sh
+++ b/tools/testing/selftests/drivers/usb/usbip/usbip_test.sh
@@ -171,10 +171,14 @@ echo "Detach invalid port tests - expect invalid port error message";
 src/usbip detach -p 100;
 echo "=============================================================="
 
+# let detach complete. Avoid segfaults from libc-2.27.so
+sleep 3;
+
 echo "Expect to see export-able devices";
 src/usbip list -l;
 echo "=============================================================="
 
+
 echo "Remove usbip_host module";
 rmmod usbip_host;
 
-- 
2.17.1
