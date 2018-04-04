From: ben.hutchings at codethink.co.uk (Ben Hutchings)
Date: Wed, 4 Apr 2018 22:38:49 +0200
Subject: [PATCH driver-core 2/2] test_firmware: fix setting old custom fw
 path back on exit, second try
In-Reply-To: <20180404203712.zecit6po44qsde4c@xylophone.i.decadent.org.uk>
References: <20180404203712.zecit6po44qsde4c@xylophone.i.decadent.org.uk>
Message-ID: <20180404203848.3txsangsvaxtxsu4@xylophone.i.decadent.org.uk>

Commit 65c79230576 tried to clear the custom firmware path on exit by
writing a single space to the firmware_class.path parameter.  This
doesn't work because nothing strips this space from the value stored
and fw_get_filesystem_firmware() only ignores zero-length paths.

Instead, write a null byte.

Fixes: 0a8adf58475 ("test: add firmware_class loader test")
Fixes: 65c79230576 ("test_firmware: fix setting old custom fw path back on exit")
Signed-off-by: Ben Hutchings <ben.hutchings at codethink.co.uk>
---
 tools/testing/selftests/firmware/fw_lib.sh | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/tools/testing/selftests/firmware/fw_lib.sh b/tools/testing/selftests/firmware/fw_lib.sh
index 9ea31b57d71a..962d7f4ac627 100755
--- a/tools/testing/selftests/firmware/fw_lib.sh
+++ b/tools/testing/selftests/firmware/fw_lib.sh
@@ -154,11 +154,13 @@ test_finish()
 	if [ "$HAS_FW_LOADER_USER_HELPER" = "yes" ]; then
 		echo "$OLD_TIMEOUT" >/sys/class/firmware/timeout
 	fi
-	if [ "$OLD_FWPATH" = "" ]; then
-		OLD_FWPATH=" "
-	fi
 	if [ "$TEST_REQS_FW_SET_CUSTOM_PATH" = "yes" ]; then
-		echo -n "$OLD_FWPATH" >/sys/module/firmware_class/parameters/path
+		if [ "$OLD_FWPATH" = "" ]; then
+			# A zero-length write won't work; write a null byte
+			printf '\000' >/sys/module/firmware_class/parameters/path
+		else
+			echo -n "$OLD_FWPATH" >/sys/module/firmware_class/parameters/path
+		fi
 	fi
 	if [ -f $FW ]; then
 		rm -f "$FW"
-- 
2.16.2

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
