From: po-hsu.lin@canonical.com (Po-Hsu Lin)
Date: Tue, 25 Dec 2018 16:59:45 +0800
Subject: [PATCH] selftests/efivarfs: clean up test files from test_create*()
Message-ID: <20181225085945.13686-1-po-hsu.lin@canonical.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20181225085945.s0OSmRUZoL3-kOwA5GRBidyVB2UBsuoZXBRooI5X6g0@z>

Test files created by test_create*() tests will stay in the $efivarfs_mount
directory until next reboot.

When the tester tries to run this efivarfs test again on the same system, the
immutable characteristics in that directory with those previously generated
files will cause some "Permission denied" noises and a false-positive test
result to the test_create_read() test.

Remove those test files in the end of each test to solve this issue.

Link: https://bugs.launchpad.net/bugs/1809704

Signed-off-by: Po-Hsu Lin <po-hsu.lin at canonical.com>
---
 tools/testing/selftests/efivarfs/efivarfs.sh | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/tools/testing/selftests/efivarfs/efivarfs.sh b/tools/testing/selftests/efivarfs/efivarfs.sh
index a47029a..ea2e2a0 100755
--- a/tools/testing/selftests/efivarfs/efivarfs.sh
+++ b/tools/testing/selftests/efivarfs/efivarfs.sh
@@ -60,6 +60,12 @@ test_create()
 		echo "$file has invalid size" >&2
 		exit 1
 	fi
+
+        rm $file 2>/dev/null
+        if [ $? -ne 0 ]; then
+                chattr -i $file
+                rm $file
+        fi
 }
 
 test_create_empty()
@@ -72,12 +78,24 @@ test_create_empty()
 		echo "$file can not be created without writing" >&2
 		exit 1
 	fi
+
+        rm $file 2>/dev/null
+        if [ $? -ne 0 ]; then
+                chattr -i $file
+                rm $file
+        fi
 }
 
 test_create_read()
 {
 	local file=$efivarfs_mount/$FUNCNAME-$test_guid
 	./create-read $file
+
+        rm $file 2>/dev/null
+        if [ $? -ne 0 ]; then
+                chattr -i $file
+                rm $file
+        fi
 }
 
 test_delete()
-- 
2.7.4
