From: po-hsu.lin at canonical.com (Po-Hsu Lin)
Date: Fri, 19 Apr 2019 21:12:21 +0800
Subject: [PATCHv2] selftests/efivarfs: clean up test files from test_create*()
Message-ID: <20190419131221.28297-1-po-hsu.lin@canonical.com>

Test files created by test_create*() tests will stay in the
$efivarfs_mount directory unless the system was rebooted.

When the tester tries to run this efivarfs test again on the same
system, the immutable characteristics in that directory will cause some
"Operation not permitted" noises and a false-positve test result to the
test_create_read() test.

    --------------------
    running test_create
    --------------------
    ./efivarfs.sh: line 59: /sys/firmware/efi/efivars/test_create-210be57c-9849-4fc7-a635-e6382d1aec27: Operation not permitted
      [PASS]
    --------------------
    running test_create_empty
    --------------------
    ./efivarfs.sh: line 78: /sys/firmware/efi/efivars/test_create_empty-210be57c-9849-4fc7-a635-e6382d1aec27: Operation not permitted
     [PASS]
    --------------------
    running test_create_read
    --------------------
    open(O_WRONLY): Operation not permitted
     [FAIL]
    --------------------

Create a file_cleanup() to remove those test files in the end of each
test to solve this issue.

Also, use this function to replace the existing file removal code.

Link: https://bugs.launchpad.net/bugs/1809704

Signed-off-by: Po-Hsu Lin <po-hsu.lin at canonical.com>
---
 tools/testing/selftests/efivarfs/efivarfs.sh | 19 +++++++++++++------
 1 file changed, 13 insertions(+), 6 deletions(-)
 mode change 100755 => 100644 tools/testing/selftests/efivarfs/efivarfs.sh

diff --git a/tools/testing/selftests/efivarfs/efivarfs.sh b/tools/testing/selftests/efivarfs/efivarfs.sh
old mode 100755
new mode 100644
index a47029a..14fa6fe
--- a/tools/testing/selftests/efivarfs/efivarfs.sh
+++ b/tools/testing/selftests/efivarfs/efivarfs.sh
@@ -7,6 +7,12 @@ test_guid=210be57c-9849-4fc7-a635-e6382d1aec27
 # Kselftest framework requirement - SKIP code is 4.
 ksft_skip=4
 
+file_cleanup()
+{
+	chattr -i $1
+	rm $1
+}
+
 check_prereqs()
 {
 	local msg="skip all tests:"
@@ -58,8 +64,10 @@ test_create()
 
 	if [ $(stat -c %s $file) -ne 5 ]; then
 		echo "$file has invalid size" >&2
+		file_cleanup $file
 		exit 1
 	fi
+	file_cleanup $file
 }
 
 test_create_empty()
@@ -72,12 +80,14 @@ test_create_empty()
 		echo "$file can not be created without writing" >&2
 		exit 1
 	fi
+	file_cleanup $file
 }
 
 test_create_read()
 {
 	local file=$efivarfs_mount/$FUNCNAME-$test_guid
 	./create-read $file
+	file_cleanup $file
 }
 
 test_delete()
@@ -94,8 +104,7 @@ test_delete()
 
 	rm $file 2>/dev/null
 	if [ $? -ne 0 ]; then
-		chattr -i $file
-		rm $file
+		file_cleanup $file
 	fi
 
 	if [ -e $file ]; then
@@ -152,8 +161,7 @@ test_valid_filenames()
 		else
 			rm $file 2>/dev/null
 			if [ $? -ne 0 ]; then
-				chattr -i $file
-				rm $file
+				file_cleanup $file
 			fi
 		fi
 	done
@@ -189,8 +197,7 @@ test_invalid_filenames()
 			echo "Creating $file should have failed" >&2
 			rm $file 2>/dev/null
 			if [ $? -ne 0 ]; then
-				chattr -i $file
-				rm $file
+				file_cleanup $file
 			fi
 			ret=1
 		fi
-- 
2.7.4
