From: ben.hutchings at codethink.co.uk (Ben Hutchings)
Date: Tue, 3 Apr 2018 20:48:49 +0100
Subject: [PATCH] test_firmware: fix setting old custom fw path back on exit,
 second try
Message-ID: <20180403194849.csgzr3jllt4f2qb7@xylophone.i.decadent.org.uk>

Commit 65c79230576 tried to clear the custom firmware path on exit by
writing a single space to the firmware_class.path parameter.  This
doesn't work because nothing strips this space from the value stored
and fw_get_filesystem_firmware() only ignores zero-length paths.

Instead, write a null byte.

Fixes: 0a8adf58475 ("test: add firmware_class loader test")
Fixes: 65c79230576 ("test_firmware: fix setting old custom fw path back on exit")
Signed-off-by: Ben Hutchings <ben.hutchings at codethink.co.uk>
---
 tools/testing/selftests/firmware/fw_filesystem.sh | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/firmware/fw_filesystem.sh b/tools/testing/selftests/firmware/fw_filesystem.sh
index f9508e1a4058..6b63b6bf2661 100755
--- a/tools/testing/selftests/firmware/fw_filesystem.sh
+++ b/tools/testing/selftests/firmware/fw_filesystem.sh
@@ -46,9 +46,11 @@ test_finish()
 		echo "$OLD_TIMEOUT" >/sys/class/firmware/timeout
 	fi
 	if [ "$OLD_FWPATH" = "" ]; then
-		OLD_FWPATH=" "
+		# A zero-length write won't work; write a null byte
+		printf '\000' >/sys/module/firmware_class/parameters/path
+	else
+		echo -n "$OLD_FWPATH" >/sys/module/firmware_class/parameters/path
 	fi
-	echo -n "$OLD_FWPATH" >/sys/module/firmware_class/parameters/path
 	rm -f "$FW"
 	rmdir "$FWPATH"
 }
-- 
2.16.2

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
